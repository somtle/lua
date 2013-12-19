--ÎÄ±¾¶Á±íÆ÷
--xianwei 2013-12-11

local class = require "base.class"
local comm_func = require "common.comm_func"

module(common.table_reader)

local Reader = class.Class(class.object)

function Reader.read_line(data)
	tb = comm_func.str_split(data, "\t")
	
end



