-----------------------------------
-- Ability: Footwork
-- Makes kicks your primary mode of attack.
-- Obtained: Monk Level 65
-- Recast Time: 00:05:00
-- Duration: 00:05:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local kickDmgBonus = 18 + player:getMod(tpz.mod.KICK_DMG) -- Kyoshu Kyahan and Dune Boots
    local attackBonus = 25 + player:getMod(tpz.mod.FOOTWORK_ATT_BONUS) -- Handled by the core (25/256 ~ 9.76%)

    player:addStatusEffect(tpz.effect.FOOTWORK, kickDmgBonus, 0, 300, 0, attackBonus)
end
