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
local physics = require( "physics")


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
local questionText2

local answerText 
local wrongText1
local wrongText2
local wrongText3

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false

local rectangularprism
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
        BackToLevel2()
    end
end



--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText1(touch)
    
    if (touch.phase == "ended") then
        
        BackToLevel2( )
         
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText2(touch)
    
    if (touch.phase == "ended") then

        BackToLevel2( )
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText3(touch)
    
    if (touch.phase == "ended") then

        BackToLevel2( )
        
    end
end 

--adding the event listeners 
function AddTextListeners2 ()    
    answerText:addEventListener( "touch", TouchListenerAnswerText)
    wrongText1:addEventListener( "touch", TouchListenerWrongText1)
    wrongText2:addEventListener( "touch", TouchListenerWrongText2)
    wrongText3:addEventListener( "touch", TouchListenerWrongText3)
end

--removing the event listeners
function RemoveTextListeners2()
    answerText:removeEventListener( "touch", TouchListenerAnswerText)
    wrongText1:removeEventListener( "touch", TouchListenerWrongText1)
    wrongText2:removeEventListener( "touch", TouchListenerWrongText2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongText3)
end


local function DisplayQuestion()
    -- choose a random question
    question = math.random(1,2)

    if (question == 1) then 
        -- create the question
        questionText.text = "How many faces are there?"
        
        rectangularprism.isVisible = true

        -- create the answer
        answerText.text = 6

        -- create the wrong answers
        wrongText1.text = 4
        wrongText2.text = 7
        wrongText3.text = 3


    elseif (question == 2) then 
        --create the question
        questionText.text = "How many vertices does a "
        questionText2.text = "rectangular prism have?"

        --create the answer
        answerText.text = 8

        --create the incorrect answers
        wrongText1.text = 4
        wrongText2.text = 10
        wrongText3.text = 12

        -- make the other things from other questions invisible
        rectangularprism.isVisible = false
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
    questionText2 = display.newText("", display.contentCenterX, display.contentCenterY*4/8, Arial, 50)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 75)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 75)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 75)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 75)
    wrongText3.anchorX = 0

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

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(questionText2)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
    sceneGroup:insert(rectangularprism)

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
        AddTextListeners2()
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
        RemoveTextListeners2()
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