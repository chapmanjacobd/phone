# git-describe
# Autogenerated from man page /data/data/com.termux/files/usr/share/man/man1/git-describe.1.gz
complete -c git-describe -l dirty -l broken -d 'Describe the state of the working tree'
complete -c git-describe -l all -d 'Instead of using only the annotated tags, use any ref found in refs/ namespace'
complete -c git-describe -l tags -d 'Instead of using only the annotated tags, use any tag found in refs/tags name…'
complete -c git-describe -l contains -d 'Instead of finding the tag that predates the commit, find the tag that comes …'
complete -c git-describe -l abbrev -d 'Instead of using the default number of hexadecimal digits (which will vary ac…'
complete -c git-describe -l candidates -d 'Instead of considering only the 10 most recent tags as candidates to describe…'
complete -c git-describe -l exact-match -d 'Only output exact matches (a tag directly references the supplied commit)'
complete -c git-describe -l debug -d 'Verbosely display information about the searching strategy being employed to …'
complete -c git-describe -l long -d 'Always output the long format (the tag, the number of commits and the abbrevi…'
complete -c git-describe -l match -d 'Only consider tags matching the given glob(7) pattern, excluding the "refs/ta…'
complete -c git-describe -l exclude -d 'Do not consider tags matching the given glob(7) pattern, excluding the "refs/…'
complete -c git-describe -l always -d 'Show uniquely abbreviated commit object as fallback'
complete -c git-describe -l first-parent -d 'Follow only the first parent commit upon seeing a merge commit'
complete -c git-describe -l no-match -d 'to clear and reset the list of patterns'
complete -c git-describe -l no-exclude -d 'to clear and reset the list of patterns'

