
execute if block ~ ~ ~ minecraft:beacon store result score @s smolmen.id run data get block ~ ~ ~ Levels
execute if entity @s[tag=smolmen.red_beacon] store result score #levels smolmen.dummy run data get storage smolmen:const red_beacon.levels
execute if entity @s[tag=smolmen.blue_beacon] store result score #levels smolmen.dummy run data get storage smolmen:const blue_beacon.levels

execute if score @s smolmen.id matches 0 run say skip
execute if score @s smolmen.id matches 0 if score #levels smolmen.dummy matches 1..4 run say skip 2
execute if score @s smolmen.id matches 0 if score #levels smolmen.dummy matches 1..4 run scoreboard players operation @s smolmen.id = #levels smolmen.dummy

execute if entity @s[tag=smolmen.red_beacon] run data modify storage smolmen:const red_beacon set value {}
execute if entity @s[tag=smolmen.red_beacon] run data modify storage smolmen:const red_beacon.levels set from block ~ ~ ~ Levels
execute if entity @s[tag=smolmen.red_beacon] run data modify storage smolmen:const red_beacon.primary_effect set from block ~ ~ ~ primary_effect
execute if entity @s[tag=smolmen.red_beacon] run data modify storage smolmen:const red_beacon.secondary_effect set from block ~ ~ ~ secondary_effect

execute if entity @s[tag=smolmen.blue_beacon] run data modify storage smolmen:const blue_beacon set value {}
execute if entity @s[tag=smolmen.blue_beacon] run data modify storage smolmen:const blue_beacon.levels set from block ~ ~ ~ Levels
execute if entity @s[tag=smolmen.blue_beacon] run data modify storage smolmen:const blue_beacon.primary_effect set from block ~ ~ ~ primary_effect
execute if entity @s[tag=smolmen.blue_beacon] run data modify storage smolmen:const blue_beacon.secondary_effect set from block ~ ~ ~ secondary_effect
