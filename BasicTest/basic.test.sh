#!/bin/bash
check_result () {
  RESULT=$?
  MESSAGE=$1
  if [ $RESULT == 0 ]; then
    echo [SUCCESS] $MESSAGE
  else
    echo [FAILED] $MESSAGE
    exit 1
  fi
}

for sentiment in City Country Region ; do
  docker run davidgman/iplocation -i 1.1.1.1 | grep $sentiment
  check_result $sentiment
done

exit 0