
# Scoreboard timers
scoreboard players add #timer.20 smolmen.dummy 1
execute if score #timer.20 smolmen.dummy matches 20.. run scoreboard players set #timer.20 smolmen.dummy 0

scoreboard players add #timer.100 smolmen.dummy 1
execute if score #timer.100 smolmen.dummy matches 100.. run scoreboard players set #timer.100 smolmen.dummy 0

# Player Control
execute as @a at @s run function smolmen:player/tick
execute as @e[type=player,scores={smolmen.death=1..}] run function smolmen:player/respawn

# Beacons
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 at @s run function smolmen:beacons/tick
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 at @s run function smolmen:beacons/tick

# Prepended from stack_size modules
execute as @e[type=item,tag=!smolmen.checked] function ./check_items
append function ./check_items:
    tag @s add smolmen.checked
