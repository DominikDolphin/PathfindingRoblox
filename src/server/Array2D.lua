local Array2D = {}
Array2D.__index = Array2D
Array2D.__type = "Array2D"

function Array2D.new(rows, cols, defaultValue)
	--Create the metatable 
	local self = setmetatable({
		arr = {}, --where our array is stored 
		rows = rows, --num of rows  
		cols = cols, -- num of columns 
	}, Array2D) 
	
	for x = 1, rows do 
		self.arr[x] = {}
		for y = 1, cols do 
			self.arr[x][y] = defaultValue or 0 
		end		
	end
	
	return self 	
end

function Array2D:Get(x, y)
	assert(self.arr[x] and self.arr[x][y], x .. ", " .. y .. " is out of bounds.")
	
	return self.arr[x][y]
end

function Array2D:Set(x, y, value)
	assert(self.arr[x] and self.arr[x][y], x .. ", " .. y .. " is out of bounds.")
	
	self.arr[x][y] = value 
end

function Array2D:GetRowLength()
	return self.rows 
end

function Array2D:GetColumnLength()
	return self.cols 
end

function Array2D:__len()
	return self.rows 
end

function Array2D:__tostring()
	local str = ""
	for x = 1, self:GetRowLength() do
		str ..= "\n"
		for y = 1, self:GetColumnLength() do 
			str ..= self:Get(x, y) .. ", "
		end
	end
	return str 
end

function Array2D:__eq(value)
	if typeof(value) == "table" and value.__type == Array2D.__type then 
		return tostring(self) == tostring(value) 
	end	
end

return Array2D 
