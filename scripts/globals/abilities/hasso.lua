-----------------------------------
-- Ability: Hasso
-- Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-- Obtained: Samurai Level 25
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
    local strboost = target:getMainLvl() / 7
    if target:getMainJob() ~= tpz.job.SAM then
        strboost = target:getSubLvl() / 7
    end

    target:delStatusEffect(tpz.effect.HASSO)
    target:delStatusEffect(tpz.effect.SEIGAN)
    target:addStatusEffect(tpz.effect.HASSO, strboost, 0, 300)
end
