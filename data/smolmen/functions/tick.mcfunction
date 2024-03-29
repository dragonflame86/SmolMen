## Tick these functions

execute as @a[tag=!smolmen.smol] run function smolmen:respawn
execute as @e[type=player,scores={smolmen.death=1..}] run function smolmen:respawn
execute as @a at @s if predicate smolmen:mounted run function smolmen:mounts/mount_check
#tellraw dragoncommands [{"nbt":"Motion","entity": "dragoncommands"}]