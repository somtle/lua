--字符串通用操作
--xianwei

local string = string
local type = type
local assert = assert
local print = print
local table = table

module("common.str_oper")

function trim (s) 
--[[去处尾空格]]--
  return (string.gsub(s, "^%s*(.-)%s*$", "%1")) 
end

function star_with(st, s)
	--[[字符串以指定字符串开头]]--
	assert(type(st) == "string", "args is not string type")
	res = string.find(st, string.format("^%s", s))
	if type(res) == "number" then
		return true
	end
	return false
end

function find(st, s)
	--查找s字符串是否在st当中
	res = string.find(st, s)
	if res ~= nil then
		return true
	end
	return false
end

function end_with(st, s)
	--[[字符串以指定字符串结尾]]--
	assert(type(st) == "string", "args is not string type")
	res = string.find(st, string.format("%s$", s))
	if type(res) == "number" then
		return true
	end
	return false
end

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