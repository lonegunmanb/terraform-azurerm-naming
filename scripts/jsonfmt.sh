#!/usr/bin/env bash

echo "==> Formating json files..."

files=$(find . -type f -name "*.json" | grep -v -e ".github" -e "-terraform" -e "vendor" -e ".terraform")

for f in $files; do
  jq . $f > $f.bak
  rm $f
  mv $f.bak $f
done

exit 0
