
execute if entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 run tellraw @s {"text":"The Red Beacon already exists.", "color":"red"}
execute if entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 run return fail

forceload add ~ ~
setblock ~ ~ ~ minecraft:beacon

execute align xyz run summon minecraft:block_display ~0.5 ~0.5 ~0.5 {Tags:["smolmen.red_beacon"], Glowing: 1b, block_state:{Name:"minecraft:beacon"}, UUID: [I; -1467071060, -810596892, -2050357980, 210445240], Passengers:[{id:"minecraft:item_display", Tags:["smolmen.red_beacon.border"]}]}
data modify entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 transformation.translation set value [-0.51f,-0.51f,-0.51f]
data modify entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 transformation.scale set value [0.98f,0.98f,0.98f]
scoreboard players set a88e45ac-cfaf-45e4-85ca-05240c8b23b8 smolmen.dummy 60
team join red a88e45ac-cfaf-45e4-85ca-05240c8b23b8

execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 on passengers run item replace entity @s contents with minecraft:arrow[custom_model_data=3]
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 on passengers run data modify entity @s transformation.scale set value [0f, 0f, 0f]
