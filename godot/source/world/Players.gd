extends Node

func count():
	var num = get_children().size()
	if $Player.dead:
		num -= 1
	return num

func count_alive():
	return count() - 1