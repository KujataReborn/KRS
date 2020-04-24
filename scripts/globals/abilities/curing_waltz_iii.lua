-----------------------------------
-- Ability: Curing Waltz III
-- Heals HP to target player.
-- Obtained: Dancer Level 45
-- TP Required: 50%
-- Recast Time: 00:10
-----------------------------------
require("scripts/globals/settings")
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
    elseif player:getTP() < 500 then
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
        player:delTP(500)
    end

    local cure = 0
    local VIT = target:getStat(tpz.mod.VIT)
    local CHR = player:getStat(tpz.mod.CHR)
    if player:getMainJob() == tpz.job.DNC then
        cure = (VIT + CHR) * 0.75 + 270
    elseif player:getSubJob() == tpz.job.DNC then
        cure = (VIT + CHR) * 0.375 + 270
    end
    cure = math.floor(cure * (1.0 + (player:getMod(tpz.mod.WALTZ_POTENTCY) / 100)))

    --Applying server mods....
    cure = cure * CURE_POWER

    --Cap the final amount to max HP.
    local diff = target:getMaxHP() - target:getHP()
    cure = math.min(cure,diff)

    --Do it
    target:restoreHP(cure)
    target:wakeUp()
    player:updateEnmityFromCure(target,cure)

    return cure
end
