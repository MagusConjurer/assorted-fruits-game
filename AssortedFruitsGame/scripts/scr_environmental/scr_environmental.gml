function get_environmental_dialogue(item)
{
	switch(item)
	{
		// Uses overworld macros
		// BEDROOM
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
		// OUTSIDE
		case TREE:
			return "There used to be a swing here. I remember when Uncle Danny used to push me until his arms gave out. I wish I could go back to that...";
		break;
		case BUS_STOP_DENT:
			return "That storm was crazy! I can't believe this is the only thing that got damaged...";
		break;
		case BUS_STOP:
			return "I'm so glad I don't have to walk to Strawberry Lane anymore. I almost lost my mind when they put this bus stop here!";
		break;
		case GARBAGE_CANS:
			return "La Verga, I forgot to take the trash to the street. As if Dad needed more reasons to be angry...";
		break;
		case TREE_ROOT:
			return "Uncle Danny almost sprained his ankle one time, back when we used to play tag. Everything was so great back then... God, I really don't want to go to this damn dinner.";
		break;
		// CAFE
		case DRINKS:
			return "I remember when Stella first started here. She dropped so many drinks, it was so hard not to laugh!";
		break;
		case PRIDE_FLAG:
			return "Thank goodness there's a place in this town that accepts me. Perfect for when I need a break from home...";
		break;
		case CAFE_MENU:
			return "Wait... Oh no! They took off my favorite drink?! What am I supposed to order now?";
		break;
		case MISSING_MUFFINS:
			return "No muffins again... Ugh, you really have to get here early to score one.";
		break;
		// LIVING ROOM
		case RETABLO:
			return "I forgot how old this is. It belonged to my Abuela, and probably her Abuela too.";
		break;
		case FISHING_PHOTO:
			return "This trip to the lake was the best! Uncle Danny caught the biggest bass I've ever seen. He wouldn't shut up about it either. (Sigh) I guess we won't have trips like that anymore.";
		break;
		case TELEVISION:
			return "Jeez, Mom sure loves her telenovelas. You wouldn't think she was Catholic based off what she watches.";
		break;
		case YARN:
			return "God, I hope Mom isn't making me any more socks. They're so itchy!";
		break;
		case BIBLE_CALENDAR:
			return "\"Jesus loves all.\" (Scoff) If only my family would focus more on that verse.";
		break;
	}
}