set -e
version=$(mysql --version)
# trimleft '* Distrib '
version=${version##* Distrib }
# trimright '-*'
version=${version%%\-*}

# directory of this script
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$version" != 10.1.28 ] && [ "$version" != 10.2.9 ]  ; then
  echo no
elif patch    -f --dry-run --silent $(which mysqld_safe) "$d/mysqld_safe.patch" &>/dev/null ; then
  echo yes
elif patch -R -f --dry-run --silent $(which mysqld_safe) "$d/mysqld_safe.patch" &>/dev/null ; then
  echo fixed
else
  echo maybefixed
fi
