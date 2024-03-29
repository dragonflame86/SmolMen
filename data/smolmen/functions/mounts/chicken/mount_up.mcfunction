## Mounts the player upon a chicken
ride @s mount @e[type=minecraft:chicken,nbt=!{InLove:0},sort=nearest,limit=1,distance=..3, tag=!smolmen.vehicle]
execute as @e[type=minecraft:chicken,nbt=!{InLove:0},sort=nearest,limit=1,distance=..3, tag=!smolmen.vehicle] at @s run function smolmen:mounts/prepare_mount

advancement revoke @s only smolmen:technical/feed_seeds