
execute if entity @s[tag=smolmen.red_beacon] positioned ~-50 ~-50 ~-50 run tag @a[team=blue,dx=100,dz=100,dy=100] add smolmen.restricted.in_base
execute if entity @s[tag=smolmen.blue_beacon] positioned ~-50 ~-50 ~-50 run tag @a[team=red,dx=100,dz=100,dy=100] add smolmen.restricted.in_base

execute if entity @s[tag=smolmen.raid_protection] positioned ~-50 ~-50 ~-50 as @e[type=minecraft:creeper,dx=100,dz=100,dy=100] run data merge entity @s {ExplosionRadius: 0}
execute if entity @s[tag=smolmen.raid_protection] positioned ~-50 ~-50 ~-50 as @e[type=minecraft:tnt,dx=100,dz=100,dy=100, nbt={fuse: 1s}] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-50 ~-50 ~-50 as @e[type=minecraft:tnt_minecart,dx=100,dz=100,dy=100] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-50 ~-50 ~-50 as @e[type=minecraft:item_display,tag=combatplus.arc_star,dx=100,dz=100,dy=100] run kill @s

execute if score #timer.100 smolmen.dummy matches 0 on passengers run data modify entity @s transformation.scale set value [93f, 93f, 93f]
