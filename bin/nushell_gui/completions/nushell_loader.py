import json, subprocess

def load_nushell_commands():
    proc = subprocess.run(["nu", "-c", "help commands | to json"], capture_output=True, text=True)
    data = json.loads(proc.stdout)
    return [cmd["name"] for cmd in data]
