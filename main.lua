print("do good be good");
display.setStatusBar( display.HiddenStatusBar )
local game=display.newGroup();
local physics = require("physics")
local watchMaker=require ("hero")
--physics.setDrawMode( "hybrid" )
physics.start()
--physics.setScale( 60)
--physics.setGravity(0,9.8,0)

bg = display.newImage("bg_level_1.png", 0, 0, true)
bg.x = display.contentWidth / 2
bg.y = display.contentHeight / 2
bg.rotation = 90
bg.xScale = .75
bg.yScale = .75
game:insert(bg)


watchMaker.main.construct(physics, game)


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

    sprocket = display.newImage("sprocket_1.png")
    sprocket.x = 400
    sprocket.y = 800
    sprocket.myName = "sprocket"
    physics.addBody( sprocket, {radius=230, friction=1} )
	game:insert(sprocket)

    sprocket.bodyType = "kinematic"

    sprocket:addEventListener("touch", onTouch)

end

gameLoop=function()


--taking tracking out for now
--local trackObject=watchMaker.main.head
--game.x = -trackObject.x+400
--game.y=	 -trackObject.y+100
--print(watchMaker.main.head.x);

    if (sprocket.rotation == 360) then
        sprocket.rotation = 0

    else
        sprocket.rotation = sprocket.rotation + 1
    end

end

addSprocket()
Runtime:addEventListener( "enterFrame", gameLoop );

