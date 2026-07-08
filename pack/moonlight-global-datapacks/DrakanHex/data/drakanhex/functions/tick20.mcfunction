#schedule function drakanhex:tick20 20 replace

execute store result score limit_counter DrakanHex if entity @e[limit=501, type=allay]
scoreboard players operation #tmp DrakanHex = limit_counter DrakanHex
execute if score limit_counter DrakanHex matches 501 as @e[sort=random, type=allay] run function drakanhex:entity-limit
scoreboard players operation #tmp DrakanHex -= limit_counter DrakanHex
execute unless score #tmp DrakanHex matches 0 run tellraw @a [{"text":"Превышение количества аллеев ","color":"red"},{"score":{"name":"#tmp","objective":"DrakanHex"}},{"text":"/500"}]

execute store result score limit_counter DrakanHex if entity @e[limit=2001, type=item]
scoreboard players operation #tmp DrakanHex = limit_counter DrakanHex
execute if score limit_counter DrakanHex matches 2001 as @e[sort=random, type=item] run function drakanhex:entity-limit
scoreboard players operation #tmp DrakanHex -= limit_counter DrakanHex
execute unless score #tmp DrakanHex matches 0 run tellraw @a [{"text":"Превышение количества предметов ","color":"red"},{"score":{"name":"#tmp","objective":"DrakanHex"}},{"text":"/2000"}]