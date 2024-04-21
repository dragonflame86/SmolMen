
execute if entity @s[tag=smolmen.red_beacon] positioned ~-15 ~-15 ~-15 run tag @a[team=blue,dx=30,dz=30,dy=30] add smolmen.restricted.in_base
execute if entity @s[tag=smolmen.blue_beacon] positioned ~-15 ~-15 ~-15 run tag @a[team=red,dx=30,dz=30,dy=30] add smolmen.restricted.in_base

execute if entity @s[tag=smolmen.raid_protection] positioned ~-15 ~-15 ~-15 as @e[type=minecraft:creeper,dx=30,dz=30,dy=30] run data merge entity @s {ExplosionRadius: 0}
execute if entity @s[tag=smolmen.raid_protection] positioned ~-15 ~-15 ~-15 as @e[type=minecraft:tnt,dx=30,dz=30,dy=30, nbt={fuse: 1s}] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-15 ~-15 ~-15 as @e[type=minecraft:tnt_minecart,dx=30,dz=30,dy=30] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-15 ~-15 ~-15 as @e[type=minecraft:item_display,tag=combatplus.arc_star,dx=30,dz=30,dy=30] run kill @s

execute if score #timer.100 smolmen.dummy matches 0 on passengers run data modify entity @s transformation.scale set value [23f, 23f, 23f]
