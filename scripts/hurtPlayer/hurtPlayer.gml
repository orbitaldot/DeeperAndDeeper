function hurtPlayer() {
	if place_meeting(x, y, obj_player) {
		if obj_player.invinc == 0 {
			global.hp--;
		
			obj_player.invinc = obj_player.max_invinc;
		}
	}
}