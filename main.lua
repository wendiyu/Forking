-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Mr. Coxall
-- Created on: Apr 2018
-- 
-- This file makes is the starting point for a multi-scene game
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )