
# get and store beacon data
execute if score #timer.100 smolmen.dummy matches 0 run function smolmen:beacons/get_data

# set max health
execute if score @s smolmen.id matches 0 run scoreboard players set #max_health smolmen.dummy 40
execute if score @s smolmen.id matches 1 run scoreboard players set #max_health smolmen.dummy 60
execute if score @s smolmen.id matches 2 run scoreboard players set #max_health smolmen.dummy 80
execute if score @s smolmen.id matches 3 run scoreboard players set #max_health smolmen.dummy 100
execute if score @s smolmen.id matches 4 run scoreboard players set #max_health smolmen.dummy 120

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
