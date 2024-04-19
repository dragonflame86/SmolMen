
advancement revoke @s only smolmen:technical/beacon_speed

execute if entity @s[team=red] positioned ~-50 -64 ~-50 if entity @e[type=minecraft:block_display,tag=smolmen.blue_beacon,dx=100,dy=400,dz=100] run effect clear @s minecraft:speed
execute if entity @s[team=blue] positioned ~-50 -64 ~-50 if entity @e[type=minecraft:block_display,tag=smolmen.red_beacon,dx=100,dy=400,dz=100] run effect clear @s minecraft:speed
