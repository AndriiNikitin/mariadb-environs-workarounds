# source directory of this script
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo 'if [ "$(bash '$d'/is_fix_needed.sh)" == "yes" ] ; then '
echo 'sudo patch $(which wsrep_sst_mysqldump) '$d'/wsrep_sst_mysqldump.patch'
echo 'fi'
