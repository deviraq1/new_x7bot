local function Dev_ar(msg, matches)
local function check_newmember(arg, data)
local data = load_data(_config.moderation.data)
if data[tostring(msg.chat_id_)]['settings']['lock_memberd'] == 'yes' then    
  if msg.adduser or msg.joinuser then	

return kick_user(data.id_, arg.chat_id)

end
end

end
end
return {
  patterns = {
'^(.*)$', 

  },
  run = Dev_ar
}