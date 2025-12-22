alias g='git'

function gitlines () {
  git log --numstat --pretty="%H" --author=`git config user.name` --no-merges | awk "NF==3 {plus+=\$1; minus+=\$2} END {printf(\"$(git config user.name) commits %d lines (+%d, -%d)\\n\", plus+minus, plus, minus)}"
}
