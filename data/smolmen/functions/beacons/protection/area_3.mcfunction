
execute if entity @s[tag=smolmen.red_beacon] positioned ~-40 ~-40 ~-40 run tag @a[team=blue,dx=80,dz=80,dy=80] add smolmen.restricted.in_base
execute if entity @s[tag=smolmen.blue_beacon] positioned ~-40 ~-40 ~-40 run tag @a[team=red,dx=80,dz=80,dy=80] add smolmen.restricted.in_base

execute if entity @s[tag=smolmen.raid_protection] positioned ~-40 ~-40 ~-40 as @e[type=minecraft:creeper,dx=80,dz=80,dy=80] run data merge entity @s {ExplosionRadius: 0}
execute if entity @s[tag=smolmen.raid_protection] positioned ~-40 ~-40 ~-40 as @e[type=minecraft:tnt,dx=80,dz=80,dy=80, nbt={fuse: 1s}] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-40 ~-40 ~-40 as @e[type=minecraft:tnt_minecart,dx=80,dz=80,dy=80] run kill @s
execute if entity @s[tag=smolmen.raid_protection] positioned ~-40 ~-40 ~-40 as @e[type=minecraft:item_display,tag=combatplus.arc_star,dx=80,dz=80,dy=80] run kill @s

execute if score #timer.100 smolmen.dummy matches 0 on passengers run data modify entity @s transformation.scale set value [73f, 73f, 73f]
