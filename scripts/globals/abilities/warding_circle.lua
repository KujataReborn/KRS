-----------------------------------
-- Ability: Warding Circle
-- Grants resistance, defense, and attack against Demons to party members within the area of effect.
-- Obtained: Samurai Level 5
-- Recast Time: 00:05:00 (Can be reduced to 00:08:20 using Merit Points)
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local duration = 180 + player:getMod(tpz.mod.WARDING_CIRCLE_DURATION)
    target:addStatusEffect(tpz.effect.WARDING_CIRCLE, 15, 0, duration)
end
