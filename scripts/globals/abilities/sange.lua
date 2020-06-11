-----------------------------------
-- Ability: Sange
-- Daken will always activate but consumes shuriken while active.
-- Obtained: Ninja Level 75 Merits
-- Recast Time: 00:03:00 minutes
-- Duration: 00:01:00 minute
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.SANGE, 0, 0, 60)
end
