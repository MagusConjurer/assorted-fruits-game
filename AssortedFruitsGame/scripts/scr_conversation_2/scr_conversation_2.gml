/// @description Duplicate to use as a template for additional conversations

function get_convo_two()
{
	setup_data = {
	type: "data",
	left_speaker: obj_alex_dia,
	right_speaker: obj_stella_dia,
	in_person: true
	}

	line_0 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Hey hey! Right on time.",    
		jump_to: 0				 
	}

	line_1 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Heya Stella.",    
		jump_to: 0				 
	}

	line_2 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "How's it going?",    
		jump_to: 0				 
	}

	line_3 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "*sigh* I have had a hell of a time getting here.",    
		jump_to: 0				 
	}

	line_4 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Oof. You can tell me about it over a drink. Whaddya want?",    
		jump_to: 0				 
	}

	selection_5 = {
		type: "selection",
		text_to_show: "",
		color: c_gray,
		option_descriptions: ["Black coffee", "Latte", "Hot Chocolate"],
		option_jump_index: [6,6,6], 
		option_choice_index: [0,0,0] 
	}

	line_6 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Coming right up!",    
		jump_to: 0				 
	}

	line_7 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Here’s your drink. So, spill.",    
		jump_to: 0				 
	}

	line_8 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Spill my drink?",    
		jump_to: 0				 
	}

	line_9 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "No dumb-dumb, tell me what happened.",    
		jump_to: 0				 
	}

	line_10 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Oh. Uh... Some old guy at the bus stop harassed me out of nowhere.",    
		jump_to: 0				 
	}

	line_11 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "He called me slurs and said some really hateful stuff.",    
		jump_to: 0				 
	}

	line_12 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "No shit! What'd you do?",    
		jump_to: 0				 
	}

	line_13 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Nothing, really. I didn’t wanna make a scene in public.",    
		jump_to: 0				 
	}

	line_14 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I wish I could’ve stood up for myself, but the words just get stuck in my throat.",    
		jump_to: 0				 
	}

	line_15 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Plus with strangers, things could escalate if you say the wrong thing...",    
		jump_to: 0				 
	}

	line_16 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Exactly.",    
		jump_to: 0				 
	}

	line_17 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Jeez, that really sucks Alex. I’m sorry.",    
		jump_to: 0				 
	}

	line_18 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "It’s fine. Can’t say I’m surprised that happened, considering the town we live in.",    
		jump_to: 0				 
	}

	line_19 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Lucky us.",    
		jump_to: 0				 
	}

	line_20 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "How’s the new apartment? I know you said your girlfriend was pretty nervous about moving.",    
		jump_to: 0				 
	}

	line_21 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Ehh, it’s fine. Smaller than it looked online, but we’re managing.",    
		jump_to: 0				 
	}

	line_22 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "You should come over sometime. Just uh, don’t say the G-word in front of the landlord. He still thinks we’re two besties sharing a unit.",    
		jump_to: 0				 
	}

	line_23 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Ah, the old \"Gal Pals\" excuse.",    
		jump_to: 0				 
	}

	line_24 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Yup. Works every time.",    
		jump_to: 0				 
	}

	line_25 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Speaking of which, you mentioned last night didn’t go so well?",    
		jump_to: 0				 
	}

	line_26 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Right. That.",    
		jump_to: 0				 
	}

	line_27 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "They took it... badly. For different reasons. Mom didn't yell like Dad did, but she thinks I’m... sick. Dad texted Uncle Danny about it, and apparently he lost his shit.",    
		jump_to: 0				 
	}

	line_28 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Oh no...",    
		jump_to: 0				 
	}

	line_29 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "We’re having a family dinner tonight to \"talk about my lifestyle decisions\" and Danny’s joining. I feel lke I’m gonna barf just thinking about it.",    
		jump_to: 0				 
	}

	line_30 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Will you be able to handle it? If you want I can ask Alya if you can stay over, I’m sure she won’t mind...",    
		jump_to: 0				 
	}

	line_31 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Thanks Stel, but I think skipping out on dinner will only make things worse.",    
		jump_to: 0				 
	}

	line_32 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Fair.",    
		jump_to: 0				 
	}

	line_33 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I wish I knew how to handle confrontation better, but I freeze up every time. It sucks.",    
		jump_to: 0				 
	}

	line_34 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Hmm...",    
		jump_to: 0				 
	}

	line_35 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Ya know, the chapter I'm reading right now in my psych textbook is about coping mechanisms - maybe some of those can help?",    
		jump_to: 0				 
	}

	line_36 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Maybe.",    
		jump_to: 0				 
	}

	line_37 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Seriously, having coping mechanisms in your mental health toolkit can be hella useful during stressful situations.",    
		jump_to: 0				 
	}

	line_38 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "\"Mental health toolkit\"? Now you really sound like a psychologist. Paging Dr. Stella.",    
		jump_to: 0				 
	}

	line_39 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "That's the goal!",    
		jump_to: 0				 
	}

	line_40 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Now, what would you say you struggle with most?",    
		jump_to: 0				 
	}

	selection_41 = {
		type: "selection",
		text_to_show: "",
		color: c_gray,
		option_descriptions: ["Negative thoughts spiraling (Health)", "Speaking my mind (Dash)", "Getting overwhelmed (Shield)"],
		option_jump_index: [42,51,63],  // The line number to jump to for the option description at the same index
		option_choice_index: [BH_ABILITY_HEAL, BH_ABILITY_DASH, BH_ABILITY_SHIELD] 
	}

	line_42 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I struggle with negative thoughts spiraling. Every time someone says something negative, I can’t help but think \"What if they’re right?\"",    
		jump_to: 0				 
	}

	line_43 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Then I start thinking negative thoughts of my own, and it just spirals. ",    
		jump_to: 0				 
	}

	line_44 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "I know how that feels. I used to struggle with that myself, actually.",    
		jump_to: 0				 
	}

	line_45 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "When you realize you're spiraling, it can be helpful to take a step back and try to redirect your thoughts.",    
		jump_to: 0				 
	}

	line_46 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Obvi this is easier said than done, but even a few affirmations can be helpful.",    
		jump_to: 0				 
	}

	line_47 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Huh...",    
		jump_to: 0				 
	}

	line_48 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Like, if some a-hole hates on you for being queer, you gotta remind yourself that being yourself ain't a crime.",    
		jump_to: 0				 
	}

	line_49 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Right.",    
		jump_to: 0				 
	}

	line_50 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "[Ability gained: Affirmations! You can now heal yourself in battle.]",    
		jump_to: 0				 
	}

	line_51 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I have a really hard time speaking my mind. Like I can feel the words on the tip of my tongue, but I choke whenever I try to talk back.",    
		jump_to: 0				 
	}

	line_52 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I hate feeling so powerless in conversations.",    
		jump_to: 0				 
	}

	line_53 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Ugh, mood. That was totally me with my parents.",    
		jump_to: 0				 
	}

	line_54 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Really?",    
		jump_to: 0				 
	}

	line_55 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Sure. Part of the reason I moved out was because I'd clam up whenever yelled at. Honestly, it still happens sometimes.",    
		jump_to: 0				 
	}

	line_56 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "It's tough speaking up. But if you don't stand up for yourself, people will walk all over you.",    
		jump_to: 0				 
	}

	line_57 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Yeah...",    
		jump_to: 0				 
	}

	line_58 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "If you wanna move forward in a conversation, you have to be brave and just say your shit.",    
		jump_to: 0				 
	}

	line_59 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "And you gotta be self-compassionate. This stuff's hard.",    
		jump_to: 0				 
	}

	line_60 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "You miss 100% of the shots you don't take, right?",    
		jump_to: 0				 
	}

	line_61 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Mm-hmm.",    
		jump_to: 0				 
	}

	line_62 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "[Ability gained: Dash! Dash through your battles with ease.]",    
		jump_to: 0				 
	}

	line_63 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I get overwhelmed super easily, especially when a topic comes up that I'm uncomfortable with.",    
		jump_to: 0				 
	}

	line_64 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "My brain blanks and I shut down, which usually makes things worse.",    
		jump_to: 0				 
	}

	line_65 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Ah, good ol' fight or flight mode screwing you over.",    
		jump_to: 0				 
	}

	line_66 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Because your body's hyped up on adrenaline, the decision making part of your brain takes a back seat.",    
		jump_to: 0				 
	}

	line_67 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Wait, there's an actual physical reason why I can’t think straight when I'm overwhelmed? I'm not just being dumb?",    
		jump_to: 0				 
	}

	line_68 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Sure there’s a reason. And no, you're not being dumb. Don't be so hard on yourself. ",    
		jump_to: 0				 
	}

	line_69 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "When you get overwhelmed, that means your brain needs a time-out to recuperate.",    
		jump_to: 0				 
	}

	line_70 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "If you can't leave the conversation, try switching topics subtly.",    
		jump_to: 0				 
	}

	line_71 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Talking about something else may give your brain time to chill the hell out and work again.",    
		jump_to: 0				 
	}

	line_72 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "What if they go back to the topic though?",    
		jump_to: 0				 
	}

	line_73 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Well you can't control other people's actions, obvi. Admittedly it's a temporary fix.",    
		jump_to: 0				 
	}

	line_74 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "But it's better than shutting down, no?",    
		jump_to: 0				 
	}

	line_75 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Definitely.",    
		jump_to: 0				 
	}

	line_76 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "[Ability gained: Shield! You can now protect yourself in battle.]",    
		jump_to: 0				 
	}

	line_77 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Thanks again for everything, Stella.",    
		jump_to: 0				 
	}

	line_78 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "No problem, dude. I'll check in with you later, k? You got this.",    
		jump_to: 0				 
	}

	line_79 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Yeah.",    
		jump_to: 0				 
	}

	line_80 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Say you got this.",    
		jump_to: 0				 
	}

	line_81 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "...I got this.",    
		jump_to: 0				 
	}

	line_82 = {
		type: "line",			 
		on_the_left: false,         
		emotion: 0,  
		text: "Louder!! I can't hear you!",    
		jump_to: 0				 
	}

	line_83 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "I got this!!",    
		jump_to: 0				 
	}

	line_84 = {
		type: "line",			 
		on_the_left: true,         
		emotion: 0,  
		text: "Hell yeah! Now go get em tiger.",    
		jump_to: 0				 
	}
	
	
	current_conversation = [ 
	setup_data, 
	line_0, 
	line_1,
	line_2,
	line_3,
	line_4,
	selection_5,
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
	line_18,
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
	selection_41,
	line_42,
	line_43,
	line_44,
	line_45,
	line_46,
	line_47,
	line_48,
	line_49,
	line_50,
	line_51,
	line_52,
	line_53,
	line_54,
	line_55,
	line_56,
	line_57,
	line_58,
	line_59,
	line_60,
	line_61,
	line_62,
	line_63,
	line_64,
	line_65,
	line_66,
	line_67,
	line_68,
	line_69,
	line_70,
	line_71,
	line_72,
	line_73,
	line_74,
	line_75,
	line_76,
	line_77,
	line_78,
	line_79,
	line_80,
	line_81,
	line_82,
	line_83,
	line_84
	];
	global.conversations[2] = current_conversation;
}