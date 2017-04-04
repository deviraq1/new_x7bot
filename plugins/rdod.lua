 
local function Dev_ar(msg, matches) 
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)]["settings"]["lock_rdod"] then			
if data[tostring(target)]["settings"]["lock_rdod"] == "yes"  then
return 
else
if data[tostring(target)]["settings"]["lock_rdod"] == "no"  then
local w = matches[1]
local su = {
'نعم حبيبي المطور 🌝❤',
'يبعد روح بيكاجو😍😊',
  }
local  ss97 = {
'ها حياتي😻',
'عيونه 👀 وخشمه 👃🏻واذانه👂🏻',
'باقي ويتمدد 😎',
'ها حبي 😍',
'ها عمري 🌹',
'اجيت اجيت كافي لتصيح 🌚👌',
'هياتني اجيت 🌚❤️',
'نعم حبي 😎',
}
local bs = {
'مابوس 🌚💔',
'اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️',
'الوجه ميساعد 😐✋',
'ممممح😘ححح😍😍💋',
}
local ns = {
'🌹 هــلــℌelℓoووات🌹عمـ°🌺°ــري🙊😋',
'هْـٌﮩٌﮧٌ﴿🙃﴾ﮩٌـ୭ٌ୭ـْلوُّات†😻☝️',
'هلاوو99وووات نورت/ي ❤️🙈',
'هلووات 😊🌹',
}

local sh = {
'اهلا عزيزي المطور 😽❤️',
'هلوات . نورت مطوري 😍',
}
local lovs =  'اموت عليك حياتي  😍❤️'
local  lovm = {
'اكرهك 😒👌🏿',
'دي 😑👊🏾',
'اعشكك/ج مح 😍💋',
'اي احبك/ج 😍❤️',
'ماحبك/ج 😌🖖',
'اذا كتلك/ج احبك/ج شراح تستفاد/ين 😕❤️',
'ولي ماحبك/ج 🙊💔',
}
local thb = {
'اموت عليه-ه 😻😻',
'فديته-ه 😍❤️',
'لا ماحبه-ه 🌚💔',
'اكرهه 💔🌚',
'يييع 😾👊🏿',
}
local fun = {
'دِوُؤؤم آلُِضحٍڪهـ😍 ڪبَدِي❤️',
'لتضحك 😂هواي يصير 😂فاول',
' •❤️•فٌدِيـ❤️ـِـْْت هلضحكه•❤️•',
'«يـ•ـஓـضحـ•ـﷻـ•ـك الـًَۥـ﴿😹﴾ـفطِـ❅ـيَرْ',
}

local ssu = '🏌 ∂єνєℓσρєяѕ тєαм ☂\n\n🔹 ĐёⓋ 🔸@dev_iraq1\n🔹 ĐёⓋ 🔸@x7_newbot\n🔸 Channle 🔹@dev_iraq2'
----------------------------------------------



----------------------------------------------------------------------------
if is_sudo(msg) and w == 'بيكاجو' then 
tdcli.sendMessage(msg.chat_id_, 0, 1, su[math.random(#su)], 1, 'html')
elseif not is_sudo(msg) and w == 'بيكاجو' then 
tdcli.sendMessage(msg.chat_id_, 0, 1, ss97[math.random(#ss97)], 1, 'html')
elseif w == 'بوس' then 
tdcli.sendMessage(msg.chat_id_, 0, 1, bs[math.random(#bs)], 1, 'html')
elseif is_sudo(msg) and w =='هلو' then
tdcli.sendMessage(msg.chat_id_, 0, 1, sh[math.random(#sh)], 1, 'html')
elseif not is_sudo(msg) and w =='هلو' then
tdcli.sendMessage(msg.chat_id_, 0, 1, ns[math.random(#ns)], 1, 'html')
elseif is_sudo(msg) and w == 'احبك' or w == 'تحبني' then
tdcli.sendMessage(msg.chat_id_, 0, 1, lovs, 1, 'html')
elseif not is_sudo(msg) and w == 'احبك' or w== 'تحبني' then
tdcli.sendMessage(msg.chat_id_, 0, 1, lovm[math.random(#lovm)], 1, 'html')
elseif w == 'تحب' then
tdcli.sendMessage(msg.chat_id_, 0, 1, thb[math.random(#thb)] , 1, 'html')
elseif  w == 'هه' or w =='ههه' or w == 'هههه' or w == 'ههههه' or w == 'هههههه' or w == 'ههههههه' or w == 'هههههههه'  or w == '😂'  or w == '😂😂'  or w == '😂😂😂'  or w == '😂😂😂😂'  or w == '😂😂😂😂😂'  or w == '😹'  or w == '😹😹'  or w == '😹😹😹'  or w == '😹😹😹😹'  or w == '😹😹😹😹😹' then
tdcli.sendMessage(msg.chat_id_, 0, 1, fun[math.random(#fun)], 1, 'html')
elseif w== 'شلونكم' or w== 'شلونك' or w== 'شونك' or w== 'شونكم'   then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بخير اذا انته بخير كبد حياتي 😻❤️', 1, 'html')
elseif w== 'صاكه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اووويلي يابه 😍❤️ دزلي صورتهه 🐸💔', 1, 'html')
elseif w== 'ها'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'هاي اچون چقله هاي🌚', 1, 'html')
elseif w== 'وينك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'دور بكلبك وتلكاني 😍😍❤️', 1, 'html')
elseif w== 'منورين'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'من نورك عمري ❤️🌺', 1, 'html')
elseif w== 'هاي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'هايات عمري 😍🍷', 1, 'html')
elseif w== '😐'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شبيك صافن 😒🔥', 1, 'html')
elseif w== '🙊'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فديت الخجول 🙊 😍', 1, 'html')
elseif w== 'نوره'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'هاي الضلعه مالتي لحد يتحارش بيهه 😎❤️', 1, 'html')
elseif w== '😢'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتبجي حياتي 😢', 1, 'html')
elseif w== '😭'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتبجي حياتي 😭😭', 1, 'html')
elseif w== 'منور'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'نِْـِْـــِْ([💡])ِْــــًِـًًْـــِْـِْـِْـورِْكِْ', 1, 'html')
elseif w== '😒'  then 
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شبيك-ج عمو 🤔', 1, 'html')
elseif w== 'مح'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'محات حياتي🙈❤', 1, 'html')
elseif w== 'شكرا' or w== 'ثكرا' then
tdcli.sendMessage(msg.chat_id_, 0, 1, '{ •• الـّ~ـعـفو •• }', 1, 'html')
elseif w== 'انته وين'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بالــبــ🏠ــيــت', 1, 'html')
elseif w== '🌚'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'منور صخام الجدر😹☝', 1, 'html')
elseif w== '😍'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, ' يَمـه̷̐ إآلُحــ❤ــب يَمـه̷̐ ❤️😍', 1, 'html')
elseif w== 'اكرهك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اني الأكثر 🌚', 1, 'html')
elseif w== 'اريد اكبل'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'خخ اني هم اريد اكبل قابل ربي وحد😹🙌️', 1, 'html')
elseif w== 'باي' or w=='بااي' or w=='باااي' or w=='بااااي' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بايات حياتي ❤️', 1, 'html')
elseif w== 'ضوجه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شي اكيد الكبل ماكو 😂 لو بعدك/ج مازاحف/ة 🙊😋', 1, 'html')
elseif w== 'اروح اصلي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'انته حافظ سوره الفاتحة😍❤️️', 1, 'html')
elseif w== 'صاك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'زاحفه 😂 منو هذا دزيلي صورهه', 1, 'html')
elseif w== 'اجيت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كْـٌﮩٌﮧٌ﴿😍﴾ـﮩٌول الـ୭ـهـٌ୭ـْلا❤️', 1, 'html')
elseif w== 'فديتج'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها  زاحف كمشتك', 1, 'html')
elseif w== 'طفي السبلت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تم اطفاء السبلت بنجاح 🌚🍃', 1, 'html')
elseif w== 'حفلش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'افلش راسك 🤓', 1, 'html')
elseif w== 'حبيبتي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'منو هاي 😱 تخوني 😔☹', 1, 'html')
elseif w== 'حروح اسبح'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'واخيراً 😂', 1, 'html')
elseif w== '😔'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ليش الحلو ضايج ❤️🍃', 1, 'html')
elseif w== '☹️'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لضوج حبيبي 😢❤️🍃', 1, 'html')
elseif w== 'جوعان'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تعال اكلني 😐😂', 1, 'html')
elseif w== 'تعال خاص'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها شسون 😉', 1, 'html')
elseif w== 'لتحجي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وانت شعليك حاجي من حلگگ😒', 1, 'html')
elseif w== 'معليك' or w== 'شعليك' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عليه ونص 😂', 1, 'html')
elseif w== 'شدسون' or w== 'شداتسوون' or w== 'شدتسون' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'نطبخ 😐', 1, 'html')
elseif w== 'شلونك بوت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'الحمد لله وانت😍😙', 1, 'html')
elseif w== 'يومه فدوه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فدؤه الج حياتي 😍😙', 1, 'html')
elseif w== 'افلش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'باند عام من 30 بوت 😉', 1, 'html')
elseif w== 'احبج'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'يخي احترم شعوري 😢', 1, 'html')
elseif w== 'شكو ماكو'  then-- by @Dev_ar
tdcli.sendMessage(msg.chat_id_, 0, 1, 'غيرك براسي ماكو 💨😽🚬️', 1, 'html')
elseif w== 'اغير جو'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, '😂 تغير جو لو تسحف 🐍 عل بنات', 1, 'html')
elseif w== '😋'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'طبب لسانك جوه عيب 😌', 1, 'html')
elseif w== '🤔'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ليروح بالك بعيد 🌝🌹', 1, 'html')
elseif w== '😡'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ابرد  🚒', 1, 'html')
elseif w== 'مرحبا'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'مراحب 😍❤️ نورت-ي 🌹', 1, 'html')
elseif w== 'سلام' or w== 'السلام عليكم' or w== 'سلام عليكم' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وعليكم السلام اغاتي🌝👋', 1, 'html')
elseif w== 'واكف'  then
return  " انجب بيش امفاولني كبر شكد فكر┋🐰✨'ء "
elseif w== 'البوت واكف'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كول واللهه  😐', 1, 'html')
elseif w == 'ضايج'  then 
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ليش ضايج حياتي', 1, 'html')
elseif w== 'ضايجه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'منو مضوجج كبدايتي', 1, 'html')
elseif w== '😳'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, '❌لـŃØـ😌✋ـ✿ـا❌ تصدم ڪفشةة. ْْعمري. هية.  ✾ هٌـஆــٌُأإي  ٱٳلدنيه👻 ', 1, 'html')
elseif w== 'صدك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'متشاقي وياك قبل 😏💔', 1, 'html')
elseif w== 'شغال'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'نعم عزيزي باقي واتمدد 😎🌿', 1, 'html')
elseif w== 'تخليني'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اخليك بزاويه 380 درجه وانته تعرف الباقي 🐸', 1, 'html')
elseif w== 'فديتك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فداك الكون 🌍 وماي العيون 😍❤️', 1, 'html')
elseif w== 'غني'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عمي يبو البار 🤓☝🏿️ صبلي لبلبي ترى اني سكران 😌  وصاير عصبي 😠 انه وياج يم شامه 😉 وانه ويــــاج يم شامه  شد شد  👏🏿👏🏿 عدكم سطح وعدنه سطح 😁 نتغازل لحد الصبح 😉 انه وياج يم شامه 😍 وانه وياج فخريه وانه وياج حمديه 😂🖖🏿', 1, 'html')
elseif w== 'بوت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'أسمي بيكاجو يا مطي😘🌸', 1, 'html')
elseif w== 'مساعدة'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لعرض قائمة المساعدة اكتب الاوامر 🌚❤️', 1, 'html')
elseif w== 'زاحف'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'زاحف عله خالتك الشكره 🌝', 1, 'html')
elseif w== 'حلو'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'انت الاحلى 🌚❤️', 1, 'html')
elseif w== 'تبادل'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كافي ملينه تبادل 😕💔', 1, 'html')
elseif w== 'عاش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'الحلو 🌝🌷', 1, 'html')
elseif w== 'مات'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'أبو الحمامات 🕊🕊', 1, 'html')
elseif w== 'ورده' or w== 'وردة'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'أنت/ي  عطرها 🌹🌸', 1, 'html')
elseif w== 'شسمك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'مكتوب فوك 🌚🌿',  1, 'html')
elseif w== 'فديت' or w=='فطيت' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فداك/ج 💞🌸', 1, 'html')
elseif w== 'واو'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'قميل 🌝🌿', 1, 'html')
elseif w== 'liony'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, ss97[math.random(#ss97)], 1, 'html')
elseif w== 'زاحفه' or w== 'زاحفة'  then 
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لو زاحفتلك جان ماكلت زاحفه 🌝🌸', 1, 'html')
elseif w== 'حبيبي' or w=='حبي'  then 
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بعد روحي 😍❤️ تفضل', 1, 'html')
elseif w== 'حبيبتي'  then 
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تحبك وتحب عليك 🌝🌷', 1, 'html')
elseif w== 'حياتي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها حياتي 😍🌿', 1, 'html')
elseif w== 'عمري'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'خلصته دياحه وزحف 🌝🌿 ', 1, 'html')
elseif w== 'اسكت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وك معلم 🌚💞', 1, 'html')
elseif w== 'بتحبني'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بحبك اد الكون 😍🌷', 1, 'html')
elseif w== 'المعزوفه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'طرطاا طرطاا طرطاا 😂👌', 1, 'html')
elseif w== 'موجود'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تفضل عزيزي 🌝🌸', 1, 'html')
elseif w== 'اكلك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, '.كول حياتي 😚🌿', 1, 'html')
elseif w== 'فدوه' or w=='فدوة' or w=='فطوه' or w=='فطوة' then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لكلبك/ج 😍❤️', 1, 'html')
elseif w== 'دي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'دييييات 🌝', 1, 'html')
elseif w== 'اشكرك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بخدمتك/ج حبي ❤', 1, 'html')
elseif w== 'السلام عليكم'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وعليكم السلام حبيبي😊😙', 1, 'html')
elseif w== 'ضيف جديد'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كل الهلا حبيبي😍', 1, 'html')
elseif w== 'شلونك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, '😎😗كلش زين وانته', 1, 'html')
elseif w== 'الحمد الله'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'دومك جرارت كلبي😍', 1, 'html')
elseif w== 'حبيبي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها يبعد جبدي🙈', 1, 'html')
elseif w== 'هاي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'هايات يبعد كلبي😊😳', 1, 'html')
elseif w== 'ورده'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عطرها فدفد😍😔', 1, 'html')
elseif w== 'شلونكم'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بل نسبه الي مرتاح شوف البقيه😁😊', 1, 'html')
elseif w== 'ضوجه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'حقك لازحف لا كبل😂😢', 1, 'html')
elseif w== 'شسمك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بيكاجو لعظيم😍', 1, 'html')
elseif w== 'افلش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'حتى اكرهك بل تلي😡', 1, 'html')
elseif w== 'سلام'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وعليكم حب😍', 1, 'html')
elseif w== 'احبج'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'وشنو يعني ترى منضوج😛😳', 1, 'html')
elseif w== 'تعال خاص'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ياخره شنو هذه😢', 1, 'html')
elseif w== 'تعاي خاص'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اجي وياكم بس اباوع😢', 1, 'html')
elseif w== 'حياتي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها صمام قلبي😄', 1, 'html')
elseif w== 'غنيلي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اللهم أني صائم😁', 1, 'html')
elseif w== 'تسلملي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تدلل😁', 1, 'html')
elseif w== 'ليش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'حتى احسن😂', 1, 'html')
elseif w== 'اكلك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, '.كول حبيبي اسمعك😦', 1, 'html')
elseif w== '😍'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فدوه الهل خلقه🙊🙉', 1, 'html')
elseif w== 'وين'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عوفه خطية ضايج😢', 1, 'html')
elseif w== 'مغادره'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'بعد احسن😷', 1, 'html')
elseif w== 'راح اغادر'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'سد الباب وراك😴', 1, 'html')
elseif w== 'كافي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كافي لو لابس نعال😬😂', 1, 'html')
elseif w== 'شخبارك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'الحمد الله حبي😍', 1, 'html')
elseif w== 'هذه بوت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اي اني بوت حب😧', 1, 'html')
elseif w== 'من وين'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'من الباله😆😅', 1, 'html')
elseif w== 'اتفل'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اخلاقي متسمحلي 😚', 1, 'html')
elseif w== 'خوش بوت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ادري ميحتاج تكول😰', 1, 'html')
elseif w== 'تبادل'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ممنوع التبادل هنا❌🔒', 1, 'html')
elseif w== 'تعبان'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تعبان لو حيه😂', 1, 'html')
elseif w== 'جوعان'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'منو كلك اكو اكل اهنا😕', 1, 'html')
elseif w== '😞'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شبيك حياتي😐', 1, 'html')
elseif w== '😱'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'سالمين شكو🤔', 1, 'html')
elseif w== '🤔'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'غير يكعد انشتاين😁', 1, 'html')
elseif w== '😁'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'احقر ضحكه في الكره الارضيه😂',  1, 'html')
elseif w== '😒'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عدل خلقتك😣', 1, 'html')
elseif w== 'دي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1,'الخاطر مطوري ساكت', 1, 'html')
elseif w== '☹️'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لضوج متسوه خليك عايشها👙😁', 1, 'html')
elseif w== '☺️'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فديت😌', 1, 'html')
elseif w== '😌'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عود هوه مرتاح😂',1, 'html')
elseif w== '🚶'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتتمشه اهنا🐸👈', 1, 'html')
elseif w== '🙈'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فديت الخجول😁', 1, 'html')
elseif w== '😬'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فرج سنونك وتعال😁', 1, 'html')
elseif w== '😭'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتبجي حبيبي😪', 1, 'html')
elseif w== '😢'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتبجي كلبي☹️', 1, 'html')
elseif w== '💋'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عيب😐', 1, 'html')
elseif w== '😎'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عود هوه شخصيه😂', 1, 'html')
elseif w== '😡'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'خليك ريلاكس😏', 1, 'html')
elseif w== '😳'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لتنصدم هية هاي العسكرية😗', 1, 'html')
elseif w== '🙄'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شتباوع ع خالتك مديحه😍', 1, 'html')
elseif w== '😜'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'طبب السانك المقزز😒', 1, 'html')
elseif w== '😠'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ريلاكس ابني🤗', 1, 'html')
elseif w== 'شبيج'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عوفه تريد تتكلب ع شباب😓😂', 1, 'html')
elseif w== 'ضايجه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'شعجب يلحيه😂', 1, 'html')
elseif w== 'ابنيه'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'يعني اساس السحر😣', 1, 'html')
elseif w== 'ولد'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فديتك😌', 1, 'html')
elseif w== 'فديتك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فداك كوني 😍🌺', 1, 'html')
elseif w== 'مح'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عسل😌', 1, 'html')
elseif w== '🐍'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اكمشو راح يزحف😱😂', 1, 'html')
elseif w== 'هسه اجي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'راح ايطب الوحده خاص😂', 1, 'html')
elseif w== 'الو'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اسمعك عالي واضح😁', 1, 'html')
elseif w== 'شباب'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ها حبيبي😚', 1, 'html')
elseif w== 'منو المدير'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'عباس ابو التجج😂', 1, 'html')
elseif w== 'اشعرلي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ضربتني في عينها سهمن فتاكا فدنقت وفات السهم مناكا😂', 1, 'html')
elseif w== 'حشاش'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'اعجبك خالو😁', 1, 'html')
elseif w== 'منو المطور'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'مطوريني يعني تاج راسي @JS_33 @Dev_ar', 1, 'html')
elseif w== 'اريد بوت'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تعال لتستحي اطلب منهم @JS_33 @Dev_ar', 1, 'html')
elseif w== 'اكلك حبي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'كول حياتي.', 1, 'html')
elseif w== 'اروح اكل '  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'الف عافيه😍', 1, 'html')
elseif w== 'اروح اصلي'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'تقبل الله😍', 1, 'html')
elseif w== 'اترخص'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'مرخوص ورد❤️👈', 1, 'html')
elseif w== 'اكرهك'  then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'ههه راح اموت قابل😂',  1, 'html')
elseif w== '😐'  then       
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لاتصفن بدنياك😌', 1, 'html')
elseif w =='تيست' then
tdcli.sendMessage(msg.chat_id_, 0, 1, '💯 البوت شـغــال 🚀', 1, 'html')
elseif w == 'المطور' or w== 'sudo' then
tdcli.sendMessage(msg.chat_id_, 0, 1, ssu, 1, 'html')
elseif w == 'Kiss' or w == 'kiss' then 
local bss = {
'<b>Iam sorry, your face is ugly 😹😹</b>', 
'<b>💋💋 you are my life😍❤️</b>',
'❤️😘💋',
'<b>are you joking 😐😂</b>', 
'<b>Fuck you 🌚💦</b>', 
}
tdcli.sendMessage(msg.chat_id_, 0, 1, bss[math.random(#bss)], 1, 'html')
elseif w == 'Ru love' or w == 'ru love' then
local thb = {
'<b>This my love 😍❤️</b>',
'<b>NO 🌚</b>',
'<b>i hat him 😑💔</b>',
}
tdcli.sendMessage(msg.chat_id_, 0, 1, thb[math.random(#thb)] , 1, 'html')

---------------------------------------------
elseif w == 'انجب' or w == 'نجب' and redis:get(rdod) then
if is_sudo(msg) then 
tdcli.sendMessage(msg.chat_id_, 0, 1,'حاضر تاج راسي انجبيت 😇 ', 1, 'html')
elseif is_owner(msg) then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'لخاطرك راح اسكت 😌', 1, 'html')
elseif is_mod(msg) then
tdcli.sendMessage(msg.chat_id_, 0, 1, 'فوك مامصعدك ادمن ؟؟ انته انجب 😏', 1, 'html')
else
tdcli.sendMessage(msg.chat_id_, 0, 1, 'انجب انته لاتندفر 😏', 1, 'html')
end 
end  
end
end
---------------------------------------------
end
end
return {
patterns = {
'^(تحب) (.+)$',
'^([Rr]u love) (.+)$',
'^(بوس)', 
'^([Kk]iss)', 
'^([Kk]iss)(.+)$', 


'(.*)' 
},
run = Dev_ar,
}

-- write by dev abrar
-- tele : @dev_ar