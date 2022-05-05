#!/usr/bin/env bash

echo "==> Checking json files are formatted..."

files=$(find . -type f -name "*.json" | grep -v -e ".github" -e "-terraform" -e "vendor" -e ".terraform")

for f in $files; do
  expected=$(jq . $f | md5sum | cut -d ' ' -f1)
  actual=$(cat $f | md5sum | cut -d ' ' -f1)
  if [ "$expected" != "$actual" ]; then
      echo "$f is not well formatted, you can fix this by running make jsonfmt"
      exit 1
  fi
done

exit 0
