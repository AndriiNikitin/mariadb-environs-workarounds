# use this script on own risk 
# use only in test environment

# directory with this file
d="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for workaround in $d/MDEV-* ; do
  eval "$(bash $workaround/print_fix.sh)"
done
