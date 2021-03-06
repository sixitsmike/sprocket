-- This file is for use with Corona Game Edition
--
-- This file is automatically generated with PhysicsEdtior (http://physicseditor.de). Do not edit
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "shapedefs").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

module(...)

function physicsData(scale)
	local physics = { data =
	{ 
		
		["arm_bottom"] = {
			
				{
					density = 2, friction = 0, bounce = 0, 
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   82, 86.5  ,  46.5, 113  ,  19.5, 104  ,  -62.5, -79  ,  55, 16.5  ,  93.5, 52  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0, 
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   0.5, -187  ,  9.5, -176  ,  32.5, -30  ,  -62.5, -79  ,  -83.5, -166  ,  -71, -187.5  }
				}  ,
				{
					density = 2, friction = 0, bounce = 0, 
					filter = { categoryBits = 1, maskBits = 65535 },
					shape = {   -62.5, -79  ,  32.5, -30  ,  55, 16.5  }
				}  
		}
		
	} }

	-- apply scale factor
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


