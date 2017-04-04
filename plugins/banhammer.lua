local function pre_process(msg)
chat = msg.chat_id_
user = msg.sender_user_id_
	local function check_newmember(arg, data)
		test = load_data(_config.moderation.data)
		lock_bots = test[arg.chat_id]['settings']['lock_bots']

    if data.type_.ID == "UserTypeBot" then
      if not is_owner(arg.msg) and lock_bots == 'yes' then
kick_user(data.id_, arg.chat_id)
end
end
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_banned(data.id_, arg.chat_id) then
tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور من المجموعة  ❱_", 0, "md")
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then

tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور عام  ❱_", 0, "md")
   
kick_user(data.id_, arg.chat_id)
     end
	end
	if msg.adduser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
	if msg.joinuser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
if is_silent_user(user, chat) then
del_msg(msg.chat_id_, msg.id_)
end
if is_banned(user, chat) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
if is_gbanned(user) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
end
local function action_by_reply(arg, data)
  local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
if data.sender_user_id_ then
  if cmd == "حظر" then
local function ban_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
         
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور من المجموعة  ❱_", 0, "md")
      
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم حظره من المجموعة ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
   if cmd == "فتح الحظر" then
local function unban_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then

return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير محظور ❱_", 0, "md")
      
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم فتح الحظر ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "كتم" then
local function silent_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك كتم المشرفين والادمنية ❱*", 0, "md")
       
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ مكتوم سابقاً ❱_", 0, "md")
     
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم الكتم ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "فتح الكتم" then
local function unsilent_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير مكتوم ❱_", 0, "md")
      
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم ازالة الكتم ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "حظر عام" then
local function gban_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
        
     end
if is_gbanned(data.id_) then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور عام ❱_", 0, "md")
      
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم حظره عام ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "فتح عام" then
local function ungban_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير محظور عام ❱_", 0, "md")
      
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم فتح الحظر العام ❱ ✔️_", 0, "md")
   
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "بلوك" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*❗️❰ لا يمكنك طرد المشرفين والادمنية ❱*", 0, "md")
   
  else
     kick_user(data.sender_user_id_, data.chat_id_)
     end
  end
  if cmd == "مسح الكل" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*❗️❰ لا يمكنك حذف رسائل المشرفين ❱*", 0, "md")
   
  else
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسائل المستخدم*|*[ "..data.sender_user_id_.." ]*\n *❕❰ تم مسحها ❱ ✔️*", 0, "md")
       
    end
  end
else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*❗️❰ لم يتم العثور على المستخدم  ❱*", 0, "md")
      
   end
end
local function action_by_username(arg, data)
  local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
  if cmd == "حظر" then
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
         
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور ❱_", 0, "md")

   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم الحظر ❱ ✔️_", 0, "md")
   
end
   if cmd == "فتح الحظر" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير محظور ❱_", 0, "md")
      
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم فتح الحظر ❱ ✔️_", 0, "md")
   
end
  if cmd == "كتم" then
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك كتم المشرفين والادمنية ❱*", 0, "md")
       
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ مكتوم ❱_", 0, "md")
     
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم الكتم ❱ ✔️_", 0, "md")
   
end
  if cmd == "فتح الكتم" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير مكتوم ❱_", 0, "md")
      
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم ازالة الكتم ❱ ✔️_", 0, "md")
   
end
  if cmd == "حظر عام" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
        
     end
if is_gbanned(data.id_) then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ محظور عام ❱_", 0, "md")
      
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم حظره عام ❱ ✔️_", 0, "md")
   
end
  if cmd == "فتح عام" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❗️❰ غير محظور عام ❱_", 0, "md")
      
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم فتح العام ❱ ✔️_", 0, "md")
   
end
  if cmd == "بلوك" then
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك طرد المشرفين والادمنية ❱*", 0, "md")
   
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "مسح الكل" then
   if is_mod1(arg.chat_id, data.id_) then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*❗️❰ لا يمكنك حذف رسائل المشرفين ❱*", 0, "md")
   
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
return tdcli.sendMessage(arg.chat_id, "", 0, "_المعرف_|"..user_name.."\n_الايدي_| *[ "..data.id_.." ]*\n_❕❰ تم مسح جميع الرسائل ❱ ✔️_", 0, "md")
       
    end
  end
else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_❗️❰ لم يتم العثور على المستخدم ❱_", 0, "md")
      
   end
end
local function run(msg, matches)
local data = load_data(_config.moderation.data)
chat = msg.chat_id_
user = msg.sender_user_id_
 if matches[1] == "بلوك" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="بلوك"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
     tdcli.sendMessage(msg.chat_id_, "", 0, "*❗️❰ لا يمكنك طرد المشرفين والادمنية ❱*", 0, "md")
         
     else
kick_user(matches[2], msg.chat_id_)
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="بلوك"})
         end
      end
 if matches[1] == "مسح الكل" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="مسح الكل"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*❗️❰ لا يمكنك حذف رسائل المشرفين ❱*", 0, "md")
   
     else
tdcli.deleteMessagesFromUser(msg.chat_id_, matches[2], dl_cb, nil)
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*رسائل المستخدم* *[ "..matches[2].." ]*\n *❕❰ تم مسحها ❱ ✔️*", 0, "md")
         
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="مسح الكل"})
         end
      end
 if matches[1] == "حظر عام" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="حظر عام"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(matches[2]) then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
        
     end
   if is_gbanned(matches[2]) then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ محظور عام ❱*", 0, "md")
        
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰  تم حظره عام  ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="حظر عام"})
      end
   end
 if matches[1] == "فتح عام" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="فتح عام"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ غير محظور عام ❱*", 0, "md")
        
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰ تم فتح العام ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="فتح عام"})
      end
   end
 if matches[1] == "حظر" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="حظر"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "*❗️❰ لا يمكنك حظر المشرفين والادمنية ❱*", 0, "md")
        
     end
   if is_banned(matches[2], msg.chat_id_) then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ محظور ❱*", 0, "md")
        
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰ تم حظره ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
     tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="حظر"})
      end
   end
 if matches[1] == "فتح الحظر" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="فتح الحظر"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.chat_id_) then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ غير محظور ❱*", 0, "md")
        
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰  تم فتح الحظر ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="فتح الحظر"})
      end
   end
 if matches[1] == "كتم" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="كتم"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*❗️❰ لا يمكنك كتم المشرفين والادمنية ❱*", 0, "md")
        
     end
   if is_silent_user(matches[2], chat) then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ مكتوم ❱*", 0, "md")
        
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰ تم الكتم ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="كتم"})
      end
   end
 if matches[1] == "فتح الكتم" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="فتح الكتم"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     return tdcli.sendMessage(msg.chat_id_, "", 0, "*المستخدم "..matches[2].."\n ❗️❰ غير مكتوم ❱*", 0, "md")
        
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*المستخدم "..matches[2].."\n ❕❰ تم ازالة الكتم ❱ ✔️*", 0, "md")
      
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="فتح الكتم"})
      end
   end
		if matches[1]:lower() == 'مسح' and is_owner(msg) then
			if matches[2] == 'bans' then
				if next(data[tostring(chat)]['banned']) == nil then
					return "*❗️❰ لا يوجد محظورين  ❱*"
              
				end
				for k,v in pairs(data[tostring(chat)]['banned']) do
					data[tostring(chat)]['banned'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "*❕❰ تم ازالة الحظر عن الكل في هذه المجموعة ❱ ✔️*"
           
			end
			if matches[2] == 'قائمة الكتم' then
				if next(data[tostring(chat)]['is_silent_users']) == nil then
					return "*❗️❰ لا يوجد مكتومين  ❱*"
             
				end
				for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
					data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				    end
				return "*❕❰ تم مسح قائمة الكتم ❱ ✔️*"
               
			    end
        end
		if matches[1]:lower() == 'مسح' and is_sudo(msg) then
			if matches[2] == 'gbans' then
				if next(data['gban_users']) == nil then
					return "*❗️❰ لا يوجد محظورين عام ❱*"
             
				end
				for k,v in pairs(data['gban_users']) do
					data['gban_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				return "*❕❰ تم ازالة الحظر العام ❱ ✔️*"
          
			end
     end
if matches[1] == "قائمة العام" and is_admin(msg) then
  return gbanned_list(msg)
 end
if matches[1] == "قائمة الكتم" and is_mod(msg) then
  return silent_users_list(chat)
 end
if matches[1] == "قائمة الحظر" and is_mod(msg) then
  return banned_list(chat)
 end
end
return {
	patterns = {
"^(حظر عام)$",
"^(حظر عام) (.*)$",
"^(فتح عام)$",
"^(فتح عام) (.*)$",
"^(قائمة العام)$",
"^(حظر)$",
"^(حظر) (.*)$",
"^(فتح الحظر)$",
"^(فتح الحظر) (.*)$",
"^(قائمة الحظر)$",
"^(كتم)$",
"^(كتم) (.*)$",
"^(فتح الكتم)$",
"^(فتح الكتم) (.*)$",
"^(قائمة الكتم)$",
"^(بلوك)$",
"^(بلوك) (.*)$",
"^(مسح الكل)$",
"^(مسح الكل) (.*)$",
"^(مسح) (.*)$",

},
run = run,
pre_process = pre_process
}
