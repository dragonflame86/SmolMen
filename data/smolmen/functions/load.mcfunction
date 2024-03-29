## General Setup

schedule function smolmen:mounts/mount_cleanup 10s replace

scoreboard objectives add smolmen.death deathCount
scoreboard objectives add smolmen.dummy dummy

scoreboard players set smolmen.water_speed smolmen.dummy 8
scoreboard players set smolmen.land_speed smolmen.dummy 18

scoreboard players set smolmen.speed_multiplier smolmen.dummy 18

tellraw @a [{"text":"[Smol Men] ", "bold": true, "color": "gold"},{"text":"loaded.", "bold": false, "color": "white"}]