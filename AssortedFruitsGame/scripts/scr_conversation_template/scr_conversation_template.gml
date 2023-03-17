/// @description Duplicate to use as a template for additional conversations

setup_data = {
	type: "data",
	left_speaker: obj_other_dia,
	right_speaker: obj_player_dia
}

line_0 = {
	type: "line",
	on_the_left: 0,          // Which side their object will be on  
	emotion: ALEX_ANXIOUS,   // The macro for that person's emotion
	text: "The dialogue"     // The text of what they are saying
}

selection_0 = {
	type: "selection",
	text_to_show: "What should I do?",
	color: c_gray,
	option_descriptions: ["one", "two"]
}

current_conversation = [ setup_data, line_0, selection_0 ];

global.conversations[0] = current_conversation;