
execute if block ~ ~ ~ minecraft:beacon run scoreboard players set #loop smolmen.dummy -9

scoreboard players remove #loop smolmen.dummy 1
execute if score #loop smolmen.dummy matches 1.. positioned ^ ^ ^0.1 run function smolmen:player/check_for_beacon_2
