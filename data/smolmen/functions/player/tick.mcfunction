
execute if entity @s[tag=!smolmen.smol] run function smolmen:player/setup
execute if entity @s[predicate=smolmen:mounted] at @s run function smolmen:mounts/mount_check

execute if entity @s[scores={smolmen.wfoas=1..}] at @s function smolmen:player/wfoas
append function smolmen:player/wfoas:
    scoreboard players reset @s smolmen.wfoas

