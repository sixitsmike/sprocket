module(..., package.seeall)

action = require('action')
hero   = require('hero')

local function build()

    bg = display.newImage("bg_level_1.png", 0, 0, true)
    bg.x = display.contentWidth / 2
    bg.y = display.contentHeight / 2
    bg.rotation = 90
    bg.xScale = .75
    bg.yScale = .75
    displayList:insert(bg)

    local scaleHalf = 0.5
    local scaleFull = 1.0

    hero.main.construct(physics, displayList, scaleHalf)
    hero.main.positionParts(350,100)

    s1 = action.addSprocket(scaleFull)
    s2 = action.addSprocket(scaleHalf)
    s2.x = s2.x + 500

end


local onFrameChange = function()

    if (s1.rotation == 360) then
        s1.rotation = 0
		s2.rotation=360

    else
        s1.rotation = s1.rotation + 1
		s2.rotation=s2.rotation-1
    end

end


function start()
    
    build()

    Runtime:addEventListener( "enterFrame", onFrameChange );

end

function finish()
    
    --remove event listeners, clear display list, etc

end



