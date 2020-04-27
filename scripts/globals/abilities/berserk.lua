-----------------------------------
-- Ability: Berserk
-- Enhances attacks but weakens defense.
-- Obtained: Warrior Level 15
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local power = 25 + player:getMod(tpz.mod.BERSERK_EFFECT)
    local duration = 180 + player:getMod(tpz.mod.BERSERK_DURATION)
    player:addStatusEffect(tpz.effect.BERSERK, power, 0, duration)

    return tpz.effect.BERSERK
end
