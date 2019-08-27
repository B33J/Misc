@echo off
cls
setlocal EnableDelayedExpansion
title TESTING A SCRIPT - STAND BACK

set line=@@@@@@@@@@@@@@
set exitq=
REM set dateY=%date:~-4%
REM set dateM=%date:~4,2%
REM set dateD=%date:~7,2%
::for %%i in (%1) do set filedir=%%~dpi
::for %%i in (%1) do set sourcefile=%%~nxi

:: TRY NOT TO DELETE ANYTHING ABOVE THIS LINE

echo.
echo WORK IN PROGRESS
echo.
pause

:start

CALL :ROLL_CHAR_STATS

CALL :SELECT_WEAPON

CALL :SELECT_DIE_TO_ROLL


set /a int_roll_result=%random% %%^!int_dieValue! +1
echo.
echo You rolled: !int_roll_result!


goto quit

:ROLL_CHAR_STATS
echo.
echo We are going to roll for character ability scores.
echo.
echo The abilities to roll for are: 
echo.
echo Strength, measuring physical power
echo Dexterity, measuring agility
echo Constitution, measuring endurance
echo Intelligence, measuring reasoning and memory
echo Wisdom, measuring Perception and Insight
echo Charisma, measuring force of personality
echo.
echo We will roll 4 six-sided dice, excluding the lowest roll, six times to obtain a set of
echo six numbers which you will assign to the abilities listed above.
echo.
pause
:reroll_stats
set int_stat_int=
FOR /L %%a IN (1,1,6) DO (
	set /a int_stat_int+=1
	
	set /a int_stat_roll1=!random! %%6 +1
	set /a int_stat_roll2=!random! %%6 +1
	set /a int_stat_roll3=!random! %%6 +1
	set /a int_stat_roll4=!random! %%6 +1
	echo.
	IF %%a EQU 1 set str_set_count=First
	IF %%a EQU 2 set str_set_count=Second
	IF %%a EQU 3 set str_set_count=Third
	IF %%a EQU 4 set str_set_count=Fourth
	IF %%a EQU 5 set str_set_count=Fifth
	IF %%a EQU 6 set str_set_count=Sixth
	echo !str_set_count! set, we rolled:
	echo.  !int_stat_roll1!
	echo.  !int_stat_roll2!
	echo.  !int_stat_roll3!
	echo.  !int_stat_roll4!
	
	:: found this part on stackoverflow
	set lowest_roll=!int_stat_roll1!
	IF "!int_stat_roll2!" LSS "!lowest_roll!" set lowest_roll=!int_stat_roll2!
	IF "!int_stat_roll3!" LSS "!lowest_roll!" set lowest_roll=!int_stat_roll3!
	IF "!int_stat_roll4!" LSS "!lowest_roll!" set lowest_roll=!int_stat_roll4!
	
	echo Excluding the !lowest_roll!
	
	set /a int_stat_roll_total=!int_stat_roll1!+!int_stat_roll2!+!int_stat_roll3!+!int_stat_roll4!-!lowest_roll!
	echo Total is: !int_stat_roll_total!
	set int_stats_roll_set!int_stat_int!=!int_stat_roll_total!
	pause
)
echo.
echo %line%
echo The roll set is:
echo !int_stats_roll_set1!
echo !int_stats_roll_set2!
echo !int_stats_roll_set3!
echo !int_stats_roll_set4!
echo !int_stats_roll_set5!
echo !int_stats_roll_set6!
echo %line%
set /a int_stats_roll_total=!int_stats_roll_set1!+!int_stats_roll_set2!+!int_stats_roll_set3!+!int_stats_roll_set4!+!int_stats_roll_set5!+!int_stats_roll_set6!
echo Total is !int_stats_roll_total!
echo.
timeout /t 3 >nul
:discard_set_question
echo Keep this set (y)?  Or discard it and reroll (n)?
set user_input=
set /p user_input=
IF /I "!user_input!" == "n" (
	cls
	echo.
	echo ROLLING NEW SET
	goto reroll_stats
)
IF /I NOT "!user_input!" == "y" goto discard_set_question
:assign_scores
REM set int_ability_STRENGTH=
REM set int_ability_DEXTERITY=
REM set int_ability_CONSTITUTION=
REM set int_ability_INTELLIGENCE=
REM set int_ability_WISDOM=
REM set int_ability_CHARISMA=

set int_stats_selecting1=!int_stats_roll_set1!
set int_stats_selecting2=!int_stats_roll_set2!
set int_stats_selecting3=!int_stats_roll_set3!
set int_stats_selecting4=!int_stats_roll_set4!
set int_stats_selecting5=!int_stats_roll_set5!
set int_stats_selecting6=!int_stats_roll_set6!

set int_stats_list_int=6

FOR %%b in (STRENGTH DEXTERITY CONSTITUTION INTELLIGENCE WISDOM CHARISMA) DO (
	echo Which number score to assign to %%b^?
	FOR /L %%l IN (1,1,!int_stats_list_int!) DO (
		echo %%l^) !int_stats_selecting%%l!
	)
	set user_input=
	set /p user_input=
	REM next FOR is to handle an answer that has an empty value
	FOR /L %%j IN (!user_input!,1,!user_input!) DO (
		IF "!int_stats_selecting%%j!" == "" (
			echo.
			echo ERROR!
			pause
		)
	)
	FOR /L %%p IN (!user_input!,1,!user_input!) DO (
		set int_ability_%%b=!int_stats_selecting%%p!
		set int_stats_selecting%%p=
	)
	echo Ability %%b has !int_ability_%%b!
	REM shift numbers down after selecting a number
	IF "!int_stats_selecting1!" == "" (
		set int_stats_selecting1=!int_stats_selecting2!
		set int_stats_selecting2=
	)
	IF "!int_stats_selecting2!" == "" (
		set int_stats_selecting2=!int_stats_selecting3!
		set int_stats_selecting3=
	)
	IF "!int_stats_selecting3!" == "" (
		set int_stats_selecting3=!int_stats_selecting4!
		set int_stats_selecting4=
	)
	IF "!int_stats_selecting4!" == "" (
		set int_stats_selecting4=!int_stats_selecting5!
		set int_stats_selecting5=
	)
	IF "!int_stats_selecting5!" == "" (
		set int_stats_selecting5=!int_stats_selecting6!
		set int_stats_selecting6=
	)
	REM shrink the ability score list by 1 by this point
	set /a int_stats_list_int-=1
)
cls
echo.
echo So the ability scores assigned are:
echo.
echo %line%%line%
echo.
echo    !int_ability_STRENGTH!	Strength
echo    !int_ability_DEXTERITY!	Dexterity
echo    !int_ability_CONSTITUTION!	Constitution
echo    !int_ability_INTELLIGENCE!	Intelligence
echo    !int_ability_WISDOM!	Wisdom
echo    !int_ability_CHARISMA!	Charisma
echo.
echo %line%%line%
:assign_stats_confirm
echo.
echo Is this correct? (y/n)
set user_input=
set /p user_input=
IF /I "!user_input!" == "n" (
	echo.
	echo Let's reassign the ability scores...
	echo.
	goto assign_scores
)
IF /I NOT "!user_input!" == "y" goto assign_stats_confirm
:: exit ROLL_CHAR_STATS
EXIT /B


:SELECT_DIE_TO_ROLL
echo.
echo Select a die:
echo 1) d4
echo 2) d6
echo 3) d8
echo 4) d10
echo 5) d12
echo 6) d20
echo Q) Quit
set userinput=
set /p userinput=

IF /I "!userinput!" == "Q" (
	set exitq=true
	EXIT /B )
IF "!userinput!" == "1" (
	set int_dieValue=4
	set str_dieToRoll=d4
	EXIT /B )
IF "!userinput!" == "2" (
	set int_dieValue=6
	set str_dieToRoll=d6
	EXIT /B )
IF "!userinput!" == "3" (
	set int_dieValue=8
	set str_dieToRoll=d8
	EXIT /B )
IF "!userinput!" == "4" (
	set int_dieValue=10
	set str_dieToRoll=d10
	EXIT /B )
IF "!userinput!" == "5" (
	set int_dieValue=12
	set str_dieToRoll=d12
	EXIT /B )
IF "!userinput!" == "6" (
	set int_dieValue=20	
	set str_dieToRoll=d20
	EXIT /B )
	
echo.
echo ERROR.
echo Please input only number 1 through 6, or Q to quit this game.
echo.
pause

:: exit SELECT_DIE_TO_ROLL
EXIT /B

:SELECT_WEAPON
echo.
echo Select a weapon:
echo 1) Dagger
echo 2) Shortsword
echo 3) Longsword
echo 4) Bastard sword
echo 5) Great sword
set sword_selection=
set /p sword_selection=
IF "!sword_selection!" == "1" set str_weapon=dagger
IF "!sword_selection!" == "2" set str_weapon=shortsword
IF "!sword_selection!" == "3" set str_weapon=longsword
IF "!sword_selection!" == "4" set "str_weapon=bastard sword"
IF "!sword_selection!" == "5" set "str_weapon=great sword"

:: exit SELECT_WEAPON
EXIT /B

:SELECT_MONSTER
firebeetle
kobold
goblin
orc



:quit
echo.
echo Finished script.
echo.
REM pause
color 0F
EXIT /B
GOTO:EOF



:dayOfYear JD DateStr
:: -- returns the day of the year, i.e. 1 for 1/1/2008, 365 for 12/31/2008
:: -- JD     [out,opt] - variable name to store resulting day of the year
:: -- DateStr [in,opt]  - date string, e.g. "3/31/2006" or "Fri 03/31/2006" or "31.3.2006", or omit form current date
set "DateStr=%2"
if "%2"=="" set "DateStr=%date%"
for /f "skip=1 tokens=2-4 delims=(-)" %%a in ('"echo.|date"') do (
    for /f "tokens=1-3 delims=/.- " %%A in ("%DateStr:* =%") do (
        set %%a=%%A&set %%b=%%B&set %%c=%%C))
set /a "yy=10000%yy% %%10000,mm=100%mm% %% 100,dd=100%dd% %% 100"
set /a JD=dd-32075+1461*(yy+4800+(mm-14)/12)/4+367*(mm-2-(mm-14)/12*12)/12-3*((yy+4900+(mm-14)/12)/100)/4
set /a "yy=10000%yy% %%10000,mm=1,dd=1"
set /a JD-=-1+dd-32075+1461*(yy+4800+(mm-14)/12)/4+367*(mm-2-(mm-14)/12*12)/12-3*((yy+4900+(mm-14)/12)/100)/4
IF "%1" NEQ "" (SET %1=%JD%) ELSE (echo.%JD%)
EXIT /b

