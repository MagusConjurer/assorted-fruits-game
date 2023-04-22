/// @description Bedroom after dinner

setup_data = {
	type: "data",
	left_speaker: [obj_stella_dia],
	right_speaker: [obj_alex_dia],
	in_person: false,
	multiple_options: false
}

line_0 = {
	type: "message",
	on_the_left: true,
	speaker: 0,
	emotion: 0,   
	text: "hey dude, how's dinner going???",    
	jump_to: 0				 
}

line_1 = {
	type: "message",
	on_the_left: false,
	speaker: 0,
	emotion: 0,   
	text: "I stormed out :/",    
	jump_to: 0				 
}

line_2 = {
	type: "message",
	on_the_left: false,  
	speaker: 0,
	emotion: 0,   
	text: "danny talked about sending me to a camp that will \“fix me\”, and dad threatened to kick me out.",    
	jump_to: 0				 
}

line_3 = {
	type: "message",
	on_the_left: true, 
	speaker: 0,
	emotion: 0,   
	text: "Holy shit?????",    
	jump_to: 0				 
}

line_4 = {
	type: "message",
	on_the_left: true, 
	speaker: 0,
	emotion: 0,   
	text: "Do you think he meant it??",    
	jump_to: 0				 
}

line_5 = {
	type: "message",
	on_the_left: false,   
	speaker: 0,
	emotion: 0,   
	text: "maybe, but mom protested. she doesn't want me to leave.",    
	jump_to: 0				 
}

line_6 = {
	type: "message",
	on_the_left: true,     
	speaker: 0,
	emotion: 0,   
	text: "hmm... I know you don't have much dough atm, but maybe it'd be best to leave on your own terms",    
	jump_to: 0				 
}

line_7 = {
	type: "message",
	on_the_left: true,   
	speaker: 0,
	emotion: 0,   
	text: "This environment can't be good for your mental health",    
	jump_to: 0				 
}

line_8 = {
	type: "message",
	on_the_left: false,      
	speaker: 0,
	emotion: 0,   
	text: "no kidding",    
	jump_to: 0				 
}

line_9 = {
	type: "message",
	on_the_left: true,      
	speaker: 0,
	emotion: 0,   
	text: "Tell ya what",    
	jump_to: 0				 
}

line_10 = {
	type: "message",
	on_the_left: true,  
	speaker: 0,
	emotion: 0,   
	text: "tmrw I'll get a group of our friends together, and we can make a gameplan for you to get the hell outta dodge",    
	jump_to: 0				 
}

line_11 = {
	type: "message",
	on_the_left: true,    
	speaker: 0,
	emotion: 0,   
	text: "No matter what happens, we've got your back Alex <3",    
	jump_to: 0				 
}

line_12 = {
	type: "line",
	on_the_left: true,    
	speaker: 0,
	emotion: 0,   
	text: "(internal) Yeah... Even if things seem tough now, I think it'll work out ok.",    
	jump_to: 0
}

line_13 = {
	type: "line",
	on_the_left: true,    
	speaker: 0,
	emotion: 0,   
	text: "(internal) I've got Stella and my other friends to help me out. They're my safe space.",    
	jump_to: 0
}

line_14 = {
	type: "line",
	on_the_left: true,    
	speaker: 0,
	emotion: 0,   
	text: "(internal) Regardless of my family, I know I'll push through in the end.",    
	jump_to: 0
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
line_14
];

global.conversations[4] = current_conversation;