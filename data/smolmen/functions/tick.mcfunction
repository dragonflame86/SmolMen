
# Player Control
execute as @a at @s run function smolmen:player/tick
execute as @e[type=player,scores={smolmen.death=1..}] run function smolmen:player/respawn

# Prepended from stack_size modules
execute as @e[type=item,tag=!smolmen.checked] function ./check_items
append function ./check_items:
    tag @s add smolmen.checked
