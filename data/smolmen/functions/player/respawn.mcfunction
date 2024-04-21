
attribute @s minecraft:generic.max_health base set 10
attribute @s minecraft:generic.scale base set 0.4
attribute @s minecraft:generic.movement_speed base set 0.075
attribute @s minecraft:generic.jump_strength base set 0.37

raw attribute @s minecraft:generic.attack_damage modifier add 1234-0-0-0-1 "smolDamage" -0.5 add_multiplied_total

scoreboard players set @s smolmen.death 0

execute if entity @s[team=red] if entity @e[tag=smolmen.red_beacon,tag=smolmen.regenerating] run tag @s add smolmen.dead
execute if entity @s[team=blue] if entity @e[tag=smolmen.blue_beacon,tag=smolmen.regenerating] run tag @s add smolmen.dead
execute if entity @s[tag=smolmen.dead] return run gamemode spectator @s

execute if entity @s[team=red] function ~/../give_team_items {map_id: 20, hat_cmd: 2, team: "Red", color: "red"}
execute if entity @s[team=blue] function ~/../give_team_items {map_id: 24, hat_cmd: 3, team: "Blue", color: "blue"}

function ~/../give_team_items:
    clear @s *[custom_data~{team_item:1b}]
    $give @s filled_map[map_id=$(map_id),custom_data={team_item:1b, team: "$(color)"},item_name='{"text": "$(team) Team Map","color": "$(color)"}', lore=['{"text": "You will respawn with this map.","color": "gray", "italic": false}'], hide_additional_tooltip={}, max_stack_size=1, can_place_on={blocks: ["minecraft:brown_banner", "minecraft:green_banner"]}]
    $item replace entity @s armor.head with barrel[custom_model_data=$(hat_cmd), custom_data={team_item:1b}, item_name='{"text": "$(team) Beard", "color": "$(color)"}', enchantments={"minecraft:binding_curse": 1}, enchantment_glint_override=false, hide_additional_tooltip={}]