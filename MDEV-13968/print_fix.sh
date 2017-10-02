# directory of this script
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo 'if [ "$(bash '$d'/is_fix_needed.sh)" == "yes" ] ; then '
echo 'sudo patch "$(dirname $(which wsrep_sst_mysqldump))/wsrep_sst_common" "'$d'/wsrep_sst_common.patch"'
echo 'fi'
