-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Megan
-- Date: May 16, 2019
-- Description: This is the level 1 screen of the game. The user can use the right or left arrow keys to move the
-- car around. Once the car touches a pylon or a tree, the use will be asked a question. If thw user gets the 
-- the question right he/she will earn 100 points. If the user gets the question qrong, he/she will lose one heart
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- Create the local variables for the timer
local totalSeconds = 30
local secondsLeft = 30
local clockText 
local countDownTimer

-- To keep track of the hearts the player has
local numLives = 5

-- Tells the user if it is right or wrong
local textTrue
local textFalse

local answerPosition = 1
local questionSelect = 1
local bkg
local cover

local randomPosition

-- The positions for the objects/answers
local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*5/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local textTouched = false

-- Create the answer texts 
local questionText
local correctAnswer 
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

-- Create the lives for the car
local heart1
local heart2
local heart3
local heart4
local heart5

-- question 1 objects
local circle1
local rectangle1
local pentagon1
local triangle1

-- question 2 objects
local Tri2
local oval2

-- question 3 objects
local numThree
local numEight
local numZero
local numFour

-- question 5 objects
local tri5
local square5

-- question 6 objects
local rightAngleTri6
local isosceles6

-- question 7 objects
local numTwo
local numOne
local shapes

-- question 8 objects
local numSix
local numSeven
local numNine


-- question 9 objects 
local pentagonText
local octagonText
local decagonText
local hexagonText

-- question 10 objects 
local nonagonText

-- question 11 objects 
local numFive
local numTen

-- question 14 objects
local angles 


-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 

    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel1()
end 


local function UpdateTime()

    -- Decrement the number of seconds
    secondsLeft = secondsLeft - 1

    -- Display the number of seconds left in the clock object 
    clockText.text = "Time Left: " .. secondsLeft

    if ( secondsLeft == 0 ) then
        -- Reset the number of seconds left
        secondsLeft = totalSeconds

        numLives = numLives - 1

        -- If there are no lives left, play a lose sound, show a you lose image
        -- and cancel the timer remove the third heart by making it invisible

        if (numLives == 4) then

            heart5.isVisible = false

            ResumeLevel1()
        end

        if (numLives == 3) then

            heart5.isVisible = false
            heart4.isVisible = false

            ResumeLevel1()
        end

        if (numLives == 2) then

            heart5.isVisible = false
            heart4.isVisible = false
            heart3.isVisible = false

            ResumeLevel1()
        end

        if (numLives == 1) then

            heart5.isVisible = false
            heart4.isVisible = false
            heart3.isVisible = false
            heart2.isVisible = false

            ResumeLevel1()
        end

        if (numLives == 0) then

            heart1.isVisible = false   
            heart2.isVisible = false
            heart3.isVisible = false 
            heart2.isVisible = false
            heart3.isVisible = false
            timer.cancel(countDownTimer)
            composer.gotoScene( "you_lose" )           

            ResumeLevel1()
            
        end
    end
end


-- Function that calls the timer
local function StartTimer()

    -- Create a countdown timer that loops infinitely
    countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0 )

    if (countDownTimer == 0) then

        timer.cancel(countDownTimer)
    
    end
end
--------------------------- Touch and react question for question 1 ---------------------

local function TouchListenerAnswer(touch)
    if (touch.phase == "ended") then

        CountScore1( )

        BackToLevel1( )
    
    end 
end


local function TouchListenerwrongAnswer1(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


local function TouchListenerwrongAnswer2(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


local function TouchListenerwrongAnswer3(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


--adding the event listeners 
local function AddListeners ( )

    correctAnswer:addEventListener("touch", TouchListenerAnswer)
    wrongAnswer1:addEventListener("touch", TouchListenerwrongAnswer1)
    wrongAnswer2:addEventListener("touch", TouchListenerwrongAnswer2)
    wrongAnswer3:addEventListener("touch", TouchListenerwrongAnswer3)

end

--removing the event listeners
local function removeEventListener( )

    correctAnswer:removeEventListener("touch", TouchListenerAnswer)
    wrongAnswer1:removeEventListener("touch", TouchListenerwrongAnswer1)
    wrongAnswer2:removeEventListener("touch", TouchListenerwrongAnswer2)
    wrongAnswer3:removeEventListener("touch", TouchListenerwrongAnswer3)
end

local function PositionAnswers4()

    randomPosition = math.random(1,4)

    if ( randomPosition == 1 ) then

        correctAnswer.x = X1 
        correctAnswer.y = Y1 

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y1

        wrongAnswer2.x = X1
        wrongAnswer2.y = Y2 

        wrongAnswer3.x = X2
        wrongAnswer3.y = Y2

    elseif ( randomPosition == 2 ) then

        correctAnswer.x = X2 
        correctAnswer.y = Y2 

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y1

        wrongAnswer2.x = X1
        wrongAnswer2.y = Y2 

        wrongAnswer3.x = X2
        wrongAnswer3.y = Y1

    elseif ( randomPosition == 3 ) then

        correctAnswer.x = X2 
        correctAnswer.y = Y1 

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y1

        wrongAnswer2.x = X1
        wrongAnswer2.y = Y2 

        wrongAnswer3.x = X1
        wrongAnswer3.y = Y2

    elseif ( randomPosition == 4 ) then

        correctAnswer.x = X1 
        correctAnswer.y = Y1 

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y1

        wrongAnswer2.x = X1
        wrongAnswer2.y = Y2 

        wrongAnswer3.x = X2
        wrongAnswer3.y = Y2
    end

end

local function PositionAnswers2( )

    randomPosition = math.random(1,2)

    if ( randomPosition == 1 ) then

        correctAnswer.x = X1
        correctAnswer.y = Y1

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y2

    elseif ( randomPosition == 2 ) then

        correctAnswer.x = X2
        correctAnswer.y = Y2

        wrongAnswer1.x = X1
        wrongAnswer1.y = Y1

    end

end

local function PositionAnswers3 ( )

    randomPosition = math.random(1,3)

    if ( randomPosition == 1 ) then 

        correctAnswer.x = X2
        correctAnswer.y = Y2

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y1

        wrongAnswer2.x = X1
        wrongAnswer2.y = Y2 

    elseif ( randomPosition == 2 ) then

        correctAnswer.x = X1
        correctAnswer.y = Y2

        wrongAnswer1.x = X2
        wrongAnswer1.y = Y2

        wrongAnswer2.x = X2
        wrongAnswer2.y = Y1

    elseif ( randomPosition == 3 ) then

        correctAnswer.x = X2
        correctAnswer.y = Y1

        wrongAnswer1.x = X1
        wrongAnswer1.y = Y2

        wrongAnswer2.x = X2
        wrongAnswer2.y = Y1

    end

end




--local function Answers()

local function DisplayQuestion( )

    -- creating random start position in a certian area
    questionSelect = math.random(4,4)

    if (questionSelect == 1) then

        questionText.text = "Which shape has 5 sides?"

        -- Display the objects
        circle1.isVisible = true
        rectangle1.isVisible = true
        pentagon1.isVisible = true
        triangle1.isVisible = true        

        -- create the answer
        correctAnswer = pentagon1

        -- create the wrong answers
        wrongAnswer1 = rectangle1
        wrongAnswer2 = circle1
        wrongAnswer3 = triangle1

        PositionAnswers4()


    elseif (questionSelect == 2) then

        questionText.text = "What shape is an oval?"

        -- Display the shapes 
        oval2.isVisible = true
        square5.isVisible = true
        circle1.isVisible = true
        tri5.isVisible = true

        -- create the answer
        correctAnswer = oval2

        -- create the wrong answers
        wrongAnswer1 = square5
        wrongAnswer2 = circle1
        wrongAnswer3 = tri5

        PositionAnswers4()


    elseif (questionSelect == 3) then 

        questionText.text = "How many vertices does a circle have?"

        -- Display the numbers 
        numThree.isVisible = true
        numEight.isVisible = true
        numZero.isVisible = true
        numFour.isVisible = true

        -- create the answer
        correctAnswer = numZero

        -- create the wrong answers
        wrongAnswer1 = numFour
        wrongAnswer2 = numEight
        wrongAnswer3 = numThree

        PositionAnswers4()
    
    elseif (questionSelect == 4) then

        questionText.text = " A circle is a polygon. "

        -- Display the text objects for the true or false question
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        correctAnswer = textTrue

        -- create the wrong answers
        wrongAnswer1 = textFalse

        PositionAnswers2()

    elseif (questionSelect == 5) then

        questionText.text = " Click on the triangle "

         -- Display the shapes 
        tri5.isVisible = true
        square5.isVisible = true
        pentagon1.isVisible = true
        oval2.isVisible = true

        -- create the answer
        correctAnswer = tri5

        -- create the wrong answers
        wrongAnswer1 = square5
        wrongAnswer2 = pentagon1
        wrongAnswer3 = oval2

        PositionAnswers4()


    elseif (questionSelect == 6) then   

        questionText.text = " Which triangle is isosceles? "

        -- Display the shapes
        isosceles6 = true
        rightAngleTri6 = true
        triangle1 = true

        -- create the answer
        correctAnswer = isosceles6

        -- create the wrong answers
        wrongAnswer1 = rightAngleTri6
        wrongAnswer2 = triangle1

        PositionAnswers3()

    elseif (questionSelect == 7) then

        questionText.text = " How many circles are in this photo? "

        -- Display the shapes
        numTwo.isVisible = true
        numFour.isVisible = true
        numOne.isVisible = true
        numZero.isVisible = true

        -- create the answer
        correctAnswer = numTwo

        -- create the wrong answers
        wrongAnswer1 = numFour
        wrongAnswer2 = numOne
        wrongAnswer3 = numZero

        PositionAnswers4()


    elseif (questionSelect == 8) then

        questionText.text = " How many sides does a heptagon have? "

        -- Display the shapes
        numSix.isVisible = true
        numSeven.isVisible = true
        numEight.isVisible = true
        numNine.isVisible = true

        -- create the answer
        correctAnswer = numSeven

        -- create the wrong answers
        wrongAnswer1 = numSix
        wrongAnswer2 = numEight
        wrongAnswer3 = numNine

        PositionAnswers4()


    elseif (questionSelect == 9) then

        questionText.text = " A five-sided polygon is called: "

        -- Make the objects visible
        octagonText.isVisible = true
        pentagonText.isVisible = true
        decagonText.isVisible = true
        hexagonText.isVisible = true

        -- create the answer
        correctAnswer = pentagonText

        -- create the wrong answers
        wrongAnswer1 = octagonText
        wrongAnswer2 = decagonText
        wrongAnswer3 = hexagonText

        PositionAnswers4()

    elseif (questionSelect == 10) then

        questionText.text = " A polygon that has two more sides than a hexagon is called: "

        -- Make the objects visible
        pentagonText.isVisible = true
        octagonText.isVisible = true
        nonagonText.isVisible = true
        hexagonText.isVisible = true

        -- create the answer
        correctAnswer = octagonText

        -- create the wrong answers
        wrongAnswer1 = pentagonText
        wrongAnswer2 = nonagonText
        wrongAnswer3 = hexagonText

        PositionAnswers4()


    elseif (questionSelect == 11) then 

        questionText.text = display.newText(" How many more sides than a pentagon does a decagon have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 25 )

        -- Make the objects visible
        numFive.isVisible = true
        numSix.isVisible = true
        numSeven.isVisible = true
        numTen.isVisible = true

        -- create the answer
        correctAnswer = numFive

        -- create the wrong answers
        wrongAnswer1 = numSix
        wrongAnswer2 = numSeven
        wrongAnswer3 = numTen

        PositionAnswers4()


    elseif (questionSelect == 12) then

        questionText.text = display.newText( " A polygon can have as many sides as it likes. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

        -- Make the objects visible
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        correctAnswer = textTrue

        -- create the wrong answer
        wrongAnswer1 = textFalse

        PositionAnswers2()


    elseif (questionSelect == 13) then

        questionText.text = display.newText( " A polygon is a plane shape with curved sides. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

        -- Make the objects visible
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        correctAnswer = textFalse

        -- create the wrong answer
        wrongAnswer1 = textTrue

        PositionAnswers2()


    elseif (questionSelect == 14) then

        questionText.text = display.newText( " Which angle is acute? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )


    elseif (questionSelect == 15) then

        questionText.text = display.newText( " Parallel lines are lines that never intercept. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 16) then

        questionText.text = display.newText( " What is a right angle? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 17) then

        questionText.text = display.newText( " What do a square and a quadrilateral have in common? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 18) then

        questionText.text = display.newText( " It is possible to draw a triangle with two right angles. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 19) then

        questionText.text = display.newText( " How many pairs of parallel lines does a square have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 20) then

        questionText.text = display.newText( " How many vertices does an octagon have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    end
end




-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------

    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------

    -- create the clock text colour and text
    clockText = display.newText("Time Left: ", display.contentWidth*0.9/2, display.contentHeight*0.5/5, nil, 50)
    clockText:setTextColor(1, 0, 0)

    -----------------------------------------------------------------------------------------

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 985
    heart1.y = 100
    heart1.isVisible = true

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 905
    heart2.y = 100
    heart2.isVisible = true

    heart3= display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 825
    heart3.y = 100
    heart3.isVisible = true

    heart4 = display.newImageRect("Images/heart.png", 80, 80)
    heart4.x = 745
    heart4.y = 100
    heart4.isVisible = true

    heart5 = display.newImageRect("Images/heart.png", 80, 80)
    heart5.x = 665
    heart5.y = 100
    heart5.isVisible = true

    -----------------------------------------------------------------------------------------
    -- making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the answer text object & wrong answer text objects
    questionText = display.newText("", display.contentWidth/2, display.contentHeight/3, Arial, 50)

--[[
    correctAnswer = display.newText("", X1, Y2, Arial, 50)
    correctAnswer.anchorX = 0
    wrongAnswer1 = display.newText("", X2, Y2, Arial, 50)
    wrongAnswer1.anchorX = 0
    wrongAnswer2 = display.newText("", X1, Y1, Arial, 50)
    wrongAnswer2.anchorX = 0
    wrongAnswer3 = display.newText("", X2, Y1, Arial, 50)
    wrongAnswer3.anchorX = 0
]]--
    -- Question 1 --

    circle1 = display.newImage("Images/CircleMeganS@2x.png", X1, Y1)
    circle1.width = 150
    circle1.height = 150
    circle1.isVisible = false




    rectangle1 = display.newImage("Images/RectangleMeganS@2x.png", X1, Y2)
    rectangle1.width = 180
    rectangle1.height = 180
    rectangle1.isVisible = false

    pentagon1 = display.newImage("Images/PentagonMeganS@2x.png", X2, Y1)
    pentagon1.width = 160
    pentagon1.height = 160
    pentagon1.isVisible = false

    triangle1 = display.newImage("Images/TriangleMeganS@2x.png", X2, Y2)
    triangle1.width = 160
    triangle1.height = 160
    triangle1.isVisible = false


    -- Question 2 --

    oval2 = display.newImage("Images/OvalMeganS@2x.png", 0, 0)
    oval2.width = 160
    oval2.height = 160
    oval2.isVisible = false

    -- circle from question 1 

    -- triangle from question 1

    -- square from question 5
    
    -- Question 3 --

    numThree = display.newText("3", 0, 0, nil, 50)
    numThree:setTextColor (1, 1, 0)
    numThree.isVisible = false

    numEight = display.newText("8", 0, 0, nil, 50)
    numEight:setTextColor (1, 1, 0)
    numEight.isVisible = false

    numZero = display.newText("0", 0, 0, nil, 60)
    numZero:setTextColor (1, 1, 0)
    numZero.isVisible = false

    numFour = display.newText("4", 0, 0, nil, 60)
    numFour:setTextColor (1, 1, 0)
    numFour.isVisible = false


    -- Question 4 --

    -- Create the text for the true and false questions
    textTrue = display.newText("True", 0, 0, nil, 50)
    textTrue.x = display.contentWidth*1/3
    textTrue.y = display.contentHeight*2/4
    textTrue:setTextColor (1, 1, 0)
    textTrue.isVisible = false

    textFalse = display.newText("False", 0, 0, nil, 50)
    textFalse.x = display.contentWidth*2/3
    textFalse.y = display.contentHeight*2/4
    textFalse:setTextColor (1, 1, 0)
    textFalse.isVisible = false

    -- Question 5 -- 

    tri5 = display.newImage("Images/RightAngleTriMeganS@2x.png", 0, 0)
    tri5.width = 160
    tri5.height = 160
    tri5.isVisible = false

    -- the same pentagon from question 1 

    -- the same oval as question 2

    square5 = display.newImage("Images/SquareMeganS@2x.png", 0, 0)
    square5.width = 160
    square5.height = 160
    square5.isVisible = false

    -- Question 6 -- 

    isosceles6 = display.newImage("Images/IsoscelesTriMegan@2x.png", 0, 0)
    isosceles6.width = 160
    isosceles6.height = 160
    isosceles6.isVisible = false

    rightAngleTri6 = display.newImage("Images/RightAngleTriMeganS@2x.png", 0, 0)
    rightAngleTri6.width = 160
    rightAngleTri6.height = 160
    rightAngleTri6.isVisible = false

    -- the same triangle displayed from question 1

    -- Question 7 -- 

    shapes = display.newImage("Images/ShapesMeganS@2x.png", 0, 0)
    shapes.width = 160
    shapes.height = 160
    shapes.isVisible = false

    numTwo = display.newText("2", 0, 0, nil, 60)
    numTwo:setTextColor (1, 1, 0)
    numTwo.isVisible = false

    numOne = display.newText("1", 0, 0, nil, 60)
    numOne:setTextColor (1, 1, 0)
    numOne.isVisible = false

    -- the same Zero from question three

    -- the same Four from question three

    -- Question 8 -- 

    numSix = display.newText("6", 0, 0, nil, 60)
    numSix:setTextColor (1, 1, 0)
    numSix.isVisible = false

    -- the same Eight from question three -- 

    numSeven = display.newText("7", 0, 0, nil, 60)
    numSeven:setTextColor (1, 1, 0)
    numSeven.isVisible = false

    numNine = display.newText("9", 0, 0, nil, 60)
    numNine:setTextColor (1, 1, 0)
    numNine.isVisible = false


    -- Question 9 --

    pentagonText = display.newText("Pentagon", X1, Y2, nil, 40)
    pentagonText.isVisible = false

    octagonText = display.newText("Octagon", X2, Y2, nil, 40)
    octagonText.isVisible = false

    decagonText = display.newText("Decagon", X1, Y1, nil, 40)
    decagonText.isVisible = false

    hexagonText = display.newText("Hexagon", X2, Y1, nil, 40)
    hexagonText.isVisible = false

    -- Question 10 --

    nonagonText = display.newText("Nonagon", X1, Y2, nil, 40)
    nonagonText.isVisible = false






    -----------------------------------------------------------------------------------------

    -- the hearts --

    sceneGroup:insert( heart1 )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )
    sceneGroup:insert( heart4 )    
    sceneGroup:insert( heart5 )

    sceneGroup:insert( bkg )
    sceneGroup:insert( cover )

    -- add the group scene insert for the timer
    sceneGroup:insert( clockText )

    -- the group scene insert for all of the objects in the questions

    -- question 1 --
    sceneGroup:insert( circle1 )
    sceneGroup:insert( rectangle1 )
    sceneGroup:insert( pentagon1 )
    sceneGroup:insert( triangle1 )

    -- question 2 --
    sceneGroup:insert( oval2 )

    -- question 3 -- 
    sceneGroup:insert( numThree )
    sceneGroup:insert( numEight )
    sceneGroup:insert( numZero )
    sceneGroup:insert( numFour )

    -- question 4 -- 
    sceneGroup:insert( textTrue )
    sceneGroup:insert( textFalse )

    -- question 5 --
    sceneGroup:insert( tri5 )
    sceneGroup:insert( square5 )

    -- question 6 --
    sceneGroup:insert( isosceles6 )
    sceneGroup:insert( rightAngleTri6 )

    -- question 7 --
    sceneGroup:insert( numTwo )
    sceneGroup:insert( numOne )
    sceneGroup:insert( shapes )
    -- question 8 --

    sceneGroup:insert( numSix )

    -- question 9 --
    sceneGroup:insert( numSeven )
    sceneGroup:insert( numNine )
--    sceneGroup:insert(  )

--[[
    sceneGroup:insert( correctAnswer )
    sceneGroup:insert( wrongAnswer1 )
    sceneGroup:insert( wrongAnswer2 )
    sceneGroup:insert( wrongAnswer3 )
--]]
    sceneGroup:insert( questionText )
    sceneGroup:insert( pentagonText )
    sceneGroup:insert( octagonText )
    sceneGroup:insert( decagonText )
    sceneGroup:insert( hexagonText )




end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        DisplayQuestion()


        AddListeners()

        StartTimer()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.


    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

        removeEventListener()

        timer.cancel(countDownTimer)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup"). 
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



-----------------------------------------------------------------------------------------

return scene
