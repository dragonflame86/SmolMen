## General Setup

# schedule
schedule function smolmen:mounts/mount_cleanup 10s replace

# init objectives
scoreboard objectives add smolmen.wfoas minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add smolmen.leave minecraft.custom:minecraft.leave_game
scoreboard objectives add smolmen.health health {"text":"Health"}
scoreboard objectives add smolmen.death deathCount {"text":"Deaths"}

scoreboard objectives add smolmen.dummy dummy
scoreboard objectives add smolmen.const dummy
scoreboard objectives add smolmen.display dummy {"text":"Smolmen Game", "color":"gold"}

scoreboard objectives add smolmen.team trigger
scoreboard objectives add smolmen.id dummy
scoreboard objectives add smolmen.combat dummy

scoreboard objectives setdisplay below_name smolmen.health
scoreboard objectives setdisplay list smolmen.death
scoreboard objectives setdisplay sidebar smolmen.display

scoreboard objectives add smolmen.drill_cooldown dummy

scoreboard objectives add smolmen.drop_map minecraft.dropped:minecraft.filled_map
scoreboard objectives add smolmen.drop_horn minecraft.dropped:minecraft.goat_horn

scoreboard objectives add smolmen.kill_red teamkill.red
scoreboard objectives add smolmen.kill_blue teamkill.blue

# init teams
team add red {"text": "Red", "color": "red"}
team modify red color red
team modify red nametagVisibility hideForOtherTeams
team modify red seeFriendlyInvisibles true

team add blue {"text": "Blue", "color": "blue"}
team modify blue color blue
team modify blue nametagVisibility hideForOtherTeams
team modify blue seeFriendlyInvisibles true

# init bossbars
bossbar add smolmen:red_beacon {"text":"Red Beacon","color":"dark_red","bold":true}
bossbar set smolmen:red_beacon color red
bossbar set smolmen:red_beacon style notched_20
bossbar set smolmen:red_beacon max 40
bossbar set smolmen:red_beacon value 40
execute as a88e45ac-cfaf-45e4-85ca-05240c8b23b8 store result bossbar smolmen:red_beacon value run scoreboard players get @s smolmen.dummy

bossbar add smolmen:blue_beacon {"text":"Blue Beacon","color":"dark_aqua","bold":true}
bossbar set smolmen:blue_beacon color blue
bossbar set smolmen:blue_beacon style notched_20
bossbar set smolmen:blue_beacon max 40
bossbar set smolmen:blue_beacon value 40
execute as 9e6899f4-114c-4cf5-8140-b5bac8423526 store result bossbar smolmen:blue_beacon value run scoreboard players get @s smolmen.dummy

# init constants
for i in range(2, 10, 1):
    scoreboard players set f"#{i}" smolmen.const i

for i in range(10, 101, 10):
    scoreboard players set f"#{i}" smolmen.const i

# init stats
scoreboard players add #red_beacon_kills smolmen.dummy 0
scoreboard players add #red_player_kills smolmen.dummy 0
scoreboard players add #red_leader_deaths smolmen.dummy 0
scoreboard players add #blue_beacon_kills smolmen.dummy 0
scoreboard players add #blue_player_kills smolmen.dummy 0
scoreboard players add #blue_leader_deaths smolmen.dummy 0

scoreboard players set red_leader smolmen.display 10
scoreboard players display name red_leader smolmen.display {"text":"Red Leader "}

scoreboard players set red_beacon smolmen.display 9
scoreboard players display name red_beacon smolmen.display {"text":"Red Beacon Status "}

scoreboard players set red_beacon_kills smolmen.display 8
scoreboard players display name red_beacon_kills smolmen.display {"text":"Red Beacon Kills"}

scoreboard players set red_player_kills smolmen.display 7
scoreboard players display name red_player_kills smolmen.display {"text":"Red Team Kills"}

scoreboard players set red_leader_deaths smolmen.display 6
scoreboard players display name red_leader_deaths smolmen.display {"text":"Red Leader Deaths"}

scoreboard players set break smolmen.display 5
scoreboard players display name break smolmen.display {"text":"=================", "color":"gray"}
scoreboard players display numberformat break smolmen.display blank

scoreboard players set blue_leader smolmen.display 4
scoreboard players display name blue_leader smolmen.display {"text":"Blue Leader "}

scoreboard players set blue_beacon smolmen.display 3
scoreboard players display name blue_beacon smolmen.display {"text":"Blue Beacon Status "}

scoreboard players set blue_beacon_kills smolmen.display 2
scoreboard players display name blue_beacon_kills smolmen.display {"text":"Blue Beacon Kills"}

scoreboard players set blue_player_kills smolmen.display 1
scoreboard players display name blue_player_kills smolmen.display {"text":"Blue Team Kills"}

scoreboard players set blue_leader_deaths smolmen.display 0
scoreboard players display name blue_leader_deaths smolmen.display {"text":"Blue Leader Deaths"}

# mark world spawn
execute summon marker function ~/get_world_spawn:
    data modify storage smolmen:temp pos set from entity @s Pos

    data modify storage smolmen:const world_spawn set value {x: 0, y: 0, z: 0} 
    store result storage smolmen:const world_spawn.x int 1 data get storage smolmen:temp pos[0]
    store result storage smolmen:const world_spawn.y int 1 data get storage smolmen:temp pos[1]
    store result storage smolmen:const world_spawn.z int 1 data get storage smolmen:temp pos[2]

    kill @s

tellraw @a [{"text":"[Smol Men] ", "bold": true, "color": "gold"},{"text":"loaded.", "bold": false, "color": "white"}]

# configure gamerules
gamerule reducedDebugInfo true
gamerule disableRaids true
gamerule doPatrolSpawning false
gamerule doInsomnia false
gamerule doTraderSpawning false
gamerule spectatorsGenerateChunks false
gamerule randomTickSpeed 2
gamerule snowAccumulationHeight -1

schedule function ./1_second 1s replace
