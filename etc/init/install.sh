CWD=`dirname $0`

case "${OSTYPE}" in
  darwin* )
    echo "macOS"
    source "${CWD}"/mac.sh
    ;;
  linux* )
    echo "Linux"
    source "${CWD}"/linux.sh
    ;;
  msys* )
    echo "Windows"
    # Not created ...
    source "${CWD}"/windows.sh
    ;;
  * )
    echo "Not compatible"
    ;;
esac
