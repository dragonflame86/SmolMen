
execute if entity @s[tag=!smolmen.invulnerable] run playsound minecraft:block.anvil.place block @a ~ ~ ~ 5 1
setblock ~ ~ ~ minecraft:beacon

execute if entity @s[tag=smolmen.red_beacon] run data modify block ~ ~ ~ primary_effect set from storage smolmen:const red_beacon.primary_effect
execute if entity @s[tag=smolmen.red_beacon] run data modify block ~ ~ ~ secondary_effect set from storage smolmen:const red_beacon.secondary_effect

execute if entity @s[tag=smolmen.blue_beacon] run data modify block ~ ~ ~ primary_effect set from storage smolmen:const blue_beacon.primary_effect
execute if entity @s[tag=smolmen.blue_beacon] run data modify block ~ ~ ~ secondary_effect set from storage smolmen:const blue_beacon.secondary_effect

kill @e[type=item,distance=..12,sort=nearest,limit=1,nbt={Item:{id:"minecraft:beacon"}}]

execute if entity @s[tag=smolmen.raid_protection] run tellraw @a[distance=..8] {"text":"Not enough players online. Beacon has raid protection."}
execute if entity @s[tag=!smolmen.invulnerable,tag=!smolmen.raid_protection] run scoreboard players remove @s smolmen.dummy 1

execute if score @s smolmen.dummy matches 0 run function smolmen:beacons/regeneration_start
