-----------------------------------------------------------------------------------------
-- main_menu.lua
-- Created by: Megan
-- Date: Month Day, Year
-- Description: This is the screen if you have completed level 1

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
sceneName = "you_completed_level1"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local background
local MainMenuButton
local Level2Button

-- Create the car for the animation
local car

-- Create the pylon for the animation
local Pylon1
local Pylon2

-- Create the sliding text
local Text1
local Text2


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function MainMenuTransition( )       
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level2ScreenTransition( )
    composer.gotoScene( "start_level_2_screen", {effect = "zoomInOutFade", time = 500})
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

    -- Set a light blue colour to the background
    display.setDefault("background", 51/255, 153/255, 1)


    -- Create the car
    car = display.newImageRect("Images/MainMenu_Car.png", 0, 0)
    car.x = 0
    car.y = display.contentHeight*1.8/3
    car.width = 250
    car.height = 160

    -- Create the pylon
    Pylon1 = display.newImage("Images/Pylon.png", 0, 0)
    Pylon1.x = 0
    Pylon1.y = display.contentHeight*1.8/3
    Pylon1.width = 90
    Pylon1.height = 100


    Pylon2 = display.newImage("Images/Pylon.png", 0, 0)
    Pylon2.x = 0
    Pylon2.y = display.contentHeight*1.8/3
    Pylon2.width = 90
    Pylon2.height = 100


    -- Create the text for the animation
    Text1 = display.newText("You have completed level 1!", 0, 0, nil, 60 )
    Text1:setTextColor(1, 128/255, 0/255)
    Text1.x = 0 
    Text1.y = display.contentHeight*1/6


    Text2 = display.newText("Click the button to move onto the next level", 0, 0, nil, 47 )
    Text2:setTextColor(1, 128/255, 0/255)
    Text2.x = 0 
    Text2.y = display.contentHeight*1/3


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Start Button
    MainMenuButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1.5/8,
            y = display.contentHeight*6.7/8,
            width = 300,
            height = 200,

            -- Insert the images here
            defaultFile = "Images/mainmenu_ButtonUnpressedMeganS@2x.png", 
            overFile = "Images/mainmenu_ButtonPressedMeganS@2x.png", 

            -- When the button is released, call the Level1 screen transition function
            onRelease = MainMenuTransition 
       
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    Level2Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6.5/8,
            y = display.contentHeight*6.7/8,
            width = 300,
            height = 200,

            -- Insert the images here
            defaultFile = "Images/Level2_ButtonUnpressedMeganS@2x.psd.png",
            overFile = "Images/Level2_ButtonPressedMeganS@2x.psd.png",

            -- When the button is released, call the Credits transition function
            onRelease = Level2ScreenTransition
        } ) 

 -----------------------------------------------------------------------------------------
   

    -- Associating button widgets with this scene
    sceneGroup:insert( MainMenuButton )
    sceneGroup:insert( Level2Button )

    -- Add the texts and objects into the scene
    sceneGroup:insert( Text1 )
    sceneGroup:insert( Text2 )
    sceneGroup:insert( Pylon1 )
    sceneGroup:insert( Pylon2 )
    sceneGroup:insert( car )


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
    elseif ( phase == "did" ) then  

        -- Move the car
        transition.moveTo( car, {x = display.contentWidth*2.4/3, y = display.contentHeight*1.8/3 , time = 2000})

        -- Move text1 and text2

        transition.moveTo( Text2, {x = display.contentWidth*1.5/3, y = display.contentHeight*1/3 , time = 2500})

        transition.moveTo( Text1, {x = display.contentWidth*1.5/3, y = display.contentHeight*1/6 , time = 3000})

        -- Move Pylon1 and Pylon2

        transition.moveTo( Pylon2, {x = display.contentWidth*1.5/3, y = display.contentHeight*1.8/3 , time = 2700})

        transition.moveTo( Pylon1, {x = display.contentWidth*1/3, y = display.contentHeight*1.8/3 , time = 3100})

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
