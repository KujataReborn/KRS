-----------------------------------
-- Ability: Seigan
-- Grants a bonus to Third Eye when using two-handed weapons.
-- Obtained: Samurai Level 35
-- Recast Time: 00:01:00
-- Duration: 00:05:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if not target:isWeaponTwoHanded() then
        return tpz.msg.basic.NEEDS_2H_WEAPON,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    target:delStatusEffect(tpz.effect.HASSO)
    target:delStatusEffect(tpz.effect.SEIGAN)
    target:addStatusEffect(tpz.effect.SEIGAN, 0, 0, 300)
end
