
execute if entity @s[tag=!smolmen.smol] run function smolmen:player/setup
execute if entity @s[predicate=smolmen:mounted] at @s run function smolmen:mounts/mount_check

# right click effects
execute if entity @s[scores={smolmen.wfoas=1..}] at @s function smolmen:player/wfoas
append function smolmen:player/wfoas:
    scoreboard players reset @s smolmen.wfoas

# gm control
execute if entity @s[gamemode=survival,tag=smolmen.restricted] run gamemode adventure @s
execute if entity @s[gamemode=adventure,tag=!smolmen.restricted] run gamemode survival @s
execute if entity @s[gamemode=!spectator,tag=smolmen.dead] run gamemode spectator @s

execute if entity @s[team=red,tag=smolmen.dead] unless entity @p[team=red,distance=0.1..] run spectate @p[team=red] @s
execute if entity @s[team=blue,tag=smolmen.dead] unless entity @p[team=blue,distance=0.1..] run spectate @p[team=blue] @s

execute if entity @s[team=red,tag=smolmen.dead] unless entity @e[tag=smolmen.red_beacon,tag=smolmen.regenerating] run function smolmen:player/exit_dead_state
execute if entity @s[team=blue,tag=smolmen.dead] unless entity @e[tag=smolmen.blue_beacon,tag=smolmen.regenerating] run function smolmen:player/exit_dead_state

# remove gui items from inv
execute if items entity @s container.* cobblestone[custom_data~{gui:1b}] clear @s *[custom_data~{gui:1b}]

execute if entity @s[gamemode=survival,tag=!smolmen.op,y=128,dy=1] kill @s 