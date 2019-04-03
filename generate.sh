#! /bin/bash
for n in {1..10}; do
  dd if=/dev/urandom of=file$( printf %03d "$n" ).bin bs=64M count=16
done
find . -type f -name "*.bin" -execdir sh -c 'md5sum "{}" > "{}".md5' \;
