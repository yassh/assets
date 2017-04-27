echo '$0' $0
echo '$(which $0)' $(which $0)
echo '$(dirname $0)' $(dirname $0)
echo '$(dirname $(which $0))' $(dirname $(which $0))
echo '$(cd $(dirname $0) && pwd)' $(cd $(dirname $0) && pwd)
