
execute if entity @s[team=red] at @e[tag=smolmen.red_beacon] run tp @s ~ ~2 ~
execute if entity @s[team=blue] at @e[tag=smolmen.blue_beacon] run tp @s ~ ~2 ~
gamemode survival @s
tag @s remove smolmen.dead
