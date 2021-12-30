local array2D = require(script.Parent.Array2D)

local ss = game:GetService("ServerStorage")
local Unit = ss:WaitForChild("Unit"):Clone();
Unit.Parent = game.Workspace;

local allMouseDetectors = {}

mapSizeX = 10;
mapSizeY = 10;

tileTypes = {"tileGrass", "tileMountain", "tileSwamp"}

tiles = array2D.new(mapSizeX,mapSizeY,1)

function addClickDetector(parent)
	local cd = Instance.new("ClickDetector")
	cd.Parent = parent;
	table.insert(allMouseDetectors, cd);
end

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
				addClickDetector(clone);
				clone:SetAttribute("x",x);
				clone:SetAttribute("y",y);
			end
			
		end
	end
	for _,v in pairs(allMouseDetectors) do
		print(v.Name)
		v.MouseClick:connect(function()
			print("clicked")
			local x = v.Parent:GetAttribute("x")
			local y = v.Parent:GetAttribute("y")
			moveSelectedUnitTo(x,y)
		end)
	end
end

function moveSelectedUnitTo(x,y)
	Unit.CFrame = CFrame.new(x,y,1)
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

