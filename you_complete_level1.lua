-----------------------------------------------------------------------------------------
-- main_menu.lua
-- Created by: Megan
-- Date: June 4, 2019
-- Description: This is the level 1 complete screen. This screen will appear when the user 
-- completes the level. 
-----------------------------------------------------------------------------------------

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
sceneName = "you_complete_level1"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg

local mainMenu_Button
local level2_Button


-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

local backgroundSound = audio.loadSound("Sounds/Race-track.wav")
local backgroundSoundChannel

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
soundOn = true

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level2 Screen
local function Level2ScreenTransition( )
    composer.gotoScene( "level2_screen", {effect = "flipFadeOutIn", time = 1000})
end

-----------------------------------------------------------------------------------------

-- Creating Transition to Level Select Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 1000})
end   
-----------------------------------------------------------------------------------------

  

----------------------------------------------------------------------------------------
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

    -- Insert the background image and set it to the center of the screen
    bkg = display.newImage("Images/MainMenuMeganS.png")

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Start Button
    mainmenu_Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*4/8,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressed.png", 
            overFile = "Images/PlayButtonPressed.png", 

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition 
       
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    level2_Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*5.25/8,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Level2_ButtonUnpressedMeganS@2x.psd.png",
            overFile = "Images/Level2_ButtonPressedMeganS@2x.psd.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

 -----------------------------------------------------------------------------------------
   

    -- Associating button widgets with this scene
    sceneGroup:insert( mainmenu_Button )
    sceneGroup:insert( level2_Button )

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

        -- Move the cloud
        transition.moveTo( Cloud, {x = 250, y = 100 , time = 3000})

        transition.moveTo( Car, {x = display.contentWidth*7.67/10, y = display.contentHeight*8.7/10 , time = 2000})

        -- Play the background music
        backgroundSoundChannel = audio.play(backgroundSound, {loops = -1})

        -- Add the event listeners
        MuteButton:addEventListener("touch", Mute)
        UnmuteButton:addEventListener("touch", Unmute)


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

        MuteButton:removeEventListener("touch", Mute)
        UnmuteButton:removeEventListener("touch", Unmute)

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
