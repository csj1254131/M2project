local config = { 
	[11] = { 
		ID=11,
		name="魔法盾",
		front_sfx="49#49",
		front_sfx_stuck="50#50",
		no_skill=-2,
		icon=11,
		tips="降低受到的伤害",
		offsetGroup=1,
	},
	[12] = { 
		ID=12,
		name="强化魔法盾",
		front_sfx="149#149",
		front_sfx_stuck="150#150",
		no_skill=-2,
		icon=11,
		tips="降低受到的伤害",
		offsetGroup=1,
	},
	[5] = { 
		ID=5,
		name="麻痹",
		no_skill=-1,
		dis_action=7,
		icon=5,
		tips="无法移动，无法攻击",
		offsetGroup=1,
		bufftitle="你被麻痹了",
	},
	[0] = { 
		ID=0,
		name="绿毒",
		no_skill=-2,
		icon=1,
		tips="每秒受到一定的伤害",
		offsetGroup=1,
	},
	[1] = { 
		ID=1,
		name="红毒",
		no_skill=-2,
		icon=1,
		tips="降低一定防御能力",
		offsetGroup=1,
	},
	[8] = { 
		ID=8,
		name="隐身",
		no_skill=-2,
		icon=8,
		tips="不会被怪物发现，移动破除隐身状态",
		offsetGroup=1,
	},
	[9] = { 
		ID=9,
		name="神圣战甲术",
		no_skill=-2,
		icon=15,
		tips="提高防御能力",
		offsetGroup=1,
	},
	[10] = { 
		ID=10,
		name="幽灵盾",
		no_skill=-2,
		icon=14,
		tips="提高魔防能力",
		offsetGroup=1,
	},
	[6] = { 
		ID=6,
		name="无极真气",
		no_skill=-2,
		icon=11,
		tips="大幅度提高自身伤害",
		offsetGroup=1,
	},
	[7] = { 
		ID=7,
		name="护体神盾",
		no_skill=-2,
		icon=11,
		tips="提高格挡概率和格挡伤害",
		offsetGroup=1,
	},
	[13] = { 
		ID=13,
		name="禁锢",
		front_sfx="2950#2950",
		no_skill=-2,
		dis_action=2,
		icon=1113,
		tips="无法进行跑步操作",
		time="2#3000",
		group=0,
		Priority=1,
		overlap=0,
		uniqueType=25,
		replaceGroup=0,
		offsetGroup=1,
	},
	[14] = { 
		ID=14,
		name="蛛网",
		front_sfx="2951#2951",
		front_sfx_stuck="2951#2951",
		no_skill=-2,
		dis_action=2,
		replaceGroup=1,
	},
	[1113] = { 
		ID=1113,
		name="冰冻",
		no_skill=-1,
		dis_action=7,
		icon=5,
		tips="无法移动，无法攻击",
		offsetGroup=1,
	},
	[69] = { 
		ID=69,
		name="锁定",
		no_skill=-1,
		dis_action=31,
		tips="无法移动，无法攻击",
		offsetGroup=1,
	},
	[71] = { 
		ID=71,
		name="禁止攻击",
		no_skill=-1,
		tips="无法释放攻击",
		offsetGroup=1,
	},
	[21] = { 
		ID=21,
		name="雷霆剑法_BUFF",
		front_sfx="145#145",
		front_sfx_stuck="145#145",
		no_skill=-1,
		tips="雷霆剑法BUFF，目标变色",
		offsetGroup=1,
	},
	[9998] = { 
		ID=9998,
		name="野蛮冲撞",
		no_skill=-1,
	},
	[9999] = { 
		ID=9999,
		name="平滑移动",
		no_skill=-1,
	},
	[4200] = { 
		ID=4200,
		name="npc",
		front_sfx="4200#4200",
	},
	[4201] = { 
		ID=4201,
		name="npc",
		front_sfx="4201#4201",
	},
	[4202] = { 
		ID=4202,
		name="npc",
		front_sfx="4202#4202",
	},
	[4203] = { 
		ID=4203,
		name="npc",
		front_sfx="4203#4203",
	},
	[4204] = { 
		ID=4204,
		name="npc",
		front_sfx="4204#4204",
	},
	[4205] = { 
		ID=4205,
		name="npc",
		front_sfx="4205#4205",
	},
	[4206] = { 
		ID=4206,
		name="npc",
		front_sfx="4206#4206",
	},
	[4207] = { 
		ID=4207,
		name="npc",
		front_sfx="4207#4207",
	},
	[4208] = { 
		ID=4208,
		name="npc",
		front_sfx="4208#4208",
	},
	[4209] = { 
		ID=4209,
		name="npc",
		front_sfx="4209#4209",
	},
	[4210] = { 
		ID=4210,
		name="npc",
		front_sfx="4210#4210",
	},
	[4211] = { 
		ID=4211,
		name="npc",
		front_sfx="4211#4211",
	},
	[4212] = { 
		ID=4212,
		name="npc",
		front_sfx="4212#4212",
	},
	[4213] = { 
		ID=4213,
		name="npc",
		front_sfx="4213#4213",
	},
	[4214] = { 
		ID=4214,
		name="npc",
		front_sfx="4214#4214",
	},
	[4215] = { 
		ID=4215,
		name="npc",
		front_sfx="4215#4215",
	},
	[4216] = { 
		ID=4216,
		name="npc",
		front_sfx="4216#4216",
	},
	[4217] = { 
		ID=4217,
		name="npc",
		front_sfx="4217#4217",
	},
	[4218] = { 
		ID=4218,
		name="npc",
		front_sfx="4218#4218",
	},
	[4219] = { 
		ID=4219,
		name="npc",
		front_sfx="4219#4219",
	},
	[4220] = { 
		ID=4220,
		name="npc",
		front_sfx="4220#4220",
	},
	[4221] = { 
		ID=4221,
		name="npc",
		front_sfx="4221#4221",
	},
	[4222] = { 
		ID=4222,
		name="npc",
		front_sfx="4222#4222",
	},
	[4223] = { 
		ID=4223,
		name="npc",
		front_sfx="4223#4223",
	},
	[4224] = { 
		ID=4224,
		name="npc",
		front_sfx="4224#4224",
	},
	[4225] = { 
		ID=4225,
		name="npc",
		front_sfx="4225#4225",
	},
	[4226] = { 
		ID=4226,
		name="npc",
		front_sfx="4226#4226",
	},
	[4227] = { 
		ID=4227,
		name="npc",
		front_sfx="4227#4227",
	},
	[4228] = { 
		ID=4228,
		name="npc",
		front_sfx="4228#4228",
	},
	[4229] = { 
		ID=4229,
		name="npc",
		front_sfx="4229#4229",
	},
	[4230] = { 
		ID=4230,
		name="npc",
		front_sfx="4230#4230",
	},
	[1115] = { 
		ID=1115,
		name="光柱1",
		front_sfx="10086#10086",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1116] = { 
		ID=1116,
		name="光柱2",
		front_sfx="10087#10087",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1117] = { 
		ID=1117,
		name="粉色光柱",
		front_sfx="4542#4542",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1118] = { 
		ID=1118,
		name="金色光柱",
		front_sfx="4543#4543",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1119] = { 
		ID=1119,
		name="召唤符复活时间buff",
		no_skill=-2,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=1,
		offsetGroup=0,
	},
	[1120] = { 
		ID=1120,
		name="狂暴之力Ⅰ级",
		icon=1111,
		tips="沙巴克攻城期间，由行会会长/副会长开启。可获得额外血量上限加成",
		time="2#3600",
		group=1,
		Priority=3,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1121] = { 
		ID=1121,
		name="狂暴之力Ⅱ级",
		icon=1111,
		tips="沙巴克攻城期间，由行会会长/副会长开启。可获得额外血量上限加成",
		time="2#3600",
		group=1,
		Priority=3,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[1122] = { 
		ID=1122,
		name="狂暴之力Ⅲ级",
		icon=1111,
		tips="沙巴克攻城期间，由行会会长/副会长开启。可获得额外血量上限加成",
		time="2#3600",
		group=1,
		Priority=3,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[2006] = { 
		ID=2006,
		name="双倍修炼",
		no_item=527,
		icon=5,
		tips="拥有10倍经验点时，额外经验200%获得",
		time="2#7200",
		group=0,
		Priority=1,
		overlap=0,
		offsetGroup=1,
	},
	[2008] = { 
		ID=2008,
		name="摆摊BUFF",
		front_sfx="5005#5005",
		no_item=527,
		dis_action=-1,
		icon=5,
		tips="摆摊BUFF",
		time="2#7200",
		group=0,
		Priority=1,
		overlap=0,
		offsetGroup=1,
	},
	[50] = { 
		ID=50,
		name="凤天魔甲",
		front_sfx="5000#5000",
		no_item=527,
		dis_action=-1,
		icon=5,
		tips="摆摊BUFF",
		time="2#7200",
		group=0,
		Priority=1,
		overlap=0,
		offsetGroup=1,
	},
	[10000] = { 
		ID=10000,
		name="新光柱0",
		front_sfx="25000#25000",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10001] = { 
		ID=10001,
		name="新光柱1",
		front_sfx="25001#25001",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10002] = { 
		ID=10002,
		name="新光柱2",
		front_sfx="25002#25002",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10003] = { 
		ID=10003,
		name="新光柱3",
		front_sfx="25003#25003",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10004] = { 
		ID=10004,
		name="新光柱4",
		front_sfx="25004#25004",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10005] = { 
		ID=10005,
		name="新光柱5",
		front_sfx="25005#25005",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10006] = { 
		ID=10006,
		name="新光柱6",
		front_sfx="25006#25006",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10007] = { 
		ID=10007,
		name="新光柱7",
		front_sfx="25007#25007",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10008] = { 
		ID=10008,
		name="新光柱8",
		front_sfx="25008#25008",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10009] = { 
		ID=10009,
		name="新光柱9",
		front_sfx="25009#25009",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10010] = { 
		ID=10010,
		name="新光柱10",
		front_sfx="25010#25010",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10011] = { 
		ID=10011,
		name="新光柱11",
		front_sfx="25011#25011",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10012] = { 
		ID=10012,
		name="新光柱12",
		front_sfx="25012#25012",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10013] = { 
		ID=10013,
		name="新光柱13",
		front_sfx="25013#25013",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10014] = { 
		ID=10014,
		name="新光柱14",
		front_sfx="25014#25014",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10015] = { 
		ID=10015,
		name="新光柱15",
		front_sfx="25015#25015",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10016] = { 
		ID=10016,
		name="新光柱16",
		front_sfx="25016#25016",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10017] = { 
		ID=10017,
		name="新光柱17",
		front_sfx="25017#25017",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10018] = { 
		ID=10018,
		name="新光柱18",
		front_sfx="25018#25018",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10019] = { 
		ID=10019,
		name="新光柱19",
		front_sfx="25019#25019",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10020] = { 
		ID=10020,
		name="新光柱20",
		front_sfx="25020#25020",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10021] = { 
		ID=10021,
		name="新光柱21",
		front_sfx="25021#25021",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10022] = { 
		ID=10022,
		name="新光柱22",
		front_sfx="25022#25022",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10023] = { 
		ID=10023,
		name="新光柱23",
		front_sfx="25023#25023",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10024] = { 
		ID=10024,
		name="新光柱24",
		front_sfx="25024#25024",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10025] = { 
		ID=10025,
		name="新光柱25",
		front_sfx="25025#25025",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10026] = { 
		ID=10026,
		name="新光柱26",
		front_sfx="25026#25026",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10027] = { 
		ID=10027,
		name="新光柱27",
		front_sfx="25027#25027",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10028] = { 
		ID=10028,
		name="新光柱25056",
		front_sfx="25056#25056",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10029] = { 
		ID=10029,
		name="新光柱25057",
		front_sfx="25057#25057",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10030] = { 
		ID=10030,
		name="新光柱25058",
		front_sfx="25058#25058",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10031] = { 
		ID=10031,
		name="新光柱25059",
		front_sfx="25059#25059",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[10032] = { 
		ID=10032,
		name="新光柱25060",
		front_sfx="25060#25060",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25000] = { 
		ID=25000,
		name="新光柱33",
		front_sfx="25000#25000",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25001] = { 
		ID=25001,
		name="新光柱34",
		front_sfx="25001#25001",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25002] = { 
		ID=25002,
		name="新光柱35",
		front_sfx="25002#25002",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25003] = { 
		ID=25003,
		name="新光柱36",
		front_sfx="25003#25003",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25004] = { 
		ID=25004,
		name="新光柱37",
		front_sfx="25004#25004",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25005] = { 
		ID=25005,
		name="新光柱38",
		front_sfx="25005#25005",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25006] = { 
		ID=25006,
		name="新光柱39",
		front_sfx="25006#25006",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25007] = { 
		ID=25007,
		name="新光柱40",
		front_sfx="25007#25007",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25008] = { 
		ID=25008,
		name="新光柱41",
		front_sfx="25008#25008",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25009] = { 
		ID=25009,
		name="新光柱42",
		front_sfx="25009#25009",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25010] = { 
		ID=25010,
		name="新光柱43",
		front_sfx="25010#25010",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25011] = { 
		ID=25011,
		name="新光柱44",
		front_sfx="25011#25011",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25012] = { 
		ID=25012,
		name="新光柱45",
		front_sfx="25012#25012",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25013] = { 
		ID=25013,
		name="新光柱46",
		front_sfx="25013#25013",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25014] = { 
		ID=25014,
		name="新光柱47",
		front_sfx="25014#25014",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25015] = { 
		ID=25015,
		name="新光柱48",
		front_sfx="25015#25015",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25016] = { 
		ID=25016,
		name="新光柱49",
		front_sfx="25016#25016",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25017] = { 
		ID=25017,
		name="新光柱50",
		front_sfx="25017#25017",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25018] = { 
		ID=25018,
		name="新光柱51",
		front_sfx="25018#25018",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25019] = { 
		ID=25019,
		name="新光柱52",
		front_sfx="25019#25019",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25020] = { 
		ID=25020,
		name="新光柱53",
		front_sfx="25020#25020",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25021] = { 
		ID=25021,
		name="新光柱54",
		front_sfx="25021#25021",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25022] = { 
		ID=25022,
		name="新光柱55",
		front_sfx="25022#25022",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25023] = { 
		ID=25023,
		name="新光柱56",
		front_sfx="25023#25023",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25024] = { 
		ID=25024,
		name="新光柱57",
		front_sfx="25024#25024",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25025] = { 
		ID=25025,
		name="新光柱58",
		front_sfx="25025#25025",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25026] = { 
		ID=25026,
		name="新光柱59",
		front_sfx="25026#25026",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25027] = { 
		ID=25027,
		name="新光柱60",
		front_sfx="25027#25027",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25056] = { 
		ID=25056,
		name="新光柱25056",
		front_sfx="25056#25056",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25057] = { 
		ID=25057,
		name="新光柱25057",
		front_sfx="25057#25057",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25058] = { 
		ID=25058,
		name="新光柱25058",
		front_sfx="25058#25058",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25059] = { 
		ID=25059,
		name="新光柱25059",
		front_sfx="25059#25059",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
	[25060] = { 
		ID=25060,
		name="新光柱25060",
		front_sfx="25060#25060",
		no_skill=-2,
		icon=1111,
		tips="展示用",
		time=0,
		group=0,
		Priority=1,
		overlap=0,
		replaceGroup=0,
		offsetGroup=1,
	},
}
return config
