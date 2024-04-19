
tag @s remove smolmen.regenerating
tag @s add smolmen.invulnerable

setblock ~ ~ ~ minecraft:beacon
data modify entity @s block_state.Name set value "minecraft:beacon"

scoreboard players add @s smolmen.dummy 30
execute if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon color white
execute if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon color white
execute if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon style progress
execute if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon style progress

execute if entity @s[tag=smolmen.red_beacon] run tellraw @a {"text":"The Red Beacon regenerated! Respawn and vanguish the invaders!","color":"green"}
execute if entity @s[tag=smolmen.blue_beacon] run tellraw @a {"text":"The Blue Beacon regenerated! Respawn and vanguish the invaders!","color":"green"}
