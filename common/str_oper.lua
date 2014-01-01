--�ַ���ͨ�ò���
--xianwei

local string = string
local type = type
local assert = assert
local print = print
local table = table

module("common.str_oper")

function trim (s) 
--[[ȥ��β�ո�]]--
  return (string.gsub(s, "^%s*(.-)%s*$", "%1")) 
end

function star_with(st, s)
	--[[�ַ�����ָ���ַ�����ͷ]]--
	assert(type(st) == "string", "args is not string type")
	res = string.find(st, string.format("^%s", s))
	if type(res) == "number" then
		return true
	end
	return false
end

function find(st, s)
	--����s�ַ����Ƿ���st����
	res = string.find(st, s)
	if res ~= nil then
		return true
	end
	return false
end

function end_with(st, s)
	--[[�ַ�����ָ���ַ�����β]]--
	assert(type(st) == "string", "args is not string type")
	res = string.find(st, string.format("%s$", s))
	if type(res) == "number" then
		return true
	end
	return false
end

function str_split(str, split_char)
--[[�ַ����ָ�]]--
	local sub_str_tab = {};
    local i = 0;
    local j = 0;
	local char_len = string.len(split_char)
    while true do
        j = string.find(str, split_char,i+1);    --��Ŀ�괮str��i+1���ַ���ʼ����ָ����
        if j == nil then
            table.insert(sub_str_tab,str);
            break;
        end;
        table.insert(sub_str_tab,string.sub(str,i+1,j-1));
		str = string.sub(str, j+char_len, #str)
    end
    return sub_str_tab;
end