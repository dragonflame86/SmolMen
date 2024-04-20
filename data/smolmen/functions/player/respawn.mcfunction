
attribute @s minecraft:generic.max_health base set 6
attribute @s minecraft:generic.scale base set 0.4
attribute @s minecraft:generic.movement_speed base set 0.075
attribute @s minecraft:generic.jump_strength base set 0.37

raw attribute @s minecraft:generic.attack_damage modifier add 1234-0-0-0-1 "smolDamage" -0.5 add_multiplied_total

scoreboard players set @s smolmen.death 0

execute if entity @s[team=red] if entity @e[tag=smolmen.red_beacon,tag=smolmen.regenerating] run tag @s add smolmen.dead
execute if entity @s[team=blue] if entity @e[tag=smolmen.blue_beacon,tag=smolmen.regenerating] run tag @s add smolmen.dead
execute if entity @s[tag=smolmen.dead] run gamemode spectator @s
