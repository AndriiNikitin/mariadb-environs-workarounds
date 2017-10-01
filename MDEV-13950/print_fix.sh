# getting the source directory of the script
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo 'if [ "$(bash '$d'/is_fix_needed.sh)" == "yes" ] ; then '
echo 'sudo patch $(which mysqld_safe) '$d'/mysqld_safe'
echo 'fi'
