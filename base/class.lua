local setmetatable = setmetatable
local getmetatable = getmetatable
local print = print
local comm_func = require "common.comm_func"

module("base.class")

local _class={}
 
function class(super)
	local class_type={}
	class_type.ctor=false
	class_type.super=super
	class_type.new=function(...) 
			local obj={}
			do
				local create
				create = function(c,...)
					if c.super then
						create(c.super,...)
					end
					if c.ctor then
						c.ctor(obj,...)
					end
				end
 
				create(class_type,...)
			end
			
			setmetatable(obj,{ __index=comm_func.copy_tab(_class[class_type]), __newindex = 
								function(t, k,v)
									_M[k] = v
								end
							})
			--print (comm_func.repr(getmetatable(obj)))
			return obj
		end
	local vtbl={}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=
		function(t,k,v)
			vtbl[k]=v
		end
	})
	--print (comm_func.repr(getmetatable(class_type)))
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
end

base_type=class()		-- ����һ������ base_type
 
function base_type:ctor(x)	-- ���� base_type �Ĺ��캯��
	print("base_type ctor")
	self.x=x
end
 
function base_type:print_x()	-- ����һ����Ա���� base_type:print_x
	print(self.x)
end
 
function base_type:hello()	-- ������һ����Ա���� base_type:hello
	print("hello base_type")
	self.hello = self.hello
end

