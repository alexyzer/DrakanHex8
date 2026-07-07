schedule function drakanhex:tick20 20 replace
execute store result score limit_counter DrakanHex if entity @e[limit=500, type=allay]
execute if score limit_counter DrakanHex matches 500 as @e[sort=random, type=allay] run function drakanhex:entity-limit
execute store result score limit_counter DrakanHex if entity @e[limit=2000, type=item]
execute if score limit_counter DrakanHex matches 2000 as @e[sort=random, type=item] run function drakanhex:entity-limit