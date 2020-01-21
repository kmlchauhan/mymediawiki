#!/bin/bash

for i in {1..100}
do
  if [[ "$i%3" -eq 0 ]] && [[  "$i%5" -eq 0 ]]; then
    echo "DEVOPS"
  elif [[ "$i%3" -eq 0 ]]; then
    echo "DEV"
  elif [[  "$i%5" -eq 0 ]]; then
    echo "OPS"
  else
    echo $i
  fi
done
