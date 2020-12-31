# Introduction to R

## Description

This four class course introduces R statistical programming and its broad applications,
specifically for data analysis relevant to biomedical researchers.
This course assumes attendees have
no prior computer coding experience. 
At the end of this course,
you will be able to use R to import, manipulate,
and visualize data.
Please see each set of class materials for specific learning objectives.
These materials are developed by fredhutch.io,
the data and computational analysis training program at Fred Hutch.
Each class in this course includes brief tutorials interspersed with challenge exercises.

Sessions of the course are periodically taught by instructors at Fred Hutch;
each of the four classes is scheduled for two hours.
The HackMD (interactive page used for sharing links and information) for instructor-led courses is [here](https://hackmd.io/@k8hertweck/introR).
The materials are also freely available for self-guided,
work-at-your-own-pace study.

**Required software**: Software requirements for this course include:
- [R and RStudio](http://www.fredhutch.io/software#r-and-rstudio)
- [tidyverse](http://www.fredhutch.io/software#tidyverse)

The links above reference relevant sections of [fredhutch.io's Software page](http://www.fredhutch.io/software). 

This course is adapted from content originally appearing in 
[R for data analysis and visualization of Ecological Data](https://datacarpentry.org/R-ecology-lesson/),
Copyright (c) Data Carpentry. 
These materials may be useful for additional review and reinforcement of content included here.

## Class material

Materials for all lessons in this course include:

- [Class 1](class1.md): R syntax, assigning objects, using functions
- [Class 2](class2.md): Data types and structures; slicing and subsetting data
- [Class 3](class3.md): Data manipulation with `dplyr`
- [Class 4](class4.md): Data visualization in `ggplot2`

Solutions for exercises can be found in [`solutions`](solutions/).

Information about use of R and RStudio at Fred Hutch is available on the [Fred Hutch Biomedical Data Science Wiki](https://sciwiki.fredhutch.org/scicomputing/software_R/)

## For curriculum contributors and instructors

Please see the following resources for more information on:
- [**Teaching**](https://github.com/fredhutchio/instructors) these materials.
[`instructors.md`](instructors.md) includes information for instructors to facilitate teaching each lesson,
including additional options if a participant can't install R,
RStudio, or tidyverse on their computer.
[`hackmdio.md`](hackio.md) is an archive of the [interactive webpage](https://hackmd.io) used during lessons.
- [**Contributing**](https://github.com/fredhutchio/curriculum_contribution) to lessons.
Each lesson's materials are described in R markdown (`.Rmd`) and markdown (`.md`) files
in the [GitHub repository](https://github.com/fredhutchio/r_intro).
The former should be edited to make changes to the material and then knit to create the latter,
which are then rendered in GitHub.
The directories for each class hold figures for each lesson.

The data used for this course are from the [National Cancer Institute's Genomic Data Commons](https://gdc.cancer.gov). `extra/` holds the original data files used for 
download during the activities, as well as the intermediate data files for each cancer type directly downloaded from NCI-GDC, and the script used to derive them: [`clinical_data.R`](extra/clinical_data.R).
