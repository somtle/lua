--文本读表器
--xianwei 2013-12-11

local class = require "base.class"
local comm_func = require "common.comm_func"
local str_oper = require "common.str_oper"
local file_oper = require "common.file_oper"
local assert = assert
local table = table
local io = io
local tostring = tostring
local print = print
local ipairs = ipairs
local getmetatable = getmetatable

module("common.table_reader")

Record = class.Class(class.object)

function Record:Ator()
	self._fields_ = {}
	return self
end

function Record:read_data(content)
	c_tab = str_oper.str_split(content, "\t")	
	
	for i, info in ipairs(self._fields_) do 
		local field_name, field_type = info[1], info[2]
		if field_type ~= "string" then
			self[field_name] = comm_func.eval(c_tab[i])
		else
			self[field_name] = c_tab[i]
		end
		
	end
	return self
end

TableData = class.Class(class.object)

function TableData:Ator(file_path, file_name, class_type, key_tab)
	self._data_, self.key_index = {}, {}
	local file = file_oper.path_join(file_path, file_name)
	local handle = io.open(file,"r")
	local star = false
	local start_line, cur_line = 1, 0
	for line_content in handle:lines() do
		if not start then
			if str_oper.star_with(line_content, "#============") then
				start = true
			end
		elseif start_line < 2 then
			start_line = start_line + 1
		else
			cur_line = cur_line + 1
			line_content = str_oper.trim(line_content)
			if line_content ~= "" then
				new_obj = class_type.new()
				new_obj:read_data(line_content)
				table.insert(self._data_, new_obj)
				
				local tab = {}
				for index, key in ipairs(key_tab) do 
					value = new_obj[key]
					assert(value ~= nil)
					table.insert(tab, value)
				end
				self.key_index[comm_func.repr(tab)] = cur_line
				self:deal_line_data()
			end
			
		end
	end
	self:deal_file_data(handle)
	handle:close()
end

function TableData:deal_file_data(handle)
	--print (self)
	--给子类继承
end
function TableData:deal_line_data(data)
	--print (self)
	--给子类继承
end

function TableData:get_record_by_index(index)
	--获得指定行的数据
	return self._data_[index]
end

function TableData:get_record_by_key(...)
	--按照key查找记录
	local key_tab = {...}
	return self._data_[self.key_index[comm_func.repr(key_tab)]]
end

function TableData:get_count()
	return table.getn(self._data_)
end

function TableData:get_last_record()
	--获得最后一条记录
	return self:get_record_by_index(self:get_count())
end



