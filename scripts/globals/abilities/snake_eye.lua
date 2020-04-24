-----------------------------------
-- Ability: Snake Eye
-- Your next roll will automatically be a 1.
-- Obtained: Corsair Level 75
-- Recast Time: 0:15:00
-- Duration: 0:01:00 or the next usage of Phantom Roll or Double-Up
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merit = player:getMerit(tpz.merit.SNAKE_EYE)
    if merit >= 2 then
        local reduction = (merit - 1) * 150 -- 30 seconds for each merit upgrade after unlocking

        ability:setRecast(ability:getRecast() - reduction)
    end

    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.SNAKE_EYE, 1, 0, 60)

    return tpz.effect.SNAKE_EYE
end
