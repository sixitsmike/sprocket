COLLISION_ON = true

phys = require("physics")
phys.start()
phys.setDrawMode('hybrid')



arm_top = display.newImage("arm_top.png")
arm_top.y = 160
arm_bottom = display.newImage("arm_bottom.png")
arm_bottom.y = 515
arm_bottom.x = 135


--[[--

the container is the problem 
may be shold rescale each with out the container



--]]---
local scaleFactor = .5
arm_bottom.xScale = scaleFactor
arm_bottom.yScale = scaleFactor

arm_top.xScale = scaleFactor
arm_top.yScale = scaleFactor


--arm_group = display.newGroup()
--arm_group:insert(arm_top)
--arm_group:insert(arm_bottom)


--arm_group.xScale = scaleFactor
--arm_group.yScale = scaleFactor
--arm_group.x = 80
--arm_group.y = 10





local arm_bottom_verts = (require "arm_bottom").physicsData(scaleFactor)
local arm_top_verts = (require "arm_top").physicsData(scaleFactor)

if (COLLISION_ON) then
    phys.addBody( arm_bottom, arm_bottom_verts:get("arm_bottom") )
    phys.addBody( arm_top, arm_top_verts:get("arm_top") )
end

local floor = display.newImage("floor.png")
floor.y = 420
floor.x = 150
phys.addBody( floor, 'static' )

