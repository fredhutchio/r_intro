# Instructors

- Please see our [instructor repository](https://github.com/fredhutchio/instructors) for general guidelines relevant to all classes. Additional recommendations specific for this course can be found below.
- You may choose to share your script to Dropbox to help folks stay on track. If you create the project in Dropbox, you can copy the link to each class script and share in HackMD. Files ending in `.R` are rendered as text in a browser window, but learners will need to refresh the screen to see updates.
- Administering challenges: Typing the challenge exercise into the script as a comment is usually easiest. Some challenges that include a chunk of code may be added to the HackMD for learners to copy and paste (or it can be copied from Dropbox if you're sharing your script). 

## Class 1

- [Data Carpentry's Intro to R and RStudio](https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html) has another series of instructions for overviewing RStudio
- Timing and pacing: A break generally works midway through the "Vectors" section.

## Class 2

- Timing and pacing: usually it takes 30 minutes to complete the section up through the first challenge exercise (importing tsv and txt). A break generally occurs when administering the challenges at the end of the section "Subsetting data frames".

## Class 3

- Timing and pacing: A break generally works when administering challenges at the end of "Selecting columns and rows".

## Class 4

- If you don't complete data filtering in Class 3, there are backup files in the GitHub repo that can be downloaded and imported
- Timing and pacing: A break generally works when administering challenges at the end of "Box and whisker plots".

## Technological backups

If participants have issue with software installations, 
the following process allows a participant to access a remote project via web interface. 
Setting up a project and providing access to another participant requires that you have access as an admin to the 
[fredhutch.io workspace](https://rstudio.cloud/spaces/61922/projects) 
through [RStudio Cloud](https://rstudio.cloud/)

- **Add the participant who needs a project as a member of the workspace.** 
  - Under the "Members" tab,
  click the "Add member" button.
  Enter the participant's fredhutch.org email address and select "Contributor" as their role.
  - Theoretically, they should receive an email,
  but this doesn't always work,
  so after adding them,
  click on the "Invitations"" tab for the member list and copy the link to send to them via email from you, MS Teams, etc.
  - The participant will need to create a (free) account through RStudio Cloud,
  but they should then be able to see the fredhutch.io workspace.
- **If the project is needed at the start of the course, 
create an empty project in the shared workspace for the participant:**
  - Include the participant's name in the project title 
  (e.g., "lastname_intro_r").
  - Click the gear in the upper right hand corner of the project and select the "Access" tab. 
  - Change "Who can view this project" to "Everyone in fredhutch.io". 
  The participant should now be able to work with the project.
  - Note: the participant will still need to install tidyverse following the instructions provided for the rest of the class.
- If it is mid-course, 
create a project that includes versions of the instructor's scripts as follows:
  - Click the arrow next to "New Project" and select "New Project from Git Repo".
  - Add the URL for the class repository: https://github.com/fredhutchio/R_intro
  - After importing the repository, 
  rename the project to include the participant's name in the project title 
  (e.g., "lastname_intro_r").
  - Run the following code in the project's Console:
  ```
  system("bash clean_project.sh") # removes and reorganizes files
  system(rm clean_project.sh) # removes the cleaning script
  install.packages("tidyverse") # install tidyverse
  dir.create("data") # create directory
  source("class2.R") # download data
  ```
  - Change "Who can view this project" to "Everyone in fredhutch.io".
  The participant should now be able to work with the project.

Alternatively, Fred Hutch maintains an RStudio server accessible at [http://rstudio.fhcrc.org](http://rstudio.fhcrc.org). 
This server is not particularly stable, however,
so it is not recommended for use in this class. 
If a participant is familiar with using remote compute resources,
there is also an option to access RStudio via rhino using 
[these instructions](https://sciwiki.fredhutch.org/scicomputing/software_R/#run-rstudio-server-on-an-hpc-machine).

## FAQs

- [use of = vs <- as assignment operator](https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-in-r)
- other questions on code requirements vs. code conventions are usually explained in the [R style guide](http://adv-r.had.co.nz/Style.html)

## Documentation and cheatsheets for packages

### General
- [R and RStudio installation instructions](http://www.fredhutch.io/software/)
- [R style guide](http://adv-r.had.co.nz/Style.html)
- [use of R and RStudio at Fred Hutch, via Data Science Wiki](https://sciwiki.fredhutch.org/scicomputing/software_R/)

### Packages
- [cheatsheets from RStudio](https://www.rstudio.com/resources/cheatsheets/): data import, dplyr, ggplot2, etc
- [ggplot2 documentation](https://ggplot2.tidyverse.org)
- [color palettes in ggplot2](http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)
