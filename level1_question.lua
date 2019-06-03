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
local totalSeconds = 2
local secondsLeft = 2
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

-- The positions for the objects/answers
local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*5/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local textTouched = false

-- Create the answer texts 
local questionText
local answerText 
local wrongText1
local wrongText2
local wrongText3

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
            ScoreObject.isVisible = false
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


local function TouchListenerWrongText1(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


local function TouchListenerWrongText2(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


local function TouchListenerWrongText3(touch)
    if (touch.phase == "ended") then

        DecreaseLives1( )
        BackToLevel1( )
    end 
end


--adding the event listeners 
local function AddTextListeners ( )

    answerText:addEventListener("touch", TouchListenerAnswer)
    wrongText1:addEventListener("touch", TouchListenerWrongText1)
    wrongText2:addEventListener("touch", TouchListenerWrongText2)
    wrongText3:addEventListener("touch", TouchListenerWrongText3)

end

--removing the event listeners
local function RemoveTextListeners( )
--[[
    answerText:RemoveTextListeners("touch", TouchListenerAnswer)
    wrongText1:RemoveTextListeners("touch", TouchListenerWrongText1)
    wrongText2:RemoveTextListeners("touch", TouchListenerWrongText2)
    wrongText3:RemoveTextListeners("touch", TouchListenerWrongText3)
--]]
end


--local function Answers()

local function DisplayQuestion( )

    -- creating random start position in a certian area
    questionSelect = math.random(1,4)

    if (questionSelect == 1) then

        questionText.text = "Which shape has 5 sides?"

        -- Display the objects
        circle1.isVisible = true
        rectangle1.isVisible = true
        pentagon1.isVisible = true
        triangle1.isVisible = true

        -- create the answer
        answerText = pentagon1

        -- create the wrong answers
        wrongText1 = rectangle1
        wrongText2 = circle1
        wrongText3 = triangle1

        -- Set the position of the objects
        circle1.x = X1
        circle1.y = Y1

        rectangle1.x = X2
        rectangle1.y = Y2

        pentagon1.x = X1
        pentagon1.y = Y2

        triangle1.x = X2
        triangle1.y = Y1



    elseif (questionSelect == 2) then

        questionText.text = "What shape is an oval?"

        -- Display the shapes 
        oval2.isVisible = true
        square5.isVisible = true
        circle1.isVisible = true
        tri5.isVisible = true

        -- create the answer
        answerText = oval2

        -- create the wrong answers
        wrongText1 = square5
        wrongText2 = circle1
        wrongText3 = tri5

        -- Set the positions for the shapes

        oval2.x = X1
        oval2.y = Y1

        square5.x = X1
        square5.y = Y2

        circle1.x = X2
        circle1.y = Y1

        tri5.x = X2
        tri5.y = Y2


    elseif (questionSelect == 3) then 

        questionText.text = "How many vertices does a circle have?"

        -- Display the numbers 
        numThree.isVisible = true
        numEight.isVisible = true
        numZero.isVisible = true
        numFour.isVisible = true

        -- create the answer
        answerText = numZero

        -- create the wrong answers
        wrongText1 = numFour
        wrongText2 = numEight
        wrongText3 = numThree
        

        -- Set the positions for the numbers 
        numThree.x = X1
        numThree.y = Y1

        numEight.x = X1
        numEight.y = Y2

        numZero.x = X2
        numZero.y = Y1

        numFour.x = X2
        numFour.y = Y2

    elseif (questionSelect == 4) then

        questionText.text = " A circle is a polygon. "

        -- Display the text objects for the true or false question
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        answerText = textTrue

        -- create the wrong answers
        wrongText1 = textFalse

    elseif (questionSelect == 5) then

        questionText.text = " Click on the triangle "

         -- Display the shapes 
        tri5.isVisible = true
        square5.isVisible = true
        pentagon1.isVisible = true
        oval2.isVisible = true

        -- create the answer
        answerText = tri5

        -- create the wrong answers
        wrongText1 = square5
        wrongText2 = pentagon1
        wrongText3 = oval2

        -- Set the positions for the shapes
        tri5.x = X1
        tri5.y = Y1

        square5.x  = X1
        square5.y = Y2

        pentagon1.x = X2
        pentagon1.y = Y1

        oval2.x = X2
        oval2.y  = Y2


    elseif (questionSelect == 6) then   

        questionText.text = " Which triangle is isosceles? "

        -- Display the shapes
        isosceles6 = true
        rightAngleTri6 = true
        triangle1 = true

        -- create the answer
        answerText = isosceles6

        -- create the wrong answers
        wrongText1 = rightAngleTri6
        wrongText2 = triangle1

        -- Set the positions for the shapes
        isosceles6.x = X1
        isosceles6.y = Y1

        rightAngleTri6.x = X1
        rightAngleTri6.y = Y2

        triangle1.x = X2
        triangle1.y = Y2



    elseif (questionSelect == 7) then

        questionText.text = " How many circles are in this photo? "

        -- Display the shapes
        numTwo.isVisible = true
        numFour.isVisible = true
        numOne.isVisible = true
        numZero.isVisible = true

        -- create the answer
        answerText = numTwo

        -- create the wrong answers
        wrongText1 = numFour
        wrongText2 = numOne
        wrongText3 = numZero

         -- Set the positions for the shapes
        numTwo.x = X1
        numTwo.y = Y1

        numFour.x = X1
        numFour.y = Y2

        numOne.x = X2 
        numOne.y = Y2

        numZero.x = X2
        numZero.y = Y1


    elseif (questionSelect == 8) then

        questionText.text = " How many sides does a heptagon have? "

        -- Display the shapes
        numSix.isVisible = true
        numSeven.isVisible = true
        numEight.isVisible = true
        numNine.isVisible = true

        -- create the answer
        answerText = numSeven

        -- create the wrong answers
        wrongText1 = numSix
        wrongText2 = numEight
        wrongText3 = numNine

        -- Set the positions for the shapes
        numSeven.x = X1
        numSeven.y = Y1

        numSix.x = X1
        numSix.y = Y2

        numEight.x = X2 
        numEight.y = Y2

        numNine.x = X2
        numNine.y = Y1



    elseif (questionSelect == 9) then

        questionText.text = " A five-sided polygon is called: "

        -- Make the objects visible
        octagonText.isVisible = true
        pentagonText.isVisible = true
        decagonText.isVisible = true
        hexagonText.isVisible = true

        -- create the answer
        answerText = pentagonText

        -- create the wrong answers
        wrongText1 = octagonText
        wrongText2 = decagonText
        wrongText3 = hexagonText

        -- Set the positions for the shapes
        octagonText.x = X1
        octagonText.y = Y1

        pentagonText.x = X1
        pentagonText.y = Y2

        decagonText.x = X2
        decagonText.y = Y1

        hexagonText.x = X2
        hexagonText.y = Y2


    elseif (questionSelect == 10) then

        questionText.text = " A polygon that has two more sides than a hexagon is called: "

        -- Make the objects visible
        pentagonText.isVisible = true
        octagonText.isVisible = true
        nonagonText.isVisible = true
        hexagonText.isVisible = true

        -- create the answer
        answerText = octagonText

        -- create the wrong answers
        wrongText1 = pentagonText
        wrongText2 = nonagonText
        wrongText3 = hexagonText

        -- set the positions for the shapes
        octagonText.x = X1
        octagonText.y = Y1

        pentagonText.x = X1
        pentagonText.y = Y2

        decagonText.x = X2
        decagonText.y = Y1

        hexagonText.x = X2
        hexagonText.y = Y2


    elseif (questionSelect == 11) then 

        questionText.text = display.newText(" How many more sides than a pentagon does a decagon have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 25 )

        -- Make the objects visible
        numFive.isVisible = true
        numSix.isVisible = true
        numSeven.isVisible = true
        numTen.isVisible = true

        -- create the answer
        answerText = numFive

        -- create the wrong answers
        wrongText1 = numSix
        wrongText2 = numSeven
        wrongText3 = numTen

        -- set the positions for the shapes
        numFive.x = X1
        numFive.y = Y1

        numSix.x = X1
        numSix.y = Y2

        numSeven.x = X2
        numSeven.y = Y1

        numTen.x = X2
        numTen.y = Y2


    elseif (questionSelect == 12) then

        questionText.text = display.newText( " A polygon can have as many sides as it likes. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

        -- Make the objects visible
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        answerText = textTrue

        -- create the wrong answer
        wrongText1 = textFalse

        -- set the positions for the shapes
        textTrue.x = X1
        textTrue.y = Y1

        textFalse.x = X1
        textFalse.y = Y2


    elseif (questionSelect == 13) then

        questionText.text = display.newText( " A polygon is a plane shape with curved sides. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

        -- Make the objects visible
        textTrue.isVisible = true
        textFalse.isVisible = true

        -- create the answer
        answerText = textFalse

        -- create the wrong answer
        wrongText1 = textTrue

        -- set the positions for the shapes
        textTrue.x = X1
        textTrue.y = Y1

        textFalse.x = X1
        textFalse.y = Y2


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
    clockText = display.newText("Time Left: ", display.contentWidth/2, display.contentHeight/2, nil, 60)
    clockText:setTextColor(0, 0, 0)

    -----------------------------------------------------------------------------------------
    -- making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)

    answerText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)
    answerText.anchorX = 0
 
    wrongText1 = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)
    wrongText1.anchorX = 0

    wrongText2 = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)
    wrongText2.anchorX = 0

    wrongText3 = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)
    wrongText3.anchorX = 0

    -- Question 1 --

    circle1 = display.newImage("Images/CircleMeganS@2x.png", 0, 0)
    circle1.width = 150
    circle1.height = 150
    circle1.isVisible = false

    rectangle1 = display.newImage("Images/RectangleMeganS@2x.png", 0, 0)
    rectangle1.width = 180
    rectangle1.height = 180
    rectangle1.isVisible = false

    pentagon1 = display.newImage("Images/PentagonMeganS@2x.png", 0, 0)
    pentagon1.width = 160
    pentagon1.height = 160
    pentagon1.isVisible = false

    triangle1 = display.newImage("Images/TriangleMeganS@2x.png", 0, 0)
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

    square5 = display.newImage("Images/SqaureMeganS@2x.png", 0, 0)
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

    -- question 8 --

    sceneGroup:insert( numSix )

    -- insert the questions for question 9
    sceneGroup:insert( bkg )
    sceneGroup:insert( cover )
    sceneGroup:insert( answerText )
    sceneGroup:insert( wrongText1 )
    sceneGroup:insert( wrongText2 )
    sceneGroup:insert( wrongText3 )

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

        AddTextListeners()

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

        RemoveTextListeners()

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
