function hex2decimal() {
  NUM=$(echo $1 | tr '[a-f]' '[A-F]')
  echo 16i ${NUM} p | dc
}

function decimal2hex() {
  echo 16o $1 p | dc
}

function trim() {
  STRING=$(echo $1)
  echo ${STRING}
}

function isnumeric() {
  expr $1 + 1 > /dev/null 2>&1

  if [ $? -lt 2 ]
  then
    return 0
  else
    return 1
  fi
}

function strlen() {
  case $1 in
    ? ) echo 1 ;;
    * ) expr $1 : '.*' ;;
  esac
}

function touppercasefirst() {
  FIRST_CHAR=$(expr $1 : '\(.\).*')
  REST_CHARS=$(expr $1 : '.\(.*\)')

  UPPER_FIRST_CHAR=$(echo "${FIRST_CHAR}" | tr a-z A-Z)

  echo ${UPPER_FIRST_CHAR}${REST_CHARS}
}

function bell() {
  if [ "$(echo -n)" = "-n" ]
  then
    echo '\007\c'
  else
    echo -n ""
  fi
}
