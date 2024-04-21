
bossbar set smolmen:red_beacon players

execute unless entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 run tellraw @s {"text":"The Red Beacon does not exists.", "color":"red"}
execute unless entity a88e45ac-cfaf-45e4-85ca-05240c8b23b8 run return fail

execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 at @s run forceload remove ~ ~
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 at @s run setblock ~ ~ ~ minecraft:air

execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 on passengers run kill @s
kill a88e45ac-cfaf-45e4-85ca-05240c8b23b8
