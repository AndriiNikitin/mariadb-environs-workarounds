set -e
version=$(mysql --version)
# trimleft '* Distrib '
version=${version##* Distrib }
# trimright '-*'
version=${version%%\-*}

# directory of this script
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$version" != 10.1.28 ] && [ "$version" != 10.2.9 ] ; then
  echo no
elif patch    -f --dry-run --silent "$(dirname $(which wsrep_sst_mysqldump))/wsrep_sst_common" "$d/wsrep_sst_common.patch" &>/dev/null ; then
  echo yes
elif patch -R -f --dry-run --silent "$(dirname $(which wsrep_sst_mysqldump))/wsrep_sst_common" "$d/wsrep_sst_common.patch" &>/dev/null ; then
  echo fixed
else
  echo maybefixed
fi
