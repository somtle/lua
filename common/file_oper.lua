--文件操作
--xianwei 2013-12-12

local io = io
local print = print
local os = os
local string = string
local ipairs = ipairs

module("common.file_oper")

function _check_windows()
	local cur_os = os.getenv("OS")
	local res = string.find(cur_os, "NT")
	if res ~= nil then
		return true
	end
	return false
end
local _is_windows = _check_windows()

function path_join(file_dir, ...)
	--生成文件路径
	local file_path = file_dir
	if _is_windows then
		for key, value in ipairs({...}) do
			file_path = file_path.."\\"..value
		end
	else
		for key, value in ipairs({...}) do
			file_path = file_path.."//"..value
		end
	end
	return file_path
end