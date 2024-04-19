
execute if score #timer.20 smolmen.dummy matches 0 run playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 6 2

execute if score #timer.20 smolmen.dummy matches 0 run scoreboard players add @s smolmen.dummy 1
execute if entity @s[tag=smolmen.red_beacon] store result bossbar smolmen:red_beacon value run scoreboard players get @s smolmen.dummy
execute if entity @s[tag=smolmen.blue_beacon] store result bossbar smolmen:blue_beacon value run scoreboard players get @s smolmen.dummy

execute if score @s smolmen.dummy >= #max_health smolmen.dummy run function smolmen:beacons/regeneration_end
