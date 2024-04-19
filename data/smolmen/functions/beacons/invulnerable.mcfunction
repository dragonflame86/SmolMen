
execute if score #timer.100 smolmen.dummy matches 0 run playsound minecraft:block.amethyst_block.chime block @a ~ ~ ~ 10 1
execute if score #timer.100 smolmen.dummy matches 33 run playsound minecraft:block.amethyst_block.chime block @a ~ ~ ~ 10 1.5
execute if score #timer.100 smolmen.dummy matches 66 run playsound minecraft:block.amethyst_block.chime block @a ~ ~ ~ 10 0.7


execute if score #timer.20 smolmen.dummy matches 0 run scoreboard players remove @s smolmen.dummy 1
execute if score @s smolmen.dummy <= #max_health smolmen.dummy run tag @s remove smolmen.invulnerable
execute if score @s smolmen.dummy <= #max_health smolmen.dummy if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon color red
execute if score @s smolmen.dummy <= #max_health smolmen.dummy if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon color blue
execute if score @s smolmen.dummy <= #max_health smolmen.dummy if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon style notched_20
execute if score @s smolmen.dummy <= #max_health smolmen.dummy if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon style notched_20


execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:speed 3 2 false
execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:haste 3 2 false
execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:resistance 3 2 false
execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:strength 3 2 false
execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:regeneration 3 1 false
execute if entity @s[tag=smolmen.red_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=red,dx=100,dz=100,dy=400] minecraft:fire_resistance 3 0 false

execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:speed 3 2 false
execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:haste 3 2 false
execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:resistance 3 2 false
execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:strength 3 2 false
execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:regeneration 3 1 false
execute if entity @s[tag=smolmen.blue_beacon] if score #timer.20 smolmen.dummy matches 0 positioned ~-50 -64 ~-50 run effect give @a[team=blue,dx=100,dz=100,dy=400] minecraft:fire_resistance 3 0 false
