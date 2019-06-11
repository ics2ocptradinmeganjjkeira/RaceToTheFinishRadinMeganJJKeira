-----------------------------------------------------------------------------------------
--
-- level2_question.lua
-- Created by: Keira L
-- Date: Mat 22, 2019
-- Description: This is the level 2 question screen of the game
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg
local cover

local answerPosition = 1

local questionText

local answerText 
local wrongText1
local wrongText2
local wrongText3
local trueText
local falseText

local X1 = display.contentWidth*1/7
local X2 = display.contentWidth*3.75/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7
local TRUE1 = display.contentWidth/3.5
local TRUE2 = display.contentHeight/2
local FALSE1 = display.contentWidth/1.5
local FALSE2 = display.contentHeight/2

local userAnswer
local textTouched = false

local rectangularprism
local sphere
local cylinder

-- Create the local variables for the timer
local totalSeconds = 30
local secondsLeft = 30
local clockText 
local countDownTimer

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel2() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel2()
end 

local function TouchListenerAnswerText(touch)

    if (touch.phase == "ended") then

        CountScore2()
        BackToLevel2()
    end
end



--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText1(touch)
    
    if (touch.phase == "ended") then
        
        DecreaseLives2()
        BackToLevel2( )
         
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText2(touch)
    
    if (touch.phase == "ended") then

        DecreaseLives2()
        BackToLevel2( )
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText3(touch)
    
    if (touch.phase == "ended") then

        DecreaseLives2()
        BackToLevel2( )
        
    end
end 

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerTrueText(touch)
    
    if (touch.phase == "ended") then

        CountScore2()
        BackToLevel2( )
        
    end
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerFalseText(touch)
    
    if (touch.phase == "ended") then

        DecreaseLives2()
        BackToLevel2( )
        
    end
end

--adding the event listeners 
local function AddTextListeners ( )    
    answerText:addEventListener( "touch", TouchListenerAnswerText)
    wrongText1:addEventListener( "touch", TouchListenerWrongText1)
    wrongText2:addEventListener( "touch", TouchListenerWrongText2)
    wrongText3:addEventListener( "touch", TouchListenerWrongText3)
    trueText:addEventListener( "touch", TouchListenerTrueText)
    falseText:addEventListener( "touch", TouchListenerFalseText)
end

--removing the event listeners
local function RemoveTextListeners( )
    answerText:removeEventListener( "touch", TouchListenerAnswerText)
    wrongText1:removeEventListener( "touch", TouchListenerWrongText1)
    wrongText2:removeEventListener( "touch", TouchListenerWrongText2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongText3)
    trueText:removeEventListener( "touch", TouchListenerTrueText)
    falseText:removeEventListener( "touch", TouchListenerFalseText)
end


local function DisplayQuestion()
    -- choose a random question
    question = math.random(10, 10)

    if (question == 1) then 
        -- create the question
        questionText.text = "How many faces are there?"
        

        -- create the answer
        answerText.text = 6

        -- create the wrong answers
        wrongText1.text = 4
        wrongText2.text = 7
        wrongText3.text = 3

        -- make the objects needed visible and the others invisible
        rectangularprism.isVisible = true
        cylinder.isVisible = false
        sphere.isVisible = false


    elseif (question == 2) then 
        --create the question
        questionText.text = "How many vertices does a\nrectangular prism have?"

        --create the answer
        answerText.text = 8

        --create the incorrect answers
        wrongText1.text = 4
        wrongText2.text = 10
        wrongText3.text = 12

        -- make the other things from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false


    elseif (question == 3) then 
        --create the question
        questionText.text = "What type of 3D shape has one \nface? "

        --create the answer
        answerText.text = "cone"

        --create the incorrect answers
        wrongText1.text = "rectangular \nprism"
        wrongText2.text = "octagonal \nprism"
        wrongText3.text = "sphere"

        -- make the other things from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false


    elseif (question == 4) then 
        --create the question
        questionText.text = "What two shapes are in a\nsquare-based pyramid?"

        --create the answer
        answerText.text = "square, \ntriangle"

        --create the incorrect answers
        wrongText1.text = "square, \ncircle"
        wrongText2.text = "triangle, \ncircle"
        wrongText3.text = "square, \nrectangle"

        -- make the other things from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false

    elseif (question == 5) then
        -- create the question
        questionText.text = "How many edges does a sphere \nhave?"

        -- create the anser
        answerText.text = "0"

        -- create then wrong answers
        wrongText1.text = "2"
        wrongText2.text = "14"
        wrongText3.text = "8"

        -- make the other objects from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false
    
    
    elseif (question == 6) then
        -- create the question
        questionText.text = "Which 3D shape has 10 faces?"

        -- create the answer text
        answerText.text = "octagonal \nprism"

        -- create the wrong answers
        wrongText1.text = "hexagonal \nprism"
        wrongText2.text = "cylinder"
        wrongText3.text = "sphere"

        -- make the other objects from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false

    
    elseif (question == 7) then
        -- create the question text
        questionText.text = "What colour is the cylinder?"

        rectangularprism.isVisible = true
        cylinder.isVisible = true
        sphere.isVisible = true

        -- create the answer text
        answerText.text = "purple"

        -- create the wrong answers
        wrongText1.text = "green"
        wrongText2.text = "blue"
        wrongText3.text = "red"
    
    elseif (question == 8) then
        -- create the question text
        questionText.text = "How many edges does \n triangular prism have?"

        -- create the answer text
        answerText.text = "6"

        -- create the wrong answers
        wrongText1.text = "0"
        wrongText2.text = "12"
        wrongText3.text = "9"

        -- make the other objects from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false

    elseif (question == 9) then
        -- create the question text
        questionText.text = "Which shape has 8 vertices?"

        -- create the answer text
        trueText.text = "true"

        -- create the wrong answer
        falseText.text = "false"

        -- make the other objects from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false

    elseif (question == 10) then
        -- create the question text
        questionText.text = "Which shape has no faces?"

        -- create the answer text
        answerText.text = "sphere"

        -- create the wrong answers
        wrongText1.text = "triangular\nprism"
        wrongText2.text = "rectangular\nprism"
        wrongText3.text = "cone"
        
        -- make the other objects from other questions invisible
        rectangularprism.isVisible = false
        cylinder.isVisible = false
        sphere.isVisible = false
    end  
end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText.x = X1
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2

    elseif (answerPosition == 3) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2

    elseif (answerPosition == 4) then

        answerText.x = X2
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X1
        wrongText3.y = Y1
  
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
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 50)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 50)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 50)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 50)
    wrongText3.anchorX = 0

    -- create the text for true and false answers
    trueText = display.newText("", TRUE1, TRUE2, Arial, 50)
    trueText.anchorX = 0
    falseText = display.newText("", FALSE1, FALSE2, Arial, 50)
    falseText.anchorX = 0

    -- add the rectangular prism
    rectangularprism = display.newImage("Images/rectangularprism1.png", 5, 5)
    -- make the image smaller
    rectangularprism:scale(0.55, 0.55)
    --  set the location on the x-axis
    rectangularprism.x = display.contentWidth/2.2
    -- set the location on the y-axis
    rectangularprism.y = display.contentHeight/3
    -- make the prism invisible
    rectangularprism.isVisible = false

    -- add the rectangular prism
    cylinder = display.newImage("Images/cylinder.png", 5, 5)
    -- make the image smaller
    cylinder:scale(0.45, 0.45)
    --  set the location on the x-axis
    cylinder.x = display.contentWidth/3.4
    -- set the location on the y-axis
    cylinder.y = display.contentHeight/3
    -- make the prism invisible
    cylinder.isVisible = false

    -- add the rectangular prism
    sphere = display.newImage("Images/sphere.png", 5, 5)
    -- make the image smaller
    sphere:scale(0.25, 0.25)
    --  set the location on the x-axis
    sphere.x = display.contentWidth/1.5
    -- set the location on the y-axis
    sphere.y = display.contentHeight/3
    -- make the prism invisible
    sphere.isVisible = false

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
    sceneGroup:insert(trueText)
    sceneGroup:insert(falseText)
    sceneGroup:insert(rectangularprism)
    sceneGroup:insert(cylinder)
    sceneGroup:insert(sphere)

    -- insert all objects for this scene into the scene group

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
        PositionAnswers()
        AddTextListeners()
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
        --parent:ResumeLevel2()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
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