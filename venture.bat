:: A text-based adventure game to work on while I have some downtime.
:: A WIP, everything is subject to change.
:: A Saving system could be accomplished via plain-text file that we could read from to set variables. It would read the file from top-down, so if multiple same-variables, the last `set variable` would be the one actually used.  Could ">>" a certain variable to that text file at certain points in the code for the act of saving.

@echo off

::engine parameters that won't change
set WrongInput=Please type only the numbers listed, or type "START OVER" to return to the main menu.
set qline=~~~~~~~~~~~~~~~~~
set eline=#################

::set all variables back to blank as a precaution. They're already set to blank before each question's input.
set StartQuestionInput=
set PlayerName=
set NameOption=
set InputOption=
set QuitOption=
set PickupSword=

::gameplay values
set HasSword=0
set HasWatch=0
set HasItem=0
set PlayerExperience=0
set HasBowQuiver=0

:: Title screen
cls
echo.
echo.
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo.
echo V       V EEEEEE N     N TTTTTTT U     U RRRRRR  EEEEEE
echo  V     V  E      N N   N    T    U     U R     R E
echo   V   V   EEE    N  N  N    T    U     U RRRRRR  EEE
echo    V V    E      N   N N    T     U   U  R    R  E
echo     V     EEEEEE N     N    T       U    R     R EEEEEE
echo.
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo.
echo.
echo 2015 B33J ^& Indranyx
echo.
timeout /t 5 >nul
::The GOTO immediately below is for testing and will be removed for release.
::GOTO QuestionSword  
GOTO start

:credits
echo.
echo %qline%
echo.
echo A Batch script, coded by B33J!
echo Story by Indranyx.
echo Typed in Notepad++
echo 2015-20XX
echo.
echo.
echo %qline%
echo.
pause
GOTO startquestion

:start
echo.
echo.
echo ***********************************************************
echo Welcome to our little Choose Your Own Adventure game!
echo.
echo When playing and it asks a question, please type just the number of the answer.
echo.
echo Example: to answer the question below, just type the number 1 and hit Enter.
echo.
echo %qline%
echo.
echo This is an uninteractive example question. True?
echo %qline%
echo 1. Yes
echo 2. No
echo %qline%
echo.
echo.
echo If at any time you want to start over from the menu,
echo type "START OVER" during a question.
echo.
echo There is no saving in this game (yet), so be careful.
echo.
echo ***********************************************************
timeout /t 2 >nul
pause
:startquestion
echo.
echo.
echo So, choose your option:
echo %qline%
echo 1. Start the adventure!
echo 2. Display Credits
echo 3. Quit
echo %qline%
set StartQuestionInput=
set /p StartQuestionInput=

IF "%StartQuestionInput%" EQU "1" (
	GOTO playernamequestion
	) ELSE (
	IF "%StartQuestionInput%" EQU "2" (
		GOTO credits
		) ELSE (
		IF "%StartQuestionInput%" EQU "3" (
			GOTO quitprompt
			) ELSE (
			IF "%StartQuestionInput%" == "START OVER" (
				GOTO startquestion
				)
			)
		)
	)
echo %eline%
echo %WrongInput%
GOTO startquestion

:playernamequestion
echo.
echo What is your name? ^(Please input only alpha-numeric characters^)
echo %qline%
set PlayerName=
set /p PlayerName=

IF "%PlayerName%" == "" (
	echo %eline%
	echo Please input something!
	timeout /t 2 >nul
	GOTO playernamequestion
	) ELSE (
	IF "%PlayerName%" == "START OVER" (
		GOTO startquestion
		)
	)
timeout /t 2 >nul
echo.
echo Hello %PlayerName%
timeout /t 2 >nul
echo.

:playernamequestion2
echo.
echo Is %PlayerName% the name you want?
echo %qline%
echo 1. Yes
echo 2. No, let me change it.
echo %qline%
set NameOption=
set /p NameOption=
IF "%NameOption%" EQU "1" (
	GOTO introstory
	) ELSE (
	IF "%NameOption%" EQU "2" (
		GOTO playernamequestion
		) ELSE (
		IF "%NameOption%" == "START OVER" (
			GOTO startquestion
			) ELSE (
			echo %eline%
			echo %WrongInput%
			pause
			GOTO playernamequestion2
					)
				)
			)
:introstory
echo.
echo.
echo Here we go!
timeout /t 4 >nul
cls
echo ~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~~@##@~
echo.
echo.
echo You awaken to find yourself on a packed dirt path running through an open field. 
echo You can't remember how you got here. One minute you were relaxing in your home
echo after a hard day's work and the next you're standing here, blinking in the
echo sunshine. You must have been unconscious for quite some time. The sun is
echo climbing overhead, but it is still morning. Has only one night passed, or many?
echo Where are you? Only one way to find out.
echo.
echo You look to your left and the path slopes down to a forest some distance away.
echo To your right the path slopes up into the foothills of a mountain range. 
echo.
pause
:question1
echo.
echo.Which way do you go?
echo.
echo %qline%
echo 1. Down toward the forest
echo 2. Up to the mountains
echo %qline%
set InputOption=
set /p InputOption=
echo.
IF "%InputOption%" EQU "1" (
	echo.
	echo With a fuzzy head and an apprehensive first step, you head toward the forest.
	echo Maybe in the cool forest you'll be able to think more clearly.
	echo.
	pause
	GOTO forest1
	) ELSE (
	IF "%InputOption%" EQU "2" (
		echo.
		echo With a fuzzy head and an apprehensive first step, you head toward the mountains.
		echo You might be able to think more clearly up in the clean mountain air.
		echo.
		pause
		GOTO mountains1
		) ELSE (
		IF "%InputOption%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO question1
				)
			)
		)
:forest1
echo.
echo.
echo As you enter the shadows of the trees, you notice an old, rundown stone cottage
echo set a little way off the path.
echo.
pause
:investigatecottagequestion
echo.
echo Do you investigate?
echo %qline%
echo 1. Investigate the cottage
echo 2. Keep moving
echo %qline%
set InputOption=
set /p InputOption=
echo.
IF "%InputOption%" EQU "1" (
	echo.
	echo You never know what you'll find in old buildings!
	echo You choose to investigate the stone cottage.
	echo.
	pause
	GOTO cottage1
	) ELSE (
	IF "%InputOption%" EQU "2" (
		echo.
		echo You decide to keep going. The roof of that cottage looks like
		echo it could fall on you at any second!
		echo.
		pause
		GOTO forest2
		) ELSE (
		IF "%InputOption%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO investigatecottagequestion
				)
			)
		)

:cottage1
echo.
echo.
echo As you enter the cottage you see that everything is covered with dust and
echo cobwebs. Only a table by the window remains clean. On the table is a
echo beautiful bow and a quiver full of arrows.
echo.
pause
:bowandquiverquestion
echo.
echo Do you take them to aid you on your journey?
echo %qline%
echo 1. Absolutely!
echo 2. No way!
echo %qline%
set InputOption=
set /p InputOption=
echo.
IF "%InputOption%" EQU "1" (
	set HasBowQuiver=1
	echo.
	echo You pick up the bow and quiver, marveling at their workmanship.
	echo You feel more secure knowing you're better prepared to face anything
	echo that may come your way. You head back out onto the forest path.
	echo.
	pause
	GOTO forest3
	) ELSE (
	IF "%InputOption%" EQU "2" (
		echo.
		echo You decide to keep going. The roof of that cottage looks like
		echo it could fall on you at any second!
		echo.
		pause
		GOTO forest2
		) ELSE (
		IF "%InputOption%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO bowandquiverquestion
				)
			)
		)

echo.
pause

:forest2
echo.
echo.
echo forest2
echo TO DO
echo.
pause
GOTO startquestion

:forest3
echo.
echo.
echo forest3
echo TO DO
echo.
pause
GOTO startquestion

:mountains1
echo.
echo.
echo As you emerge from the foothills into the mountains proper, you can see a cave
echo entrance up ahead. 
echo.
pause
:investigatecavequestion
echo.
echo Do you investigate the cave?
echo %qline%
echo 1. Yes
echo 2. No
echo %qline%
set InputOption=
set /p InputOption=
echo.
IF "%InputOption%" EQU "1" (
	echo.
	echo It doesn^'t smell like any animals live in there...
	echo You decide to investigate the cave. 
	echo.
	pause
	GOTO cave1
	) ELSE (
	IF "%InputOption%" EQU "2" (
		echo.
		echo What good could possibly come from rooting around in an old cave?
		echo You decide to continue on the mountain path.
		echo.
		pause
		GOTO mountains2
		) ELSE (
		IF "%InputOption%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO investigatecavequestion
				)
			)
		)
:cave1
echo.
echo.
echo As your eyes adjust to the dim lighting, you notice a stone slab at the
echo back of the cave. On the slab is a sword that seems to be emitting a
echo dim white glow all its own.
echo.
pause
:pickupswordquestion
echo.
echo Do you take the sword to help you on your journey?
echo %qline%
echo 1. Yes
echo 2. No
echo %qline%
set PickupSword=
set /p PickupSword=
echo.
IF "%PickupSword%" EQU "1" (
	set HasSword=1
	echo.
	echo You can use all the help you can get^! You pick up the sword and feel a tingling
	echo sensation in your hand. Sort of pleasant, really. You slide the sword through
	echo your belt and head back out onto the mountain path, feeling more confident.
	echo.
	GOTO mountainpath
	) ELSE (
	IF "%PickupSword%" EQU "2" (
		echo.
		echo Only idiots go around picking up strange, glowing swords. What if it's sentient?
		echo You decide to leave the cave and continue on the mountain path.
		set HasSword=0
		GOTO mountains2
		) ELSE (
		IF "%PickupSword%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO pickupswordquestion
				)
			)
		)


:mountainpath
echo.
echo.
echo mountainpath
echo TODO
echo.
goto startquestion

:mountains2
echo.
echo.
echo mountains2
echo TODO
echo.
pause
GOTO start question

:oldpickupswordquestion
timeout /t 3 >nul
echo.
echo You see a sword on the ground. Do you pick it up?
echo %qline%
echo 1. Yes
echo 2. No
echo %qline%

set PickupSword=
set /p PickupSword=
echo.
IF "%PickupSword%" EQU "1" (
	echo.
	echo You pick up the sword.
	set HasSword=1
	) ELSE (
	IF "%PickupSword%" EQU "2" (
		echo.
		echo You leave the sword alone.
		set HasSword=0
		) ELSE (
		IF "%PickupSword%" == "START OVER" (
			GOTO startquestion
			) ELSE (
				echo %eline%
				echo %WrongInput%
				pause
				GOTO pickupswordquestion
				)
			)
		)
		
:choose
timeout /t 3 >nul
echo.
echo.
echo Choose 1 through 4
echo %qline%
echo 1. Goblin
echo 2. 
echo 3. 
echo 4.
echo %qline%
set InputOption=
set /p InputOption=
timeout /t 2 >nul
IF "%InputOption%" EQU "1" (
	GOTO return1a
	) ELSE (
	IF "%InputOption%" EQU "2" (
		GOTO return1b
		) ELSE (
		IF "%InputOption%" EQU "3" (
			GOTO return1c
			) ELSE (
			IF "%InputOption%" EQU "4" (
				GOTO return1d
				)
			)
		)
	)
echo %eline%
echo %WrongInput%
pause
GOTO choose
:return1a
echo.
echo A threatening goblin walks up to you.
echo.
timeout /t 3 >nul
echo "Let me ask you this..." says the goblin,
timeout /t 3 >nul
:QuestionSword
echo.
echo "Do you have a sword?"
timeout /t 2 >nul
echo %qline%
echo 1. Yes
echo 2. No
echo %qline%
set InputOption=
set /p InputOption=
:: Don't have sword, say you do ELSE tell the truth that you do not
IF "%InputOption%" EQU "1" (
	IF "%HasSword%" EQU "0" (
		echo.
		echo "Quit Fibbin'! I don't see it on you!"
		timeout /t 3 >nul
		GOTO return2a
	)
) ELSE (
	echo.
	echo "That's true. I don't see it on you!", the goblin excitedly says.
	timeout /t 3 >nul
	GOTO return2c
	)
:: Have sword, say you do ELSE lie and say you do not
IF "%InputOption%" EQU "1" (
	IF "%HasSword%" EQU "1" (
		echo.
		echo "So I see", as the goblin stands back worriedly.
		timeout /t 3 >nul
		GOTO return2b
	)
) ELSE (
	echo.
	echo "Why are you lying? I see it on you!", the goblin says angrily.
	timeout /t 3 >nul
	GOTO return2d
	)

IF "%InputOption%" == "START OVER" (
	GOTO startquestion
	) ELSE (
		echo %eline%
		echo %WrongInput%
		pause
		GOTO QuestionSword
		)
	
::echo %WrongInput%
::GOTO QuestionSword
:return2a
echo.
echo The goblin attacks!
timeout /t 3 >nul
echo You die.  Game Over!
timeout /t 4 >nul
pause
GOTO end

:return2b
echo.
echo You thrust your sword into the goblin and it dies.
timeout /t 4 >nul
echo.
echo Congratulations, you win!
echo.
pause
GOTO end

:return2c
echo.
echo The goblin laughs at you but thanks you for your honesty.
timeout /t 3 >nul
echo The goblin walks away.
timeout /t 3 >nul
echo.
pause
GOTO end

:return2d
echo.
echo The goblin runs away!
timeout /t 3 >nul
echo.
pause
GOTO end

:return1b
echo.
echo You pressed 2,
::insert more questions here as the format above and change the GOTO to something else
pause
GOTO end

:return1c
echo.
echo You pressed 3,
::insert more questions here as the format above and change the GOTO to something else
pause
GOTO end

:return1d
echo.
echo You pressed 4,
::insert more questions here as the format above and change the GOTO to something else
pause
GOTO end

:end
echo.
echo.
echo since we're creating this game, let's just go back to the start.
echo.
pause
GOTO start

:quitprompt
echo.
echo Are you sure you wish to quit?
echo 1. Yes
echo 2. No
set /p QuitOption=
IF "%QuitOption%" EQU "1" (
	GOTO reallyquit
	) ELSE (
	IF "%QuitOption%" EQU "2" (
	GOTO startquestion)
	)
echo %eline%
echo %WrongInput%
pause
GOTO quitprompt

:reallyquit
cls
