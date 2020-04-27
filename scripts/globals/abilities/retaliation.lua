-----------------------------------
-- Ability: Retaliation
-- Allows you to counterattack but reduces movement speed.
-- Obtained: Warrior Level 60
-- Recast Time: 00:03:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.RETALIATION, 1, 0, 180)
end
