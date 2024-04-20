
advancement revoke @s only smolmen:technical/use_goat_horn
item replace entity @s weapon.mainhand from entity @s weapon.mainhand
execute if entity @s[tag=!smolmen.leader] run return fail
execute if score @s smolmen.drill_cooldown matches 1.. return fail

scoreboard players set @s smolmen.drill_cooldown 139

scoreboard players set #horn smolmen.dummy 0
execute if items entity @s weapon.* minecraft:goat_horn[custom_data~{smolmen:{attack_horn:1b}}] run scoreboard players set #horn smolmen.dummy 1
execute if items entity @s weapon.* minecraft:goat_horn[custom_data~{smolmen:{defend_horn:1b}}] run scoreboard players set #horn smolmen.dummy 2
execute if items entity @s weapon.* minecraft:goat_horn[custom_data~{smolmen:{explore_horn:1b}}] run scoreboard players set #horn smolmen.dummy 3
execute if items entity @s weapon.* minecraft:goat_horn[custom_data~{smolmen:{mine_horn:1b}}] run scoreboard players set #horn smolmen.dummy 4

# red team
execute if score #horn smolmen.dummy matches 1 if entity @s[team=red] run tellraw @a[team=red] {"translate":"text.smolmen.attack", "color":"gold"}
execute if score #horn smolmen.dummy matches 2 if entity @s[team=red] run tellraw @a[team=red] {"translate":"text.smolmen.defend", "color":"gold"}
execute if score #horn smolmen.dummy matches 3 if entity @s[team=red] run tellraw @a[team=red] {"translate":"text.smolmen.explore", "color":"gold"}
execute if score #horn smolmen.dummy matches 4 if entity @s[team=red] run tellraw @a[team=red] {"translate":"text.smolmen.mine", "color":"gold"}

execute if score #horn smolmen.dummy matches 1 if entity @s[team=red] run effect give @a[team=red,distance=..48] minecraft:strength 30 0
execute if score #horn smolmen.dummy matches 2 if entity @s[team=red] run effect give @a[team=red,distance=..48] minecraft:resistance 30 1
execute if score #horn smolmen.dummy matches 3 if entity @s[team=red] run effect give @a[team=red,distance=..48] minecraft:speed 60 0
execute if score #horn smolmen.dummy matches 4 if entity @s[team=red] run effect give @a[team=red,distance=..48] minecraft:haste 30 0

# blue team
execute if score #horn smolmen.dummy matches 1 if entity @s[team=blue] run tellraw @a[team=blue] {"translate":"text.smolmen.attack", "color":"gold"}
execute if score #horn smolmen.dummy matches 2 if entity @s[team=blue] run tellraw @a[team=blue] {"translate":"text.smolmen.defend", "color":"gold"}
execute if score #horn smolmen.dummy matches 3 if entity @s[team=blue] run tellraw @a[team=blue] {"translate":"text.smolmen.explore", "color":"gold"}
execute if score #horn smolmen.dummy matches 4 if entity @s[team=blue] run tellraw @a[team=blue] {"translate":"text.smolmen.mine", "color":"gold"}

execute if score #horn smolmen.dummy matches 1 if entity @s[team=blue] run effect give @a[team=blue,distance=..48] minecraft:strength 30 0
execute if score #horn smolmen.dummy matches 2 if entity @s[team=blue] run effect give @a[team=blue,distance=..48] minecraft:resistance 30 1
execute if score #horn smolmen.dummy matches 3 if entity @s[team=blue] run effect give @a[team=blue,distance=..48] minecraft:speed 60 0
execute if score #horn smolmen.dummy matches 4 if entity @s[team=blue] run effect give @a[team=blue,distance=..48] minecraft:haste 30 0
