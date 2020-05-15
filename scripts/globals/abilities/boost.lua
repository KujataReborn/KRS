-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 00:00:15
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local power = 12.5 + (player:getMod(tpz.mod.BOOST_EFFECT) / 100)

    if player:hasStatusEffect(tpz.effect.BOOST) then
        local effect = player:getStatusEffect(tpz.effect.BOOST)
        effect:setPower(effect:getPower() + power)
        effect:setTier(effect:getTier() + 1)
        player:addMod(tpz.mod.ATTP, power)
    else
        player:addStatusEffect(tpz.effect.BOOST, power, 1, 180, 0, 0, 1)
    end
end
