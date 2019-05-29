-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Megan
-- Date: May 16, 2019
-- Description: This is the level 1 screen of the game. The user can use the right or left arrow keys to move the
-- car around. Once the car touches a pylon or a tree, the use will be asked a question. If thw user gets the 
-- the question right he/she will earn 100 points. If the user gets the question qrong, he/she will lose one heart
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
sceneName = "level1_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText
local textObject
local textObject2

local answerPosition = 1
local questionSelect = 1
local bkg
local cover

-- The positions for the objects/answers
local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*5/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false

-- Create the variables for the answers -- 

-- question 1 objects
local circle1
local rectangle1
local pentagon1
local triangle1

-- question 2 objects
local Tri2
local oval2

-- question 3 objects
local numThree
local numEight
local numZero
local numFour

-- question 5 objects
local tri5
local square5

-- question 6 objects
local rightAngleTri6
local isosceles6

-- question 7 objects
local numTwo
local numOne

-- question 8 objects
local numSix
local numSeven
local numNine


-- question 9 objects 

local pentagonText
local octagonText
local decagonText
local hexagonText

-- question 10 objects 
local nonagonText

-- question 11 objects 



-- question 14 objects
local angles 


-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 

    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel1()
end 

--------------------------- Touch and react question for question 1 ---------------------

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswerQ1(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
    
    end 
end

local function TouchListenerWrongAnswer1Q1(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer2Q1(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer3Q1(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 2 -------------------------

local function TouchListenerAnswerQ2(touch)
    
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q2(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer2Q2(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer3Q2(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 3 -------------------------

local function TouchListenerAnswerQ3(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q3(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer2Q3(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer3Q3(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


--------------------- Touch and react question for question 4 -------------------------

local function TouchListenerAnswerQ4(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer1Q4(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


--------------------- Touch and react question for question 5 -------------------------


local function TouchListenerAnswerQ5(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q5(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer2Q5(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer3Q5(touch)
    userAnswer = oval2.text
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 6 -------------------------

local function TouchListenerAnswerQ6(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q6(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer2Q6(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 7 -------------------------

local function TouchListenerAnswerQ7(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q7(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer2Q7(touch)
    userAnswer = numOne.text
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer3Q7(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 8 -------------------------

local function TouchListenerAnswerQ8(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
        
    end 
end

local function TouchListenerWrongAnswer1Q8(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer2Q8(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end


local function TouchListenerWrongAnswer3Q8(touch)
    
    if (touch.phase == "ended") then


        BackToLevel1( )
        
    end 
end



--------------------------- Touch and react question for question 9 -------------------


--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswerQ9(touch)
    
    if (touch.phase == "ended") then

        CountScore()

        BackToLevel1( )
    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer1Q9(touch)
    
    if (touch.phase == "ended") then
        
        BackToLevel1( )
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2Q9(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3Q9(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
        
    end 
end

--------------------- Touch and react question for question 10 -------------------------


--adding the event listeners 
local function AddTextListeners ( )

-- Add Text Listeners for question 1 -- 
    pentagon1:addEventListener( "touch", TouchListenerAnswerQ1 )
    rectangle1:addEventListener( "touch", TouchListenerWrongAnswer1Q1 ) 
    circle1:addEventListener( "touch", TouchListenerWrongAnswer2Q1 )
    triangle1:addEventListener( "touch", TouchListenerWrongAnswer3Q1 )


-- Add Text Listeners for question 2 -- 
    oval2:addEventListener( "touch", TouchListenerAnswerQ2 )
    circle1:addEventListener( "touch", TouchListenerWrongAnswer1Q2 ) 
    tri5:addEventListener( "touch", TouchListenerWrongAnswer2Q2 )
    square5:addEventListener( "touch", TouchListenerWrongAnswer3Q2 )

-- Add Text Listeners for question 3 -- 
    numZero:addEventListener( "touch", TouchListenerAnswerQ3 )
    numEight:addEventListener( "touch", TouchListenerWrongAnswer1Q3 ) 
    numThree:addEventListener( "touch", TouchListenerWrongAnswer2Q3 )
    numFour:addEventListener( "touch", TouchListenerWrongAnswer3Q3 )

-- Add Text Listeners for question 4 -- 
    textObject:addEventListener( "touch", TouchListenerAnswerQ4 )
    textObject2:addEventListener( "touch", TouchListenerWrongAnswer1Q4 )

-- Add Text Listeners for question 5 -- 
    tri5:addEventListener( "touch", TouchListenerAnswerQ5 ) 
    square5:addEventListener( "touch", TouchListenerWrongAnswer1Q5 )
    pentagon1:addEventListener( "touch", TouchListenerWrongAnswer2Q5 )
    oval2:addEventListener( "touch", TouchListenerWrongAnswer3Q5 )

-- Add Text Listeners for question 6 -- 
    rightAngleTri6:addEventListener( "touch", TouchListenerAnswerQ6 ) 
    isosceles6:addEventListener( "touch", TouchListenerWrongAnswer1Q6 )
    triangle1:addEventListener( "touch", TouchListenerWrongAnswer2Q6 )

-- Add Text Listeners for question 7 -- 
    numTwo:addEventListener( "touch", TouchListenerAnswerQ7 ) 
    numFour:addEventListener( "touch", TouchListenerWrongAnswer1Q7 )
    numOne:addEventListener( "touch", TouchListenerWrongAnswer2Q7 )
    numZero:addEventListener( "touch", TouchListenerWrongAnswer3Q7 )

-- Add Text Listeners for question 8 -- 
    numSeven:addEventListener( "touch", TouchListenerAnswerQ8 ) 
    numSix:addEventListener( "touch", TouchListenerWrongAnswer1Q8 )
    numEight:addEventListener( "touch", TouchListenerWrongAnswer2Q8 )
    numNine:addEventListener( "touch", TouchListenerWrongAnswer3Q8 )
    
-- Add Text Listeners for question 9 -- 
    pentagonText:addEventListener( "touch", TouchListenerAnswerQ9 )
    decagonText:addEventListener( "touch", TouchListenerWrongAnswer1Q9 )
    octagonText:addEventListener( "touch", TouchListenerWrongAnswer2Q9 )
    hexagonText:addEventListener( "touch", TouchListenerWrongAnswer3Q9 )

-- Add Text Listeners for question 10 -- 



end

--removing the event listeners
local function RemoveTextListeners()


-- Remove Text Listeners for question 1 --
    pentagon1:removeEventListener( "touch", TouchListenerAnswerQ1 )
    rectangle1:removeEventListener( "touch", TouchListenerWrongAnswer1Q1 )
    triangle1:removeEventListener( "touch", TouchListenerWrongAnswer2Q1 )
    circle1:removeEventListener( "touch", TouchListenerWrongAnswer3Q1 )

-- Remove Text Listeners for question 2 --
    oval2:removeEventListener( "touch", TouchListenerAnswerQ2 )
    circle1:removeEventListener( "touch", TouchListenerWrongAnswer1Q2 )
    circle1:removeEventListener( "touch", TouchListenerWrongAnswer2Q2 )
    pentagon1:removeEventListener( "touch", TouchListenerWrongAnswer3Q2 )

-- Remove Text Listeners for question 3 --
    numThree:removeEventListener( "touch", TouchListenerAnswerQ3 )
    numEight:removeEventListener( "touch", TouchListenerWrongAnswer1Q3 )
    numZero:removeEventListener( "touch", TouchListenerWrongAnswer2Q3 )
    numFour:removeEventListener( "touch", TouchListenerWrongAnswer3Q3 )

-- Remove Text Listeners for question 4 --
    textObject:removeEventListener( "touch", TouchListenerAnswerQ4 )
    textObject2:removeEventListener( "touch", TouchListenerWrongAnswer1Q4 )

-- Remove Text Listeners for question 5 --
    tri5:removeEventListener( "touch", TouchListenerAnswerQ5 )
    square5:removeEventListener( "touch", TouchListenerWrongAnswer1Q5 )
    pentagon1:removeEventListener( "touch", TouchListenerWrongAnswer2Q5 )
    oval2:removeEventListener( "touch", TouchListenerWrongAnswer3Q5 )

-- Remove Text Listeners for question 6 --
    rightAngleTri6:removeEventListener( "touch", TouchListenerAnswerQ6 )
    isosceles6:removeEventListener( "touch", TouchListenerWrongAnswer1Q6 )
    triangle1:removeEventListener( "touch", TouchListenerWrongAnswer2Q6 )

-- Remove Text Listeners for question 7 --
    numTwo:removeEventListener( "touch", TouchListenerAnswerQ7 )
    numFour:removeEventListener( "touch", TouchListenerWrongAnswer1Q7 )
    numOne:removeEventListener( "touch", TouchListenerWrongAnswer2Q7 )
    numZero:removeEventListener( "touch", TouchListenerWrongAnswer3Q7 )

-- Remove Text Listeners for question 8 --
    numSeven:removeEventListener( "touch", TouchListenerAnswerQ8 )
    numSix:removeEventListener( "touch", TouchListenerWrongAnswer1Q8 )
    numEight:removeEventListener( "touch", TouchListenerWrongAnswer2Q8 )
    numNine:removeEventListener( "touch", TouchListenerWrongAnswer3Q8 )

-- Remove Text Listeners for question 9 --
    pentagonText:removeEventListener( "touch", TouchListenerAnswerQ9 )
    decagonText:removeEventListener( "touch", TouchListenerWrongAnswer1Q9 )
    octagonText:removeEventListener( "touch", TouchListenerWrongAnswer2Q9 )
    hexagonText:removeEventListener( "touch", TouchListenerWrongAnswer3Q9 )

-- Remove text Listeners for question 10 -- 


end


--local function Answers()

local function DisplayQuestion()

    -- creating random start position in a certian area
    questionSelect = math.random(1,7)

    if (questionSelect == 1) then

        questionText.text = "Which shape has 5 sides?"

        -- Display the objects
        circle1.isVisible = true
        rectangle1.isVisible = true
        pentagon1.isVisible = true
        triangle1.isVisible = true


        -- Set the position of the objects
        circle1.x = X1
        circle1.y = Y1

        rectangle1.x = X2
        rectangle1.y = Y2

        pentagon1.x = X1
        pentagon1.y = Y2

        triangle1.x = X2
        triangle1.y = Y1



    elseif (questionSelect == 2) then

        questionText.text = "What shape is an oval?"

        -- Display the shapes 
        oval2.isVisible = true
        square5.isVisible = true
        circle1.isVisible = true
        tri5.isVisible = true

        -- Set the positions for the shapes

            oval2.x = X1
            oval2.y = Y1

            square5.x = X1
            square5.y = Y2

            circle1.x = X2
            circle1.y = Y1

            tri5.x = X2
            tri5.y = Y2


    elseif (questionSelect == 3) then 

        questionText.text = "How many vertices does a circle have?"

            -- Display the numbers 
            numThree.isVisible = true
            numEight.isVisible = true
            numZero.isVisible = true
            numFour.isVisible = true

            -- Set the positions for the numbers 
            numThree.x = X1
            numThree.y = Y1

            numEight.x = X1
            numEight.y = Y2

            numZero.x = X2
            numZero.y = Y1

            numFour.x = X2
            numFour.y = Y2

    elseif (questionSelect == 4) then

        questionText.text = " A circle is a polygon. "

            -- Display the text objects for the true or false question
           textObject.isVisible = true
           textObject2.isVisible = true

    elseif (questionSelect == 5) then

        questionText.text = " Click on the triangle "

            -- Display the shapes 
            tri5.isVisible = true
            square5.isVisible = true
            pentagon1.isVisible = true
            oval2.isVisible = true

            -- Set the positions for the shapes
            tri5.x = X1
            tri5.y = Y1

            square5.x  = X1
            square5.y = Y2

            pentagon1.x = X2
            pentagon1.y = Y1

            oval2.x = X2
            oval2.y  = Y2


    elseif (questionSelect == 6) then   

        questionText.text = " Which triangle is isosceles? "

            -- Display the shapes
            isosceles6 = true
            rightAngleTri6 = true
            triangle1 = true

            -- Set the positions for the shapes
            isosceles6.x = X1
            isosceles6.y = Y1

            rightAngleTri6.x = X1
            rightAngleTri6.y = Y2

            triangle1.x = X2
            triangle1.y = Y2



    elseif (questionSelect == 7) then

        questionText.text = " How many circles are in this photo? "

            -- Display the shapes
            numTwo.isVisible = true
            numFour.isVisible = true
            numOne.isVisible = true
            numZero.isVisible = true

            -- Set the positions for the shapes
            numTwo.x = X1
            numTwo.y = Y1

            numFour.x = X1
            numFour.y = Y2

            numOne.x = X2 
            numOne.y = Y2

            numZero.x = X2
            numZero.y = Y1


    elseif (questionSelect == 8) then

        questionText = " How many sides does a heptagon have? "




    elseif (questionSelect == 9) then

        questionText = " A five-sided polygon is called: "

        -- Make the objects visible
        octagonText.isVisible = true
        pentagonText.isVisible = true
        decagonText.isVisible = true
        hexagonText.isVisible = true

        -- Set the positions for the shapes
        octagonText.x = X1
        octagonText.y = Y1

        pentagonText.x = X1
        pentagonText.y = Y2

        decagonText.x = X2
        decagonText.y = Y1

        hexagonText.x = X2
        hexagonText.y = Y2


    elseif (questionSelect == 10) then

        questionText = " A polygon that has two more sides than a hexagon is called: "
--[[
    elseif (questionSelect == 11) then 

        questionText.text = display.newText(" How many more sides than a pentagon does a decagon have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 25 )

    elseif (questionSelect == 12) then

        questionText.text = display.newText( " A polygon can have as many sides as it likes. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 13) then

        questionText.text = display.newText( " A polygon is a plane shape with curved sides. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 14) then

        questionText.text = display.newText( " Which angle is acute? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 15) then

        questionText.text = display.newText( " Parallel lines are lines that never intercept. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 16) then

        questionText.text = display.newText( " What is a right angle? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )

    elseif (questionSelect == 17) then

        questionText.text = display.newText( " What do a square and a quadrilateral have in common? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 18) then

        questionText.text = display.newText( " It is possible to draw a triangle with two right angles. ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 19) then

        questionText.text = display.newText( " How many pairs of parallel lines does a square have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 30 )

    elseif (questionSelect == 20) then

        questionText.text = display.newText( " How many vertices does an octagon have? ", display.contentWidth*1/2, display.contentHeight*1/3, nil, 50 )
--]]
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
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 30)

    -- Question 1 --

    circle1 = display.newImage("Images/CircleMeganS@2x.png", 0, 0)
    circle1.width = 150
    circle1.height = 150
    circle1.isVisible = false

    rectangle1 = display.newImage("Images/RectangleMeganS@2x.png", 0, 0)
    rectangle1.width = 180
    rectangle1.height = 180
    rectangle1.isVisible = false

    pentagon1 = display.newImage("Images/PentagonMeganS@2x.png", 0, 0)
    pentagon1.width = 160
    pentagon1.height = 160
    pentagon1.isVisible = false

    triangle1 = display.newImage("Images/TriangleMeganS@2x.png", 0, 0)
    triangle1.width = 160
    triangle1.height = 160
    triangle1.isVisible = false


    -- Question 2 --

    oval2 = display.newImage("Images/OvalMeganS@2x.png", 0, 0)
    oval2.width = 160
    oval2.height = 160
    oval2.isVisible = false

    -- circle from question 1 

    -- triangle from question 1

    -- square from question 5
    
    -- Question 3 --

    numThree = display.newText("3", 0, 0, nil, 50)
    numThree:setTextColor (1, 1, 0)
    numThree.isVisible = false

    numEight = display.newText("8", 0, 0, nil, 50)
    numEight:setTextColor (1, 1, 0)
    numEight.isVisible = false

    numZero = display.newText("0", 0, 0, nil, 60)
    numZero:setTextColor (1, 1, 0)
    numZero.isVisible = false

    numFour = display.newText("4", 0, 0, nil, 60)
    numFour:setTextColor (1, 1, 0)
    numFour.isVisible = false


    -- Question 4 --

    -- Create the text for the true and false questions
    textObject = display.newText("True", 0, 0, nil, 50)
    textObject.x = display.contentWidth*1/3
    textObject.y = display.contentHeight*3/4
    textObject:setTextColor (1, 1, 0)
    textObject.isVisible = false

    textObject2 = display.newText("False", 0, 0, nil, 50)
    textObject2.x = display.contentWidth*2/3
    textObject2.y = display.contentHeight*3/4
    textObject2:setTextColor (1, 1, 0)
    textObject2.isVisible = false

    -- Question 5 -- 

    tri5 = display.newImage("Images/RightAngleTriMeganS@2x.png", 0, 0)
    tri5.width = 160
    tri5.height = 160
    tri5.isVisible = false

    -- the same pentagon from question 1 

    -- the same oval as question 2

    square5 = display.newImage("Images/SqaureMeganS@2x.png", 0, 0)
    square5.width = 160
    square5.height = 160
    square5.isVisible = false

    -- Question 6 -- 

    isosceles6 = display.newImage("Images/IsoscelesTriMegan@2x.png", 0, 0)
    isosceles6.width = 160
    isosceles6.height = 160
    isosceles6.isVisible = false

    rightAngleTri6 = display.newImage("Images/RightAngleTriMeganS@2x.png", 0, 0)
    rightAngleTri6.width = 160
    rightAngleTri6.height = 160
    rightAngleTri6.isVisible = false

    -- the same triangle displayed from question 1

    -- Question 7 -- 

    numTwo = display.newText("2", 0, 0, nil, 60)
    numTwo:setTextColor (1, 1, 0)
    numTwo.isVisible = false

    numOne = display.newText("1", 0, 0, nil, 60)
    numOne:setTextColor (1, 1, 0)
    numOne.isVisible = false

    -- the same Zero from question three

    -- the same Four from question three

    -- Question 8 -- 

    numSix = display.newText("6", 0, 0, nil, 60)
    numSix:setTextColor (1, 1, 0)
    numSix.isVisible = false

    numSeven = display.newText("7", 0, 0, nil, 60)
    numSeven:setTextColor (1, 1, 0)
    numSeven.isVisible = false

    numNine = display.newText("9", 0, 0, nil, 60)
    numNine:setTextColor (1, 1, 0)
    numNine.isVisible = false


    -- Question 9 --

    pentagonText = display.newText("Pentagon", X1, Y2, nil, 40)
    pentagonText.isVisible = false

    octagonText = display.newText("Octagon", X2, Y2, nil, 40)
    octagonText.isVisible = false

    decagonText = display.newText("Decagon", X1, Y1, nil, 40)
    decagonText.isVisible = false

    hexagonText = display.newText("Hexagon", X2, Y1, nil, 40)
    hexagonText.isVisible = false

    -- Question 10 --

    nonagonText = display.newText("Nonagon", X1, Y2, nil, 40)
    nonagonText.isVisible = false






    -----------------------------------------------------------------------------------------

    -- insert the questions for question 9
    sceneGroup:insert( bkg )
    sceneGroup:insert( cover )
    sceneGroup:insert( questionText )
    sceneGroup:insert( pentagonText )
    sceneGroup:insert( octagonText )
    sceneGroup:insert( decagonText )
    sceneGroup:insert( hexagonText )

    -- the group scene insert for all of the objects in the questions

    -- question 1 --
    sceneGroup:insert( circle1 )
    sceneGroup:insert( rectangle1 )
    sceneGroup:insert( pentagon1 )
    sceneGroup:insert( triangle1 )

    -- question 2 --
    sceneGroup:insert( oval2 )

    -- question 3 -- 
    sceneGroup:insert( numThree )
    sceneGroup:insert( numEight )
    sceneGroup:insert( numZero )
    sceneGroup:insert( numFour )

    -- question 4 -- 
    sceneGroup:insert( textObject )
    sceneGroup:insert( textObject2 )

    -- question 5 --
    sceneGroup:insert( tri5 )
    sceneGroup:insert( square5 )

    -- question 6 --
    sceneGroup:insert( isosceles6 )
    sceneGroup:insert( rightAngleTri6 )

    -- question 7 --
    sceneGroup:insert( numTwo )
    sceneGroup:insert( numOne )

    -- question 8 --




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
