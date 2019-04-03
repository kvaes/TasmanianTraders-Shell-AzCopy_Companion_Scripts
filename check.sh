#!/bin/bash
find . -type f -name "*.md5" -execdir sh -c 'md5sum -c "{}"' \;
