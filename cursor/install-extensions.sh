#!/bin/bash
# Install all Cursor extensions from list

while read extension; do
  cursor --install-extension "$extension"
done < "$(dirname "$0")/extensions.txt"

echo "Done installing extensions"
