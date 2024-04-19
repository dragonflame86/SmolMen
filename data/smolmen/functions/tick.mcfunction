## Tick these functions

execute as @a[tag=!smolmen.smol] run function smolmen:setup
execute as @e[type=player,scores={smolmen.death=1..}] run function smolmen:respawn
execute as @a[predicate=smolmen:mounted] at @s run function smolmen:mounts/mount_check

execute as @a[scores={smolmen.wfoas=1..}] at @s function smolmen:wfoas
execute as @a if items entity @s container.* cobblestone[custom_data~{gui:1b}] clear @s *[custom_data~{gui:1b}]
append function smolmen:wfoas:
    scoreboard players reset @s smolmen.wfoas

#tellraw dragoncommands [{"nbt":"Motion","entity": "dragoncommands"}]

# Prepended from stack_size modules
as @e[type=item,tag=!smolmen.checked] function ./check_items

append function ./check_items:
    tag @s add smolmen.checked