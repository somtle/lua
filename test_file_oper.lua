local str_oper = require "common.str_oper"
local comm_func = require "common.comm_func"
local class = require "base.class"
local table_reader = require "common.table_reader"

local file_path = "D:\\jg\\server\\data\\items"
local file_name = "item_shop_setting.txt"

start = false

function read_file(file_path, name)
	--[[¶ÁÎÄ¼þ]]--
	file_name = file_path..'\\'..name
	handle = io.open(file_name,"rb")
	for line in handle:lines() do
		if not start then
			if str_oper.star_with(line, "#============") then
				start = true
			end
		end
		if start then
			line = str_oper.trim(line)
			tab = str_oper.str_split(line, "\t")
			tab_str = comm_func.repr(tab)
			--print (tostring(tab_str))
		end
	end
	handle:close()
	
end

--[[handle = io.open("D:\\1.txt","rb")
handle2 = io.open("D:\\2.txt","wb")
data = handle:read(200)
handle2:write(data)
handle2:close()
handle:close()]]--



--read_file(file_path, file_name)

st = "#============"
res = str_oper.star_with(st, "#")
res1 = str_oper.end_with(st, "=")
print (res, res1)
print (string.gsub(st, "^%s*(.-)%s*$", "%1"))

--[[info = {"xianwei", "hah"}
local a, b = info[1], info[2]
print (a, b)

tab = {["hehe"] = 1, ["haha"] = 2}
print (tab.hehe, tab.haha)]]--
--[[print ("hah:", string.find("xianwei", "an"))
print(os.getenv("USERDOMAIN"))
print(os.getenv("SystemRoot"))
print(os.getenv("Os2LibPath"))
print(os.getenv("ProgramFiles" ))
print(os.getenv("APPDATA" ))
print(os.getenv("ALLUSERSPROFILE" ))
print(os.getenv("CommonProgramFiles" ))
print(os.getenv("COMPUTERNAME" ))
print(os.getenv("USERNAME"))
print(os.getenv("USERPROFILE" ))
print(os.getenv("ComSpec"))
print(os.getenv("LOGONSERVER" ))
print(os.getenv("NUMBER_OF_PROCESSORS" ))
print(os.getenv("OS"))
print(os.getenv("PATHEXT" ))
print(os.getenv("PROCESSOR_ARCHITECTURE" ))
print(os.getenv("PROCESSOR_IDENTIFIER" ))
print(os.getenv("PROCESSOR_LEVEL" ))
print(os.getenv("PROCESSOR_REVISION" ))
print(os.getenv("USERDOMAIN"))
print(os.getenv("SystemRoot" ))
print(os.getenv("TEMP"))]]--

local Data = class.Class(table_reader.Record)
function Data:Ator()
	self._fields_ = {
		{"skill_effect_id", "int"},
		{"rate", "int"}
	}
end
local file_path = "D:\\jg\\server\\data\\new_fight"
local file_name = "skill_effect.txt"
obj = table_reader.TableData.new(file_path, file_name, Data, {"skill_effect_id"})
print(comm_func.repr(getmetatable(obj:get_last_record())))
print (comm_func.repr(obj:get_last_record()))
print ((comm_func.repr(obj:get_record_by_index(1))))
print (comm_func.repr(obj:get_record_by_key(2)))
print (obj:get_record_by_key(2).skill_effect_id)
print (obj:get_count())
print (comm_func.repr(getmetatable(obj)))


