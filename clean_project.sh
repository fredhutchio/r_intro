#!/bin/bash

# Cleans project directory (delete after running)

mv supplemental/class*.R .
rm *.md *.Rmd 0dataset.R convert.R .gitignore
rm -rf class2_files/ class4_files/ exercises/ solutions/ extra/ supplemental/
