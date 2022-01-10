#!/bin/bash
for filename in text/mi-*.md; do
   [ -e "$filename" ] || continue
   pandoc --lua-filter=extras.lua "$filename" --to markdown | pandoc --lua-filter=epigraph.lua --to markdown | pandoc --lua-filter=figure.lua --to markdown > manuscript/"$(basename "$filename")"
done
