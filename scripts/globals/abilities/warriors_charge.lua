-----------------------------------
-- Ability: Warrior's Charge
-- Will double your next attack.
-- Obtained: Warrior Level 75 (Merit)
-- Recast Time: 00:15:00 (Can be reduced to 00:05:00 using Merit Points)
-- Duration: 00:01:00 or next attack
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merit = player:getMerit(tpz.merit.WARRIORS_CHARGE)
    if merit >= 2 then
        local reduction = (merit - 1) * 150 -- 00:02:30 for each merit upgrade after unlocking

        ability:setRecast(ability:getRecast() - reduction)
    end

    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.WARRIOR_S_CHARGE, 0, 0, 60)
end
