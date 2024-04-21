
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
execute store result score #red_count smolmen.dummy if entity @a[team=red]
execute store result score #blue_count smolmen.dummy if entity @a[team=blue]

tag @s add smolmen.raid_protection
execute if score #red_count smolmen.dummy matches 2.. if score #blue_count smolmen.dummy matches 2.. run tag @s remove smolmen.raid_protection

execute if entity @s[tag=!smolmen.regenerating] if score @s smolmen.id matches 0 run function smolmen:beacons/protection/area_0
execute if entity @s[tag=!smolmen.regenerating] if score @s smolmen.id matches 1 run function smolmen:beacons/protection/area_1
execute if entity @s[tag=!smolmen.regenerating] if score @s smolmen.id matches 2 run function smolmen:beacons/protection/area_2
execute if entity @s[tag=!smolmen.regenerating] if score @s smolmen.id matches 3 run function smolmen:beacons/protection/area_3
execute if entity @s[tag=!smolmen.regenerating] if score @s smolmen.id matches 4 run function smolmen:beacons/protection/area_4
     
# glass
execute if entity @s[tag=smolmen.red_beacon] run setblock ~ ~1 ~ minecraft:red_stained_glass
execute if entity @s[tag=smolmen.blue_beacon] run setblock ~ ~1 ~ minecraft:blue_stained_glass

# clear beacon beam
execute if score #timer.20 smolmen.dummy matches 0 positioned ~ ~2 ~ run function smolmen:beacons/clear_beam
