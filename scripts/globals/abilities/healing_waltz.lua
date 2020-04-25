-----------------------------------
-- Ability: Healing Waltz
-- Removes one detrimental status effect from target party member.
-- Obtained: Dancer Level 35
-- TP Required: 200
-- Recast Time: 00:00:15
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if target:getHP() == 0 then
        return tpz.msg.basic.CANNOT_ON_THAT_TARG,0
    elseif player:hasStatusEffect(tpz.effect.SABER_DANCE) then
        return tpz.msg.basic.UNABLE_TO_USE_JA2, 0
    elseif player:hasStatusEffect(tpz.effect.TRANCE) then
        return 0,0
    elseif player:getTP() < 200 then
        return tpz.msg.basic.NOT_ENOUGH_TP,0
    else
        local recastMod = player:getMod(tpz.mod.WALTZ_DELAY)
        if recastMod ~= 0 then
            local newRecast = ability:getRecast() + recastMod
            ability:setRecast(utils.clamp(newRecast, 0, newRecast))
        end

        return 0,0
    end
end

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(200)
    end

    local effect = target:healingWaltz()
    if effect == tpz.effect.NONE then
        ability:setMsg(tpz.msg.basic.NO_EFFECT) -- no effect
    else
        ability:setMsg(tpz.msg.basic.JA_REMOVE_EFFECT)
    end

    player:addRecast(tpz.recast.ABILITY, 217, ability:getRecast()) -- Waltzes

    return effect
end
