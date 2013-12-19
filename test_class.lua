
local class = require "base.class"
local comm_func = require "common.comm_func"

a = class.BaseClass.new(1)

test = class.Class(class.BaseClass)
print ('xx', comm_func.repr(getmetatable(test)))
obj = test:new(2)
print ('xx', comm_func.repr(getmetatable(obj)))
print (obj.hello())
