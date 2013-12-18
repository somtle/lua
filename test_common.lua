local comm_func = require "common.comm_func"

local a = {1, 2, ["xianwei"] = 3}
local tab_str = comm_func.repr(a)
print (tab_str)
tab = comm_func.eval(tab_str, {})
str = comm_func.repr(tab)
print (str)

local fight_rec = "A + B * C"
print (comm_func.eval(fight_rec, {["A"]=10, ["B"]=5, ["C"]=1}))