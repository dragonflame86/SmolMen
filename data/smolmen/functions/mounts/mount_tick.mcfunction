## Ticks mount movement code
execute if predicate smolmen:in_water run scoreboard players operation smolmen.speed_multiplier smolmen.dummy = smolmen.water_speed smolmen.dummy

data modify entity @s Rotation set from entity @p Rotation

execute store result score smolmen.motionX smolmen.dummy on passengers run data get entity @s Motion[0] 1000
execute store result score smolmen.motionZ smolmen.dummy on passengers run data get entity @s Motion[2] 1000

scoreboard players operation smolmen.motionX smolmen.dummy *= smolmen.speed_multiplier smolmen.dummy
scoreboard players operation smolmen.motionZ smolmen.dummy *= smolmen.speed_multiplier smolmen.dummy

execute store result entity @s Motion[0] double 0.001 run scoreboard players get smolmen.motionX smolmen.dummy
execute store result entity @s Motion[2] double 0.001 run scoreboard players get smolmen.motionZ smolmen.dummy

scoreboard players operation smolmen.speed_multiplier smolmen.dummy = smolmen.land_speed smolmen.dummy