--xianwei ���ʵ��
--2013-12-19
local setmetatable = setmetatable
local getmetatable = getmetatable
local print = print
local ipairs = ipairs
local table = table
local comm_func = require "common.comm_func"

module("base.class")

local _class={}
 
function Class(...)
	local class_type={}
	
	--���캯��
	class_type.Ator=false
	
	--super��table
	class_type.super_tb = {...}

	--ʵ��obj�ĺ���
	class_type.new=function(...) 
			local obj={}
			
			--����Ҫ������ Ԫ���__index ,���ܵ��ö����Ator����, ������Ator�ڲ����������Ķ��������Ҳ���
			setmetatable(obj,{ __index=_class[class_type]})
			do
				local create_super
				create_super = function(c, ...)
					for k, v in ipairs(c.super_tb)do 
						if table.getn(v.super_tb) > 0 then
							create_super(v, ...)
						end
						if v.Ator then
							v.Ator(obj, ...)
						end
					end
					if c.Ator then
						c.Ator(obj, ...)
					end
				end
				create_super(class_type, ...)
			end
			
			return obj
		end
	local vtbl={}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=
		function(t,k,v)
			vtbl[k]=v
		end
	})
	if table.getn(class_type.super_tb) > 0 then
		setmetatable(vtbl,{__index=
				function(t,k)
					for index, super in ipairs(class_type.super_tb) do 
						local ret=_class[super][k]
						if ret ~= nil then
							vtbl[k]=ret
							return ret
						end
					end
					return nil
				end
		})
	end
	return class_type
end

object = Class()

