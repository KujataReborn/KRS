-----------------------------------
-- Ability: Aggressor
-- Enhances accuracy but impairs evasion.
-- Obtained: Warrior Level 45
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local power = 25 -- Accuracy and Evasion
    local subpower = player:getMerit(tpz.merit.AGGRESSIVE_AIM) -- Ranged Accuracy
    local duration = 180 + player:getMod(tpz.mod.AGGRESSOR_DURATION)
    player:addStatusEffect(tpz.effect.AGGRESSOR, power, 0, duration, 0, subpower)
end
