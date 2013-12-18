
local class = require "base.class"
local comm_func = require "common.comm_func"

a = class.base_type.new(1)
a:print_x()
a:hello()
print (comm_func.repr(getmetatable(a)))
test = class.class(base_type)
test.new(2)
print (comm_func.repr(getmetatable(test)))
--[[function test.hello()
	print (self.x)
end]]--
test.hello()