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
	--[[执行语句]]--
	assert(type(str) == "string", "can not exec not string type")
	return loadstring(str)()
end

function get_cur_os()
	--获得当前的操作系统
	return os.getenv("OS")
end

function is_windows()
	--判断当前是否是windows系统
	local cur_os = get_cur_os()
	local res = string.find(cur_os, "NT")
	if res ~= nil then
		return true
	end
	return false
end

function eval(str, tab) 
	--[[执行带参数语句
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
	--[[ 按照字符串输出
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
