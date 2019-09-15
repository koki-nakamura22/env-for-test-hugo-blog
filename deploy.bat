@echo off

REM Build the project.
hugo

REM Go to public directory.
cd public

REM Add changes to git.
git add .

REM Create a commit message.
REM Get year, month and day.
set d=%date%
REM The following codes are Japanese style.
REM set yyyy=%d:~-10,4%
REM set mm=%d:~-5,2%
REM set dd=%d:~-2,2%
REM The following codes are English style.
set yyyy=%d:~-8,4%
set mm=%d:~-11,2%
set dd=%d:~-0,2%

set t=%time: =0%
set hh=%t:~0,2%
set mn=%t:~3,2%
set ss=%t:~6,2%

set commitMsg=Site updated: %yyyy%-%mm%-%dd% %hh%:%mn%:%ss%

REM Commit.
git commit -m "%commitMsg%"

REM Push source and build repos.
git push origin master

REM Come back to the project root.
cd ..
