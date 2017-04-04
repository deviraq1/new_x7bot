local function dev_iraq1(msg, matches)
if matches[1] == "الاوامر" then
local text = "<i>✔️❰ الاوامر الرئيسيه ❱❕ </i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>❕ م1 ➥❰اوامر الرفع والحضر ❱</i>\n\n" 
text = text.."<i>❕ م2 ➥❰اوامر عرض حالة المجموعه ❱</i>\n\n" 
text = text.."<i>❕ م3 ➥❰اوامر حماية المجموعه ❱</i>\n\n" 
text = text.."<i>❕ م4 ➥❰اوامر التحكم بالميديا ❱</i>\n\n" 
text = text.."<i>❕ م5 ➥❰اوامر اضافيه للمجموعه ❱</i>\n\n" 
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if matches[1]== 'م1' and is_mod(msg) then
local text = "<i>✔️❰ اوامر الرفع والتنزيل ❱❕</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>❕ رفع  ➥</i>\n"
text = text.."<i>ادمن |مدير</i>\n\n"
text = text.."<i>❕تنزيل ➥</i>\n"
text = text.."<i> ادمن |عضو</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>✔️❰ اوامر الطرد والحضر ❱❕</i>\n\n"
text = text.."<i>بلوك | حظر | كتم</i>\n\n"
text = text.."<i>💡فتح ➥</i>\n"
text = text.."<i>الحظر | الكتم</i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if matches[1]== 'م2' and is_mod(msg) then
local text = "<i>✔️❰ أوامر الوضع ❱❕</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>ضع + الامر  </i>\n"
text = text.."<i>❰ قوانين | وصف | رابط |اسم ❱</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>✔️❰ أوامر رؤية الاعدادات ❱❕</i>\n\n"
text = text.."<i>❰ القوانين| الوصف| الرابط ❱</i>\n\n"
text = text.."<i>❰ معلوماتي| الوسائط| الحمايه ❱</i>\n\n"
text = text.."<i>     ❰  الاداريين |  المدراء  ❱</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if matches[1]== 'م3'  and is_mod(msg)then
local text = "<i>【 اعـدادات المجـموعـه 】</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>【  استخدم الاوامر التالية    】</i>\n"
text = text.."<i>  【  قفل + الامر 】 للقفل </i>\n"
text = text.."<i> 【  فتح + الامر 】 للفتح </i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<b>【</b> <i>الـروابط</i> <b>】</b>\n"
text = text.."<b>【</b> <i>التـكرار</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الكـلايـش</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـتعديل</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـبوتات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الموقع</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـتــاك</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الــطـرد</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الأضــافة</i> <b>】</b>\n"
text = text.."<b>【</b> <i>السمايلات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـفـشار</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الطائفيه</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الــردود</i> <b>】</b>\n"
text = text.."<b>【</b> <i>التـرحيب</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الماركداون</i> <b>】</b>\n"
text = text.."<b>【</b> <i>اليوزر</i> <b>】</b>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if matches[1]== 'م4'  and is_mod(msg)then
local text = "【 <i>اعدادات الوسائط</i> 】\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>【  استخدم الاوامر التالية    】</i>\n"
text = text.."<i>  【  قفل + الامر 】 للقفل </i>\n"
text = text.."<i> 【  فتح + الامر 】 للفتح </i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<b>【</b> <i>الــكــل</i> <b>】</b>\n"
text = text.."<b>【</b> <i>المتحركه</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـدردشه</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الاونـلاين</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـلـعـب</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الــصـور</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـفيديو</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـصــوت</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـبصمات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الملصقات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـجهـات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>التـوجيه</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـمواقع</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الـملفات</i> <b>】</b>\n"
text = text.."<b>【</b> <i>الاشعارات</i> <b>】</b>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if matches[1]== 'م5'  and is_mod(msg)then
local text = "<i>✔️❰  اوامر اضافيه   ❱❕</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>✔️❰ معلوماتك الشخصيه  ❱❕</i>\n\n"
text = text.."<i>| اسمي | معرفي</i>\n"
text = text.."<i>| ايديي |رقمي</i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>✔️❰ اوامر التحشيش ❱❕</i>\n\n"
text = text.."<i>❕ بوس + ❰نص❱</i>\n"
text = text.."<i>❕ تحب + ❰نص❱</i>\n"
text = text.."<i>❕ كول+ ❰نص❱</i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

if is_sudo(msg) and matches[1]== "م المطور" then
local text = "<i>✔️❰  اوامر المطورين ❱❕</i>\n\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n\n"
text = text.."<i>| تفعيل | تعطيل | مغادرة</i>\n"
text = text.."<i>❕ رفع  ➥</i>\n"
text = text.."<i>ادمن |مدير | مسؤول | مطور</i>\n\n"
text = text.."<i>❕تنزيل ➥</i>\n"
text = text.."<i>عضو |ادمن | مسؤول | مطور</i>\n\n"
text = text.."<i>حظر | حظر عام | كتم</i>\n"
text = text.."<i>فتح الحظر | فتح العام |فتح الكتم</i>\n\n"
text = text.."<i>المطورين | المسؤولين | الاداريين | المدراء</i>\n"
text = text.."<i>🚀اذاعه➥❰لنشر كلمه❱ </i>\n"
text = text.."<i>🚀انشاء مجموعه➥❰لانشاء مجموعه❱ </i>\n"
text = text.."<i>🚀السوبر➥❰لجعل المجموعه خارقه❱</i>\n"
text = text.."<b>【  •┈•✦•۪۫•৩﴾ ❊ ﴿৩•۪۫•✦•┈•    】</b>\n"
text = text.."<b>【Đev</b> @dev_iraq1  <b>】</b>\n" 
text = text.."<b>【Đev</b> @x7_newbot  <b>】</b>\n" 
text = text.."<b>【CH</b> @dev_iraq2  <b>】</b>\n" 
return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
end

end
return {
description = "Help list", 
usage = "Help list",
patterns = {
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",
"^(م5)$",
"^(م المطور)$",
"^(الاوامر)$", 
},
run = dev_iraq1 
}

-- by @dev_iraq1