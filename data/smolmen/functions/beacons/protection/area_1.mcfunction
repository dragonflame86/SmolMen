
execute if entity @s[tag=smolmen.red_beacon] positioned ~-20 ~-20 ~-20 run tag @a[team=blue,dx=40,dz=40,dy=40] add smolmen.restricted.in_base
execute if entity @s[tag=smolmen.blue_beacon] positioned ~-20 ~-20 ~-20 run tag @a[team=red,dx=40,dz=40,dy=40] add smolmen.restricted.in_base

execute if entity @s[tag=smolmen.raid_protection] positioned ~-20 ~-20 ~-20 as @e[type=minecraft:creeper,dx=40,dz=40,dy=40] run data merge entity @s {ExplosionRadius: 0}
execute if entity @s[tag=smolmen.raid_protection] positioned ~-20 ~-20 ~-20 as @e[type=minecraft:tnt,dx=40,dz=40,dy=40, nbt={fuse: 1s}] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-20 ~-20 ~-20 as @e[type=minecraft:tnt_minecart,dx=40,dz=40,dy=40] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-20 ~-20 ~-20 as @e[type=minecraft:item_display,tag=combatplus.arc_star,dx=40,dz=40,dy=40] run kill @s

execute if score #timer.100 smolmen.dummy matches 0 on passengers run data modify entity @s transformation.scale set value [33f, 33f, 33f]
