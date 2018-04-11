-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local level0

-- 'onRelease' event listener for level0
local function onlevel0Release()
	
	-- go to level0.lua scene
	composer.gotoScene( ".levels.level0", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level1
local function onlevel1Release()
	
	-- go to level1.lua scene
	composer.gotoScene( ".levels.level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level2
local function onlevel2Release()
	
	-- go to level2.lua scene
	composer.gotoScene( ".levels.level2", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level0
local function onlevel3Release()
	
	-- go to level3.lua scene
	composer.gotoScene( ".levels.level3", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level4
local function onlevel4Release()
	
	-- go to level0.lua scene
	composer.gotoScene( ".levels.level4", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level5
local function onlevel5Release()
	
	-- go to level5.lua scene
	composer.gotoScene( ".levels.level5", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level6
local function onlevel6Release()
	
	-- go to level6.lua scene
	composer.gotoScene( ".levels.level6", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level7
local function onlevel7Release()
	
	-- go to level7.lua scene
	composer.gotoScene( ".levels.level7", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level8
local function onlevel8Release()
	
	-- go to level0.lua scene
	composer.gotoScene( ".levels.level8", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level9
local function onlevel0Release()
	
	-- go to level9.lua scene
	composer.gotoScene( ".levels.level9", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level10
local function onlevel10Release()
	
	-- go to level10.lua scene
	composer.gotoScene( ".levels.level10", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level11
local function onlevel11Release()
	
	-- go to level11.lua scene
	composer.gotoScene( ".levels.level11", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level12
local function onlevel12Release()
	
	-- go to level12.lua scene
	composer.gotoScene( ".levels.level12", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level13
local function onlevel13Release()
	
	-- go to level13.lua scene
	composer.gotoScene( ".levels.level13", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level14
local function onlevel14Release()
	
	-- go to level0.lua scene
	composer.gotoScene( ".levels.level14", "fade", 500 )
	
	return true	-- indicates successful touch
end

-- 'onRelease' event listener for level15
local function onlevel15Release()
	
	-- go to level0.lua scene
	composer.gotoScene( ".levels.level15", "fade", 500 )
	
	return true	-- indicates successful touch
end



function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "logo.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100
	
	-- create a level buttons
	level0 = widget.newButton{
		label = "Level 0",
		fontSize = 48*2,
		labelColor = { default={255}, over={128} },
		default = "button.png",
		over = "button-over.png",
		width = (154*4), 
		height = (40*4),
		onRelease = onlevel0Release	-- event listener function
	}
	level0.x = display.contentCenterX
	level0.y = display.contentHeight - 125

	
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( level0 )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if level0 then
		level0:removeSelf()	-- widgets must be manually removed
		level0 = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene