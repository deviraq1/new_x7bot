local function Dev_ar(msg, matches)
local data = load_data(_config.moderation.data)
if  not is_sudo(msg) and not is_owner(msg) and not is_mod(msg)  then
if data[tostring(msg.chat_id_)]['settings']['lock_tafia'] == "yes" then    
return del_msg(msg.chat_id_, tonumber(msg.id_))
end
end

end
return {
patterns = {
"^(سني)",
"^(شيعي)",
"^(مسيحي)",
"^(صابئي)",
"^(توحيدي)",
"^(يهودي)",
"^(هندوسي)",
"^(بوذي)",
  },
  run = Dev_ar
}
-- by @Dev_ar 
-- The serious :)