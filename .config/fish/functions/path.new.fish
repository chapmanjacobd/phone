function path.new --description 'Print a random temporary path that keeps the extension of INPUT' --argument-names input
    mktemp --dry-run (path.withsuffix .XXXXX "$input")
end
