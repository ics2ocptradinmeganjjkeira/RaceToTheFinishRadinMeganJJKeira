-----------------------------------------------------------------------------------------
--
-- level2_screen.lua
-- Created by: Keira L
-- Date: May 21, 2019
-- Description: This is the level 2 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image

local car 

-- Create the arrows for the car to move left or right
local rArrow 
local lArrow

-- Create the physics for the car
local motionx = 0
local SPEED = 8
local SPEED2 = -8
local LINEAR_VELOCITY = -100
local GRAVITY = 9

-- create the lives
local heart1
local heart2
local heart3
local heart4
local heart5
local numLives = 5

--create the walls
local leftW
local rightW
local topW
local ground

-- add the items the car interacts with
local pylon1
local pylon2
local pylon3
local thePylon
local tree
local rock

-- create the score
local score = 0

-- Create the local variables for the timer
local totalSeconds = 60
local secondsLeft = 60
local clockText 
local countDownTimer

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "zoomOutInFadeRotate", time = 500})
end

----------------------------------------------------------------------------------------- 
 
-- When right arrow is touched, move character right
local function right (touch)
    motionx = SPEED
    car.xScale = 1
end

-- When left arrow is touched, move character right
local function left (touch)
    motionx = SPEED2
    car.xScale = -1
end

-- Move character horizontally
local function movePlayer (event)
    car.x = car.x + motionx
end
 
-- Stop character movement when no arrow is pushed
local function stop (event)
    if (event.phase =="ended") then
        motionx = 0
    end
end


local function AddArrowEventListeners()
    rArrow:addEventListener("touch", right)
    lArrow:addEventListener("touch", left)
end

local function RemoveArrowEventListeners()
    rArrow:removeEventListener("touch", right)
    lArrow:removeEventListener("touch", left)
end


local function AddRuntimeListeners()
    Runtime:addEventListener("enterFrame", movePlayer)
    Runtime:addEventListener("touch", stop )
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
end

local function ReplaceCar()
    -- insert the car
    car = display.newImageRect("Images/MainMenu_Car.png", 0, 0)
    car.x = display.contentWidth/2
    car.y = display.contentHeight*0.5
    car.width = 200
    car.height = 150
    car.myName = "car"

    -- intialize horizontal movement of character
    motionx = 0

    -- add physics body
    physics.addBody( car, "dynamic", { density=0, friction=0.8, bounce=0, rotation=0 } )

    -- prevent car from being able to tip over
    car.isFixedRotation = true

    -- add back arrow event listeners
    AddArrowEventListeners()

    -- add back runtime listeners
    AddRuntimeListeners()
end

local function MakePylonsVisible()
    pylon1.isVisible = true
    pylon2.isVisible = true
    pylon3.isVisible = true
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
    heart3.isVisible = true
    heart4.isVisible = true
    heart5.isVisible = true

end

local function onCollision( self, event )

    if  (event.target.myName == "pylon1") or
        (event.target.myName == "pylon2") or
        (event.target.myName == "pylon3") then

        -- get the ball that the user hit
        thePylon = event.target

        -- stop the character from moving
        motionx = 0

        -- make the character invisible
        car.isVisible = false

        -- show overlay with math question
        composer.showOverlay( "level2_question", { isModal = true, effect = "fade", time = 100})

        -- Increment questions answered
        questionsAnswered = questionsAnswered + 1
    end     
end


local function AddCollisionListeners()

    -- if character collides with ball, onCollision will be called    
    pylon1.collision = onCollision
    pylon1:addEventListener( "collision" )
    pylon2.collision = onCollision
    pylon2:addEventListener( "collision" )
    pylon3.collision = onCollision
    pylon3:addEventListener( "collision" )
end

local function RemoveCollisionListeners()
    pylon1:removeEventListener( "collision" )
    pylon2:removeEventListener( "collision" )
    pylon3:removeEventListener( "collision" )

end



local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( ground, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody(leftW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(rightW, "static", {density=1, friction=0.3, bounce=0.2} ) 

    physics.addBody(pylon1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(pylon2, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(pylon3, "static",  {density=0, friction=0, bounce=0} )
   
end

local function RemovePhysicsBodies()
    physics.removeBody(ground)
    physics.removeBody(leftW)
    physics.removeBody(rightW)
 
end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeGame()

    -- make character visible again
    car.isVisible = true
    
    if (questionsAnswered > 0) then
        if (thePylon ~= nil) and (thePylon.isBodyActive == true) then
            physics.removeBody(thePylon)
            thePylon.isVisible = false
        end
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

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

        --WALLS--
    leftW = display.newLine( 0, 0, 0, display.contentHeight)
    leftW.isVisible = true

    rightW = display.newLine( 0, 0, 0, display.contentHeight)
    rightW.x = display.contentCenterX * 2
    rightW.isVisible = true


    -- Insert the ground
    ground = display.newImageRect("Images/Level2-Ground.png", 1024, 100)
    ground.x = display.contentCenterX
    ground.y = display.contentHeight * 1.07


    --Insert the right arrow
    rArrow = display.newImageRect("Images/RightArrowUnpressed.png", 100, 50)
    rArrow.x = display.contentWidth * 9.2 / 10
    rArrow.y = display.contentHeight * 9.5 / 10
   

    --Insert the left arrow
    lArrow = display.newImageRect("Images/LeftArrowUnpressed.png", 100, 50)
    lArrow.x = display.contentWidth * 8.2 / 10
    lArrow.y = display.contentHeight * 9.5 / 10


    -- Insert the Hearts
    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 985
    heart1.y = 50
    heart1.isVisible = true

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 905
    heart2.y = 50
    heart2.isVisible = true

    heart3= display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 825
    heart3.y = 50
    heart3.isVisible = true

    heart4 = display.newImageRect("Images/heart.png", 80, 80)
    heart4.x = 745
    heart4.y = 50
    heart4.isVisible = true

    heart5 = display.newImageRect("Images/heart.png", 80, 80)
    heart5.x = 665
    heart5.y = 50
    heart5.isVisible = true


    pylon1 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon1.x = 150
    pylon1.y = 650
    pylon1.isVisible = true
    pylon1.myName = "pylon1"


    pylon2 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon2.x = 50
    pylon2.y = 400
    pylon2.isVisible = true
    pylon2.myName = "pylon2"

  

    pylon3 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon3.x = 940
    pylon3.y = 500
    pylon3.isVisible = true
    pylon3.myName = "pylon3"


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
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
        onRelease = BackTransition

    } )

        -- scale down the size
        backButton:scale(0.33, 0.33)

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( backButton )   
    sceneGroup:insert( rArrow)
    sceneGroup:insert( lArrow)    
    sceneGroup:insert( heart1)
    sceneGroup:insert( heart2)
    sceneGroup:insert( heart3)
    sceneGroup:insert( heart4)
    sceneGroup:insert( heart5)
    sceneGroup:insert( pylon1)
    sceneGroup:insert( pylon2)
    sceneGroup:insert( pylon3)
    sceneGroup:insert( ground)
    sceneGroup:insert( rightW)
    sceneGroup:insert( leftW)

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
        physics.start()

        --set gravity
        physics.setGravity( 0, GRAVITY )        
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        numLives = 5
        questionsAnswered = 0

        -- make all soccer balls visible
        MakePylonsVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- create the character, add physics bodies and runtime listeners
        ReplaceCar()

        -- add physics bodies to each object
        AddPhysicsBodies()

        -- add collision listeners to objects
        AddCollisionListeners()        

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
        RemoveCollisionListeners()
        RemovePhysicsBodies()
        RemoveArrowEventListeners()
        RemoveRuntimeListeners()
        physics.stop()
        display.remove(car)
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
