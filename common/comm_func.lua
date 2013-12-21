--xianwei
--2013-12-11

local string = string
local assert = assert
local type = type 
local loadstring = loadstring
local print = print
local pairs = pairs
local tostring = tostring
local getmetatable = getmetatable
local table = table

module("common.comm_func")

function exec(str)
	--[[ִ�����]]--
	assert(type(str) == "string", "can not exec not string type")
	return loadstring(str)()
end

function eval(str, tab) 
	--[[ִ�д��������
		eg: eval("A+B", {['A']=1, ['B']=2}) = 3
	]]--
	local tab_str = str
	if tab then
		for key, value in pairs(tab) do 
			tab_str = string.gsub(tab_str, key, repr(value))
		end
	end
	local s = string.format("return %s", tab_str)
	return exec(s)
end

function repr(obj)
	--[[ �����ַ������
	]]--
	if type(obj) ~= "table" then
		return tostring(obj)
	end
	local tab = "{"
	for key, value in pairs(obj) do 
		tab = tab.."['"..repr(key).."']="..repr(value)..","
	end
	tab = tab.."}"
	return tab
end

function copy_tab(st)  
    local tab = {}  
    for k, v in pairs(st or {}) do  
        if type(v) ~= "table" then  
            tab[k] = v  
        else  
            tab[k] = copyTab(v)  
        end  
    end  
    return tab  
end  
