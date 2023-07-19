local config = { 
	["avoid_injury"] = { 
		k="avoid_injury",
		value="30#5#4#0#0#3#20#0#0#15#16#16#18#15#15",
		notice="战士受怪物物理免伤#战士受怪物魔法免伤#战士受战士伤害降低#战士受法师伤害降低#战士受道士伤害降低#法师受怪物物理免伤#法师受怪物魔法免伤#法师受战士伤害降低#法师受法师伤害降低#法师受道士伤害降低#道士受怪物物理免伤#道士受怪物魔法免伤#道士受战士伤害降低#道士受法师伤害降低#道士受道士伤害降低",
	},
	["transaction_limit"] = { 
		k="transaction_limit",
		value="1#1000020#0|2#1000030#0|5#1000040#0|8#0#300001",
		notice="交易限制 开服天数下限#等级下限#转生等级下限",
	},
	["guaiwugongcheng"] = { 
		k="guaiwugongcheng",
		value="3#30",
		notice="怪物攻城活动地图#怪物刷新时间（秒）",
	},
	["guaiwugongcheng_1"] = { 
		k="guaiwugongcheng_1",
		value="296#335|160",
		notice="怪物攻城刷怪中心坐标以及区域大小",
	},
	["guaiwugongcheng_2"] = { 
		k="guaiwugongcheng_2",
		value="蝎子王|雪蚕王|蛤蟆王|电僵王|楔蛾王|暗之触龙神|半兽勇士9|邪恶钳虫2|红野猪3|黑野猪3|蝎蛇3|幻影蜘蛛|血金刚|带刀护卫|赤血恶魔|灰血恶魔|赤月恶魔1|暴牙蜘蛛|暴牙蜘蛛0|血僵尸",
		notice="怪物攻城怪物ID怪物id|怪物id",
	},
	["jinzhusancai"] = { 
		k="jinzhusancai",
		value="5|夕",
		notice="苍月岛宝箱活动地图|怪物id",
	},
	["union_shop_limit"] = { 
		k="union_shop_limit",
		value=300,
		notice="行会商店存储数量上限",
	},
	["union_shop_flsh"] = { 
		k="union_shop_flsh",
		value=0,
		notice="行会商店数量刷新时间（整点）",
	},
	["union_shop_announce"] = { 
		k="union_shop_announce",
		value="1#5|7#8",
		notice="行会商店出售和兑换公告条件 天数#品质下限|天数#品质下限",
	},
	["team_num"] = { 
		k="team_num",
		value=10,
		notice="组队人数上限",
	},
	["guild_updata"] = { 
		k="guild_updata",
		value="1#50#0|2#100#9999|3#150#99999",
		notice="行会等级#行会人数上限#需要行会建设度",
	},
	["gold_guildexp"] = { 
		k="gold_guildexp",
		value="1000#1|1000#10|1000000",
		notice="最低1000金币#可兑换1荣誉|最低1000金币#可兑换10行会建设度|每日捐献上限",
	},
	["announce"] = { 
		k="announce",
		value="欢迎加入本行会！",
		notice="默认公告",
	},
	["GUILD_EXIT_CD"] = { 
		k="GUILD_EXIT_CD",
		value=3600,
		notice="主动退出行会下次申请行会的CD时间（秒）",
	},
	["union_warehouse_time"] = { 
		k="union_warehouse_time",
		value="4#180&5#240&6#360&7#1720",
		notice="新加入行会使用行会仓库所需间隔时间（天#秒&天2#秒2.....）",
	},
	["Found_Faction"] = { 
		k="Found_Faction",
		value="118#1#17|1#1000000#27",
		notice="创建行会所需要消耗的道具#数量#商城id|创建行会所需要消耗的道具#数量#商城id",
	},
	["GUILD_limit"] = { 
		k="GUILD_limit",
		value="38|42|46|50|55",
		notice="限制条件ID|条件限制ID",
	},
	["consignments_shelves"] = { 
		k="consignments_shelves",
		value=8,
		notice="寄售行_普通寄售栏位",
	},
	["consignments_putaway_time"] = { 
		k="consignments_putaway_time",
		value=86400,
		notice="寄售行_上架时间（秒）",
	},
	["consignments_putaway_pay"] = { 
		k="consignments_putaway_pay",
		value=10000,
		notice="寄售行_上架费用 金币",
	},
	["consignments_putaway_need"] = { 
		k="consignments_putaway_need",
		value=100020,
		notice="寄售行_上架时条件",
	},
	["consignments_putaway_LEVEL"] = { 
		k="consignments_putaway_LEVEL",
		value=30,
		notice="寄售行_上架时角色等级限制",
	},
	["consignments_putaway_price_floor"] = { 
		k="consignments_putaway_price_floor",
		value="100#100000",
		notice="寄售行_上架时设置的下限和上限（元宝）",
	},
	["consignments_putaway_price_gold"] = { 
		k="consignments_putaway_price_gold",
		value="10000#100000000",
		notice="寄售行_上架时设置的下限和上限（金币）",
	},
	["consignments_service_charge"] = { 
		k="consignments_service_charge",
		value=10,
		notice="寄售行_售出后收取的手续费抽成（收取的手续费 = 售出的元宝 * 手续费抽成）向下取整（元宝）,金币的也是这个交易税，直接扣（百分比）",
	},
	["consignments_service_charge_floor"] = { 
		k="consignments_service_charge_floor",
		value=1,
		notice="寄售行_售出后收取的手续费抽成的下限（元宝）",
	},
	["consignments_service_charge_Upper"] = { 
		k="consignments_service_charge_Upper",
		value=99999999,
		notice="寄售行_售出后收取的手续费抽成的上限（元宝）",
	},
	["consignments_pay_need"] = { 
		k="consignments_pay_need",
		notice="寄售行_购买的条件",
	},
	["consignments_pay_Term"] = { 
		k="consignments_pay_Term",
		value="1#80#3;2#100#5;3#120#6;7#150#8;21#180#9",
		notice="寄售行_购买等级、转生限制；在不同的开服天数，购买所需的条件不同；（开服天数下限#等级下限#转生等级下限）（按从小到大天数依次填写，最大不能超过100）（与交易限制类似）",
	},
	["exp_max"] = { 
		k="exp_max",
		value=2000000000,
		notice="存储经验上限",
	},
	["auto_equip_quality"] = { 
		k="auto_equip_quality",
		value=3,
		notice="自动穿戴的装备品质(低于这个品质的都会自动穿戴，时间固定5秒)",
	},
	["warehouse_max_num"] = { 
		k="warehouse_max_num",
		value=144,
		notice="总仓库格子数(48为一页，这个基于面板固定)",
	},
	["warehouse_num"] = { 
		k="warehouse_num",
		value=24,
		notice="免费给玩家的仓库格子",
	},
	["warehouse_expansion"] = { 
		k="warehouse_expansion",
		value="279#1#8",
		notice="道具#数量#扩充的格子数",
	},
	["currency_shield"] = { 
		k="currency_shield",
		value="10|14",
		notice="前端屏蔽货币提示消耗",
	},
	["cangbaotufanwei"] = { 
		k="cangbaotufanwei",
		value=5,
		notice="挖宝范围",
	},
	["cangbaotu_item_Announce_1"] = { 
		k="cangbaotu_item_Announce_1",
		value="380|149#150",
		notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）直接拾取",
	},
	["cangbaotu_item_Announce_2"] = { 
		k="cangbaotu_item_Announce_2",
		value="381|1005302",
		notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）刷BOSS",
	},
	["cangbaotu_item_Announce_3"] = { 
		k="cangbaotu_item_Announce_3",
		value="382|1005302",
		notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）副本BOSS",
	},
	["cangbaotu_item_Announce_4"] = { 
		k="cangbaotu_item_Announce_4",
		value="383|1015730#1019730#1026730#1022730#1064730#1062730#1115730#1119730#1126730#1122730#1164730#1162730#1106730#1215730#1219730#1226730#1222730#1264730#1262730",
		notice="藏宝图挖到这些道具需要公告（公告id|道具id#道具id）古墓挖宝",
	},
	["cangbaotu_boss_position_1"] = { 
		k="cangbaotu_boss_position_1",
		value="14#15",
		notice="藏宝图地图进入坐标",
	},
	["cangbaotu_boss_position_2"] = { 
		k="cangbaotu_boss_position_2",
		value="14#15",
		notice="藏宝图副本刷怪坐标",
	},
	["cangbaotu_boss_position_3"] = { 
		k="cangbaotu_boss_position_3",
		value="11#11|14#11|17#11|11#14|14#14|17#14|11#17|14#17|17#17|11#20|14#20|17#20",
		notice="藏宝大秘籍宝箱坐标",
	},
	["cangbaotu_mapid"] = { 
		k="cangbaotu_mapid",
		value="0|3|11|4",
		notice="藏宝图随机地图id",
	},
	["cangbaotu_key"] = { 
		k="cangbaotu_key",
		value=30,
		notice="藏宝图钥匙快捷购买商城ID",
	},
	["cangbaotu_backroom_reward"] = { 
		k="cangbaotu_backroom_reward",
		value="248&10002#10002#10002#10002#10003#10003#10003#10003#10003#10004#10004#10005|249&10006#10006#10006#10006#10006#10007#10007#10007#10007#10007#10007#10008",
		notice="第一档藏宝图大秘境(藏宝图ID&boxid#boxid#boxid#boxid#boxid#boxid|藏宝图ID&boxid#boxid#boxid#boxid#boxid#boxid）",
	},
	["cangbaotu_caijitime"] = { 
		k="cangbaotu_caijitime",
		value=5,
		notice="宝箱采集时间",
	},
	["paihangbang_title_1"] = { 
		k="paihangbang_title_1",
		value="384|385|386",
		notice="玩家成为职业排行榜第一时的通告（战士|法师|道士）",
	},
	["level_max"] = { 
		k="level_max",
		value=200,
		notice="角色等级上限",
	},
	["Elite_Challenge_time"] = { 
		k="Elite_Challenge_time",
		value=3,
		notice="勇士试炼次数",
	},
	["Elite_DayChallenge_time"] = { 
		k="Elite_DayChallenge_time",
		value=3,
		notice="日常精英挑战次数",
	},
	["auto_task_time"] = { 
		k="auto_task_time",
		value=500,
		notice="自动进行任务的时间（单位：毫秒）",
	},
	["Elite_DayChallenge_consumption"] = { 
		k="Elite_DayChallenge_consumption",
		value=304,
		notice="刷新日常精英挑战任务消耗道具",
	},
	["chuanyin_item"] = { 
		k="chuanyin_item",
		value=302,
		notice="传音消耗道具",
	},
	["Elite_DayChallenge_Starprobability"] = { 
		k="Elite_DayChallenge_Starprobability",
		value="70#25#5",
		notice="不同星级日常精英挑战任务刷新几率",
	},
	["Maincity_limit"] = { 
		k="Maincity_limit",
		value="6#2300001|bsr03#2300002",
		notice="不同服务器阶段主城以及进入限制",
	},
	["zhuizongcost"] = { 
		k="zhuizongcost",
		value="321#1|3#2",
		notice="追踪仇人消耗：道具id#数量|货币id#数量",
	},
	["fridndnumberlimit"] = { 
		k="fridndnumberlimit",
		value=100,
		notice="好友数量上限",
	},
	["declareWar"] = { 
		k="declareWar",
		value="2#2#100000&4#2#200000&8#2#300000&12#2#500000",
		notice="宣战花费itemid#num",
	},
	["declareWar_time"] = { 
		k="declareWar_time",
		value="2#4#8#12",
		notice="宣战时长",
	},
	["alliance"] = { 
		k="alliance",
		value="1#2#20000&2#2#30000&6#2#50000&12#2#80000&24#2#100000",
		notice="结盟花费itemid#num",
	},
	["alliance_time"] = { 
		k="alliance_time",
		value="1#2#6#12#24",
		notice="结盟时长",
	},
	["noDigMonsters"] = { 
		k="noDigMonsters",
		value="1#2#3#9#10#11#12#13#14#15#16#17#18#19#20#21#22#23#24#25#26",
		notice="移动不提示挖肉图标的怪物ID",
	},
	["drug_tips"] = { 
		k="drug_tips",
		value="<普通红药：/FCOLOR=255><金创药(中量)/FCOLOR=251>\\<普通蓝药：/FCOLOR=255><魔法药(中量)/FCOLOR=251>\\<瞬回药：/FCOLOR=255><鬼药/FCOLOR=251>",
		notice="内挂药品备注",
	},
	["boxtexiao"] = { 
		k="boxtexiao",
		value="15#4531#4511#4512|16#4531#4513#4514|17#4532#4515#4516|18#4533#4517#4518|18#4530#4519#4520|",
		notice="宝箱特效",
	},
	["attackglobalCD"] = { 
		k="attackglobalCD",
		value=100,
		notice="普攻默认CD",
	},
	["magicglobalCD"] = { 
		k="magicglobalCD",
		value=1000,
		notice="魔法默认CD",
	},
	["HumanPaperback"] = { 
		k="HumanPaperback",
		value="6#32|7#31|8#33",
		notice="人物简装 (战士衣服#战士武器|法师衣服#法师武器|道士衣服#道士武器)",
	},
	["MonsterPaperback"] = { 
		k="MonsterPaperback",
		value=27,
		notice="怪物简装",
	},
	["BuiltinCD"] = { 
		k="BuiltinCD",
		value="5000#5000#2000#2000",
		notice="内挂吃药基础时间(普通红药CD#普通蓝药CD#瞬回药CD#回城卷CD)",
	},
	["buttonSmall"] = { 
		k="buttonSmall",
		value=3,
		notice="小退按钮等待时间(大于0有时间等待)",
	},
	["EXPcoordinate"] = { 
		k="EXPcoordinate",
		value="10#450|10#300|250#0|2000",
		notice="经验显示坐标(PC端X坐标#PC端Y坐标|移动端X坐标#移动端Y坐标|前景色#背景色|最低经验显示)",
	},
	["StallName"] = { 
		k="StallName",
		value="<$USERNAME>的摊位",
		notice="默认摆摊的名称",
	},
	["BackpackGuide"] = { 
		k="BackpackGuide",
		value="1#1#41|42|43|44",
		notice="背包装备佩戴按钮#背包道具分解按钮(0=关闭 1=开启)",
	},
	["Fashionfx"] = { 
		k="Fashionfx",
		value=1,
		notice="时装裸模(0默认开启 1关闭) 后期取消这个功能,做成自定义UI的临时使用目前",
	},
	["SuitCalcType"] = { 
		k="SuitCalcType",
		value=0,
		notice="0先属性点后百分 1先百分比后属性点",
	},
	["Hangxuan"] = { 
		k="Hangxuan",
		value=0,
		notice="行会宣战开关 0关闭 1开启",
	},
	["RankingList"] = { 
		k="RankingList",
		value="1#等级|2#战士|3#法师|4#道士",
		notice="排行榜显示 (排序#显示名称 1#等级|2#战士|3#法师|4#道士)",
	},
	["prompt"] = { 
		k="prompt",
		value="res/custom/public/btn_npcfh_04.png#5#1#0.6|res/custom/hl/hl_ui/icon_red_01.png#10#-7#1",
		notice="背包满物品如:(聚灵珠(大)提示红点(PC端#X坐标#Y坐标#缩放比例|移动端#X坐标#Y坐标#缩放比例)",
	},
	["Redtips"] = { 
		k="Redtips",
		value="res/custom/public/btn_npcfh_04.png|res/custom/hl/hl_ui/icon_red_01.png",
		notice="界面红点提示图片位置(PC端|移动端)",
	},
	["MiniMap"] = { 
		k="MiniMap",
		value="0#20#570#456",
		notice="X坐标#Y坐标#宽#高     (只针对移动端)",
	},
	["AbilityCalMode"] = { 
		k="AbilityCalMode",
		value=1,
		notice="老传奇属性模式=0 1=以前百分比叠加模式（2021年5月7号之前正式开区的GM，请设置成1，不然属性错乱，以后做版本的GM请用0以后慢慢的会取消掉这个功能统一走老传奇模式）",
	},
	["Team_assembled"] = { 
		k="Team_assembled",
		value=40100,
		notice="队伍召集",
	},
	["Heroqiehuan"] = { 
		k="Heroqiehuan",
		value="1#2#3",
		notice="1=战斗 2=跟随 3=休息 4=守护(最低配置三个状态)",
	},
	["Heroqiehuanmoshi"] = { 
		k="Heroqiehuanmoshi",
		value=0,
		notice="默认0拖屏模式 1=双击切换模式",
	},
	["itemSacle"] = { 
		k="itemSacle",
		value="1.3|1.0",
		notice="移动端道具Icon缩放（默认1.3）|PC端道具Icon缩放（默认1.0）",
	},
	["Heronuqitiao"] = { 
		k="Heronuqitiao",
		value=0,
		notice="默认0=圆形怒气条 1=竖形怒气条",
	},
	["Fashionexplicit"] = { 
		k="Fashionexplicit",
		value=0,
		notice="第一次登录时装外显是否自动勾选 0=不勾选 1=勾选",
	},
	["Monsterlevel"] = { 
		k="Monsterlevel",
		value=1,
		notice="内挂显示职业等级，是否显示怪物等级 0=不显示 1=显示",
	},
	["autousetimes"] = { 
		k="autousetimes",
		value=5,
		notice="自动穿戴倒计时时间设置,单位秒",
	},
	["Integratedfashion"] = { 
		k="Integratedfashion",
		value="1#1",
		notice="(斗笠#发型) 一体时装是否斗笠和发型  0默认显示 1=不显示",
	},
	["heroLoginBtnoffset"] = { 
		k="heroLoginBtnoffset",
		value=0,
		notice="英雄头像和召唤按钮都在左边，刘海屏幕是否按钮一起偏移 1=一起偏移 0=不偏移",
	},
	["staticSacle"] = { 
		k="staticSacle",
		value="1.0|1.0",
		notice="剑甲内观缩放（移动段默认1.44，PC端1.0）  移动端|PC端",
	},
	["OpenAuctionByP"] = { 
		k="OpenAuctionByP",
		value=1,
		notice="关闭PC端拍卖行呼出快捷键P 1=关闭",
	},
	["SuitCalType"] = { 
		k="SuitCalType",
		value=0,
		notice="套装(0=老套装模式 1=新套装模式)",
	},
	["NoBJSkillID"] = { 
		k="NoBJSkillID",
		value=22,
		notice="技能禁止暴击 多个技能#分割 (技能ID#技能ID#技能ID)",
	},
	["NewKfDay"] = { 
		k="NewKfDay",
		value=1,
		notice="常量开服天数<$KFDAY> 0=按运行24小时为一天    1=开服时间自然日天计算",
	},
	["setTipsFontSizeVspace"] = { 
		k="setTipsFontSizeVspace",
		value="18#2|20#3",
		notice="配置TIPS的名称、备注的字体大小和上下行间隔   格式: 移动端字体大小#间隔|PC端字体大小#间隔  例子：18#2|20#3 默认为空白",
	},
	["ItemLock"] = { 
		k="ItemLock",
		value=2,
		notice="是否显示锁图标 0=背包  1=所有的 2=不显示",
	},
	["minimap_title_range"] = { 
		k="minimap_title_range",
		value=60,
		notice="右上方小地图显示地图备注名字根据玩家自身位置距离显示，文字显示坐标配置(cfg_mapdesc.xls)",
	},
	["itemGroundSacle"] = { 
		k="itemGroundSacle",
		value=1,
		notice="掉落物缩放比例",
	},
	["PickupTime"] = { 
		k="PickupTime",
		value=1000,
		notice="捡物间隔(单位: 毫秒) 默认1000",
	},
	["zhanguxianshi"] = { 
		k="zhanguxianshi",
		value="18&100001-19&100010",
		notice='时装内观部位显示条件  \\"-\\" 分隔符可以配置多个检测  \\"&\\"  分隔符， 第一个是部位   第二个是条件（例子：\\"18&100001-19&100010\\"  部位18(时装武器)角色等级满足1级才能显示在时装内观    部位19(时装斗笠)角色等级满足10级才能显示）',
	},
	["missionControl"] = { 
		k="missionControl",
		value=1,
		notice="值为1时 任务栏那块有脚本用addbutton加的内容时会自动隐藏原本任务 没有则显示",
	},
	["AbilInfoEx"] = { 
		k="AbilInfoEx",
		value=" # |绑定元宝#<$MONEY(绑定元宝)>|元宝#<$MONEY(元宝)>|金币#<$MONEY(金币)>|火龙币#<$MONEY(火龙币)>",
		notice="属性栏自定义标题 每行标题用|分割,支持变量",
	},
	["newSetup"] = { 
		k="newSetup",
		value=1,
		notice="新内挂配置开启",
	},
}
return config
