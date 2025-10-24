---
title: Leah H Replication Report for Jiawen - CAnD3 RRWM Exercise
author: Leah Houseman
date: October 24, 2025
---

### Leah H Replication Report for Jiawen

**Data Sources**

-   Instructions to download data were clear. Once I loaded the raw file into the appropriate folder (as per the instructions), all worked as intended.

**Analysis Data Files**

-   Files were provided in clear order. Again, required updating of file paths on my part, but then it worked as intended , aside from a factor variable recoding issue in `02_analysis.R`.
-   *Note:* It is entirely possible that the file path issue was due to my current technical ability with R.

**Code Description**

-   Appropriate notes were listed in all code files. It was easy to understand what the code was meant to accomplish.

**Stated Requirements**

-   Brief statement of basic requirements. However, it would be helpful to provide a session info report, and to note if specific versions of packages would be required.

-   Instructions on which packages were required were a little confusing (suggested packages in README vs. packages required in code files)

**Missing Requirements**

-   Once I adjusted the file paths and ran the code files, nothing was missing.

-   However, in `02_analysis.R`, in the regression step, I had to recode the education variable as a factor.

**Computing Environment of the Replicator**

-   Pending an RStudio and package updates, my environment was able to replicate the code. A session info report `replicator_session_info.txt` for my environment is available in the outputs folder.

**Replication Steps**

-   These were provided, primarily, as a series of scripts to run instead of written instructions. There was a `program.md` file located in the `docs` folder, and I think this might have been intended as the written instructions. It would be best to place this as the README, or link to it from the README.

**Findings**

1.  ***Data Preparation Code***

-   My replication attempt code is available in the `Partner Submission/Replication` folder as `Leah H_RRWN Replication Attempt.rmd` (Partner Submission/Replication/Leah H_RRWM Replication Attempt.Rmd)

1.  ***Tables***

-   Tables are available in the `outputs` folder.

**Classification**

-   Reproducability was possible overall, pending update to file paths and correcting the factor variable issue in the regression.

-   ***Was I able to reproduce the work based only on the program?***

    -   Yes, with a few errors\*

    -   \*The code was provided as the program/written instructions. However, after finding written instructions within the folder structure, it would have been a little difficult to reproduce, as instructions were fairly high level, and a few pertinent details, like package and environment requirements, were not provided (in the written program, they were in the code files).

-   ***Questions for Discussion***

    1.  Using the code files, the errors were minimal. Once file paths were updated and I corrected the factor variable issue with the regression, it worked as intended.

    2.  The structure of the repo made figuring out where to start and which files to use as the written instructions/actual code a little unclear. It was only after taking a moment to figure out the structure of the repo (and after assuming that the code files referenced in README were where I was to start) that I was able to find written instructions in the `docs` folder.

    3.  

        -   This exercise definitely helped me understand how we can be more transparent in our data analysis. Reviewing Jiawen's work helped me to understand how we can work toward a "single-click" replicability by providing well-detailed code and notes. I am not sure if replicability requirements in a journal would require written instructions over annotated code, but I can see how both would help us work toward more transparent "open science".

        -   I remember being told in undergrad when we had questions about how certain analyses were ran/how variables were coded, were were told that we'd just have to trust the researcher, but being able to access code would mean that we could actually check to answer our questions.

        -   The space available in a journal article doesn't always allow for a lot of room to give detail on analytic steps, so being able to provide an appendix with code and coding notes would be helpful. However, the restricted data/data privacy angle *may* put those researchers at a disadvantage if there is a misinformed requirement to produce data. In those instances, when data cannot be provided, as long as being able to provide a detailed description of steps/code if the replicator is able to access the restricted data is sufficient, then the benefits outweigh potential disadvantage.
