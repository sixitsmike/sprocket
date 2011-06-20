
physics = require('physics')
level_1 = require('level_1')

displayList = display.newGroup()

local function onStartGame(event)

    background:removeSelf()
    physics.start()
    level_1:start()

end

local function showSplash()

    background = display.newImage( "splash.jpg", 0, 0, true )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    background.xScale = .65
    background.yScale = .65

    background:addEventListener("touch", onStartGame)

end



showSplash()
