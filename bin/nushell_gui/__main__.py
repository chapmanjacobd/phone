#!/usr/bin/env python3
"""
Nushell GUI - A conversational interface for nushell using termuxgui
Parses structured nushell output and creates interactive data views
"""
import json
import queue
import subprocess
import sys
import threading

import termuxgui as tg


class NushellGUI:
    def __init__(self):
        self.c = tg.Connection()
        self.a = tg.Activity(self.c)

        # Main vertical layout
        self.main_layout = tg.LinearLayout(self.a, vertical=True)

        # Title bar (fixed at top)
        title_container = tg.LinearLayout(self.a, vertical=False, parent=self.main_layout)
        self.title = tg.TextView(self.a, "🐚 Nushell Assistant", title_container)
        self.title.settextsize(20)
        self.title.setmargin(10, "left")
        self.title.setmargin(10, "top")
        self.title.setmargin(10, "bottom")

        # Main scrollable content area (takes up remaining space with weight)
        self.main_scroll = tg.NestedScrollView(self.a, self.main_layout)
        self.main_scroll.setlinearlayoutparams(1)  # Weight 1 = take remaining space
        self.content_layout = tg.LinearLayout(self.a, vertical=True, parent=self.main_scroll)

        # Placeholder instructions (will scroll away)
        placeholder = tg.TextView(self.a, "💬 Type a command or query below, then tap Run", self.content_layout)
        placeholder.settextsize(12)
        placeholder.setmargin(10, "left")
        placeholder.setmargin(5, "top")
        placeholder.setmargin(5, "bottom")
        placeholder.settextcolor(0xFF757575)

        # Input area at bottom (fixed, full width, weight 0 = don't expand)
        self.input_field = tg.EditText(self.a, "", self.main_layout, singleline=True)
        self.input_field.setlinearlayoutparams(0)  # Weight 0 = fixed size
        self.input_field.setmargin(8, "left")
        self.input_field.setmargin(8, "right")
        self.input_field.setmargin(8, "top")
        self.input_field.setmargin(2, "bottom")

        # Run button below input (fixed at bottom, weight 0)
        self.run_btn = tg.Button(self.a, "▶ Run", self.main_layout)
        self.run_btn.setlinearlayoutparams(0)  # Weight 0 = fixed size
        self.run_btn.setmargin(8, "left")
        self.run_btn.setmargin(8, "right")
        self.run_btn.setmargin(2, "top")
        self.run_btn.setmargin(8, "bottom")
        self.run_btn.setbackgroundcolor(0xFF4CAF50)  # Green

        # Command execution
        self.command_queue = queue.Queue()
        self.output_queue = queue.Queue()
        self.executor_thread = threading.Thread(target=self.command_executor, daemon=True)
        self.executor_thread.start()

        # Track interactive elements
        self.interactive_elements = []

        # Initial greeting
        self.add_text_message("Welcome! Try: 'ls', 'sys', 'help commands', or ask in natural language.", is_user=False)

    def add_text_message(self, text, is_user=True):
        """Add a simple text message bubble"""
        msg_container = tg.LinearLayout(self.a, vertical=False, parent=self.content_layout)
        msg_container.setmargin(5, "top")
        msg_container.setmargin(5, "bottom")

        msg = tg.TextView(self.a, text, msg_container)
        msg.settextsize(14)
        msg.setmargin(12, "left")
        msg.setmargin(12, "right")
        msg.setmargin(8, "top")
        msg.setmargin(8, "bottom")

        if is_user:
            msg.setbackgroundcolor(0xFF1976D2)  # Blue
            msg.settextcolor(0xFFFFFFFF)
        else:
            msg.setbackgroundcolor(0xFFE0E0E0)  # Light gray
            msg.settextcolor(0xFF000000)

        return msg

    def add_command_bar(self, commands):
        """Add a horizontally scrollable command suggestion bar"""
        # Container for the horizontal scroll
        bar_label = tg.TextView(self.a, "💡 Suggestions:", self.content_layout)
        bar_label.settextsize(12)
        bar_label.setmargin(10, "left")
        bar_label.setmargin(5, "top")

        h_scroll = tg.HorizontalScrollView(self.a, self.content_layout)
        h_layout = tg.LinearLayout(self.a, vertical=False, parent=h_scroll)

        buttons = []
        for cmd, desc in commands[:10]:  # Limit to 10
            btn = tg.Button(self.a, f"▶ {cmd}", h_layout)
            btn.setmargin(5, "left")
            btn.setmargin(5, "right")
            btn.setmargin(5, "top")
            btn.setmargin(5, "bottom")
            btn.setbackgroundcolor(0xFF4CAF50)  # Green
            buttons.append((btn, cmd, desc))

        return buttons

    def add_data_table(self, data, title="Results"):
        """Add interactive data results (from ls, sys, etc.)"""
        # Title
        title_tv = tg.TextView(self.a, f"📊 {title}", self.content_layout)
        title_tv.settextsize(16)
        title_tv.setmargin(10, "left")
        title_tv.setmargin(10, "top")
        title_tv.setbackgroundcolor(0xFF37474F)
        title_tv.settextcolor(0xFFFFFFFF)

        # Create scrollable table
        table_scroll = tg.NestedScrollView(self.a, self.content_layout)
        table_layout = tg.LinearLayout(self.a, vertical=True, parent=table_scroll)
        table_layout.setmargin(5, "left")
        table_layout.setmargin(5, "right")

        buttons = []

        if isinstance(data, list):
            # Table data (list of dicts)
            for i, row in enumerate(data[:50]):  # Limit to 50 rows
                row_container = tg.LinearLayout(self.a, vertical=False, parent=table_layout)
                row_container.setmargin(2, "top")
                row_container.setmargin(2, "bottom")

                # Make row clickable
                btn = tg.Button(self.a, self.format_row(row, i), row_container)
                btn.setmargin(5, "left")
                btn.setmargin(5, "right")
                btn.setbackgroundcolor(0xFF263238 if i % 2 == 0 else 0xFF37474F)
                btn.settextcolor(0xFFFFFFFF)

                buttons.append((btn, row, i))

        elif isinstance(data, dict):
            # Key-value data
            for key, value in list(data.items())[:50]:
                row_container = tg.LinearLayout(self.a, vertical=False, parent=table_layout)

                key_tv = tg.TextView(self.a, f"{key}:", row_container)
                key_tv.settextsize(12)
                key_tv.setmargin(8, "left")
                key_tv.settextcolor(0xFF64B5F6)

                val_tv = tg.TextView(self.a, str(value), row_container)
                val_tv.settextsize(12)
                val_tv.setmargin(8, "left")

        return buttons

    def format_row(self, row, index):
        """Format a data row for display"""
        if isinstance(row, dict):
            # Show first few fields
            parts = []
            for k, v in list(row.items())[:3]:
                parts.append(f"{k}: {v}")
            return f"[{index}] " + " | ".join(parts)
        return f"[{index}] {str(row)}"

    def parse_nushell_output(self, output):
        """Parse nushell output - try JSON first, then fall back to text"""
        if not output or not output.strip():
            return None, "text"

        # Try JSON (nushell can output JSON)
        try:
            data = json.loads(output)
            if isinstance(data, (list, dict)):
                return data, "json"
        except json.JSONDecodeError:
            pass

        # Try to detect table format
        lines = output.strip().split('\n')
        if len(lines) > 2 and '│' in lines[0]:
            # Looks like a nushell table
            return output, "table"

        return output, "text"

    def execute_nushell_command(self, command):
        """Execute a nushell command and return structured output"""
        try:
            # Try with JSON output first
            json_cmd = f"{command} | to json"
            result = subprocess.run(["nu", "-c", json_cmd], capture_output=True, text=True, timeout=10)

            if result.returncode == 0 and result.stdout.strip():
                return result.stdout, "json_attempt"

            # Fall back to regular output
            result = subprocess.run(["nu", "-c", command], capture_output=True, text=True, timeout=10)

            if result.returncode == 0:
                return result.stdout if result.stdout else "✓ Success", "normal"
            else:
                return f"Error: {result.stderr}", "error"

        except FileNotFoundError:
            # Fallback to bash
            try:
                result = subprocess.run(["bash", "-c", command], capture_output=True, text=True, timeout=10)
                output = result.stdout if result.stdout else result.stderr
                return f"(bash) {output}", "bash"
            except Exception as e:
                return f"Error: {str(e)}", "error"
        except subprocess.TimeoutExpired:
            return "Error: Timeout", "error"
        except Exception as e:
            return f"Error: {str(e)}", "error"

    def command_executor(self):
        """Background thread to execute commands"""
        while True:
            try:
                command = self.command_queue.get()
                if command is None:
                    break

                output, output_type = self.execute_nushell_command(command)
                self.output_queue.put((command, output, output_type))

            except Exception as e:
                self.output_queue.put(("", f"Error: {str(e)}", "error"))

    def get_command_suggestions(self, query):
        """Generate command suggestions based on query"""
        suggestions = {
            "list": ("ls", "List files"),
            "file": ("ls", "List files"),
            "directory": ("ls -l", "List files detailed"),
            "process": ("ps", "List processes"),
            "system": ("sys", "System info"),
            "memory": ("sys mem", "Memory info"),
            "cpu": ("sys cpu", "CPU info"),
            "disk": ("sys disks", "Disk info"),
            "environment": ("env", "Environment variables"),
            "where": ("pwd", "Current directory"),
            "history": ("history | last 20", "Recent commands"),
            "help": ("help commands", "Available commands"),
            "date": ("date now", "Current date/time"),
            "network": ("sys net", "Network info"),
            "host": ("sys host", "Host info"),
        }

        query_lower = query.lower()
        matches = []

        for keyword, (cmd, desc) in suggestions.items():
            if keyword in query_lower:
                matches.append((cmd, desc))

        # If direct command, suggest it
        if not matches and query.strip():
            matches.append((query.strip(), "Execute directly"))

        # Always add some common commands
        if not matches or len(matches) < 3:
            matches.extend(
                [
                    ("ls", "List files"),
                    ("sys", "System info"),
                    ("help commands", "Help"),
                ]
            )

        return matches

    def handle_send(self, user_input):
        """Handle user input and execute immediately when appropriate"""
        if not user_input.strip():
            return

        # Add user message
        self.add_text_message(user_input, is_user=True)

        # Check if direct command or natural language
        if user_input.startswith(('/', '$', '>', 'nu ')):
            # Direct execution - strip prefix
            command = user_input.lstrip('/>$').strip()
            if command.startswith('nu '):
                command = command[3:].strip()
            self.command_queue.put(command)
        else:
            # Check if it looks like a command
            first_word = user_input.split()[0] if user_input.split() else ""
            common_cmds = ['ls', 'cd', 'pwd', 'ps', 'sys', 'env', 'help', 'history', 'date', 'cat', 'open', 'echo']

            if first_word in common_cmds or '|' in user_input:
                # Execute directly - looks like a command
                self.command_queue.put(user_input)
            else:
                # Natural language - get suggestions and auto-execute the best one
                suggestions = self.get_command_suggestions(user_input)

                if suggestions:
                    # Auto-execute the first (best) suggestion
                    best_cmd, best_desc = suggestions[0]
                    self.add_text_message(f"Running: {best_cmd} ({best_desc})", is_user=False)
                    self.command_queue.put(best_cmd)

                    # Still show other suggestions if there are alternatives
                    if len(suggestions) > 1:
                        other_suggestions = suggestions[1:]
                        buttons = self.add_command_bar(other_suggestions)
                        self.interactive_elements.extend(buttons)

    def handle_data_row_click(self, row_data, index):
        """Handle clicking on a data row - execute action immediately"""
        # If it's a file, execute the most common operation
        if isinstance(row_data, dict) and 'name' in row_data:
            filename = row_data['name']
            # Auto-execute 'cat' for files
            self.add_text_message(f"Viewing: {filename}", is_user=True)
            self.command_queue.put(f"cat {filename}")

            # Show alternative operations
            ops = [
                (f"open {filename}", "Open file"),
                (f"ls -l {filename}", "File info"),
            ]
            buttons = self.add_command_bar(ops)
            self.interactive_elements.extend(buttons)
        else:
            # Just show the row details
            msg = f"Selected row {index}: {self.format_row(row_data, index)}"
            self.add_text_message(msg, is_user=False)

    def check_output_queue(self):
        """Check for command outputs and display them"""
        try:
            while not self.output_queue.empty():
                command, output, output_type = self.output_queue.get_nowait()

                # Parse the output
                data, data_type = self.parse_nushell_output(output)

                if data_type == "json" and isinstance(data, (list, dict)):
                    # Create interactive table
                    buttons = self.add_data_table(data, f"Output: {command}")
                    self.interactive_elements.extend(buttons)
                else:
                    # Show as text
                    output_container = tg.LinearLayout(self.a, vertical=False, parent=self.content_layout)
                    output_container.setmargin(5, "top")

                    output_tv = tg.TextView(self.a, str(data)[:1000], output_container)  # Limit length
                    output_tv.settextsize(12)
                    output_tv.setmargin(10, "left")
                    output_tv.setmargin(10, "right")
                    output_tv.setmargin(5, "top")
                    output_tv.setmargin(5, "bottom")
                    output_tv.setbackgroundcolor(0xFF1E1E1E)
                    output_tv.settextcolor(0xFF00FF00)

        except queue.Empty:
            pass

    def run(self):
        """Main event loop"""
        for ev in self.c.events():
            # Check for command outputs
            self.check_output_queue()

            # Handle activity destruction
            if ev.type == tg.Event.destroy and ev.value["finishing"]:
                self.command_queue.put(None)
                self.c.close()
                sys.exit()

            # Handle run button
            if ev.type == tg.Event.click and ev.value["id"] == self.run_btn.id:
                user_input = self.input_field.gettext()
                if user_input.strip():
                    self.input_field.settext("")
                    self.handle_send(user_input)

            # Handle suggestion/data button clicks - execute immediately
            for item in self.interactive_elements:
                if ev.type == tg.Event.click and ev.value["id"] == item[0].id:
                    if len(item) == 3:
                        if isinstance(item[1], str):
                            # Command button - execute immediately
                            command = item[1]
                            self.add_text_message(f"▶ {command}", is_user=True)
                            self.command_queue.put(command)
                        elif isinstance(item[1], dict):
                            # Data row - execute default action
                            self.handle_data_row_click(item[1], item[2])
                    break


def main():
    try:
        gui = NushellGUI()
        gui.run()
    except KeyboardInterrupt:
        print("\nExiting...")
        sys.exit(0)
    except Exception as e:
        print(f"Error: {e}")
        import traceback

        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()
