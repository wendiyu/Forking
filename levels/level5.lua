-----------------------------------------------------------------------------------------
--
-- level5.lua
--
-- Created by: fawaz mezher
-- Created on: Apr 2018
-- 
-- This file is level 5
-----------------------------------------------------------------------------------------

-- Include modules/libraries
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local physics = require( "physics" )
local fx = require( "com.ponywolf.ponyfx" )
local tiled = require( "com.ponywolf.ponytiled" )
local json = require( "json" )

-- Name this Scene: note this is a Global variable
sceneName = "level5_scene"

-- Create a new Composer scene
local scene = composer.newScene( sceneName )

-- for arranging objects in the new scene
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenTop = display.screenOriginY
local screenLeft = display.screenOriginX
local screenWidth = display.contentWidth
local screenHeight = display.contentHeight

-- Are we running on the Corona Simulator?
-- https://docs.coronalabs.com/api/library/system/getInfo.html
local isSimulator = "simulator" == system.getInfo( "environment" )
local isMobile = ( "ios" == system.getInfo("platform") ) or ( "android" == system.getInfo("platform") )

-----------------------------------------------------------------------------------------
-- Place your scene spacific code below
-----------------------------------------------------------------------------------------

-- Variables Global to the scene; note make sure you do not declare with "local"
--

-- This module turns gamepad axis events and mobile accelerometer events into keyboard
-- events so we don't have to write separate code for joystick, tilt, and keyboard control
require( "com.ponywolf.joykey" ).start()

-- add virtual joysticks to mobile 
system.activate("multitouch")
if isMobile or isSimulator then
	local vjoy = require( "com.ponywolf.vjoy" )
	local stick = vjoy.newStick()
	stick.x, stick.y = 128, display.contentHeight - 128
	local button = vjoy.newButton()
	button.x, button.y = display.contentWidth - 128, display.contentHeight - 128
end

-- Variables local to scene
local map, hero, shield, parallax

-- Functions local to scene, like event handlers for buttons
local function menuTransition( )
	--composer.gotoScene("scene.splashScene")

end

-- This function is called when scene is created
function scene:create( event )

	local sceneGroup = self.view  -- Add scene display objects to this group

	-- Display background
	--local background = display.newRect( centerX, centerY, screenWidth ,screenHeight )
	--background:setFillColor( 0, 0, 255 ) 

	-- Associating display objects with this scene
	--sceneGroup:insert( background )

	-- stream music
	--bgMusic = audio.loadStream( "scene/menu/sfx/titletheme.mp3" )

	-- Start physics before loading map
	physics.start()
	physics.setGravity( 0, 32 )

	-- Load our map
	--local filename = "./assets/maps/winterScene.json"
	--local mapData = json.decodeFile( system.pathForFile( filename, system.ResourceDirectory ) )
	
	local filename = "./assets/maps/level5.json"
	local mapData = json.decodeFile( system.pathForFile( filename, system.ResourceDirectory ) )
	--map = tiled.new( mapData, "./assets/maps" )	
	map = tiled.new( mapData, "./assets/sprites" )

	-- drag the whole map for fun
	local dragable = require "com.ponywolf.plugins.dragable"
	map = dragable.new(map)

	-- Find our hero!
	--map.extensions = "assets.lib."
	--map:extend( "hero" )
	--hero = map:findObject( "hero" )
	--hero.filename = filename

	-- Find our enemies and other items
	--map:extend( "blob", "enemy", "exit", "coin", "spikes" )

	-- Find the parallax layer
	--parallax = map:findLayer( "parallax" )

			-- Add our scoring module
	--local gem = display.newImageRect( sceneGroup, "./assets/lib/img/gem.png", 64, 64 )
	--gem.x = display.contentWidth - gem.contentWidth / 2 - 24
	--gem.y = display.screenOriginY + gem.contentHeight / 2 + 20



	-- Insert our game items in the correct back-to-front order
	sceneGroup:insert( map )

	--sceneGroup:insert( gem )


end

-- Function to scroll the map
local function enterFrame( event )

	local elapsed = event.time

	-- Easy way to scroll a map based on a character
	--if hero and hero.x and hero.y and not hero.isDead then
	--	local x, y = hero:localToContent( 0, 0 )
	--	x, y = display.contentCenterX - x, display.contentCenterY - y
	--	map.x, map.y = map.x + x, map.y + y
		-- Easy parallax
	--	if parallax then
	--		parallax.x, parallax.y = map.x / 6, map.y / 8  -- Affects x more than y
	--	end
	--end
end

--local function enterFrame( event )

--	local elapsed = event.time

--end

-- This function is called when scene comes fully on screen
function scene:show( event )

	local phase = event.phase
	if ( phase == "will" ) then
		Runtime:addEventListener( "enterFrame", enterFrame )
	elseif ( phase == "did" ) then

	end

end

-- This function is called when scene goes fully off screen
function scene:hide( event )

	local phase = event.phase
	if ( phase == "will" ) then

	elseif ( phase == "did" ) then
		Runtime:removeEventListener( "enterFrame", enterFrame )
	end

end

-- This function is called when scene is destroyed
function scene:destroy( event )

	audio.stop()  -- Stop all audio
	for s, v in pairs( self.sounds ) do  -- Release all audio handles
		audio.dispose( v )
		self.sounds[s] = nil
	end

  --collectgarbage()

end

scene:addEventListener( "create" )
scene:addEventListener( "show" )
scene:addEventListener( "hide" )
scene:addEventListener( "destroy" )

return scene