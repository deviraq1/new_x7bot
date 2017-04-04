local function modadd(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
     return '❗️❰ انت لست مطور البوت ❱' 
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.chat_id_)] then
return '❗️❰ المجموعة مفعلة ❱ ✔️'
  end

        -- create data array in moderation.json
      data[tostring(msg.chat_id_)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      settings = {
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes',
	   lock_warns = 'no',
	   lock_persian = 'no',
	   lock_english = 'no',
	   lock_mention = 'no',
	   lock_tgservice = 'no',
	    lock_strict = 'no',
           lock_memberd = 'no',
           lock_smiles = 'no',
           lock_bad_words = 'no',
           lock_tafia = 'no',
           lock_rdod = 'no',
           lock_welc = 'no',
           lock_warns = 'no',
	   
          },
   mutes = {
                  mute_fwd = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.chat_id_)] = msg.chat_id_
      save_data(_config.moderation.data, data)
  return '*❕❰ تم تفعيل المجموعة ❱ ✔️*'
end

local function modrem(msg)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
        return '❗️❰ انت لست مطور البوت ❱'
    end
   
    local data = load_data(_config.moderation.data)
    local receiver = msg.chat_id_
  if not data[tostring(msg.chat_id_)] then
    return '_❗️❰ المجموعة غير مفعلة ❱_'
   end
  

  data[tostring(msg.chat_id_)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.chat_id_)] = nil
      save_data(_config.moderation.data, data)
  return '_❕❰ تم تعطيل المجموعة ❱ ✔️_'
end

local function modlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
    return "_❗️❰ المجموعة غير مفعلة ❱_"
  end
 
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['mods']) == nil then --fix way
   return "❗️❰ لايوجد اداريين ❱"
  end

   message = '*  ❰ قائمة الأداريين ❱*\n'

  for k,v in pairs(data[tostring(msg.chat_id_)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
return "_❗️❰ المجموعة غير مفعلة ❱_"
  end

  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['owners']) == nil then --fix way
    return "❗️❰ لايوجد مدير ❱"
  end

   message = '*❰ قائمة المدراء ❱*\n'

  for k,v in pairs(data[tostring(msg.chat_id_)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
  if not administration[tostring(data.chat_id_)] then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_❗️❰ المجموعة غير مفعلة ❱_", 0, "md")
     end
  
if cmd == "رفع مدير" then
local function owner_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❗️❰ هو مدير بالفعل ❱*", 0, "md") 
      end
   
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❕❰ تم تعيين مديرالمجموعة ❱ ✔️*", 0, "md") 
   end

tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "رفع ادمن" then
local function promote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❗️❰ هو ادمن بالفعل ❱*", 0, "md") 
      end
   
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❕❰ تم رفع رتبتك ادمن  ❱ ✔️*", 0, "md") 
   end

tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "تنزيل عضو" then
local function rem_owner_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❗️❰ هو عضو بالفعل ❱*", 0, "md") 
      end
   
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❕❰ تم خفض الرتبة الى عضو  ❱ ✔️*", 0, "md") 
   end

tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "تنزيل ادمن" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❗️❰ هو ليس ادمن  ❱*", 0, "md") 
   end
  
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❕❰ تم خفض الرتبة الى عضو  ❱ ✔️*", 0, "md") 
   end

tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "ايدي" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
end

local function action_by_username(arg, data)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_❗️❰ المجموعة غير مفعلة ❱_", 0, "md")
     end
  
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if not arg.username then return false end
if cmd == "رفع مدير" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n*❗️❰ هو مدير بالفعل ❱*", 0, "md")
      end
   
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❕❰ تم تعيين مديرالمجموعة ❱ ✔️*", 0, "md") 
   end

  if cmd == "رفع ادمن" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❗️❰ هو ادمن بالفعل ❱*", 0, "md") 
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❕❰ تم رفع الرتبة ادمن ❱ ✔️*", 0, "md") 
   end

   if cmd == "تنزيل عضو" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❗️❰ هو عضو بالفعل ❱*", 0, "md")
      end
   
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❕❰ تم خفض الرتبة الى عضو  ❱ ✔️*", 0, "md")
   end

   if cmd == "تنزيل ادمن" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n *❗️❰ هو ليس ادمن  ❱*", 0, "md")
   end
  
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "* المعرف|* "..user_name.."\n *الايدي| "..data.id_.."*\n * ❕❰ تم خفض الرتبة ❱  ✔️*", 0, "md")
   end

   if cmd == "ايدي" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
     text = " Result for [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
      
   end
end

local function action_by_id(arg, data)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
    return tdcli.sendMessage(data.chat_id_, "", 0, "_❗️❰ المجموعة معطلة ❱_", 0, "md")
  end
if not tonumber(arg.user_id) then return false end
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "رفع مدير" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❗️❰ هو مدير بالفعل ❱*", 0, "md")
      end
   
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❕❰ تم تعيين مديرالمجموعة ❱ ✔️*", 0, "md")
   end

  if cmd == "رفع ادمن" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* * ❗️❰ هو ضمن الادمنية بالفعل ❱*", 0, "md")
      end
   
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❕❰ تم رفع الرتبة ادمن ❱ ✔️*", 0, "md")
   end

   if cmd == "تنزيل عضو" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❗️❰ هو ليس ادمن  ❱*", 0, "md")
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❕❰ تم خفض الرتبة الى عضو  ❱ ✔️*", 0, "md") 
   end

   if cmd == "تنزيل ادمن" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."* *❗️❰ هو ليس ادمن  ❱*", 0, "md") 
   end
  
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*المعرف|* "..user_name.."\n *🖲️| ID"..data.id_.."*\n *❕❰ تم خفض الرتبة ❱  ✔️*", 0, "md")
   end

    if cmd == "معلومات" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
username = '_لايوجد معرف_'
  end
       return tdcli.sendMessage(arg.chat_id, 0, 1, '【 معلومات عن  】 : [ '..data.id_..' ] :\n❰ المعرف ❱ : '..username..'\n❰ الأسم ❱ : '..data.first_name_, 1)
      end
   
 else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_خطـأ فـي اليـوزر_", 0, "md")
  end
end





---------------Lock Link-------------------
local function lock_link(msg, data, target)
local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
 return "❗️❰ الروابط مقفولة ❱"
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الروابط ❱ ✔️"
end
end
local function unlock_link(msg, data, target)
local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
return "❗️❰ الروابط مفتوحة ❱"
else 
data[tostring(target)]["settings"]["lock_link"] = "no" 
save_data(_config.moderation.data, data) 
return "❕❰ تم فتح الروابط ❱ ✔️"
end
end



---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
 return "❗️❰ التاك مقفول ❱"
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل التاك ❱ ✔️"
end
end


local function unlock_tag(msg, data, target)
local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
return "❗️❰ التاك مفتوح ❱"
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح التاك ❱ ✔️"
end
end


---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
 return "❗️❰ اليوزر مقفول ❱"
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
 return "❕❰ تم قفل اليوزر ❱ ✔️"
end
end


local function unlock_mention(msg, data, target)
local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
return "❗️❰ اليوزر مفتوح ❱"
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح اليوزر ❱ ✔️"
end
end


---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
 return "❗️❰ التعديل مقفول ❱"
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل التعديل ❱ ✔️"
end
end


local function unlock_edit(msg, data, target)
local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
return "❗️❰ التعديل مفتوح ❱"
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح التعديل ❱ ✔️"
end
end


---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
 return "❗️❰ الكلايش مقفولة ❱"
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الكلايش ❱ ✔️"
end
end


local function unlock_spam(msg, data, target)
local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
 return "❗️❰ الكلايش مفتوحة ❱"
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
 return "❕❰ تم فتح الكلايش ❱ ✔️"
end
end


---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
 return "❗️❰ التكرار مقفول ❱"
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل التكرار ❱ ✔️"
end
end

local function unlock_flood(msg, data, target)
local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
return "❗️❰ التكرار مفتوح ❱"
else 
data[tostring(target)]["settings"]["flood"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح التكرار ❱ ✔️"
end
end


---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
 return "❗️❰ البوتات مقفولة ❱"
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل البوتات ❱ ✔️"
end
end


local function unlock_bots(msg, data, target)
local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
return "❗️❰ البوتات مفتوحة ❱"
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح البوتات ❱ ✔️"
end
end


---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
 return "❗️❰ الماركداون مقفول ❱"
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الماركداون ❱ ✔️"
end
end


local function unlock_markdown(msg, data, target)
local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
return "❗️❰ الماركداون مفتوح ❱"
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الماركداون ❱ ✔️"
end
end


---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
 return "❗️❰ الويب مقفول ❱"

else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الويب ❱ ✔️"
end
end


local function unlock_webpage(msg, data, target)
local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
return "❗️❰ الويب مفتوح ❱"
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الويب ❱ ✔️"
end
end
----------------------------------
---------------lock_english-------------------

local function lock_english(msg, data, target)
  local lock_english = data[tostring(target)]["settings"]["lock_english"]
  if lock_english == "yes" then
    return  "❗️❰ الانكليزيه مقفولة ❱"
else
    data[tostring(target)]["settings"]["lock_english"] = "yes"
    save_data(_config.moderation.data, data)
    return  "❕❰ تم قفل الانكليزيه ❱ ✔️"
  end
end
local function unlock_english(msg, data, target)
  local lock_english = data[tostring(target)]["settings"]["lock_english"]
  if lock_english == "no" then
    return  "❗️❰ الانكليزيه مفتوحة ❱"
  else
    data[tostring(target)]["settings"]["lock_english"] = "no"
    save_data(_config.moderation.data, data)
    return  "❕❰ تم فتح الانكليزيه ❱ ✔️"
  end
end

---------------lock_arabic-------------------
local function lock_arabic(msg, data, target)
  local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
  if lock_arabic == "yes" then
    return "❗️❰ العربيه مقفولة ❱" 
else
    data[tostring(target)]["settings"]["lock_persian"] = "yes"
    save_data(_config.moderation.data, data)
    return "❕❰ تم قفل العربيه ❱ ✔️"
  end
end
local function unlock_arabic (msg, data, target)
  local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
  if lock_arabic == "no" then
    return "❗️❰ العربيه مفتوحة ❱" 
  else
    data[tostring(target)]["settings"]["lock_persian"] = "no"
    save_data(_config.moderation.data, data)
    return "❕❰ تم فتح العربيه ❱ ✔️"
  end
end

---------------lock_memberd-------------------
local function lock_memberd(msg, data, target)
  local lock_memberd = data[tostring(target)]["settings"]["lock_memberd"]
  if lock_memberd == "yes" then
    return "❗️❰ الاضافة مقفولة ❱" 	
  else
    data[tostring(target)]["settings"]["lock_memberd"] = "yes"
    save_data(_config.moderation.data, data)
      return "❕❰ تم قفل الأضافة ❱ ✔️" 	  
  end
end
local function unlock_memberd (msg, data, target)
  local lock_memberd = data[tostring(target)]["settings"]["lock_memberd"]
  if lock_memberd == "no" then
    return "❗️❰ الاضافة مفتوحة ❱" 
  else
    data[tostring(target)]["settings"]["lock_memberd"] = "no"
    save_data(_config.moderation.data, data)
      return "❕❰ تم فتح الأضافة ❱ ✔️" 	
  end
end

---------------lock_strict-------------------
local function lock_strict(msg, data, target)
  local lock_strict = data[tostring(target)]["settings"]["lock_strict"]
  if lock_strict == "yes" then
    return "❗️❰ الطرد مفعل ❱" 	
  else
    data[tostring(target)]["settings"]["lock_strict"] = "yes"
    save_data(_config.moderation.data, data)
    return "❕❰ تم تفعيل الطرد ❱ ✔️" 		
  end
end
local function unlock_strict (msg, data, target)
  local lock_strict = data[tostring(target)]["settings"]["lock_strict"]
  if lock_strict == "no" then
    return "❗️❰ الطرد معطل ❱" 	
  else
    data[tostring(target)]["settings"]["lock_strict"] = "no"
save_data(_config.moderation.data, data)
    return "❕❰ تم تعطيل الطرد ❱ ✔️" 	
  end
end

---------------lock_rdod-------------------
local function lock_rdod(msg, data, target)
  local lock_rdod = data[tostring(target)]["settings"]["lock_rdod"]
  if lock_rdod == "yes" then
    return   "❗️❰ الردود مقفولة ❱"	  			
  else
    data[tostring(target)]["settings"]["lock_rdod"] = "yes"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم قفل الردود ❱ ✔️"					
  end
end
local function unlock_rdod (msg, data, target)
  local lock_rdod = data[tostring(target)]["settings"]["lock_rdod"]
  if lock_rdod == "no" then
    return   "❗️❰ الردود مفتوحة ❱"
  else
    data[tostring(target)]["settings"]["lock_rdod"] = "no"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم فتح الردود ❱ ✔️"	
  end
end

---------------lock_smiles-------------------
local function lock_smiles (msg, data, target)
  local lock_smiles = data[tostring(target)]["settings"]["lock_smiles"]
  if lock_smiles == "yes" then
    return   "❗️❰ السمايلات مقفولة ❱" 	
  else
    data[tostring(target)]["settings"]["lock_smiles"] = "yes"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم قفل السمايلات ❱ ✔️"	  
  end
end
local function unlock_smiles (msg, data, target)
  local lock_smiles = data[tostring(target)]["settings"]["lock_smiles"]
  if lock_smiles == "no" then
    return   "❗️❰ السمايلات مفتوحة ❱" 	
  else
    data[tostring(target)]["settings"]["lock_smiles"] = "no"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم فتح السمايلات ❱ ✔️"	
  end
end

---------------lock_badwords-------------------
local function lock_badwords  (msg, data, target)
  local lock_badwords = data[tostring(target)]["settings"]["lock_badwords"]
  if lock_badwords == "yes" then
    return   "❗️❰ الفشار مقفول ❱"	 	
  else
    data[tostring(target)]["settings"]["lock_badwords"] = "yes"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم قفل الفشار ❱ ✔️"  	
  end
end
local function unlock_badwords (msg, data, target)
  local lock_badwords = data[tostring(target)]["settings"]["lock_badwords"]
  if lock_badwords == "no" then
    return   "❗️❰ الفشار مفتوح ❱"	
  else
    data[tostring(target)]["settings"]["lock_badwords"] = "no"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم فتح الفشار ❱ ✔️"  
  end
end

---------------lock_tafia-------------------
local function lock_tafia  (msg, data, target)
  local lock_tafia = data[tostring(target)]["settings"]["lock_tafia"]
  if lock_tafia == "yes" then
    return   "❗️❰ الطائفيه مقفولة ❱" 	
  else
    data[tostring(target)]["settings"]["lock_tafia"] = "yes"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم قفل الطائفيه ❱ ✔️" 	
  end
end
local function unlock_tafia (msg, data, target)
  local lock_tafia = data[tostring(target)]["settings"]["lock_tafia"]
  if lock_tafia == "no" then
    return   "❗️❰ الطائفيه مفتوحة ❱" 	
  else
    data[tostring(target)]["settings"]["lock_tafia"] = "no"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم فتح الطائفيه ❱ ✔️" 
  end
end


---------------lock_welc-------------------
local function lock_welc  (msg, data, target)
  local lock_welc = data[tostring(target)]["settings"]["lock_welc"]
  if lock_welc == "yes" then
    return   "❗️❰ الترحيب معطل ❱"    	
  else
    data[tostring(target)]["settings"]["lock_welc"] = "yes"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم تعطيل الترحيب ❱ ✔️"    	
  end
end
local function unlock_welc (msg, data, target)
  local lock_welc = data[tostring(target)]["settings"]["lock_welc"]
  if lock_welc == "no" then
  return   "❗️❰ الترحيب فعال ❱"    
  else
    data[tostring(target)]["settings"]["lock_welc"] = "no"
    save_data(_config.moderation.data, data)
    return   "❕❰ تم تفعيل الترحيب ❱ ✔️"    	
  end
end
----------------------
----------------------------------

function group_settings(msg, target) 	
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_strict"] then			
data[tostring(target)]["settings"]["lock_strict"] = "no"	
	
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_memberd"] then			
data[tostring(target)]["settings"]["lock_memberd"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_smiles"] then			
data[tostring(target)]["settings"]["lock_smiles"] = "no"		

end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_badwords"] then			
data[tostring(target)]["settings"]["lock_badwords"] = "no"		

end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tafia"] then			
data[tostring(target)]["settings"]["lock_tafia"] = "no"		

end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_rdod"] then			
data[tostring(target)]["settings"]["lock_rdod"] = "no"		

end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_welc"] then			
data[tostring(target)]["settings"]["lock_welc"] = "no"		
end
end



local settings = data[tostring(target)]["settings"] 
text = "<i>   【 اعـدادات المجـموعـه 】   </i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>【 الـروابط 】 « </i><b>"..settings.lock_link.."</b>\n"
text = text.."<i>【 التـكرار 】 « </i><b>"..settings.flood.."</b>\n"
text = text.."<i>【 التـكرار 】 « </i><b>"..NUM_MSG_MAX.."</b>\n"
text = text.."<i>【 الكـلايـش 】 « </i><b>"..settings.lock_spam.."</b>\n"
text = text.."<i>【 الـمواقع 】 « </i><b>"..settings.lock_webpage.."</b>\n"
text = text.."<i>【 الـتــاك 】 « </i><b>"..settings.lock_tag.."</b>\n"
text = text.."<i>【 الـبوتات 】 « </i><b>"..settings.lock_bots.."</b>\n"
text = text.."<i>【 الـتعديل 】 « </i><b>"..settings.lock_edit.."</b>\n"
text = text.."<i>【 الــطـرد 】 « </i><b>"..settings.lock_strict.."</b>\n"
text = text.."<i>【 الأضــافة 】 « </i><b>"..settings.lock_memberd.."</b>\n"
text = text.."<i>【 السمايلات 】 « </i><b>"..settings.lock_smiles.."</b>\n"
text = text.."<i>【 الـفـشار 】 « </i><b>"..settings.lock_badwords.."</b>\n"
text = text.."<i>【 الطائفيه 】 « </i><b>"..settings.lock_tafia.."</b>\n"
text = text.."<i>【 الــردود 】 « </i><b>"..settings.lock_rdod.."</b>\n"
text = text.."<i>【 التـرحيب 】 « </i><b>"..settings.lock_welc.."</b>\n"
text = text.."<i>【 الماركداون 】 « </i><b>"..settings.lock_markdown.."</b>\n"
text = text.."<i>【 المـعرفـات 】 « </i><b>"..settings.lock_mention.."</b>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【 Dev 】 « </b> @dev_iraq1\n"
text = text.."<b>【 Dev 】 « </b> @x7_newbot\n"
text = text.."<b>【 CH 】 « </b> @dev_iraq2\n"

        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end



--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
return "❗️❰ جميع الاعدادات مقفولة ❱"
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
return "❕❰ تم قفل جميع الاعدادات ❱ ✔️"
end
end


local function unmute_all(msg, data, target) 
local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
return "❗️❰ جميع الاعدادات مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
return "❕❰ تم فتح جميع الاعدادات ❱ ✔️"
end 
end


---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
 return "❗️❰ المتحركه مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل المتحركه ❱ ✔️"
end
end


local function unmute_gif(msg, data, target)
local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
return "❗️❰ المتحركه مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح المتحركه ❱ ✔️"
end
end

---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
 return "❗️❰ اللعب مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل اللعب ❱ ✔️"
end
end


local function unmute_game(msg, data, target)
local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
return "❗️❰ اللعب مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
 return "❕❰ تم فتح اللعب ❱ ✔️"
end
end

---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
 return "❗️❰ الاونلاين مقفول ❱"
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الاونلاين ❱ ✔️"
end
end


local function unmute_inline(msg, data, target)
local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
return "❗️❰ الاونلاين مفتوح ❱"
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الاونلاين ❱ ✔️"
end
end

---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
 return "❗️❰ الدردشه مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الدردشه ❱ ✔️"
end
end


local function unmute_text(msg, data, target)
local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
return "❗️❰ الدردشه مفتوحة ❱" 
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الدردشه ❱ ✔️"
end
end

---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
 return "❗️❰ الصور مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الصور ❱ ✔️"
end
end


local function unmute_photo(msg, data, target)
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
return "❗️❰ الصور مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الصور ❱ ✔️"
end
end

---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
 return "❗️❰ الفيديو مقفول ❱"
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
 return "❕❰ تم قفل الفيديو ❱ ✔️"
end
end


local function unmute_video(msg, data, target)
local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
return "❗️❰ الفيديو مفتوح ❱"
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الفيديو ❱ ✔️"
end
end

---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
 return "❗️❰ الصوت مقفول ❱"
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
return "❕❰ تم قفل الصوت ❱ ✔️"
end
end


local function unmute_audio(msg, data, target)
local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
return "❗️❰ الصوت مفتوح ❱"
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
return "❕❰ تم فتح الصوت ❱ ✔️"
end
end

---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
 return "❗️❰ البصمات مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل البصمات ❱ ✔️"
end
end


local function unmute_voice(msg, data, target)
local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
return "❗️❰ البصمات مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
 return "❕❰ تم فتح البصمات ❱ ✔️"
end
end

---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
 return "❗️❰ الملصقات مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الملصقات ❱ ✔️"
end
end


local function unmute_sticker(msg, data, target)
local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
return "❗️❰ الملصقات مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
 return "❕❰ تم فتح الملصقات ❱ ✔️"
end 
end

---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
 return "❗️❰ الجهات مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الجهات ❱ ✔️"
end
end


local function unmute_contact(msg, data, target)
local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
return "❗️❰ الجهات مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
return "❕❰ تم فتح الجهات ❱ ✔️"
end
end

---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
 return "❗️❰ التوجيه مقفول ❱"
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل التوجيه ❱ ✔️"
end
end


local function unmute_forward(msg, data, target)
local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
return "❗️❰ التوجيه مفتوح ❱"
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
 return "❕❰ تم فتح التوجيه ❱ ✔️"
end
end

---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
 return "❗️❰ الموقع مقفول ❱"
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
 return "❕❰ تم قفل الموقع ❱ ✔️"
end
end


local function unmute_location(msg, data, target)
local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
return "❗️❰ الموقع مفتوح ❱"
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الموقع ❱ ✔️"
end
end

---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
 return "❗️❰ الملفات مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
 return "❕❰ تم قفل الملفات ❱ ✔️"
end
end


local function unmute_document(msg, data, target)
local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
return "❗️❰ الملفات مفتوحة ❱"
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
 return "❕❰ تم فتح الملفات ❱ ✔️"
 end
end

---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
 return "❗️❰ الاشعارات مقفولة ❱"
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
return "❕❰ تم قفل الاشعارات ❱ ✔️"
end
end


local function unmute_tgservice(msg, data, target)
local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
return "❗️❰ الاشعارات مفتوحة ❱" 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
return "❕❰ تم فتح الاشعارات ❱ ✔️"
end 
end

----------MuteList---------

local function mutes(msg, target) 	
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = "no"		
end
end

local mutes = data[tostring(target)]["mutes"] 
text = "<i>   【 اعدادات الوسائط 】   </i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>【 الــكــل 】 « </i><b>"..mutes.mute_all.."</b>\n"
text = text.."<i>【 المتحركه 】 « </i><b>"..mutes.mute_gif.."</b>\n"
text = text.."<i>【 الـدردشه 】 « </i><b>"..mutes.mute_text.."</b>\n"
text = text.."<i>【 الاونـلاين 】 « </i><b>"..mutes.mute_inline.."</b>\n"
text = text.."<i>【 الـلـعـب 】 « </i><b>"..mutes.mute_game.."</b>\n"
text = text.."<i>【 الــصـور 】 « </i><b>"..mutes.mute_photo.."</b>\n"
text = text.."<i>【 الـفيديو 】 « </i><b>"..mutes.mute_video.."</b>\n"
text = text.."<i>【 الـصــوت 】 « </i><b>"..mutes.mute_audio.."</b>\n"
text = text.."<i>【 الـبصمات 】 « </i><b>"..mutes.mute_voice.."</b>\n"
text = text.."<i>【 الملصقات 】 « </i><b>"..mutes.mute_sticker.."</b>\n"
text = text.."<i>【 الـجهـات 】 « </i><b>"..mutes.mute_contact.."</b>\n"
text = text.."<i>【 التـوجيه 】 « </i><b>"..mutes.mute_forward.."</b>\n"
text = text.."<i>【 الـمواقع 】 « </i><b>"..mutes.mute_location.."</b>\n"
text = text.."<i>【 الـملفات 】 « </i><b>"..mutes.mute_document.."</b>\n"
text = text.."<i>【 الاشعارات 】 « </i><b>"..mutes.mute_tgservice.."</b>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【 Dev 】 « </b> @dev_iraq1\n"
text = text.."<b>【 Dev 】 « </b> @x7_newbot\n"
text = text.."<b>【 CH 】 « </b> @dev_iraq2\n"

        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end


local function dev_ar(msg, matches)
    local data = load_data(_config.moderation.data)
   local chat = msg.chat_id_
   local user = msg.sender_user_id_
if matches[1] == "ايدي" then
if not matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
return "*ID ➠【"..user.."】\nID GP➠ 【"..chat.."】* " 
end

if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ايدي"})
  end
if matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ايدي"})
      end
   end
if matches[1] == "تثبيت" and is_owner(msg) then
tdcli.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
return "_❕❰ تم تثبيت الرسالة ❱ ✔️_"
end

if matches[1] == 'الغاء تثبيت' and is_mod(msg) then
tdcli.unpinChannelMessage(msg.chat_id_)
return "_❕❰ تم الغاء تثبيت الرسالة ❱ ✔️ _"
end

if matches[1] == "تفعيل" then
return modadd(msg)
end
if matches[1] == "تعطيل" then
return modrem(msg)
end
if matches[1] == "رفع مدير" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="رفع مدير"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="رفع مدير"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="رفع مدير"})
      end
   end
if matches[1] == "تنزيل عضو" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="تنزيل عضو"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="تنزيل عضو"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="تنزيل عضو"})
      end
   end
if matches[1] == "رفع ادمن" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="رفع ادمن"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="رفع ادمن"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="رفع ادمن"})
      end
   end
if matches[1] == "تنزيل ادمن" and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="تنزيل ادمن"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="تنزيل ادمن"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="تنزيل ادمن"})
      end
   end

if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الروابط" and is_mod(msg) then
return lock_link(msg, data, target)
end
if matches[2] == "التاك" and is_mod(msg) then
return lock_tag(msg, data, target)
end
if matches[2] == "اليوزر" and is_mod(msg) then
return lock_mention(msg, data, target)
end
if matches[2] == "التعديل" and is_mod(msg) then
return lock_edit(msg, data, target)
end
if matches[2] == "الكلايش" and is_mod(msg) then
return lock_spam(msg, data, target)
end
if matches[2] == "التكرار" and is_mod(msg) then
return lock_flood(msg, data, target)
end
if matches[2] == "البوتات" and is_mod(msg) then
return lock_bots(msg, data, target)
end
if matches[2] == "الماركداون" and is_mod(msg) then
return lock_markdown(msg, data, target)
end
if matches[2] == "الويب" and is_mod(msg) then
return lock_webpage(msg, data, target)
end
if matches[2] == "العربيه" and is_mod(msg) then
return lock_arabic(msg, data, target)
end
if matches[2] == "الانكليزيه" and is_mod(msg) then
return lock_english(msg, data, target)
end
if matches[2] == "الاضافة" and is_mod(msg) then
return lock_memberd(msg, data, target)
end
if matches[2] == "الترحيب" and is_mod(msg) then
return lock_welc(msg, data, target)
end
if matches[2] == "الطائفيه" and is_mod(msg) then
return lock_tafia(msg, data, target)
end
if matches[2] == "الفشار" and is_mod(msg) then
return lock_badwords(msg, data, target)
end
if matches[2] == "السمايلات" and is_mod(msg) then
return lock_smiles(msg, data, target)
end
if matches[2] == "الردود" and is_mod(msg) then
return lock_rdod(msg, data, target)
end
if matches[2] == "الردود" and is_mod(msg) then
return lock_strict(msg, data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الروابط" and is_mod(msg) then
return unlock_link(msg, data, target)
end
if matches[2] == "التاك" and is_mod(msg) then
return unlock_tag(msg, data, target)
end
if matches[2] == "العربيه" and is_mod(msg) then
return unlock_arabic(msg, data, target)
end
if matches[2] == "الانكليزيه" and is_mod(msg) then
return unlock_english(msg, data, target)
end
if matches[2] == "الاضافة" and is_mod(msg) then
return unlock_memberd(msg, data, target)
end
if matches[2] == "الترحيب" and is_mod(msg) then
return unlock_welc(msg, data, target)
end
if matches[2] == "الطائفيه" and is_mod(msg) then
return unlock_tafia(msg, data, target)
end
if matches[2] == "الفشار" and is_mod(msg) then
return unlock_badwords(msg, data, target)
end
if matches[2] == "السمايلات" and is_mod(msg) then
return unlock_smiles(msg, data, target)
end
if matches[2] == "الردود" and is_mod(msg) then
return unlock_rdod(msg, data, target)
end
if matches[2] == "الردود" and is_mod(msg) then
return unlock_strict(msg, data, target)
end
if matches[2] == "اليوزر" and is_mod(msg) then
return unlock_mention(msg, data, target)
end
if matches[2] == "التعديل" and is_mod(msg) then
return unlock_edit(msg, data, target)
end
if matches[2] == "الكلايش" and is_mod(msg) then
return unlock_spam(msg, data, target)
end
if matches[2] == "التكرار" and is_mod(msg) then
return unlock_flood(msg, data, target)
end
if matches[2] == "البوتات" and is_mod(msg) then
return unlock_bots(msg, data, target)
end
if matches[2] == "الماركداون" and is_mod(msg) then
return unlock_markdown(msg, data, target)
end
if matches[2] == "الويب" and is_mod(msg) then
return unlock_webpage(msg, data, target)
end
end
if matches[1] == "قفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الكل" and is_mod(msg) then
return mute_all(msg, data, target)
end
if matches[2] == "المتحركه" and is_mod(msg) then
return mute_gif(msg, data, target)
end
if matches[2] == "الدردشه" and is_mod(msg) then
return mute_text(msg ,data, target)
end
if matches[2] == "الصور" and is_mod(msg) then
return mute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" and is_mod(msg) then
return mute_video(msg ,data, target)
end
if matches[2] == "الصوت" and is_mod(msg) then
return mute_audio(msg ,data, target)
end
if matches[2] == "البصمات" and is_mod(msg) then
return mute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" and is_mod(msg) then
return mute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" and is_mod(msg) then
return mute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" and is_mod(msg) then
return mute_forward(msg ,data, target)
end
if matches[2] == "الموقع" and is_mod(msg) then
return mute_location(msg ,data, target)
end
if matches[2] == "الملفات" and is_mod(msg) then
return mute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" and is_mod(msg) then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "الاونلاين" and is_mod(msg) then
return mute_inline(msg ,data, target)
end
if matches[2] == "اللعب" and is_mod(msg) then
return mute_game(msg ,data, target)
end
end

if matches[1] == "فتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "الكل" and is_mod(msg) then
return unmute_all(msg, data, target)
end
if matches[2] == "المتحركه" and is_mod(msg) then
return unmute_gif(msg, data, target)
end
if matches[2] == "الدردشه" and is_mod(msg) then
return unmute_text(msg, data, target)
end
if matches[2] == "الصور" and is_mod(msg) then
return unmute_photo(msg ,data, target)
end
if matches[2] == "الفيديو" and is_mod(msg) then
return unmute_video(msg ,data, target)
end
if matches[2] == "الصوت" and is_mod(msg) then
return unmute_audio(msg ,data, target)
end
if matches[2] == "البصمات" and is_mod(msg) then
return unmute_voice(msg ,data, target)
end
if matches[2] == "الملصقات" and is_mod(msg) then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "الجهات" and is_mod(msg) then
return unmute_contact(msg ,data, target)
end
if matches[2] == "التوجيه" and is_mod(msg) then
return unmute_forward(msg ,data, target)
end
if matches[2] == "الموقع" and is_mod(msg) then
return unmute_location(msg ,data, target)
end
if matches[2] == "الملفات" and is_mod(msg) then
return unmute_document(msg ,data, target)
end
if matches[2] == "الاشعارات" and is_mod(msg) then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "الاونلاين" and is_mod(msg) then
return unmute_inline(msg ,data, target)
end
if matches[2] == "اللعب" and is_mod(msg) then
return unmute_game(msg ,data, target)
end
end
if matches[1] == "معلومات المجموعه" and is_mod(msg) and gp_type(msg.chat_id_) == "channel" then
local function group_info(arg, data)
ginfo = "*【 معلومات المجموعة 】*\n💡| عدد الادمنية :  *"..data.administrator_count_.."*\n💡| عدد الأعضاء : *"..data.member_count_.."*\n💡| عدد المطرودين : *"..data.kicked_count_.."*\n💡| الايدي : *"..data.channel_.id_.."*"
print(serpent.block(data))

        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.chat_id_, group_info, {chat_id=msg.chat_id_,msg_id=msg.id_})
end
		if matches[1] == 'ضع رابط' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
         return '❗️ ❰ ارسل رابط المجموعة الآن  ❱ '
       
		end

		if msg.content_.text_ then
   local is_link = msg.content_.text_:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.content_.text_:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.content_.text_
				save_data(_config.moderation.data, data)
           return "❕❰ تم حفظ الرابط ❱ ✔️"
		 	
       end
		end
    if matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
        return "❗️❰ ارسل【 ضع رابط 】 لوضع رابط جديد ❱"
      
      end
	 
      text = "<i>    【 رابط المجموعة 】      </i>\n\n".."【 "..linkgp.." 】"
         
        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
     end
  if matches[1] == "ضع قوانين" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
  return "❕❰ تم حفظ القوانين ❱ ✔️"
   
  end
  if matches[1] == "القوانين" then
 if not data[tostring(chat)]['rules'] then
       rules = "❗️❰ لايوجد قوانين ❱"
        else
     rules = "*      【 قوانين المجموعة  】*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="res"})
  end
if matches[1] == "معلومات" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="معلومات"})
  end
  if matches[1] == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 20 then
				return "_【ضع تكرار من】_ *[1-20]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "❕❰ تم تعيين التكرار ❱ الى : *[ "..matches[2].." ]*"
       end
		if matches[1]:lower() == 'مسح' and is_owner(msg) then
			if matches[2] == 'الاداريين' then
				if next(data[tostring(chat)]['mods']) == nil then
                return "❗️❰ لايوجد اداريين ❱"
				
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            return "❕❰ تم مسح الاداريين ❱ ✔️"
			
         end
			if matches[2] == 'القوانين' then
				if not data[tostring(chat)]['rules'] then
               return "❗️❰ لايوجد قوانين ❱"
             
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
            return "❕❰ تم مسح القوانين ❱ ✔️"
			
       end
			if matches[2] == 'الوصف' then
        if gp_type(chat) == "chat" then
				if not data[tostring(chat)]['about'] then
              return "❗️❰ لايوجد وصف ❱"
          
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
              return "❕❰ تم مسح الوصف ❱ ✔️"
             
		   	end
        end
		if matches[1]:lower() == 'مسح' and is_admin(msg) then
			if matches[2] == 'المدراء' then
				if next(data[tostring(chat)]['owners']) == nil then
                return "❗️❰ لايوجد مدراء ❱"
            
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            return "❕❰ تم مسح المدراء ❱ ✔️"
          
			end
     end
if matches[1] == "ضع اسم" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "ضع وصف" and matches[2] and is_mod(msg) then
     if gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif gp_type(chat) == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     return "❕❰ تم حفظ الوصف ❱ ✔️"
      end
  
  if matches[1] == "الوصف" and gp_type(chat) == "chat" then
 if not data[tostring(chat)]['about'] then
      about = "❗️❰ لايوجد وصف ❱"
       
        else
     about = "     * 【 وصف المجموعة  】*\n"..data[tostring(chat)]['about']
      end
    return about
  end
if matches[1] == "الحمايه" then
return group_settings(msg, target)
end
if matches[1] == "الوسائط" then
return mutes(msg, target)
end
if matches[1] == "الاداريين" then
return modlist(msg)
end
if matches[1] == "المدراء" and is_owner(msg) then
return ownerlist(msg)
end


--------------------- Welcome -----------------------
----------------------------------------
if matches[1] == 'ضع ترحيب' and matches[2] then
		welcome = check_markdown(matches[2])
		redis:hset('malik',msg.chat_id_,tostring(welcome))
tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_❕❰ تم حفظ الترحيب ❱ ✔️_ :\n\n'..matches[2], 1, 'md')
	
end
-----------------------------------------
if matches[1] == 'مسح الترحيب' then

		if not redis:hget('malik',msg.chat_id_) then
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_❗️❰ لايوجد ترحيب ❱', 1, 'md')
		else
			welcome = check_markdown(matches[2])
			redis:hdel('malik',msg.chat_id_)
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, ' ❕❰ تم *مسح* الترحيب ❱ ✔️', 1, 'md')
		end
	end
end

-----------------------------------------
local function pre_process(msg)
	if msg.content_.members_ then
		if redis:hget('malik',msg.chat_id_) then
			if msg.content_.members_[0] then
				name = msg.content_.members_[0].first_name_
				if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
					return nil
				else
					data = redis:hget('malik',msg.chat_id_)
					if data:match('{name}') then
						out = data:gsub('{name}',name)
					else
						out = data
					end
						tdcli.sendMessage(msg.chat_id_, msg.id_, 1, tostring(out:gsub('\\_','_')), 1, 'md')
				end
			end
		end
	end
end
return {
patterns ={
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(تثبيت)$",
"^(الغاء تثبيت)$",
"^(معلومات المجموعه)$",
"^(تفعيل)$",
"^(تعطيل)$",
"^(رفع مدير)$",
"^(رفع مدير) (.*)$",
"^(تنزيل عضو)$",
"^(تنزيل عضو) (.*)$",
"^(رفع ادمن)$",
"^(رفع ادمن) (.*)$",
"^(تنزيل ادمن)$",
"^(تنزيل ادمن) (.*)$",
"^(الاداريين)$",
"^(المدراء)$",
"^(قفل) (.*)$",
"^(فتح) (.*)$",
"^(الحمايه)$",
"^(الوسائط)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(القوانين)$",
"^(ضع قوانين) (.*)$",
"^(الوصف)$",
"^(ضع وصف) (.*)$",
"^(ضع اسم) (.*)$",
"^(مسح) (.*)$",
"^(ضع تكرار) (%d+)$",
"^[!/#](res) (.*)$",
"^(معلومات) (%d+)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^(ضع ترحيب) (.*)",
"^(مسح الترحيب)$"

},
run=dev_ar,
pre_process = pre_process
}
