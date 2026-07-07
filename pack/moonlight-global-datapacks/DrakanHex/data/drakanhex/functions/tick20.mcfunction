schedule function drakanhex:tick20 20 replace
execute store result score limit_counter DrakanHex if entity @e[limit=501, type=allay]
execute if score limit_counter DrakanHex matches 501 as @e[sort=random, type=allay] run function drakanhex:entity-limit
execute store result score limit_counter DrakanHex if entity @e[limit=2001, type=item]
execute if score limit_counter DrakanHex matches 2001 as @e[sort=random, type=item] run function drakanhex:entity-limit