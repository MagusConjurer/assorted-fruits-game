function get_environmental_dialogue(item)
{
	switch(item)
	{
		// Uses overworld macros
		case CLOSET:
			return "Ugh some clothes are missing again. I think Mom's been secretly trying to get rid of my more masculine clothes.";		
		break;
		
		case LAUNDRY:
			return "Oof that really piled up. I should do my laundry when no one is home so Mom doesn't try to sift through it.";
		break;
		
		case TRASH:
			return "Oh my god did I really write this? Maybe I should tone it down a bit.";
		break;
		
		case GRAD_CAP:
			return "I should get back to school soon. I almost have enough to move out.";
		break;
		
		case NIGHTSTAND:
			return "Is that a bible? \"You should read it.\" God damn it Dad.";
		break;
	}
}