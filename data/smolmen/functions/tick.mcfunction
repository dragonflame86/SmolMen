
# Scoreboard timers
scoreboard players add #timer.20 smolmen.dummy 1
execute if score #timer.20 smolmen.dummy matches 20.. run scoreboard players set #timer.20 smolmen.dummy 0

scoreboard players add #timer.100 smolmen.dummy 1
execute if score #timer.100 smolmen.dummy matches 100.. run scoreboard players set #timer.100 smolmen.dummy 0

scoreboard players add #timer.6000 smolmen.dummy 1
execute if score #timer.6000 smolmen.dummy matches 6000.. run scoreboard players set #timer.6000 smolmen.dummy 0

# Remove gm take from players so beacons & sites can add it back
tag @a remove smolmen.restricted
tag @a remove smolmen.restricted.in_base

# Beacons
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 at @s run function smolmen:beacons/tick
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 at @s run function smolmen:beacons/tick

as @e[type=block_display,tag=smolmen.drill_site] at @s function ./drill/tick

as @e[type=item_display,tag=smolmen.trader] at @s function ./trader/tick

# Minecarts
execute as @e[type=#smolmen:minecarts] at @s run function smolmen:mounts/minecarts

# Player Control
execute as @a at @s run function smolmen:player/tick
execute as @e[type=player,scores={smolmen.death=1..}] run function smolmen:player/respawn

# Prepended from stack_size modules
execute as @e[type=item,tag=!smolmen.checked] function ./check_items
append function ./check_items:
    tag @s add smolmen.checked

    if items entity @s contents minecraft:filled_map[minecraft:custom_data~{team_item:1b}] kill @s
    if items entity @s contents minecraft:barrel[minecraft:custom_data~{team_item:1b}] kill @s
    if items entity @s contents minecraft:goat_horn[minecraft:custom_data~{smolmen:{leader_horn:1b}}] kill @s

# Reduce Arrow Damage
execute as @e[type=#minecraft:arrows,tag=!smolmen.checked] function ./nerf_arrows
append function ./nerf_arrows:
    execute store result entity @s damage double 0.5 run data get entity @s damage
    tag @s add smolmen.checked

# Scoreboard Display
# red
data modify storage smolmen:temp obj set value {display: "red_beacon", value: 0, "color": "red"}
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 store result storage smolmen:temp obj.value int 1 run scoreboard players get @s smolmen.dummy
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 if entity @s[tag=smolmen.regenerating] run data modify storage smolmen:temp obj set value {display: "red_beacon", value: "Regenerating", color: "green"}
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 if entity @s[tag=smolmen.invulnerable] run data modify storage smolmen:temp obj set value {display: "red_beacon", value: "Invulnerable", color: "white"}
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

function smolmen:m.set_leader_red with storage smolmen:const leaders.red

data modify storage smolmen:temp obj set value {display: "red_beacon_kills", value: 0, color: "red"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #red_beacon_kills smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

data modify storage smolmen:temp obj set value {display: "red_player_kills", value: 0, color: "red"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #red_player_kills smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

data modify storage smolmen:temp obj set value {display: "red_leader_deaths", value: 0, color: "red"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #red_leader_deaths smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

# blue
data modify storage smolmen:temp obj set value {display: "blue_beacon", value: 0, "color": "blue"}
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 store result storage smolmen:temp obj.value int 1 run scoreboard players get @s smolmen.dummy
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 if entity @s[tag=smolmen.regenerating] run data modify storage smolmen:temp obj set value {display: "blue_beacon", value: "Regenerating", color: "green"}
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 if entity @s[tag=smolmen.invulnerable] run data modify storage smolmen:temp obj set value {display: "blue_beacon", value: "Invulnerable", color: "white"}
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

function smolmen:m.set_leader_blue with storage smolmen:const leaders.blue

data modify storage smolmen:temp obj set value {display: "blue_beacon_kills", value: 0, color: "blue"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #blue_beacon_kills smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

data modify storage smolmen:temp obj set value {display: "blue_player_kills", value: 0, color: "blue"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #blue_player_kills smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj

data modify storage smolmen:temp obj set value {display: "blue_leader_deaths", value: 0, color: "blue"}
execute store result storage smolmen:temp obj.value int 1 run scoreboard players get #blue_leader_deaths smolmen.dummy
function smolmen:m.set_scoreboard_value with storage smolmen:temp obj
