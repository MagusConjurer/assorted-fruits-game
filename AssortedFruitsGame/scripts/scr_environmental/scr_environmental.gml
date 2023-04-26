function get_environmental_dialogue(item)
{
	switch(item)
	{
		// Uses overworld macros
		case CLOSET:
			return "Ugh some clothes are missing again. I think Mom's been trying to get me to be more feminine again.";		
		break;
		
		case LAUNDRY:
			return "There's no room in the basket for anything. I should do my laundry when no one is home so Mom doesn't try to sift through it.";
		break;
		
		case TRASH:
			return "Did mom empty my trash? It was full the other day.";
		break;
		
		case GRAD_CAP:
			return "It's been almost a year since I took a break from uni... I should really get back to school soon. I almost have enough to move out.";
		break;
		
		case NIGHTSTAND:
			return "A bible? I don't remember that being here. Is that... a note?! \"You should read it.\" God damn it Dad.";
		break;
	}
}