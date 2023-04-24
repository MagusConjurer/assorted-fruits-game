/// @description Family Dinner

setup_data = {
	type: "data",
	left_speaker: [obj_alex_dia],
	right_speaker: [obj_mom_dia, obj_dad_dia, obj_uncle_dia],
	in_person: true,
	multiple_options: true
}

line_0 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "(internal) Oh shit, I do not got this.",
	jump_to: 0
}

line_1 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "Alex Mija, could you pass me a roll?",
	jump_to: 0
}

line_2 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "(internal) It's been 15 minutes and barely anyone's spoken. It's so awkward I could die.",
	jump_to: 0
}

line_3 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "(internal) And I hate when she calls me that.",
	jump_to: 0
}

line_4 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Are you gonna just sit there and look constipated or are you going to hand your mother the roll?",
	jump_to: 0
}

line_5 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "!",
	jump_to: 0
}

line_6 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "Erp, sorry Dad...",
	jump_to: 0
}

line_7 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Don't apologize to me, apologize to your mother. No manners...",
	jump_to: 0
}

line_8 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "Uh, right. Sorry Mom. Here you go.",
	jump_to: 0
}

line_9 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "Thank you, sweetheart.",
	jump_to: 0
}

line_10 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "............",
	jump_to: 0
}

line_11 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Alright, I guess I'll say it since no one else will. We all know what this is about..",
	jump_to: 0
}

line_12 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "Danny, maybe this isn't the time-",
	jump_to: 0
}
line_13 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "I think it's the perfect time. Ain't nobody else talkin'.",
	jump_to: 0
}

line_14 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "‘sides, ain't that why you invited me over?",
	jump_to: 0
}

line_15 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "[mutters] You come over for dinner like twice a week anyways...",
	jump_to: 0
}

line_16 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Don't be smart with your Uncle.",
	jump_to: 0
}
line_17 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Heh, least you still got that bite, kiddo. That hasn't changed.",
	jump_to: 0
}

selection_18 = {
	type: "selection",
	text_to_show: "",
	color: c_gray,
	options: ["", ""],
	option_descriptions: ["I haven't changed.", "I've always been like this"],
	option_jump_index: [19,26],  
	option_choice_index: [0,0] 
}

line_19 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "I haven't changed. I'm still me.",
	jump_to: 0
}

line_20 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "No, you've changed. You spend so much time on your phone and with that girl that you've gotten all confused.",
	jump_to: 0
}

line_21 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "You never liked Stella.",
	jump_to: 0
}

line_22 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "We like Stella, we're just worried she's a bad influence on you.",
	jump_to: 0
}

line_23 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "She has all these piercings, and she even convinced you to dye your lovely hair...",
	jump_to: 0
}

line_24 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Plus she made a ruckus when she left the church to run off with her girlfriend.",
	jump_to: 0
}

line_25 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Sounds like she's corrupting you. I mean, I remember you were a tomboy even when you were a kid, but you weren't... this.",
	jump_to: 34
}

line_26 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "I've always been like this. You're just mad I put a label on it.",
	jump_to: 0
}

line_27 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "Alex, tone.",
	jump_to: 0
}

line_28 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "You kids are obsessed with labels. Not binary this, whatever-sexual that.",
	jump_to: 0
}

line_29 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Right? You can't expect us to respect that.",
	jump_to: 0
}

line_30 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "You're being too harsh. Alex is sick.",
	jump_to: 0
}

line_31 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "She's got this disorder- ah, what was it called? ‘Gender identity disorder'. They taught it in med school.",
	jump_to: 0
}

line_32 = {
	type: "line",
	on_the_left: false,
	speaker: 0,
	emotion: 0,
	text: "They don't even use that term anymore! You should know that as a doctor.",
	jump_to: 0
}

line_33 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "I'm busy with my patients mija, I can't keep up with all this new terminology.",
	jump_to: 0
}

line_34 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "......",
	jump_to: 0
}

line_35 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "So what the hell do you want me to do then?",
	jump_to: 0
}

line_36 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "No need to snap at us. We just want what's best for you. We're your family.",
	jump_to: 0
}

line_37 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "My family? You hate me for who I am!",
	jump_to: 0
}

line_38 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "We don't hate you, sweetheart.",
	jump_to: 0
}

line_39 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Hate the sin, not the sinner.",
	jump_to: 0
}

line_40 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Amen.",
	jump_to: 0
}

line_41 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "Ya know, there are places that help kids like Alex. My buddy runs a summer camp that works miracles.",
	jump_to: 0
}

line_42 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "You've gotta be shitting me!",
	jump_to: 0
}

line_43 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "He's just trying to help, Alex.",
	jump_to: 0
}

line_44 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Yeah, it's preferable to being kicked out, right? You're 18, you don't gotta stay here.",
	jump_to: 0
}

line_45 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "No no, Alex should stay here. She's too young to leave!",
	jump_to: 0
}

selection_46 = {
	type: "selection",
	text_to_show: "Who should I respond to?",
	color: c_gray,
	options: ["Mom", "Dad", "Uncle Danny"],
	option_descriptions: ["You're just making it worse.", "Stop being an asshole.", "You're not my dad."],
	option_jump_index: [47,49,51],  
	option_choice_index: [BH_BATTLE_MOM, BH_BATTLE_DAD, BH_BATTLE_UNCLE] 
}

line_47 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "Mom, you're making it worse. Stop.",
	jump_to: 0
}

line_48 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_MOM,
	emotion: 0,
	text: "You will not speak to me like that!",
	jump_to: 53
}

line_49 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "Dad, stop being an asshole.",
	jump_to: 0
}

line_50 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_DAD,
	emotion: 0,
	text: "Did you just call me an asshole? Oh, you're gonna regret that.",
	jump_to: 53
}

line_51 = {
	type: "line",
	on_the_left: true,
	speaker: 0,
	emotion: 0,
	text: "Danny, you're not my dad. You can't tell me what to do.",
	jump_to: 0
}

line_52 = {
	type: "line",
	on_the_left: false,
	speaker: DIA_UNCLE,
	emotion: 0,
	text: "I ain't your dad, but I'm still your family.",
	jump_to: 53
}

current_conversation = [ 
setup_data, 
line_0, 
line_1, 
line_2, 
line_3, 
line_4, 
line_5, 
line_6, 
line_7, 
line_8, 
line_9, 
line_10, 
line_11, 
line_12, 
line_13, 
line_14, 
line_15, 
line_16, 
line_17, 
selection_18,
line_19, 
line_20, 
line_21, 
line_22, 
line_23, 
line_24, 
line_25, 
line_26, 
line_27, 
line_28, 
line_29, 
line_30, 
line_31, 
line_32, 
line_33, 
line_34, 
line_35, 
line_36, 
line_37, 
line_38, 
line_39, 
line_40, 
line_41, 
line_42, 
line_43, 
line_44, 
line_45, 
selection_46,
line_47, 
line_48, 
line_49, 
line_50, 
line_51, 
line_52
];

global.conversations[3] = current_conversation;