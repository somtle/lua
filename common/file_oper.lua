--文件操作
--xianwei 2013-12-12

local io = io
local print = print
local comm_func = require "common.comm_func"

module("common.file_oper")

--[[local Reader = class.Class(class.object)

function Reader.read_line(data)
	tb = comm_func.str_split(data, "\t")
	
end]]--

function read_file(file_path, name)
	--[[读文件]]--
	file_name = file_path..'\\'..name
	print (file_name)
	for line in io.lines(file_name) do 
		tab = comm_func.str_split(line, "\t")
		print ( comm_func.repr(tab))
	end
	
end