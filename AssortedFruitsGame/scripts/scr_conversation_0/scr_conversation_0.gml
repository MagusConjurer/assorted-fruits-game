/// @description Phone Dialogue

setup_data = {
	type: "data",
	left_speaker: obj_stella_dia,
	right_speaker: obj_alex_dia,
	in_person: false
}

line_0 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "heyyy! We still on for Cookies ‘n Cream Cafe at 3?",    
	jump_to: 0				 
}

line_1 = {
	type: "message",
	on_the_left: false,          
	emotion: 0,   
	text: "oh damn i almost forgot but yea!!",    
	jump_to: 0				 
}

line_2 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "I figured you’d need a reminder lol",    
	jump_to: 0				 
}

line_3 = {
	type: "message",
	on_the_left: false,          
	emotion: 0,   
	text: ":/",    
	jump_to: 0				 
}

line_4 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: ":p",    
	jump_to: 0				 
}

line_5 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "How'd last night go?",    
	jump_to: 0				 
}

line_6 = {
	type: "message",
	on_the_left: false,          
	emotion: 0,   
	text: "awful. worse than i expected.",    
	jump_to: 0				 
}

line_7 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "oh, Alex…",    
	jump_to: 0				 
}

line_8 = {
	type: "message",
	on_the_left: false,          
	emotion: 0,   
	text: "i’ll tell u about it later",    
	jump_to: 0				 
}

line_9 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "ok. You better not be late tho, or coffee’s on you",    
	jump_to: 0				 
}

line_10 = {
	type: "message",
	on_the_left: false,          
	emotion: 0,   
	text: "wha?? u literally work there and can get us drinks for free!!",    
	jump_to: 0				 
}

line_11 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "late people don’t deserve free drinks ¯\_(ツ)_/¯",    
	jump_to: 0				 
}

line_12 = {
	type: "message",
	on_the_left: true,          
	emotion: 0,   
	text: "see you soon!!",    
	jump_to: 0				 
}

line_13 = {
	type: "line",
	on_the_left: false,          
	emotion: 0,   
	text: "(internal) Jeez, she’s so strict about being on time… Luckily the cafe’s just a short bus ride away.",    
	jump_to: 0				 
}

line_14 = {
	type: "line",
	on_the_left: false,          
	emotion: 0,   
	text: "(internal) I have a little time, but I should get going soon.",    
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

global.conversations[0] = current_conversation;