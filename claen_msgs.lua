
local function delmsg (arg,data) 
    for k,v in pairs(data.messages_) do 
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd) 
    end 
end 
local function danger(msg, matches) 
    local chat_id = msg.chat_id_ 
    local msg_id = msg.id_ 
    if matches[1] == 'مسح' then 
        if tostring(chat_id):match("^-1000") then 
            if is_owner(msg) then 
                if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then 
                    return  'استـخدم مـن 1 الى 1000 فقـط❗️' 
                else 
                    tdcli.getChatHistory(chat_id, msg_id, 0, tonumber(matches[2]), delmsg, nil) 
                    return 'رسـالة❗️『*'..matches[2]..'*』 تـم حــذف' 
                end 
            end 
        else 
            return "فقـط فـي المجـموعات الخـارقة 🕹️" 
        end 
    end 
end 

return { 
    patterns = { 
        '^(مسح) (%d*)$', 
    }, 
    run = danger 
} 