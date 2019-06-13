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
local GRAVITY = 20
local SPEED3 = 8
local SPEED4 = 8

-- create the lives
local heart1
local heart2
local heart3
local heart4
local heart5
local lives = 4

--create the walls
local leftW
local rightW
local ground

-- add the items the car interacts with
local hitPylon = false

local pylon1
local pylon2
local pylon3
local pylon4
local pylon5
local thePylon
local tree1
local rock1
local theObject

-- create the score
local score = 0
local scoreText

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


-- move the pylon1 to the starting poisition
local function MovePylon1( event )
    -- add the scroll speed to the y-value
    if (pylon1.y > 768) then 
        pylon1.x = math.random (150, 800)
        pylon1.y = 0
    else
        pylon1.y = pylon1.y + SPEED3
    end
    
end

-- move the pylon1 to the starting poisition
local function MovePylon2( event )
    -- add the scroll speed to the y-value
    if (pylon2.y > 768) then 
        pylon2.x = math.random (150, 800)
        pylon2.y = 0
    else
        pylon2.y = pylon2.y + SPEED3
    end
    
end

-- move the pylon1 to the starting poisition
local function MovePylon3( event )
    -- add the scroll speed to the y-value
    if (pylon3.y > 768) then 
        pylon3.x = math.random (150, 800)
        pylon3.y = 0
    else
        pylon3.y = pylon3.y + SPEED3
    end  
end

-- move the pylon1 to the starting poisition
local function MovePylon4( event )
    -- add the scroll speed to the y-value
    if (pylon4.y > 768) then 
        pylon4.x = math.random (150, 800)
        pylon4.y = 0
    else
        pylon4.y = pylon4.y + SPEED3
    end
end

-- move the pylon1 to the starting poisition
local function MovePylon5( event )
    -- add the scroll speed to the y-value
    if (pylon5.y > 768) then 
        pylon5.x = math.random (150, 800)
        pylon5.y = 0
    else
        pylon5.y = pylon5.y + SPEED3
    end
end

-- move the tree to the starting poisition
local function MoveTree1( event )
    -- add the scroll speed to the y-value
    if (tree1.y > 768) then 
        tree1.x = math.random (200, 800)
        tree1.y = 0
    else
        tree1.y = tree1.y + SPEED4
    end
end

local function AddRuntimeListeners()
    Runtime:addEventListener("enterFrame", movePlayer)
    Runtime:addEventListener("touch", stop )
    Runtime:addEventListener("enterFrame", MovePylon1)
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
    Runtime:removeEventListener("enterFrame", MovePylon1)
    Runtime:removeEventListener("enterFrame", MovePylon2)
    Runtime:removeEventListener("enterFrame", MovePylon3)
    Runtime:removeEventListener("enterFrame", MovePylon4)
    Runtime:removeEventListener("enterFrame", MovePylon5)
    Runtime:removeEventListener("enterFrame", MoveTree1)
end

local function AddArrowEventListeners()
    rArrow:addEventListener("touch", right)
    lArrow:addEventListener("touch", left)
end

local function RemoveArrowEventListeners()
    rArrow:removeEventListener("touch", right)
    lArrow:removeEventListener("touch", left)
end


local function ReplaceCar()
    -- insert the car
    car = display.newImageRect("Images/MainMenu_Car.png", 200, 150)
    car.x = display.contentWidth/2
    car.y = display.contentHeight*0.5
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
    pylon2.isVisible = false
    pylon3.isVisible = false
    pylon4.isVisible = false
    pylon5.isVisible = false
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
    heart3.isVisible = true
    heart4.isVisible = true
    heart5.isVisible = false
end

local function MakeObjectsVisible()
    tree1.isVisible = false
end

local function onCollision( self, event )

    -- for testing purposes
    --print( event.target )        --the first object in the collision
    --print( event.other )         --the second object in the collision
    --print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    --print( event.otherElement )  --the element (number) of the second object which was hit in the collision
    --print( event.target.myName .. ": collision began with " .. event.other.myName )

    if (event.phase == "began") then
        if  (event.target.myName == "pylon1") or
            (event.target.myName == "pylon2") or
            (event.target.myName == "pylon3") or
            (event.target.myName == "pylon4") or
            (event.target.myName == "pylon5") then

            hitPylon = true

            --print ("***Collided with: " .. event.other[0])
            --print ("***Collided with: " .. event.object2.myName)

            -- get the ball that the user hit
            thePylon = event.target
            thePylon:removeEventListener( "collision" )         

            -- stop the character from moving
            motionx = 0

            -- stop the pylon from moving
            SPEED4 = 0
            SPEED3 = 0

            -- make the character invisible
            car.isVisible = false

            -- show overlay with math question
            composer.showOverlay( "level2_question", { isModal = true, effect = "fade", time = 100})            

        elseif  (event.target.myName == "tree1") and (hitPylon == false) then

            -- get the ball that the user hit
            theObject = event.target        

            -- remove the collision listener
            --heObject:removeEventListener( "collision" ) 

            -- call the decrease lives function
            DecreaseLives2()
        end    
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
    pylon4.collision = onCollision
    pylon4:addEventListener( "collision" )
    pylon5.collision = onCollision
    pylon5:addEventListener( "collision" )

    tree1.collision = onCollision
    tree1:addEventListener( "collision" )
end

local function RemoveCollisionListeners()

    pylon1:removeEventListener( "collision" )
    pylon2:removeEventListener( "collision" )
    pylon3:removeEventListener( "collision" )
    pylon4:removeEventListener( "collision" )
    pylon5:removeEventListener( "collision" )
<<<<<<< HEAD
=======

    tree1:removeEventListener( "collision" )

>>>>>>> 8d5424685e1d4f5986a4527bb1e9d5ae424d2b30
end




local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody(ground, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody(leftW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(rightW, "static", {density=1, friction=0.3, bounce=0.2} ) 

    physics.addBody(pylon1, "static", { density=0, friction=0.8, bounce=0, rotation=0 } )
    physics.addBody(pylon2, "static",  { density=0, friction=0, bounce=0} )
    physics.addBody(pylon3, "static",  { density=0, friction=0, bounce=0} )
    physics.addBody(pylon4, "static",  { density=0, friction=0, bounce=0} )
    physics.addBody(pylon5, "static",  { density=0, friction=0, bounce=0} )

    physics.addBody(tree1, "static",  { density=0, friction=0, bounce=0} )
   
end

local function RemovePhysicsBodies()
    physics.removeBody(ground)
    physics.removeBody(leftW)
    physics.removeBody(rightW)
    if (pylon1 ~= nil) and (pylon1.isBodyActive == true) then        
        physics.removeBody(pylon1)
    end

    if (pylon2 ~= nil) and (pylon2.isBodyActive == true) then        
        physics.removeBody(pylon2)
    end

    if (pylon3 ~= nil) and (pylon3.isBodyActive == true) then        
        physics.removeBody(pylon3)
    end

    if (pylon4 ~= nil) and (pylon4.isBodyActive == true) then        
        physics.removeBody(pylon4)
    end

    if (pylon5 ~= nil) and (pylon5.isBodyActive == true) then        
        physics.removeBody(pylon5)
    end

    if (tree1 ~= nil) and (tree1.isBodyActive == true) then        
        physics.removeBody(tree1)
    end
 
end


-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeLevel2()

    -- make character visible again
    car.isVisible = true
    hitPylon = false
    SPEED3 = 8
    SPEED4 = 8

    -- Increment questions answered
    questionsAnswered = questionsAnswered + 1
 

    if (questionsAnswered >= 0) then
        if (thePylon ~= nil) and (thePylon.isBodyActive == true) then
            --print ("***ResumeLevel2: removed the pylon")
            thePylon.isVisible = false
            physics.removeBody(thePylon)
        end
        if (questionsAnswered == 1) then            
            Runtime:addEventListener("enterFrame", MovePylon2)
            pylon2.isVisible = true
            Runtime:addEventListener("enterFrame", MoveTree1)
            tree1.isVisible = true
        end
        if (questionsAnswered == 2) then
            Runtime:addEventListener("enterFrame", MovePylon3)
            pylon3.isVisible = true
        end
        if (questionsAnswered == 3) then
            Runtime:addEventListener("enterFrame", MovePylon4)
            pylon4.isVisible = true
        end
        if (questionsAnswered == 4) then
            Runtime:addEventListener("enterFrame", MovePylon5)
            pylon5.isVisible = true
        end
    end
end

function CountScore2()

    score = score + 100

    scoreText.text = "Score: " .. score

    if (score == 400) then
        composer.gotoScene( "you_completed_level2" )
    end
end


function DecreaseLives2()

    lives = lives - 1

    if ( lives == 4) then
        heart5.isVisible = false
    end  
    if (lives == 3) then
        heart4.isVisible = false
    end 
    if (lives == 2) then
        heart3.isVisible = false
    end
    if (lives == 1) then
        heart2.isVisible = false
    end

    if (lives == 0) then
        heart1.isVisible = false
        composer.gotoScene( "you_lose" )
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
    ground.myName = "ground"


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
    heart1.y = 100
    heart1.isVisible = true
    heart1:scale(0.75, 0.75)

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 905
    heart2.y = 100
    heart2.isVisible = true
    heart2:scale(0.75, 0.75)

    heart3= display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 825
    heart3.y = 100
    heart3.isVisible = true
    heart3:scale(0.75, 0.75)

    heart4 = display.newImageRect("Images/heart.png", 80, 80)
    heart4.x = 745
    heart4.y = 100
    heart4.isVisible = true
    heart4:scale(0.75, 0.75)

    heart5 = display.newImageRect("Images/heart.png", 80, 80)
    heart5.x = 665
    heart5.y = 100
    heart5.isVisible = true
    heart5:scale(0.75, 0.75)


    pylon1 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon1.x = display.contentWidth/2
    pylon1.y = 0
    pylon1.isVisible = true
    pylon1.myName = "pylon1"


    pylon2 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon2.x = 350
    pylon2.y = 0
    pylon2.isVisible = false
    pylon2.myName = "pylon2"

  
    pylon3 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon3.x = 700
    pylon3.y = 0
    pylon3.isVisible = false
    pylon3.myName = "pylon3"

    pylon4 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon4.x = 700
    pylon4.y = 0
    pylon4.isVisible = false
    pylon4.myName = "pylon4"

    pylon5 = display.newImageRect("Images/Pylon.png", 80, 80)
    pylon5.x = 700
    pylon5.y = 0
    pylon5.isVisible = false
    pylon5.myName = "pylon5"

    tree1 = display.newImageRect("Images/tree.png", 150, 100)
    tree1.x = 700
    tree1.y = 0
    tree1.isVisible = false
    tree1.myName = "tree1"


    scoreText = display.newText("Score: " .. score, display.contentWidth*4.3/5, display.contentHeight*0.4/10, nil, 50 )
    scoreText:setTextColor(0, 0, 0)
    scoreText.isVisible = true

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
    sceneGroup:insert( pylon4)
    sceneGroup:insert( pylon5)
    sceneGroup:insert( tree1)
    sceneGroup:insert( ground)
    sceneGroup:insert( rightW)
    sceneGroup:insert( leftW)
    sceneGroup:insert( scoreText)

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- delay the pylon2 from falling down immidiately
        timer.performWithDelay( 4000, MovePylon2)   

        -- delay the pylon3 from falling down immidiately
        timer.performWithDelay( 6500, MovePylon3) 

        -- delay pylon5 from falling immediately
        timer.performWithDelay( 8000, MovePylon5)

        -- Called when the scene is still off screen (but is about to come on screen).
        physics.start()

        --set gravity
        physics.setGravity( 0, GRAVITY )     

        
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        lives = 4
        questionsAnswered = 0
        score = 0

        -- make all soccer balls visible
        MakePylonsVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- make destructive objects visible
        MakeObjectsVisible()

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


