-----------------------------------------------------------------------------------------
--
--start_level_screen.lua
-- Created by: Megan
-- Date: May 22, 2019
-- Description: This is the start level screen. This appears when 
-- the player starts the level
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "start_level_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
-- The local variables for the sound


----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- Create the background image
local bkg
local stopLight
local red
local yellow
local green
local startText

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that will go to the main menu 
local function gotoLevel1()

    composer.gotoScene( "level1_screen" )
end

local function redStopLight()

    red.isVisible = true
end

local function yellowStopLight()

    yellow.isVisible = true
end

local function greenStopLight()

    green.isVisible = true
end

local function StartText()

    startText.isVisible = true
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    display.setStatusBar(display.HiddenStatusBar)

    -- Set the background to be black
    display.setDefault( "background", 1, 1, 1  ) 

    -- Display the stop light
    stopLight = display.newImage("Images/StopLightMeganS@2x.png", 0, 0)
    stopLight.x = display.contentCenterX
    stopLight.y = display.contentCenterY

    stopLight:scale(0.5,0.47)

    -- Create the start text 
    startText = display.newText("Start!", 0, 0, nil, 80)
    startText.x = display.contentWidth*2.5/3
    startText.y = display.contentHeight*1/2
    startText:setTextColor(0, 0, 0)
    startText.isVisible = false

    -- Create the colours for the stop light
    red = display.newImage("Images/RedMeganS@2x.png", 0, 0)
    red.x = display.contentWidth*1.05/2
    red.y = display.contentHeight*0.8/4
    red:scale(0.1,0.1)
    red.isVisible = false

    yellow = display.newImage("Images/YellowMeganS@2x.png", 0, 0)
    yellow.x = display.contentWidth*1.05/2
    yellow.y = display.contentHeight*1.5/3
    yellow:scale(0.1,0.1)
    yellow.isVisible = false

    green = display.newImage("Images/GreenMeganS@2x.png", 0, 0)
    green.x = display.contentWidth*1.05/2
    green.y = display.contentHeight*2.4/3
    green:scale(0.1,0.1)
    green.isVisible = false

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( stopLight )
    sceneGroup:insert( red )
    sceneGroup:insert( yellow )
    sceneGroup:insert( green )
    sceneGroup:insert( startText )


end 

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.views

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Go to the level 1 screen after the given time.
        timer.performWithDelay ( 3000, gotoLevel1) 

        -- Create the animation for the stop lights
        timer.performWithDelay( 1000, redStopLight )
        timer.performWithDelay( 2200, yellowStopLight )
        timer.performWithDelay( 2400, greenStopLight )
        timer.performWithDelay( 2400, StartText )

       
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
    
      
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
