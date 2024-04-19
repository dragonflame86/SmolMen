
execute if entity @s[tag=smolmen.red_beacon] run tellraw @a {"text":"The Red Beacon has been destroyed! Red team cannot respawn until it regenerates!","color":"green"}
execute if entity @s[tag=smolmen.blue_beacon] run tellraw @a {"text":"The Blue Beacon has been destroyed! Blue team cannot respawn until it regenerates!","color":"green"}

execute if entity @s[tag=smolmen.red_beacon] run bossbar set smolmen:red_beacon color purple
execute if entity @s[tag=smolmen.blue_beacon] run bossbar set smolmen:blue_beacon color purple

setblock ~ ~ ~ minecraft:bedrock
playsound minecraft:entity.lightning_bolt.thunder voice @a ~ ~ ~ 1024 1.5
data modify entity @s block_state.Name set value "minecraft:bedrock"

tag @s add smolmen.regenerating
