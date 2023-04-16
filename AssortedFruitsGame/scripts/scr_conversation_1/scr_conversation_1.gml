/// @description Bus Guy Interaction

setup_data = {
	type: "data",
	left_speaker: obj_busguy_dia,
	right_speaker: obj_alex_dia,
	in_person: true
}

line_0 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "Eugh.",
	jump_to: 0
}

line_1 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "...",
	jump_to: 0
}

line_2 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "F@$%!t.",
	jump_to: 0 
}

line_3 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "(internal) Did he seriously say that to me? I didn’t even do anything to him!",
	jump_to: 0
}

selection_4 = {
	type: "selection",
	text_to_show: "Ugh, what should I do…",
	color: c_gray,
	option_descriptions: ["[Ignore him]", "Please stop."],
	option_jump_index: [5,9],
	option_choice_index: [BH_NO_RESPONSE, BH_PLEASE_STOP]
}

line_5 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "...",
	jump_to: 0
}

line_6 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "What, can’t even look at me when I’m talking to you?",
	jump_to: 0 
}

line_7 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "....",
	jump_to: 0
}

line_8 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "Lookin’ away ain’t gonna do you any favors, kid.",
	jump_to: 13  
}

line_9 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "Please stop.",
	jump_to: 0
}

line_10 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "What, I’m just stating the obvious. You’re practically screaming it to the entire town looking like that.",
	jump_to: 0  
}

line_11 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "It’s not a nice thing to say, though.",
	jump_to: 0
}

line_12 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "I don’t gotta be nice to you.",
	jump_to: 0 
}

line_13 = {
	type: "line",
	on_the_left: false,        
	emotion: ALEX_ANXIOUS,  
	text: "(internal) My heart’s beating really fast… I just wanna get away, but I have to catch this bus…",
	jump_to: 0  
}

line_14 = {
	type: "line",
	on_the_left: true,        
	emotion: BUS_GUY_RUDE,  
	text: "Hey! You deaf or something?",
	jump_to: 0
}

current_conversation = [ 
setup_data, 
line_0, 
line_1,
line_2,
line_3,
selection_4,
line_5,
line_6,
line_7,
line_8,
line_9,
line_10,
line_11,
line_12,
line_13,
line_14
];

global.conversations[1] = current_conversation;