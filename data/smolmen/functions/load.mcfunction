## General Setup

schedule function smolmen:mounts/mount_cleanup 10s replace

scoreboard objectives add smolmen.death deathCount
scoreboard objectives add smolmen.leave minecraft.custom:minecraft.leave_game
scoreboard objectives add smolmen.dummy dummy
scoreboard objectives add smolmen.const dummy

scoreboard objectives add smolmen.team trigger
scoreboard objectives add smolmen.id dummy

scoreboard objectives add smolmen.wfoas minecraft.used:minecraft.warped_fungus_on_a_stick

team add red {"text": "Red", "color": "red"}
team modify red color red
team modify red nametagVisibility hideForOtherTeams

team add blue {"text": "Blue", "color": "blue"}
team modify blue color blue
team modify blue nametagVisibility hideForOtherTeams


for i in range(2, 10, 1):
    scoreboard players set f"#{i}" smolmen.const i

for i in range(10, 101, 10):
    scoreboard players set f"#{i}" smolmen.const i


execute summon marker function ~/get_world_spawn:
    data modify storage smolmen:temp pos set from entity @s Pos

    data modify storage smolmen:const world_spawn set value {x: 0, y: 0, z: 0} 
    store result storage smolmen:const world_spawn.x int 1 data get storage smolmen:temp pos[0]
    store result storage smolmen:const world_spawn.y int 1 data get storage smolmen:temp pos[1]
    store result storage smolmen:const world_spawn.z int 1 data get storage smolmen:temp pos[2]

    kill @s

tellraw @a [{"text":"[Smol Men] ", "bold": true, "color": "gold"},{"text":"loaded.", "bold": false, "color": "white"}]

gamerule reducedDebugInfo true

schedule function ./1_second 1s replace