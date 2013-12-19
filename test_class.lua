
local class = require "base.class"
local comm_func = require "common.comm_func"

A = class.Class(class.object)

function A:Ator(a)
	self.a = 0
end

function A:hello()
	print ("hello a = ", self.a)
end

function A:test()
	print ("test A")
end

B = class.Class(class.object)

function B:Ator(b)
	self.b = 1 
end

function B:hello()
	print ("hello b = ", self.b)
end

C = class.Class(B,A)
obj = C.new(3)
print (obj.a, obj.b)
print (obj:hello())
print (obj:test())
