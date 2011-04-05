print("do good be good");
display.setStatusBar( display.HiddenStatusBar )
local game=display.newGroup();
local physics = require("physics")
local watchMaker=require ("hero")

physics.start()
--physics.setScale( 60)
--physics.setGravity(0,9.8,0)

--dummyBg=display.newImage("Background.png",-300,100)
--game:insert(dummyBg)


--watchMaker.main.construct(physics,game)

--[[
dummyGround=display.newImage("dummyground.png",-200,1000,true);
dummyGround.rotation=-1
physics.addBody(dummyGround,"static")
game:insert(dummyGround)
]]


local function onTouch( event )
	
    local t = event.target
	local phase = event.phase
	
    if "began" == phase then
		
        local parent = t.parent
		parent:insert( t )
		display.getCurrentStage():setFocus( t )

		t.isFocus = true

		t.x0 = event.x - t.x
		t.y0 = event.y - t.y

	elseif t.isFocus then

		if "moved" == phase then
			
            t.x = event.x - t.x0
			t.y = event.y - t.y0

		elseif "ended" == phase or "cancelled" == phase then

			display.getCurrentStage():setFocus( nil )
			t.isFocus = false

		end
	end

	return true

end

local sprocket = {}

local function addSprocket()
    
    falling = display.newImage("sprocket_1.png")
    falling.y = -500
    physics.addBody( falling, {radius=230, friction=1} )

    sprocket = display.newImage("sprocket_1.png")
    sprocket.x = 400
    sprocket.y = 800
    sprocket.myName = "sprocket"
    physics.addBody( sprocket, "static", {radius=230, friction=1} )
    --sprocket.bodyType = "kinematic"
    
    --sprocket:addEventListener("touch", onTouch)

end

gameLoop=function()


--[[ taking tracking out for now
local trackObject=watchMaker.main.head
game.x = -trackObject.x-200
game.y=-trackObject.y+200
]]

    if (sprocket.rotation == 360) then
        sprocket.rotation = 0
    else    
        sprocket.rotation = sprocket.rotation + 1
    end

end

addSprocket()
Runtime:addEventListener( "enterFrame", gameLoop );

