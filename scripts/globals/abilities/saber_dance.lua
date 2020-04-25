-----------------------------------
-- Ability: Saber Dance
-- Increases Double Attack rate but renders Waltz unusable. Double Attack rate gradually decreases.
-- Obtained: Dancer Level 75 Merit Group 2
-- Recast Time: 00:05:00
-- Duration: 00:05:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    local merit = player:getMerit(tpz.merit.SABER_DANCE)
    if merit >= 2 then
        local reduction = (merit - 1) * 30 -- 30 seconds for each merit upgrade after unlocking

        ability:setRecast(ability:getRecast() - reduction)
    end

    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.SABER_DANCE,50,3,300)
end
