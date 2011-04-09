module(..., package.seeall)

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



function addSprocket(scale)

    local verts = (require "sprocket_1").physicsData(scale)
    local  sprocket = display.newImage("sprocket_1.png")
    sprocket.x = 200
    sprocket.y = 800
    sprocket.xScale = scale
    sprocket.yScale = scale
    sprocket.myName = "sprocket"
    physics.addBody( sprocket, verts:get("sprocket_1") )
    sprocket.friction = 1
	displayList:insert(sprocket)

    sprocket.bodyType = "kinematic"

    sprocket:addEventListener("touch", onTouch)
    return sprocket


end
