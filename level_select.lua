-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: John Omage
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

-- Background sound
local backgroundSound = audio.loadSound( "Sounds/bensound-littleidea.mp3" )
local backgroundSoundChannel = audio.play(backgroundSound,{channel=1,loops=-1})

local buttonSound = audio.loadSound( "Sounds/baa.mp3")
local buttonSoundChannel

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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local textObject


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "start_level_1_screen", {effect = "slideDown", time = 1000})
end    

-- Creating Transition to Level1 Screen
local function Level2ScreenTransition( )
    composer.gotoScene( "start_level_2_screen", {effect = "slideDown", time = 1000})
end    

-- Creating Transition to Level1 Screen
local function Level3ScreenTransition( )
    composer.gotoScene( "start_level_3_screen", {effect = "slideDown", time = 1000})
end    

local function BackButtonTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
end  

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    display.setDefault("background", 124/255, 249/255, 250/255)
    

    -----------------------------------------------------------------------------------------
    -- TEXT
    -----------------------------------------------------------------------------------------
    textObject = display.newText( "Level Select", 500, 100, nil, 100)
    -- sets the color of the text
    textObject:setTextColor(75/255, 55/255, 40/255)

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    lvl2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 512,
            y = display.contentHeight/2,
            width = 185,
            height = 185,

            -- Insert the images here
            defaultFile = "Images/JohnOmage2.png",
            overFile = "Images/JohnOmage22.png",
  
            -- When the button is released, call the Level1 screen transition function
            onRelease = Level2ScreenTransition  
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    lvl3Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 748,
            y = display.contentHeight/2,
            width = 185,
            height = 185,

            -- Insert the images here
            defaultFile = "Images/JohnOmage3.png",
            overFile = "Images/JohnOmage33.png",

            -- When the button is released, call the Credits transition function
            onRelease = Level3ScreenTransition
            
        } ) 
    -----------------------------------------------------------------------------------------

    -- Creating Instructions Button
    lvl1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 276,
            y = display.contentHeight/2,
            width = 185,
            height = 185,

            -- Insert the images here
            defaultFile = "Images/JohnOmage1.png",
            overFile = "Images/JohnOmage11.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 128,
            y = 100,
            width = 110,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedRadinW@2x.png",
            overFile = "Images/BackButtonPressedRadinW@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = BackButtonTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( lvl1Button )
    sceneGroup:insert( lvl2Button )
    sceneGroup:insert( lvl3Button )
    sceneGroup:insert( backButton )
    sceneGroup:insert( textObject )
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
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    audio.play(baqckgroundSoundChannel)
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
        --audio.stop(backgroundSoundChannel)


    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    
end 

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