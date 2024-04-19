
execute if entity 9e6899f4-114c-4cf5-8140-b5bac8423526 run tellraw @s {"text":"The Blue Beacon already exists.", "color":"red"}
execute if entity 9e6899f4-114c-4cf5-8140-b5bac8423526 run return fail

forceload add ~ ~
setblock ~ ~ ~ minecraft:beacon

execute align xyz run summon minecraft:block_display ~0.5 ~0.5 ~0.5 {Tags:["smolmen.blue_beacon"], Glowing: 1b, block_state:{Name:"minecraft:beacon"}, UUID: [I; -1637312012, 290213109, -2126465606, -935185114]}
data modify entity 9e6899f4-114c-4cf5-8140-b5bac8423526 transformation.translation set value [-0.51f,-0.51f,-0.51f]
data modify entity 9e6899f4-114c-4cf5-8140-b5bac8423526 transformation.scale set value [0.98f,0.98f,0.98f]
scoreboard players set 9e6899f4-114c-4cf5-8140-b5bac8423526 smolmen.dummy 60
team join blue 9e6899f4-114c-4cf5-8140-b5bac8423526
