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

function str_split(str, split_char)
--[[字符串分割]]--
	local sub_str_tab = {};
    local i = 0;
    local j = 0;
	local char_len = string.len(split_char)
    while true do
        j = string.find(str, split_char,i+1);    --从目标串str第i+1个字符开始搜索指定串
        if j == nil then
            table.insert(sub_str_tab,str);
            break;
        end;
        table.insert(sub_str_tab,string.sub(str,i+1,j-1));
		str = string.sub(str, j+char_len, #str)
    end
    return sub_str_tab;
end

function exec(str)
	--[[执行语句]]--
	assert(type(str) == "string", "can not exec not string type")
	return loadstring(str)()
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

function get_metatable(tb)
	assert(type(tb) == "table", "args not table type")
	mt = getmetatable(tb)
	if not mt then
		return repr(tb) 
	else
		tb["metetable"] = get_metatable(mt)
		return tb
	end
	
end
