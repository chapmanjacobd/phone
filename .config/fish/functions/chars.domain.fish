# Defined interactively
function chars.domain
    awk -F \/ '{l=split($3,a,"."); subdomain=""; if (l > 2 && a[1] != "www") subdomain=a[1] OFS; print subdomain (a[l-1]=="com"?a[l-2] OFS:X) a[l-1] OFS a[l]}' OFS="." $argv
end
