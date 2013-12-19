local setmetatable = setmetatable
local getmetatable = getmetatable
local print = print
local comm_func = require "common.comm_func"

module("base.class")

local _class={}
 
function Class(super)
	local class_type={}
	class_type.Ator=false
	class_type.super=super
	class_type.new=function(...) 
			local obj={}
			do
				local create
				create = function(c,...)
					if c.super then
						create(c.super,...)
					end
					if c.Ator then
						c.Ator(obj,...)
					end
				end
 
				create(class_type,...)
			end

			setmetatable(obj,{ __index=_class[class_type]})
			return obj
		end
	local vtbl={}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=
		function(t,k,v)
			vtbl[k]=v
		end
	})
	if super then
		setmetatable(vtbl,{__index=
				function(t,k)
					local ret=_class[super][k]
					vtbl[k]=ret
					return ret
				end
		})
	end
	return class_type
ends

