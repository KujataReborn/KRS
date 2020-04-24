-----------------------------------
-- Ability: Fold
-- Erases one roll or bust tpz.effect. Targets self-cast effect with the longest remaining duration.
-- Obtained: Corsair Level 75
-- Recast Time: 00:15:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merit = player:getMerit(tpz.merit.FOLD)
    if merit >= 2 then
        local reduction = (merit - 1) * 150 -- 30 seconds for each merit upgrade after unlocking

        ability:setRecast(ability:getRecast() - reduction)
    end

    if target:hasCorsairEffect() then
        return 0,0
    else
        return tpz.msg.basic.CANNOT_PERFORM,0
    end
end

function onUseAbility(player,target,ability)
    target:fold()

    return tpz.effect.FOLD
end
