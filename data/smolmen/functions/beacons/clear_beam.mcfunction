
execute unless block ~ ~ ~ #smolmen:air run setblock ~ ~ ~ minecraft:air destroy
execute positioned ~ ~1 ~ unless block ~ ~ ~ minecraft:bedrock unless block ~ ~ ~ minecraft:void_air run function smolmen:beacons/clear_beam
