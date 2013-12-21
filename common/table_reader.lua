--ÎÄ±¾¶Á±íÆ÷
--xianwei 2013-12-11

local class = require "base.class"
local comm_func = require "common.comm_func"

module(common.table_reader)

local TableReader = class.Class(class.object)

function TableReader.read_table(file_path, name)
	file_name = file_path..'\\'..name
	for line in io.lines(file_name) do 
		line = comm_func.trim(line)
		tab = comm_func.str_split(line, "\t")
		print (comm_func.repr(tab))
	end
	
end



