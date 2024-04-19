
bossbar set smolmen:blue_beacon players

execute unless entity 9e6899f4-114c-4cf5-8140-b5bac8423526 run tellraw @s {"text":"The Blue Beacon does not exists.", "color":"red"}
execute unless entity 9e6899f4-114c-4cf5-8140-b5bac8423526 run return fail

execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 at @s run forceload remove ~ ~
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 at @s run setblock ~ ~ ~ minecraft:air
kill 9e6899f4-114c-4cf5-8140-b5bac8423526
