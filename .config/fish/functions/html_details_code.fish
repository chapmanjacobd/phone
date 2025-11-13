# Defined interactively
function html_details_code
    echo -n '<details>
<summary></summary>

```plain
'
    cb
    echo '
```

</details>'
end
