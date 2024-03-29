## Scheduled function to make sure mounts are restored to their previous state

execute as @e[tag=smolmen.vehicle] unless predicate smolmen:has_passenger run function smolmen:mounts/restore_mount
schedule function smolmen:mounts/mount_cleanup 1s replace