# Defined interactively
function lines.unparagraph
    python -c 'from library.utils import strings; import re, sys; print("\n\n".join(strings.un_paragraph(p) for p in re.split(r"\n[ \t]*\n", sys.stdin.read())))'
end
