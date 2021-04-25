function monsterSetup(p) {
	static lastMonster = -1;
	static monsterProbabilityDefault = .4;
	static monsterProbability = 0;
	static monsterProbabilityIncrease = .125;
	
	if global.tower { return };
	
	show_debug_message(string(monsterProbability));
	
	var monstergroup = -1;
	
	monsterProbability += monsterProbabilityIncrease;
	
	if monsterProbability > random_range(0, 1) {
		while monstergroup == -1 or monstergroup == lastMonster {
			if global.chapter == 1 {
				if p < 20 {
					monstergroup = irandom_range(0, 2);
				}else if p < 30 {
					monstergroup = irandom_range(1, 7);	
				}else{
					monstergroup = irandom_range(2, 9);	
				}
			} else if global.chapter == 2 {
				monstergroup = irandom_range(50, 51);	
			}
		}
		lastMonster = monstergroup;
		
		// special rules
		if monstergroup > 3 && global.flags[5] == 0 {
			monstergroup = 3;
			global.flags[5] = 1;
		}
		
		if monstergroup == 0 {
			instance_create_depth(70, 30, -100, obj_enemy_walker);
			instance_create_depth(70, 125 - 30, -100, obj_enemy_walker);
		}else if monstergroup == 1 {
			instance_create_depth(50, 20, -100, obj_enemy_walker);
			instance_create_depth(50, 105, -100, obj_enemy_walker);
		}else if monstergroup == 2 {
			instance_create_depth(70, 10, -100, obj_enemy_walker);
			instance_create_depth(80, 30, -100, obj_enemy_walker);
			instance_create_depth(75, 100, -100, obj_enemy_walker);
		}else if monstergroup == 3 {
			instance_create_depth(60, 30, -100, obj_enemy_test);	
		}else if monstergroup == 4 {
			instance_create_depth(60, 95, -100, obj_enemy_test);	
		}else if monstergroup == 5 {
			instance_create_depth(70, 30, -100, obj_enemy_test); 	
			instance_create_depth(70, 125 - 30, -100, obj_enemy_test); 
		}else if monstergroup == 6 {
			if random(1) > .5 {
				instance_create_depth(50, 30, -100, obj_enemy_test);
				instance_create_depth(50, 90, -100, obj_enemy_walker);
			}else{
				instance_create_depth(50, 30, -100, obj_enemy_walker);
				instance_create_depth(50, 90, -100, obj_enemy_test);
			}
		}else if monstergroup == 7 {
			instance_create_depth(60, 30, -100, obj_enemy_walker);
			instance_create_depth(80, 125/2, -100, obj_enemy_test);
			instance_create_depth(60, 95, -100, obj_enemy_walker);
		}else if monstergroup == 8 {
			instance_create_depth(70, 125/2, -100, obj_enemy_shooter);
		}else if monstergroup == 9 {
			instance_create_depth(70, 125/2, -100, obj_enemy_shooter);
		}
		
		else if monstergroup == 50 {
			instance_create_depth(90, 125/2, -100, obj_enemy_chainer);	
		}else if monstergroup == 51 {
			instance_create_depth(90, 115, -100, obj_enemy_chainer);
			instance_create_depth(80, 30, -100, obj_enemy_test);
		}
		
		
		monsterProbability = monsterProbabilityDefault;
	}
	
	
	//if p mod 5 == 0 {
	//	if p mod 10 == 0 {
	//		instance_create_depth(70, 30, -100, obj_enemy_test); 	
	//		instance_create_depth(70, 125 - 30, -100, obj_enemy_test); 	
	//	}else{
	//		instance_create_depth(70, 125/2, -100, obj_enemy_test); 	
	//	}
	//}
	
	//if p == 23 {
	//	instance_create_depth(90, 125/2, -100, obj_enemy_chainer);	
	//}
}