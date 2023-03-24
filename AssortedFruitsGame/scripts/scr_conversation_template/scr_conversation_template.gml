/// @description Duplicate to use as a template for additional conversations

setup_data = {
	type: "data",
	left_speaker: obj_alex_dia,
	right_speaker: obj_stella_dia,
	in_person: true
}

line_0 = {
	type: "line",			 // "line" for in person, "message" for phone 
	on_the_left: true,       // Which side their object will be on  
	emotion: ALEX_ANXIOUS,   // The macro for that person's emotion
	text: "The dialogue",    // The text of what they are saying
	jump_to: 0				 // An index to jump to after this line
}

selection_1 = {
	type: "selection",
	text_to_show: "What should I do?",
	color: c_gray,
	option_descriptions: ["one", "two"],
	option_jump_index: [0,1],  // The line number to jump to for the option description at the same index
	option_ability_index: [0,0] // 0 for none or use macro for ability
}

current_conversation = [ 
setup_data, 
line_0, 
selection_1 
];

// global.conversations[0] = current_conversation;