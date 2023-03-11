if(text == CONTINUE_DIA_TEXT)
{
	show_debug_message("Pressed Continue Dialogue");
	continue_conversation();
}
else if (text == COMPLETE_DIA_TEXT)
{
	show_debug_message("Pressed End Dialogue");
	end_conversation();
}
