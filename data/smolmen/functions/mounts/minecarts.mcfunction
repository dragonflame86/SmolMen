
execute unless block ~ ~ ~ minecraft:powered_rail[powered=true] run return fail

data modify storage smolmen:const motion set from entity @s Motion
execute store result score #x smolmen.dummy run data get storage smolmen:const motion[0]
execute store result score #y smolmen.dummy run data get storage smolmen:const motion[1]
execute store result score #z smolmen.dummy run data get storage smolmen:const motion[2]

scoreboard players set #direction smolmen.dummy 0
execute if score #x smolmen.dummy matches 1.. run scoreboard players set #direction smolmen.dummy 1
execute if score #x smolmen.dummy matches ..-1 run scoreboard players set #direction smolmen.dummy 2
execute if score #z smolmen.dummy matches 1.. run scoreboard players set #direction smolmen.dummy 3
execute if score #z smolmen.dummy matches ..-1 run scoreboard players set #direction smolmen.dummy 4

execute unless score #y smolmen.dummy matches 0 run scoreboard players set #direction smolmen.dummy 0

execute if score #direction smolmen.dummy matches 1 positioned ~0.5 ~ ~ if block ~ ~ ~ minecraft:powered_rail[powered=true] run tp @s ~ ~ ~
execute if score #direction smolmen.dummy matches 2 positioned ~-0.5 ~ ~ if block ~ ~ ~ minecraft:powered_rail[powered=true] run tp @s ~ ~ ~
execute if score #direction smolmen.dummy matches 3 positioned ~ ~ ~0.5 if block ~ ~ ~ minecraft:powered_rail[powered=true] run tp @s ~ ~ ~
execute if score #direction smolmen.dummy matches 4 positioned ~ ~ ~-0.5 if block ~ ~ ~ minecraft:powered_rail[powered=true] run tp @s ~ ~ ~
