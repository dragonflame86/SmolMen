
# get and store beacon data
execute if score #timer.100 smolmen.dummy matches 0 run function smolmen:beacons/get_data

# set max health
execute if score @s smolmen.id matches 0 run scoreboard players set #max_health smolmen.dummy 40
execute if score @s smolmen.id matches 1 run scoreboard players set #max_health smolmen.dummy 60
execute if score @s smolmen.id matches 2 run scoreboard players set #max_health smolmen.dummy 80
execute if score @s smolmen.id matches 3 run scoreboard players set #max_health smolmen.dummy 100
execute if score @s smolmen.id matches 4 run scoreboard players set #max_health smolmen.dummy 120

# heal
execute if score @s smolmen.dummy < #max_health smolmen.dummy if score #timer.6000 smolmen.dummy matches 0 run scoreboard players operation @s smolmen.dummy += @s smolmen.id

# reduce health if over max
execute if score @s smolmen.dummy > #max_health smolmen.dummy run scoreboard players remove @s smolmen.health 1

execute if entity @s[tag=smolmen.red_beacon] store result bossbar smolmen:red_beacon max run scoreboard players get #max_health smolmen.dummy
execute if entity @s[tag=smolmen.blue_beacon] store result bossbar smolmen:blue_beacon max run scoreboard players get #max_health smolmen.dummy

# bossbar visibility
execute if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon players @a[distance=..64]
execute if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon players @a[distance=..64]

# break block damage
execute if entity @s[tag=!smolmen.regenerating] unless block ~ ~ ~ minecraft:beacon run function smolmen:beacons/damage

# regenerate
execute if entity @s[tag=smolmen.regenerating] run function smolmen:beacons/regeneration
execute if entity @s[tag=smolmen.invulnerable] run function smolmen:beacons/invulnerable

# set health display
execute if entity @s[tag=smolmen.red_beacon] store result bossbar smolmen:red_beacon value run scoreboard players get @s smolmen.dummy
execute if entity @s[tag=smolmen.blue_beacon] store result bossbar smolmen:blue_beacon value run scoreboard players get @s smolmen.dummy

# protection
execute if entity @s[tag=smolmen.red_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 0 positioned ~-15 -64 ~-15 run tag @a[team=blue,dx=30,dz=30,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.red_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 1 positioned ~-20 -64 ~-20 run tag @a[team=blue,dx=40,dz=40,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.red_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 2 positioned ~-30 -64 ~-30 run tag @a[team=blue,dx=60,dz=60,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.red_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 3 positioned ~-40 -64 ~-40 run tag @a[team=blue,dx=80,dz=80,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.red_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 4 positioned ~-50 -64 ~-50 run tag @a[team=blue,dx=100,dz=100,dy=400] add smolmen.restricted

execute if entity @s[tag=smolmen.blue_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 0 positioned ~-15 -64 ~-15 tag @a[team=red,dx=30,dz=30,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.blue_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 1 positioned ~-20 -64 ~-20 run tag @a[team=red,dx=40,dz=40,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.blue_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 2 positioned ~-30 -64 ~-30 run tag @a[team=red,dx=60,dz=60,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.blue_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 3 positioned ~-40 -64 ~-40 run tag @a[team=red,dx=80,dz=80,dy=400] add smolmen.restricted
execute if entity @s[tag=smolmen.blue_beacon,tag=!smolmen.regenerating] if score @s smolmen.id matches 4 positioned ~-50 -64 ~-50 run tag @a[team=red,dx=100,dz=100,dy=400] add smolmen.restricted

execute if entity @s[tag=smolmen.blue_beacon] unless entity @a[team=blue,limit=1] function ~/anti_raid
execute if entity @s[tag=smolmen.red_beacon] unless entity @a[team=red,limit=1] function ~/anti_raid:
    as @e[type=creeper, distance=..48, tag=!smolmen.restricted] function ~/../restrict_creepers:
        data merge entity @s {ExplosionRadius: 0}
        tag @s add smolmen.restricted

    kill @e[type=tnt, distance=..48, nbt={fuse: 1s}] 
    kill @e[type=item_display,tag=combatplus.arc_star, distance=..48]
     

# glass
execute if entity @s[tag=smolmen.red_beacon] run setblock ~ ~1 ~ minecraft:red_stained_glass
execute if entity @s[tag=smolmen.blue_beacon] run setblock ~ ~1 ~ minecraft:blue_stained_glass

# clear beacon beam
execute if score #timer.20 smolmen.dummy matches 0 positioned ~ ~2 ~ run function smolmen:beacons/clear_beam
