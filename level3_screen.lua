-----------------------------------------------------------------------------------------
--
-- level3_screen.lua
-- Created by: John Omage
-- Date: Month Day, Year
-- Description: This is the level 3 screen of the game.
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
sceneName = "level3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image

-- Create the back button to the main menu screen
local backButton

-- Create the lives for the car
local heart1
local heart2
local heart3
local heart4
local heart5

local alreadyCollided = false

-- To keep track of the hearts the player has
local numLives = 5

-- Create the score
local Score = 0
local ScoreObject

-- Create the local variables for the 
local totalSeconds = 2
local secondsLeft = 2
local clockText 
local countDownTimer

-- Create the arrows for the car to move left or right
local rArrow
local lArrow

-- Create the physics for the car
local motionx = 0
local SPEED = 5
local LeftSpeed = -5
local LINEAR_VELOCITY = -100
local GRAVITY = 9

-- Create the walls for the level 3
local leftW 
local rightW
local topW
local floor

-- Create the car
local Car

-- Static pylons
local Pylon1
local Pylon2
local Pylon3

-- the pylon that is collided with
local thePylon

-- Falling pylons
local Pylon4
local Pylon5
local Pylon6

local questionsAnswered = 0

-----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------- 

-- create a sound for when the character collids with the spikes
local crashSound = audio.loadSound("Sounds/Crash.wav")
local crashSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- When right arrow is touched, move car right
local function right (touch)
    motionx = SPEED
    Car.xScale = 1
end

-- When left arrow is touched, move car left
local function left (touch)
    motionx = LeftSpeed
    Car.xScale = -1
end

-- Move car horizontally
local function movePlayer (event)
    Car.x = Car.x + motionx
end
 
-- Stop car movement when no arrow is pushed
local function stop (event)
    if (event.phase =="ended") then
        motionx = 0
    end
end

-- move the pylon1 to the starting poisition
local function MovePylon4( event )
    -- add the scroll speed to the y-value
    if (Pylon4.y > 768) then 
        Pylon4.x = math.random (150, 250)
        Pylon4.y = 0
    else

        Pylon4.y = Pylon4.y + SPEED
    end
    
end

-- move the pylon1 to the starting poisition
local function MovePylon5( event )
    -- add the scroll speed to the y-value
    if (Pylon5.y > 768) then 
        Pylon5.x = math.random (260, 400)
        Pylon5.y = 0
    else

        Pylon5.y = Pylon5.y + SPEED
    end
    
end

-- move the pylon1 to the starting poisition
local function MovePylon6( event )
    -- add the scroll speed to the y-value
    if (Pylon6.y > 768) then 
        Pylon6.x = math.random (405, 800)
        Pylon6.y = 0
    else

        Pylon6.y = Pylon6.y + SPEED 
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
    print ("***Called MovePylon event listeners")
    Runtime:addEventListener("enterFrame", MovePylon4)
    Runtime:addEventListener("enterFrame", MovePylon5)
    Runtime:addEventListener("enterFrame", MovePylon6)
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
    print ("***Removed MovePylon event listeners")
    Runtime:removeEventListener("enterFrame", MovePylon4)
    Runtime:removeEventListener("enterFrame", MovePylon5)
    Runtime:removeEventListener("enterFrame", MovePylon6)
end


local function ReplaceCar()

    -- intialize horizontal movement of car
    motionx = 0

    -- add physics body
    physics.addBody( Car, "dynamic", { density=0, friction=0.8, bounce=0, rotation=0 } )

    -- prevent car from being able to tip over
    Car.isFixedRotation = true

    -- add back arrow listeners
    AddArrowEventListeners()

    -- add back runtime listeners
    AddRuntimeListeners()
end

local function MakePylonsVisible()
    Pylon1.isVisible = true
    Pylon2.isVisible = true
    Pylon3.isVisible = true
    Pylon4.isVisible = true
    Pylon5.isVisible = true
    Pylon6.isVisible = true
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
    heart3.isVisible = true
    heart4.isVisible = true
    heart5.isVisible = true

end

-- Creating Transition Function to Credits Page
local function MainTransition( )       
    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 700})
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

            ResumeLevel3()
        end

        if (numLives == 3) then

            heart5.isVisible = false
            heart4.isVisible = false

            ResumeLevel3()
        end

        if (numLives == 2) then

            heart5.isVisible = false
            heart4.isVisible = false
            heart3.isVisible = false

            ResumeLevel3()
        end

        if (numLives == 1) then

            heart5.isVisible = false
            heart4.isVisible = false
            heart3.isVisible = false
            heart2.isVisible = false

            ResumeLevel3()
        end

        if (numLives == 0) then

            heart1.isVisible = false   
            heart2.isVisible = false
            heart3.isVisible = false 
            heart2.isVisible = false
            heart3.isVisible = false
            ScoreObject.isVisible = false
            timer.cancel(countDownTimer)

            ResumeLevel3()
            
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



local function onCollision( self, event )
    -- for testing purposes
    --print( event.target )        --the first object in the collision
    --print( event.other )         --the second object in the collision
    --print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    --print( event.otherElement )  --the element (number) of the second object which was hit in the collision
    --print( event.target.myName .. ": collision began with " .. event.other.myName )

    if ( event.phase == "began" ) then

        if  ((event.target.myName == "Pylon1") or 
            (event.target.myName == "Pylon2") or
            (event.target.myName == "Pylon3") or            
            (event.target.myName == "Pylon4") or
            (event.target.myName == "Pylon5") or
            (event.target.myName == "Pylon6")) and (alreadyCollided == false) then

            -- add sound effect here
            crashSoundChannel = audio.play(crashSound)

            -- set already collided to true
            alreadyCollided = true

            -- remove runtime listeners that move the car
            --RemoveArrowEventListeners()
            --RemoveRuntimeListeners()

            -- get the Pylon that the user hit
            --Pylon = event.target
            --Pylon:removeEventListener( "collision" )         

            -- stop the character from moving
            motionx = 0

            -- make the character invisible
            Car.isVisible = false

            -- show overlay with math question
            composer.showOverlay( "level3_question", { isModal = true, effect = "fade", time = 100})

            -- Increment questions answered
            questionsAnswered = questionsAnswered + 1
            
        end        

    end
end


local function AddCollisionListeners()
    -- if character collides with ball, onCollision will be called
    Pylon1.collision = onCollision
    Pylon1:addEventListener( "collision" )
    Pylon2.collision = onCollision
    Pylon2:addEventListener( "collision" )
    Pylon3.collision = onCollision
    Pylon3:addEventListener( "collision" )
    Pylon4.collision = onCollision
    Pylon4:addEventListener( "collision" )
    Pylon5.collision = onCollision
    Pylon5:addEventListener( "collision" )
    Pylon6.collision = onCollision
    Pylon6:addEventListener( "collision" )

end

local function RemoveCollisionListeners()

    Pylon1:removeEventListener( "collision" )
    Pylon2:removeEventListener( "collision" )
    Pylon3:removeEventListener( "collision" )
    Pylon4:removeEventListener( "collision" )
    Pylon5:removeEventListener( "collision" )
    Pylon6:removeEventListener( "collision" )


end

local function AddPhysicsBodies()
    --add to the physics engine 

    physics.addBody( leftW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody( rightW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody( topW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody( floor, "static", {density=1, friction=0.3, bounce=0.2} )


    physics.addBody( Pylon1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody( Pylon2, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody( Pylon3, "static",  {density=0, friction=0, bounce=0} )

    physics.addBody(Pylon4, "static", { density=0, friction=0.8, bounce=0, rotation=0 } )
    physics.addBody(Pylon5, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(Pylon6, "static",  {density=0, friction=0, bounce=0} )

end


local function RemovePhysicsBodies()
    
    physics.removeBody( leftW )
    physics.removeBody( rightW )
    physics.removeBody( floor )

    if (Pylon4 ~= nil) and (Pylon4.isBodyActive == true) then        
        physics.removeBody(Pylon4)
    end
    physics.removeBody(Pylon2)
    if (Pylon5 ~= nil) and (Pylon5.isBodyActive == true) then        
        physics.removeBody(Pylon5)
    end
    physics.removeBody(Pylon3)
    if (Pylon6 ~= nil) and (Pylon6.isBodyActive == true) then        
        physics.removeBody(Pylon6)
    end
end


-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeLevel3()

    -- make character visible again
    Car.isVisible = true
    Car.y = display.contentHeight - Car.width/2
    Pylon4.y = 0
    Pylon5.y = 0
    Pylon6.y = 0
    alreadyCollided = false
    
    --[[
    if (questionsAnswered >= 0) then
        if (Pylon ~= nil) and (Pylon.isBodyActive == true) then
            Pylon.isVisible = false
            physics.removeBody(Pylon)
        end
        if (questionsAnswered == 1) then            
            Runtime:addEventListener("enterFrame", MovePylon4)
            Pylon4.isVisible = true
        end
        if (questionsAnswered == 2) then
            Runtime:addEventListener("enterFrame", MovePylon5)
            Pylon5.isVisible = true
        end
        elseif (questionsAnswered == 3) then
            Runtime:addEventListener("enterFrame", MovePylon6)
            Pylon6.isVisible = true
    end
]]--
   
end

function CountScore3()

    Score = Score + 100

    ScoreObject.text = "Score: " .. Score

    if (Score == 300) then

        composer.gotoScene( "you_win" )

    end
end

function DecreaseLives3()

    numLives = numLives - 1
    print ("***lives = " .. numLives)
    if ( numLives == 4) then
        heart1.isVisible = false
    end
    if ( numLives == 3) then
        heart2.isVisible = false
    end
    if ( numLives == 2) then
        heart3.isVisible = false
    end
    if ( numLives == 1) then
        heart4.isVisible = false
    end
    if ( numLives == 0) then
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
    bkg_image = display.newImageRect("Images/Level3ScreenJohnOmage@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 

    -- Insert the car into the level one screen
    Car = display.newImageRect("Images/MainMenu_Car.png", 0, 0)
    Car.x = display.contentWidth * 1/2
    Car.y = display.contentHeight  * 0.1 / 3
    Car.width = 200
    Car.height = 150
    Car.myName = "Car"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( Car )


    -- Create the clock text colour and text
    clockText = display.newText("Time Left: ", display.contentWidth*3.3/5, display.contentHeight*2.2/10, nil, 60)
    clockText:setTextColor(0, 0, 0)

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( clockText )

    ScoreObject = display.newText("Score: " .. Score, display.contentWidth*4.3/5, display.contentHeight*0.4/10, nil, 50 )
    ScoreObject:setTextColor(0, 0, 0)
    ScoreObject.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( ScoreObject )  

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 985
    heart1.y = 100
    heart1.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart1 )

    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 905
    heart2.y = 100
    heart2.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart2 )

    heart3= display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 825
    heart3.y = 100
    heart3.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart3 )

    heart4 = display.newImageRect("Images/heart.png", 80, 80)
    heart4.x = 745
    heart4.y = 100
    heart4.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart4 )

    heart5 = display.newImageRect("Images/heart.png", 80, 80)
    heart5.x = 665
    heart5.y = 100
    heart5.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( heart5 )

    Pylon1 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon1.x = 110
    Pylon1.y = 650
    Pylon1.isVisible = true
    Pylon1.myName = "Pylon1"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon1 )


    Pylon2 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon2.x = 50
    Pylon2.y = 400
    Pylon2.isVisible = true
    Pylon2.myName = "Pylon2"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon2 )
  

    Pylon3 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon3.x = 750
    Pylon3.y = 500
    Pylon3.isVisible = true
    Pylon3.myName = "Pylon3"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon3 )


    Pylon4 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon4.x = math.random(250, 400)
    Pylon4.y = 500
    Pylon4.isVisible = true
    Pylon4.myName = "Pylon4"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon4 )


    Pylon5 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon5.x = math.random(405, 600)
    Pylon5.y = 500
    Pylon5.isVisible = true
    Pylon5.myName = "Pylon5"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon5 )


    Pylon6 = display.newImageRect("Images/Pylon.png", 80, 80)
    Pylon6.x = math.random(605, 800)
    Pylon6.y = 500
    Pylon6.isVisible = true
    Pylon6.myName = "Pylon6"

    -- Insert objects into the scene group in order to ONLY be associated with this scene  
    sceneGroup:insert( Pylon6 )

    --Insert the right arrow
    rArrow = display.newImageRect("Images/RightArrowUnpressed.png", 100, 50)
    rArrow.x = display.contentWidth * 9.2 / 10
    rArrow.y = display.contentHeight * 9.5 / 10

     -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rArrow )

    --Insert the left arrow
    lArrow = display.newImageRect("Images/LeftArrowUnpressed.png", 100, 50)
    lArrow.x = display.contentWidth * 7.2 / 10
    lArrow.y = display.contentHeight * 9.5 / 10
   
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( lArrow )

    --WALLS--
    leftW = display.newLine( 0, 0, 0, display.contentHeight)
    leftW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( leftW )

    rightW = display.newLine( 0, 0, 0, display.contentHeight)
    rightW.x = display.contentCenterX * 2
    rightW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rightW )

    topW = display.newLine( 0, 0, display.contentWidth, 0)
    topW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topW )

    floor = display.newImageRect("Images/Level-1Floor.png", 1024, 100)
    floor.x = display.contentCenterX
    floor.y = display.contentHeight * 1.06
    
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( floor )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------   

    -- Creating Start Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*7.5/8,

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png", 
            overFile = "Images/BackButtonPressed.png", 

            -- When the button is released, call the Level3 screen transition function
            onRelease = MainTransition         
        } )
    -- Set the scale for the Start button
        backButton:scale( 0.3, 0.3 )
    ----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( backButton ) 

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
            -- start physics
        physics.start()

        -- set gravity
        physics.setGravity( 0, GRAVITY )


    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


        -- Start the timer

--        StartTimer()

        -- Keep count of the lives and questions answered

        numLives = 5
        questionsAnswered = 0

        -- make all of the pylons visible
        MakePylonsVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- add physics bodies to each object
        AddPhysicsBodies()

        -- add collision listeners to objects
        AddCollisionListeners()

        -- create the car, add physics bodies and runtime listeners
        ReplaceCar()

        -- start the countdown timer
--        StartTimer()

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
        physics.stop()
        RemoveArrowEventListeners()
        RemoveRuntimeListeners()
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







