function str_color
    set n (for char in (string split '' "$argv")
      printf %d\\n \'$char
  end | sum_lines)

    set hue (math "$n % 360")
    echo $hue
end
