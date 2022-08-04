function wip
  if count $argv > /dev/null
      $argv
  end
  git --no-pager diff;git add .;git commit -m wip;git pull;git push
end
