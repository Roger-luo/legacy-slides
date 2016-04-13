#!/bin/bash

pandoc "_slides/$1" -o "slides/${1%.md}.html" -t revealjs -s --template=slide.revealjs