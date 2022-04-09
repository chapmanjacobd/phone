#!/bin/bash
exec am start --user 0 -a android.intent.action.VIEW -n io.github.forkmaintainers.iceraven/.App -d "$1" >/dev/null
