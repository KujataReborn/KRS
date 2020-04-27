-----------------------------------
-- Ability: Warcry
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
-- Recast Time: 00:05:00
-- Duration: 00:00:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    if not target:hasStatusEffect(tpz.effect.BOOST) then
        local power = 0
        local duration = 30
        local merit = player:getMerit(tpz.merit.SAVAGERY) -- TP Bonus

        if player:getMainJob() == tpz.job.WAR then
            power = math.floor((player:getMainLvl() / 4) + 4.75) / 256
        else
            power = math.floor((player:getSubLvl() / 4) + 4.75) / 256
        end

        power = power * 100
        duration = duration + player:getMod(tpz.mod.WARCRY_DURATION)

        target:addStatusEffect(tpz.effect.WARCRY, power, 0, duration, 0, merit)
    else
        ability:setMsg(tpz.msg.basic.NO_EFFECT) -- no effect
    end
end
