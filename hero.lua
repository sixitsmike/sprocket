module(...,package.seeall)
--[[
@ author regniraj@gmail.com
@ date April 1st 2010
@ code name sprocket
The hero class and different methods related to hero
]]--



local unpack = unpack
local pairs = pairs
local ipairs = ipairs



main={

container=nil,

physics=nil,
--body related declaration
leftHand=nil,
leftArm=nil,
rightHand=nil,
rightArm=nil,
body=nil,
--neck=nil,
head=nil,
leftleg=nil,
leftfoot=nil,
rightleg=nil,
rightfoot=nil,
--end body related


--joints
neckJoint=nil,
rightShoulderJoint=nil,
leftShoulderJoint=nil,
rightArmJoint=nil,
leftArmJoint=nil,
leftHipJoint=nil,
rightHipJoint=nil,
rightKneeJoint=nil,
leftKneeJoint=nil,
game=null,



initphyics=function()

			local scaleFactor = .75

			local physicsData=physicsData(scaleFactor)
			physics.addBody( main.head, physicsData:get("ClockMaker_Head") )

			physics.addBody( main.body, physicsData:get("ClockMaker_Torso") )

			physics.addBody( main.leftArm, physicsData:get("ClockMaker_Arm_Left_Upper") )
			physics.addBody( main.leftHand, physicsData:get("ClockMaker_Arm_Left_Lower") )

			physics.addBody( main.rightArm, physicsData:get("ClockMaker_Arm_Right_Upper") )
			physics.addBody( main.rightHand, physicsData:get("ClockMaker_Arm_Right_Lower") )

			physics.addBody( main.leftfoot, physicsData:get("ClockMaker_Leg_Left_Lower") )
			physics.addBody( main.leftleg, physicsData:get("ClockMaker_Leg_Left_Upper") )

			physics.addBody( main.rightfoot, physicsData:get("ClockMaker_Leg_Right_Lower") )
			physics.addBody( main.rightleg, physicsData:get("ClockMAker_Leg_Right_Upper") )

end,





construct=function(phy_,game_)
			main.physics=phy
			main.game=game_

			main.container=display.newGroup()
			main.head = display.newImage("ClockMaker_Head.png")

			main.leftHand=display.newImage("ClockMaker_Arm_Left_Lower.png")
			main.leftArm=display.newImage("ClockMaker_Arm_Left_Upper.png")

			main.rightHand=display.newImage("ClockMaker_Arm_Right_Lower.png")
			main.rightArm=display.newImage("ClockMaker_Arm_Right_Upper.png")




			main.leftleg=display.newImage("ClockMaker_Leg_Left_Upper.png")
			main.leftfoot=display.newImage("ClockMaker_Leg_Left_Lower.png")

			main.rightleg=display.newImage("ClockMAker_Leg_Right_Upper.png")
			main.rightfoot=display.newImage("ClockMaker_Leg_Right_Lower.png")

	main.body=display.newImage("ClockMaker_Torso.png")

	main.container:insert(main.head)

				main.container:insert(main.leftHand)
				main.container:insert(main.leftArm)

				main.container:insert(main.rightArm)
				main.container:insert(main.rightHand)
				main.container:insert(main.leftfoot)
				main.container:insert(main.leftleg)
				main.container:insert(main.rightfoot)
				main.container:insert(main.rightleg)
				main.container:insert(main.body);








		main.initphyics()
		main.positionParts()
		main.makeJoint()
				end

,
positionParts=function()
main.head.x=0
main.head.y=0

main.body.x=16
main.body.y=339

main.rightArm.x=-168
main.rightArm.y=257

main.rightHand.x=-213
main.rightHand.y=391

main.leftArm.x=183
main.leftArm.y=220

main.leftHand.x=274
main.leftHand.y=349

main.rightleg.x=-76
main.rightleg.y=511

main.rightfoot.x=-51
main.rightfoot.y=700

main.leftleg.x=93
main.leftleg.y=549

main.leftfoot.x=108
main.leftfoot.y=706





main.container.x=400
main.container.y=-500

--main.container.xScale = 0.25
--main.container.yScale = 0.25

main.game:insert(main.container)


end



,
makeJoint=function()
main.neckJoint=physics.newJoint("pivot",main.head,main.body,5,5)
main.neckJoint.isLimitEnabled = true -- (boolean)
main.neckJoint:setRotationLimits( -10, 10 )




main.rightShoulderJoint=physics.newJoint("pivot",main.body,main.rightArm,2,2)
main.rightShoulderJoint.isLimitEnabled = true -- (boolean)
main.rightShoulderJoint:setRotationLimits( -5,30 )



main.leftShoulderJoint=physics.newJoint("pivot",main.body,main.leftArm,2,2)
main.leftShoulderJoint.isLimitEnabled = true -- (boolean)
main.leftShoulderJoint:setRotationLimits( -30,15 )




main.rightArmJoint=physics.newJoint("pivot",main.rightArm,main.rightHand,0,0)
main.rightArmJoint.isLimitEnabled = true -- (boolean)
main.rightArmJoint:setRotationLimits( -0,0 )




main.leftArmJoint=physics.newJoint("pivot",main.leftArm,main.leftHand,0,0)
main.leftArmJoint.isLimitEnabled = true -- (boolean)
main.leftArmJoint:setRotationLimits( -0,0 )






main.leftHipJoint=physics.newJoint("pivot",main.body,main.leftleg,0,0)
main.leftHipJoint.isLimitEnabled = true
main.leftHipJoint:setRotationLimits( 0,0)


main.rightHipJoint=physics.newJoint("pivot",main.body,main.rightleg,0,0)
main.rightHipJoint.isLimitEnabled = true
main.rightHipJoint:setRotationLimits( 0,0 )







main.rightKneeJoint=physics.newJoint("pivot",main.rightleg,main.rightfoot,0,0)
main.rightKneeJoint.isLimitEnabled = true
main.rightKneeJoint:setRotationLimits( 0,0)


main.leftKneeJoint=physics.newJoint("pivot",main.leftleg,main.leftfoot,0,0)
main.leftKneeJoint.isLimitEnabled = true
main.leftKneeJoint:setRotationLimits( 0,0 )



end
}

--[[

data related to the phy attribute of the table


--]]--

function physicsData(scale)
	local physics = { data =
	{

		["ClockMaker_Head"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -37.5, 186.5  ,  66, 184  ,  58.5, 209.5  ,  34, 221  ,  -18, 220  ,  -35.5, 210.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   266.5, -88.5  ,  258.5, -111.5  ,  267.5, -102.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -260.5, -129.5  ,  -269.5, -104.5  ,  -270.5, -118.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   258, 49  ,  267, 13  ,  268.5, 41.5  ,  266, 47  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -271.5, 23.5  ,  -269.5, -2.5  ,  -259.5, 32.5  ,  -266, 32  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -137.5, 163.5  ,  -92, 186  ,  -132, 178  ,  -137.5, 171.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   186, 89  ,  180, -148  ,  273.5, -29.5  ,  270.5, -3.5  ,  267, 13  ,  258, 49  ,  234, 72  ,  210, 90  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   273.5, -29.5  ,  180, -148  ,  268.5, -64.5  ,  278.5, -44.5  ,  278.5, -36.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -276.5, -45.5  ,  -273.5, -21.5  ,  -279.5, -27.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   270.5, -3.5  ,  273.5, -29.5  ,  276.5, -9.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -259.5, 38.5  ,  -259.5, 32.5  ,  -243, 53  ,  -251, 51  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   150.5, 138.5  ,  -155, -168  ,  -135.5, -181.5  ,  157.5, 117.5  ,  156.5, 129.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -269.5, -104.5  ,  -271.5, -82.5  ,  -273.5, -96.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -155.5, 119.5  ,  -155, -168  ,  150.5, 148.5  ,  66, 184  ,  -92, 186  ,  -137.5, 163.5  ,  -150.5, 149.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -271.5, -82.5  ,  -276.5, -45.5  ,  -279.5, -50.5  ,  -279.5, -66.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   104, 180  ,  66, 184  ,  150.5, 148.5  ,  134, 168  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -243, 53  ,  -259.5, 32.5  ,  -269.5, -2.5  ,  -273.5, -21.5  ,  -199, -163  ,  -155, -168  ,  -192, 81  ,  -214, 78  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   267, 13  ,  270.5, -3.5  ,  270.5, 10.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   268.5, -64.5  ,  180, -148  ,  218, -140  ,  266.5, -88.5  ,  270.5, -80.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -273.5, -21.5  ,  -269.5, -2.5  ,  -273.5, -7.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   258.5, -111.5  ,  244, -128  ,  257.5, -117.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   234, 72  ,  258, 49  ,  252.5, 63.5  ,  246, 69  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   266.5, -88.5  ,  218, -140  ,  244, -128  ,  258.5, -111.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -260.5, -129.5  ,  -221, -157  ,  -199, -163  ,  -273.5, -21.5  ,  -271.5, -82.5  ,  -269.5, -104.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   34, -222  ,  58, -216  ,  157.5, 117.5  ,  -135.5, -181.5  ,  -82.5, -208.5  ,  -38, -222  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -271.5, -82.5  ,  -273.5, -21.5  ,  -276.5, -45.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -221, -157  ,  -260.5, -129.5  ,  -259.5, -135.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   163.5, -154.5  ,  157.5, 117.5  ,  58, -216  ,  137, -179  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   157.5, 117.5  ,  163.5, -154.5  ,  180, -148  ,  186, 89  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -192, 81  ,  -155, -168  ,  -155.5, 119.5  ,  -177.5, 99.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -155, -168  ,  150.5, 138.5  ,  150.5, 148.5  }
				}
		}

		,
		["ClockMaker_Torso"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   116.5, -161  ,  104.5, -123  ,  41, -155.5  ,  111, -168.5  ,  116.5, -167  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -163.5, 38  ,  -122, 82.5  ,  -161.5, 72  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   162.5, 98  ,  157.5, 132  ,  117, 152.5  ,  137.5, 68  ,  156.5, 76  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -145, 10.5  ,  -159, 33.5  ,  -157.5, 19  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   117, 152.5  ,  157.5, 132  ,  141, 151.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -20, 160.5  ,  -52, 146.5  ,  -119, 105.5  ,  -121.5, 102  ,  -122, 82.5  ,  66, 148.5  ,  24, 167.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -45.5, -138  ,  -106.5, -62  ,  -134.5, -150  ,  -90, -155.5  ,  -52, -158.5  ,  -46, -152.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   143.5, 48  ,  137.5, 68  ,  129.5, 7  ,  141, 13.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -90, -155.5  ,  -134.5, -150  ,  -134.5, -160  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   111.5, -29  ,  41, -155.5  ,  105.5, -67  ,  112.5, -51  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -110.5, -50  ,  0, -120.5  ,  32, -127.5  ,  -123.5, -22  ,  -121.5, -34  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   104.5, -103  ,  41, -155.5  ,  104.5, -123  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   105.5, -67  ,  41, -155.5  ,  104.5, -103  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   41, -155.5  ,  113.5, 143  ,  110, 141.5  ,  39.5, -138  ,  38.5, -152  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -38, -124.5  ,  -106.5, -62  ,  -45.5, -138  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   0, -120.5  ,  -110.5, -50  ,  -106.5, -62  ,  -38, -124.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   117, 152.5  ,  113.5, 143  ,  41, -155.5  ,  111.5, -29  ,  129.5, 7  ,  137.5, 68  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   129.5, 7  ,  111.5, -29  ,  125, -9.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -163.5, 38  ,  -159, 33.5  ,  32, -127.5  ,  110, 141.5  ,  66, 148.5  ,  -122, 82.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   32, -127.5  ,  -159, 33.5  ,  -145, 10.5  ,  -123.5, -22  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   39.5, -138  ,  110, 141.5  ,  32, -127.5  }
				}
		}

		,
		["ClockMaker_Arm_Left_Lower"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   37, 70.5  ,  57, 50.5  ,  61.5, 60  ,  55.5, 73  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -3.5, 72  ,  -26.5, 41  ,  -32.5, 21  ,  43, 9.5  ,  24.5, 77  ,  11, 84.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   57, 50.5  ,  43, 9.5  ,  75.5, 37  ,  71, 48.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   52.5, 5  ,  43, 9.5  ,  -32.5, 21  ,  16, -10.5  ,  39, -21.5  ,  54.5, -24  ,  60.5, -8  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -27.5, 61  ,  -26.5, 41  ,  -3.5, 72  ,  -13, 75.5  ,  -24.5, 71  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   37, 70.5  ,  28, 64.5  ,  43, 9.5  ,  57, 50.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -15, -73.5  ,  -8, -62.5  ,  -5.5, -38  ,  -73.5, -30  ,  -76.5, -46  ,  -63.5, -78  ,  -46, -85.5  ,  -30, -85.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -32.5, 21  ,  -26.5, 41  ,  -32.5, 35  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -66.5, -19  ,  -73.5, -30  ,  4, -14.5  ,  -43, 1.5  ,  -55, -3.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   4, -14.5  ,  -73.5, -30  ,  -5.5, -38  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   54.5, -24  ,  39, -21.5  ,  51, -25.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   4, -14.5  ,  16, -10.5  ,  -32.5, 21  ,  -43, 1.5  }
				}
		}

		,
		["ClockMaker_Arm_Left_Upper"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -33, 52  ,  5, 64  ,  -27, 61  ,  -33.5, 58.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -27, 61  ,  5, 64  ,  -18, 69  ,  -26.5, 67.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   42.5, 47.5  ,  54, 21  ,  62, 34  ,  64, 46  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   58.5, 1.5  ,  54, 21  ,  49.5, -7.5  ,  59.5, -4.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -18, 69  ,  5, 64  ,  -10.5, 75.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   49.5, -7.5  ,  54, 21  ,  42.5, 47.5  ,  7.5, 69.5  ,  30, -19  ,  40.5, -18.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   54, 21  ,  58.5, 1.5  ,  62, 4  ,  63, 12  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   7.5, 69.5  ,  42.5, 47.5  ,  20, 73  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -65, 10  ,  -57, -38  ,  -40, -72  ,  -34.5, -76.5  ,  -8.5, -67.5  ,  5, 64  ,  -33, 52  ,  -52.5, 38.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   7.5, 69.5  ,  5, 64  ,  -8.5, -67.5  ,  30, -19  }
				}
		}

		,
		["ClockMaker_Arm_Right_Lower"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -36.5, 35  ,  -4, -77.5  ,  16.5, 8  ,  11, 76.5  ,  -23, 69.5  ,  -37.5, 57  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -4, -77.5  ,  -28.5, 7  ,  -38.5, -37  ,  -30.5, -65  ,  -19.5, -75  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   23.5, -12  ,  16.5, 8  ,  -4, -77.5  ,  18.5, -66  ,  29.5, -48  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   18.5, -66  ,  -4, -77.5  ,  18, -72.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   28.5, 29  ,  26, 65.5  ,  11, 76.5  ,  16.5, 8  ,  24.5, 15  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   37.5, 47  ,  26, 65.5  ,  28.5, 29  ,  37.5, 41  }
				}
		}

		,
		["ClockMaker_Arm_Right_Upper"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   5, 62  ,  18, 54  ,  15, 63  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -45, 10  ,  24, 41  ,  5, 62  ,  -52.5, 16.5  ,  -51.5, 10.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   18, 54  ,  24, 41  ,  24.5, 53.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -41, -1  ,  24, 41  ,  -45, 10  ,  -45.5, 3.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   24, 41  ,  -41, -1  ,  28, -88  ,  34, -88  ,  34, 36  ,  32.5, 40.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   34, 36  ,  34, -88  ,  50, -77  ,  63.5, -48.5  ,  63.5, -10.5  ,  56.5, 19.5  ,  46, 36  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -59.5, 21.5  ,  -52.5, 16.5  ,  5, 62  ,  -12, 87  ,  -33.5, 67.5  ,  -61.5, 35.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -63.5, 55.5  ,  -54.5, 43.5  ,  -46, 62  ,  -64, 62  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -54.5, 43.5  ,  -33.5, 67.5  ,  -46, 62  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   5, 62  ,  24, 41  ,  18, 54  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -33.5, 67.5  ,  -12, 87  ,  -22, 86  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   28, -88  ,  -41, -1  ,  -28.5, -37.5  ,  -0.5, -72.5  }
				}
		}

		,
		["ClockMaker_Leg_Left_Lower"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   17.5, -17.5  ,  -30.5, -89.5  ,  -8.5, -95.5  ,  34, -68  ,  38, -36  ,  34, -22  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -30.5, -89.5  ,  17.5, -17.5  ,  16, -12  ,  -70, -63  ,  -75, -107  ,  -71.5, -113.5  ,  -47.5, -111.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   61.5, 105.5  ,  41.5, 112.5  ,  3.5, 107.5  ,  -38.5, 91.5  ,  36, 24  ,  58, 41  ,  73, 62  ,  76, 84  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   23.5, -108.5  ,  34, -68  ,  -8.5, -95.5  ,  7.5, -109.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -66, 10  ,  -56, -20  ,  16, -12  ,  -57, 60  ,  -69, 48  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -38.5, 91.5  ,  -51, 80  ,  -57, 60  ,  16, -12  ,  36, 24  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -68, -41  ,  -70, -63  ,  16, -12  ,  -56, -20  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -75, -107  ,  -70, -63  ,  -77, -85  }
				}
		}

		,
		["ClockMaker_Leg_Left_Upper"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -23, -57  ,  40.5, 17.5  ,  28, 50  ,  13.5, 65.5  ,  -37, 49  ,  -50.5, -25.5  ,  -48.5, -49.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -62.5, 8.5  ,  -50.5, -25.5  ,  -37, 49  ,  -62.5, 42.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -37, 49  ,  13.5, 65.5  ,  -19, 73  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   28, 50  ,  40.5, 17.5  ,  43.5, 47.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   61.5, -60.5  ,  40.5, 17.5  ,  -23, -57  ,  -1, -68  ,  27, -74  ,  57, -74  }
				}
		}

		,
		["ClockMaker_Leg_Right_Lower"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   19.5, -17.5  ,  -21.5, -91.5  ,  2.5, -96.5  ,  31, -72  ,  37, -30  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   38.5, 126.5  ,  2.5, 129.5  ,  -11.5, 127.5  ,  28, 26  ,  42, 36  ,  56, 55  ,  65, 79  ,  60, 109  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   31, -72  ,  2.5, -96.5  ,  16.5, -118.5  ,  32.5, -120.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -38, -108  ,  -60, -71  ,  -65, -119  ,  -62.5, -130.5  ,  -54.5, -130.5  ,  -43.5, -123.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -50, 92  ,  -58, 70  ,  -52, -9  ,  -27.5, -94.5  ,  19, -11  ,  28, 26  ,  -11.5, 127.5  ,  -31.5, 118.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -62.5, -130.5  ,  -65, -119  ,  -65, -129  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -27.5, -94.5  ,  -52, -9  ,  -63, -19  ,  -60, -71  ,  -38, -108  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -64, 19  ,  -52, -9  ,  -58, 70  ,  -66, 63  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   28, 26  ,  19, -11  ,  26, 4  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   19.5, -17.5  ,  19, -11  ,  -27.5, -94.5  ,  -21.5, -91.5  }
				}
		}

		,
		["ClockMAker_Leg_Right_Upper"] = {

				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -21, 83.5  ,  -24, 67.5  ,  28.5, 98  ,  -1.5, 103  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -40, 24.5  ,  59, 21.5  ,  63, 41.5  ,  43, 79.5  ,  34, 94.5  ,  28.5, 98  ,  -24, 67.5  ,  -40, 56.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -19.5, -69  ,  -45, 0.5  ,  -70, -53.5  ,  -73, -101.5  ,  -69.5, -104  ,  -23.5, -90  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   43, 79.5  ,  63, 41.5  ,  58, 67.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -40, 24.5  ,  -45, 0.5  ,  -2.5, -56  ,  71.5, -13  ,  72, -8.5  ,  59, 21.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0,
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -2.5, -56  ,  -45, 0.5  ,  -19.5, -69  }
				}
		}

	} }
	local s = scale or 1.0
	for bi,body in pairs(physics.data) do
		for fi,fixture in ipairs(body) do
			for ci,coordinate in ipairs(fixture.shape) do
				fixture.shape[ci] = s * coordinate
			end
		end
	end

	function physics:get(name)
		return unpack(self.data[name])
	end

	return physics;
end



