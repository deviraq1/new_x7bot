local function Dev_ar(msg, matches)
function get_info(arg, data)
if data.first_name_ then
local telNum
if data.phone_number_ then
telNum = '+'..data.phone_number_
else
telNum = '<b>--------</b>'
end
local username
if data.username_ then
username = '@'..data.username_
else
username = '<b>--------</b>'
end
local Rank
if is_sudo(msg) then
Rank = '<i>Sudo</i>'
elseif is_owner(msg) then
Rank = '<i>Owner</i>'
elseif is_mod(msg) then
Rank = '<i>Moderator</i>'
else
Rank = '<i>Member</i>'
end
if matches[1] == 'موقعي' or matches[1]== 'me'or matches[1]== 'Me' then
local text = '<b>❰Your</b> <i>information❱</i>\n\n'
text=text..'<b>❰Name ❱ ➥</b> <i>'..data.first_name_..'</i>\n'
text=text..'<b>❰User   ❱ ➥</b> '..username..'\n'
text=text..'<b>❰ID       ❱ ➥</b> <i>'..data.id_..'</i>\n'
text=text..'<b>❰Num   ❱ ➥</b> '..telNum..'\n'
text=text..'<b>❰Rank  ❱ ➥</b> '..Rank..'\n'
text=text..'<b>❰GpID  ❱ ➥</b> <i>'..arg.chat_id..'</i>'
tdcli.sendMessage(arg.chat_id, 0, 1, text, 0, 'html')
end
 if matches[1] == 'My name' or matches[1]== 'my name' or matches[1]== 'اسمي' then
tdcli.sendMessage(msg.chat_id_, 0, 1, '<b>'..data.first_name_..'</b>', 1, 'html')
elseif matches[1]== 'My user' or matches[1]== 'my user'or matches[1]== 'معرفي' then
tdcli.sendMessage(msg.chat_id_, 0, 1, ''..username..'', 1, 'html')
elseif matches[1]== 'My id' or matches[1]== 'my id' or matches[1]== 'ايديي' then
tdcli.sendMessage(msg.chat_id_, 0, 1, '<b>'..data.id_..'</b>', 1, 'html')
elseif matches[1]== 'My num' or matches[1]== 'my num' or matches[1]== 'رقمي' then
tdcli.sendMessage(msg.chat_id_, 0, 1, ''..telNum..'\n', 1, 'html')
end	
end
end
  tdcli_function ({
    ID = "GetUser",
    user_id_ = msg.sender_user_id_,
    }, get_info, {chat_id=msg.chat_id_,user_id=msg.sender_user_id_})		
end
return {
patterns = {
"^([Mm]y name)$",
"^(اسمي)$",
"^([Mm]y user)$",
"^(معرفي)$",
"^([Mm]y num)$",
"^(رقمي)$",
"^([Mm]y id)$",
"^(ايديي)$",
"^(موقعي)$",
"^([Mm]e)$",
},
run = Dev_ar
}

--@Dev_ar