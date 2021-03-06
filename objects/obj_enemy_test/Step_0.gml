event_inherited();

var acc = .02;
if obj_player.x < x {
	if vel[0] > -mxspd {
		vel[0] -= acc;		
	}
}else if obj_player.x > x {
	if vel[0] < mxspd {
		vel[0] += acc;	
	}
}

if obj_player.y < y {
	if vel[1] > -mxspd {
		vel[1] -= acc;		
	}
}else if obj_player.y > y {
	if vel[1] < mxspd {
		vel[1] += acc;	
	}
}
if bbox_left + sign(vel[0])*mxspd*2 > 0 && bbox_right + sign(vel[0])*mxspd*2 < 100 && !instance_place(x + vel[0], y, obj_enemy_test) {
	x += vel[0];	
}else{
	vel[0] *= -.5;	
}

if bbox_top + sign(vel[1])*mxspd*2 > 0 && bbox_bottom + sign(vel[1])*mxspd*2 < 125 && !instance_place(x, y + vel[1], obj_enemy_test) {
	y += vel[1];	
}else{
	vel[1] *= -.5;	
}

// launch walkers
var walker = instance_place(x, y, obj_enemy_walker);
if walker != noone {
	var d = irandom_range(0, 360);
	walker.vel[0] = lengthdir_x(3, d);	
	walker.vel[1] = lengthdir_y(3, d);
	walker.sprite_index = spr_enemy_walker_hey;
	walker.alarm[0] = 60;
}

image_xscale = -sign(obj_player.x - x) + (obj_player.x == x)*1

if hp <= 0 {
	instance_destroy(id);	
}