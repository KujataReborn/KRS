-----------------------------------
-- Ability: Fan Dance
-- Reduces physical damage taken and increases enmity but renders Samba unusable. Physical damage reduction gradually decreases with each hit taken.
-- Obtained: Dancer Level 75 Merit Group 2
-- Recast Time: 00:05:00
-- Duration: 00:05:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merit = player:getMerit(tpz.merit.FAN_DANCE)
    if merit >= 2 then
        local reduction = (merit - 1) * 30 -- 30 seconds for each merit upgrade after unlocking

        ability:setRecast(ability:getRecast() - reduction)
    end

    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.FAN_DANCE,90,0,300)
end
