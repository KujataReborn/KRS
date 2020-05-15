-----------------------------------
-- Ability: Blade Bash
-- Deliver an attack that can stun the target and occasionally cause Plague.
-- Obtained: Samurai Level 75
-- Recast Time: 00:15:00 (Can be reduced to 00:05:00 using Merit Points)
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if not player:isWeaponTwoHanded() then
        return tpz.msg.basic.NEEDS_2H_WEAPON,0
    else
        local merit = player:getMerit(tpz.merit.BLADE_BASH)
        if merit >= 2 then
            local reduction = (merit - 1) * 150 -- 00:02:30 for each merit upgrade after unlocking

            ability:setRecast(ability:getRecast() - reduction)
        end

        return 0,0
    end
end

function onUseAbility(player,target,ability)
    if math.random(100) < 99 then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 6)
    end
    
    if math.random(100) < 65 then
        target:addStatusEffect(tpz.effect.PLAGUE, 5, 0, 15)
    end
end
