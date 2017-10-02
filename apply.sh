# use this script on own risk 
# use only in test environment

# directory with this file
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e

for workaround in $d/MDEV-* ; do
  [ -e $workaround/print_fix.sh ] && eval "$(bash $workaround/print_fix.sh)"
done
