print("do good be good");
display.setStatusBar( display.HiddenStatusBar )
dummyBg=display.newImage("sky09.jpg",-300,100)
local game=display.newGroup();
local physics = require("physics")
local watchMaker=require ("Hero")

physics.start()
physics.setScale( 60)
physics.setGravity(0,9.8)


--game:insert(dummyBg)
watchMaker.main.construct(physics,game)

--dummy background



dummyGround=display.newImage("dummyground.png",-200,1000,true);
dummyGround.rotation=-1
physics.addBody(dummyGround,"static")
game:insert(dummyGround)


gameLoop=function()

--print(watchMaker.main.body);

local trackObject=watchMaker.main.head
game.x = -trackObject.x-200
game.y=-trackObject.y+200



end

Runtime:addEventListener( "enterFrame", gameLoop );

TESTchristheCODER

