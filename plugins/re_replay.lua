

local function Dev_ar(msg, matches) 
  

if matches[1] == "كول" or matches[1]=="say"  or matches[1]=="Say" and (matches[2] ~= 0) then
local ss97 = matches[2]
tdcli.sendMessage(msg.chat_id_, 0, 1, [[<b>]]..ss97..[[</b>]], 1, 'html')


	 end
 end 
return { 
  patterns = { 
    "^(كول)(.*)$",
    "^([Ss]ay)(.*)$",

  }, 
  run = Dev_ar, 
} 

-- by @Dev_ar