local str_oper = require "common.str_oper"
local comm_func = require "common.comm_func"

file_path = "D:\\"
file_name = "item.txt"

start = false

function read_file(file_path, name)
	--[[¶ÁÎÄ¼þ]]--
	file_name = file_path..'\\'..name
	handle = io.open(file_name,"r")
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
			print (tostring(tab_str))
		end
	end
	handle:close()
	
end

--[[handle = io.open("D:\\1.txt","r")
st = handle:read()
print(st)]]--


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

