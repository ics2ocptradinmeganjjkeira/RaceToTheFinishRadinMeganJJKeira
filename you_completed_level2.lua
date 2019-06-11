-----------------------------------------------------------------------------------------
-- main_menu.lua
-- Created by: Megan
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "you_completed_level2"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local level3Button
local backButton
local bkg

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

--local backgroundSound = audio.loadSound("Sounds/Race-track.wav")
--local backgroundSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function MainMenuTransition( )       
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level3ScreenTransition( )
    composer.gotoScene( "start_level_3_screen", {effect = "zoomInOutFade", time = 1000})
end    



-------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -------------------------------------------------------------------------------------


    -- Hide the status bar 
    display.setStatusBar(display.HiddenStatusBar)


    -- Insert the background image
    bkg = display.newImageRect("Images/you_completed_level2.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Credits Button
    level3Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 740,
            y = display.contentHeight/1.50,
            width = 250,
            height = 250,

            -- Insert the images here
            defaultFile = "Images/level3button.PNG",
            overFile = "Images/level3button(over).png",

            -- When the button is released, call the Credits transition function
            onRelease = Level3ScreenTransition
            
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*0.5/8,
        y = display.contentHeight*15/16,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressed.png",
        overFile = "Images/BackButtonPressed.png",

        -- Setting Functional Properties
        onRelease = MainMenuTransition

    } )

    -- scale down the size
    backButton:scale(0.33, 0.33)


 -----------------------------------------------------------------------------------------
   

    -- Associating button widgets with this scene
    sceneGroup:insert( bkg )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( backButton )

 
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
 --       backgroundSoundChannel = audio.play(backgroundSound)  
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then  




    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        audio.stop()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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
