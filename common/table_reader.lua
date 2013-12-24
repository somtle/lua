--ÎÄ±¾¶Á±íÆ÷
--xianwei 2013-12-11

local class = require "base.class"
local comm_func = require "common.comm_func"
local str_oper = require "common.str_oper"
local assert = assert
local table = table

module(common.table_reader)

local Record = class.Class(class.object)

function Record:Ator()
	self._fields_ = {}
	return self
end

function Record:read_data(content)
	c_tab = str_oper.str_split(content, "\t")	
	
	assert(table.getn(c_tab) == table.getn(self._fields_), "content length not equal struct length")
	for i, info in pairs(self._fields_) do 
		local field_name, field_type = info[0], info[1]
		if field_type ~= "string" then
			self[field_name] = common_func.eval(c_tab[i])
		else
			self[field_name] = c_tab[i]
		end
		
	end
end

local TableData = class.class(class.object)

function TableData:Ator(file_path, class)
	
end

function TableData:read_table(


