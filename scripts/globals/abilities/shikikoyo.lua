-----------------------------------
-- Ability: Shikikoyo
-- Share TP above 1000 with a party member.
-- Obtained: Samurai Level 75
-- Recast Time: 00:15:00 (Can be reduced to 00:05:00 using Merit Points)
-- Duration: Instant
-- Target: Party member, cannot target self.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getID() == target:getID() then
        return tpz.msg.basic.CANNOT_PERFORM_TARG,0
    elseif player:getTP() < 1000 then
        return tpz.msg.basic.NOT_ENOUGH_TP, 0
    else
        local merit = player:getMerit(tpz.merit.SHIKIKOYO)
        if merit >= 2 then
            local reduction = (merit - 1) * 150 -- 00:02:30 for each merit upgrade after unlocking
    
            ability:setRecast(ability:getRecast() - reduction)
        end
        
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    local pTP = player:getTP() - 1000
    pTP = utils.clamp(pTP, 0, 3000 - target:getTP())

    player:setTP(1000)
    target:setTP(target:getTP() + pTP)

    return pTP
end
