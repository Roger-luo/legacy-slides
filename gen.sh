#!/bin/bash

pandoc README.md -o index.html --toc --toc-depth=2

for mdfile in `ls _slides`; do
    pandoc "_slides/$mdfile" -o "slides/${mdfile%.md}.html" -t revealjs -s --template=slide.revealjs
done