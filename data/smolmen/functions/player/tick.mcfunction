
execute if entity @s[tag=!smolmen.smol] run function smolmen:player/setup
execute if entity @s[predicate=smolmen:mounted] at @s run function smolmen:mounts/mount_check

# right click effects
execute if entity @s[scores={smolmen.wfoas=1..}] at @s function smolmen:player/wfoas
append function smolmen:player/wfoas:
    scoreboard players reset @s smolmen.wfoas

# gm control
execute if entity @s[tag=smolmen.restricted.in_base] run tag @s add smolmen.restricted

execute if entity @s[gamemode=survival,tag=smolmen.restricted] run gamemode adventure @s
execute if entity @s[gamemode=adventure,tag=!smolmen.restricted] run gamemode survival @s
execute if entity @s[gamemode=!spectator,tag=smolmen.dead] run gamemode spectator @s

execute if entity @s[team=red,tag=smolmen.dead] unless entity @p[team=red,distance=0.1..] run spectate @p[team=red] @s
execute if entity @s[team=blue,tag=smolmen.dead] unless entity @p[team=blue,distance=0.1..] run spectate @p[team=blue] @s

execute if entity @s[team=red,tag=smolmen.dead] unless entity @e[tag=smolmen.red_beacon,tag=smolmen.regenerating] run function smolmen:player/exit_dead_state
execute if entity @s[team=blue,tag=smolmen.dead] unless entity @e[tag=smolmen.blue_beacon,tag=smolmen.regenerating] run function smolmen:player/exit_dead_state

attribute @s[tag=smolmen.restricted.in_base,tag=!smolmen.restricted.all,gamemode=adventure] minecraft:player.block_interaction_range modifier add 447fc5c3-5d47-4aba-8525-3ab4faf87b8b "protection" -1 add_multiplied_total
tag @s[tag=smolmen.restricted.in_base,tag=!smolmen.restricted.all,gamemode=adventure] add smolmen.restricted.all
attribute @s[tag=!smolmen.restricted.in_base,tag=smolmen.restricted.all] minecraft:player.block_interaction_range modifier remove 447fc5c3-5d47-4aba-8525-3ab4faf87b8b
tag @s[tag=!smolmen.restricted.in_base,tag=smolmen.restricted.all] remove smolmen.restricted.all

# remove gui items from inv
execute if items entity @s container.* cobblestone[custom_data~{gui:1b}] clear @s *[custom_data~{gui:1b}]

# remove opposite team maps from inv
clear @s[team=red] filled_map[custom_data~{team: "blue"}]
clear @s[team=blue] filled_map[custom_data~{team: "red"}]

execute if entity @s[gamemode=survival,tag=!smolmen.op,y=128,dy=1] kill @s 

# process dropped maps
execute if score @s smolmen.drop_map matches 1.. function ~/return_map:
    anchored eyes positioned ^ ^ ^ as @e[type=item,distance=..2] if items entity @s contents filled_map[custom_data~{team_item:1b}] data merge entity @s {PickupDelay:0s, Motion: [0,0,0], Tags:["smolmen.checked"]}
    scoreboard players reset @s smolmen.drop_map

# process dropped goat horns
execute if score @s smolmen.drop_horn matches 1.. function ~/cycle_horn:
    scoreboard players set #horn smolmen.dummy 0
    if entity @s[tag=smolmen.leader] anchored eyes positioned ^ ^ ^ as @e[type=item,distance=..2] if items entity @s contents minecraft:goat_horn[custom_data~{smolmen:{attack_horn:1b}}] scoreboard players set #horn smolmen.dummy 1
    if entity @s[tag=smolmen.leader] anchored eyes positioned ^ ^ ^ as @e[type=item,distance=..2] if items entity @s contents minecraft:goat_horn[custom_data~{smolmen:{defend_horn:1b}}] scoreboard players set #horn smolmen.dummy 2
    if entity @s[tag=smolmen.leader] anchored eyes positioned ^ ^ ^ as @e[type=item,distance=..2] if items entity @s contents minecraft:goat_horn[custom_data~{smolmen:{explore_horn:1b}}] scoreboard players set #horn smolmen.dummy 3
    if entity @s[tag=smolmen.leader] anchored eyes positioned ^ ^ ^ as @e[type=item,distance=..2] if items entity @s contents minecraft:goat_horn[custom_data~{smolmen:{mine_horn:1b}}] scoreboard players set #horn smolmen.dummy 4

    if score #horn smolmen.dummy matches 1 if items entity @s weapon.mainhand * loot give @s loot smolmen:defend_leader_horn
    if score #horn smolmen.dummy matches 1 unless items entity @s weapon.mainhand * loot replace entity @s weapon.mainhand loot smolmen:defend_leader_horn
    if score #horn smolmen.dummy matches 2 if items entity @s weapon.mainhand * loot give @s loot smolmen:explore_leader_horn
    if score #horn smolmen.dummy matches 2 unless items entity @s weapon.mainhand * loot replace entity @s weapon.mainhand loot smolmen:explore_leader_horn
    if score #horn smolmen.dummy matches 3 if items entity @s weapon.mainhand * loot give @s loot smolmen:mine_leader_horn
    if score #horn smolmen.dummy matches 3 unless items entity @s weapon.mainhand * loot replace entity @s weapon.mainhand loot smolmen:mine_leader_horn
    if score #horn smolmen.dummy matches 4 if items entity @s weapon.mainhand * loot give @s loot smolmen:attack_leader_horn
    if score #horn smolmen.dummy matches 4 unless items entity @s weapon.mainhand * loot replace entity @s weapon.mainhand loot smolmen:attack_leader_horn

    scoreboard players reset @s smolmen.drop_horn

# horn cooldown
execute if score @s smolmen.drill_cooldown matches 1.. run scoreboard players remove @s smolmen.drill_cooldown 1

# scoreboard stats
execute if score @s[team=red] smolmen.kill_blue matches 1.. run scoreboard players add #red_player_kills smolmen.dummy 1
execute if score @s[team=blue] smolmen.kill_red matches 1.. run scoreboard players add #blue_player_kills smolmen.dummy 1
scoreboard players reset @s smolmen.kill_red
scoreboard players reset @s smolmen.kill_blue

# nerf night vision
effect give @s[nbt={active_effects:[{id:"minecraft:night_vision"}]},gamemode=!creative,gamemode=!spectator] blindness 2 0 false