local array2D = require(script.Parent.Array2D)

local ss = game:GetService("ServerStorage")
local Unit = ss:WaitForChild("Unit");


mapSizeX = 10;
mapSizeY = 10;

tileTypes = {"tileGrass", "tileMountain", "tileSwamp"}

tiles = array2D.new(mapSizeX,mapSizeY,1)

function generateMapVisuals()
	for x = 1,mapSizeX do
		for y = 1,mapSizeY do
			
			local tt = tileTypes[ tiles:Get(x,y) ]; 
			
			
			--if tt == nil then return end;
			local instance = ss:FindFirstChild(tostring(tt))
			--print (instance)
			if instance then
				local clone = instance:Clone()
				clone.Parent = game.Workspace
				clone.CFrame = CFrame.new(x,y,0);
			end
			
		end
	end
end

function generateMapData()
	
	--Sets All to grass
	for x = 1,mapSizeX do
		for y = 1,mapSizeY do
			tiles:Set(x,y,1);
		end
	end
	
	
	--Make a big swamp area
	for x = 4,6,1 do
		for y = 1,4,1 do
			tiles:Set(x,y,3)
		end
	end
	
	-- u-shaped mountain range
	tiles:Set(5,5,2);
	tiles:Set(6,5,2);
	tiles:Set(7,5,2);
	tiles:Set(8,5,2);
	tiles:Set(9,5,2);

	tiles:Set(5,6,2);
	tiles:Set(5,7,2);
	tiles:Set(9,6,2);
	tiles:Set(9,7,2);
end


function start()
	generateMapData()
	generateMapVisuals();
end


start()

