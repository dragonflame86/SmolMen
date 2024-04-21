
scoreboard players set #loop smolmen.dummy 100
execute anchored eyes positioned ^ ^ ^ run function smolmen:player/check_for_beacon_2

execute if score #loop smolmen.dummy matches -10 run attribute @s[tag=smolmen.restricted.all] minecraft:player.block_interaction_range modifier remove 447fc5c3-5d47-4aba-8525-3ab4faf87b8b
execute if score #loop smolmen.dummy matches -10 run tag @s remove smolmen.restricted.all
