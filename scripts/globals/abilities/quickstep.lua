-----------------------------------
-- Ability: Quickstep
-- Lowers target's evasion. If successful, you will earn two Finishing Moves.
-- Obtained: Dancer Level 20
-- TP Required: 100
-- Recast Time: 00:00:15
-- Duration: First Step lasts 1 minute, each following Step extends its current duration by 30 seconds.
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getAnimation() ~= 1 then
        return tpz.msg.basic.REQUIRES_COMBAT,0
    else
        if player:hasStatusEffect(tpz.effect.TRANCE) then
            return 0,0
        elseif player:getTP() < 100 then
            return tpz.msg.basic.NOT_ENOUGH_TP,0
        else
            return 0,0
        end
    end
end

function onUseAbility(player,target,ability,action)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(100)
    end

    local hit = 1
    local effect = 1

    if math.random() <= getHitRate(player, target, true, player:getMod(tpz.mod.STEP_ACCURACY)) then
        hit = 5

        local main = player:getMainJob() == tpz.job.DNC
        local daze = 1

        if target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1) then
            local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1):getDuration()

            target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_2, 1, 0, duration + 30)

            if main then daze = 2 end
            effect = 2
        elseif target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_2) then
            local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_2):getDuration()

            target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_2)
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_3, 1, 0, duration + 30)

            
            if main then daze = 2 end
            effect = 3
        elseif target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_3) then
            local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_3):getDuration()

            target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_3)
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_4, 1, 0, duration + 30)
            
            if main then daze = 2 end
            effect = 4
        elseif target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_4) then
            local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_4):getDuration()

            target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_4)    
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30)

            
            if main then daze = 2 end
            effect = 5
        elseif target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_5) then
            local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_5):getDuration()

            target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_5)
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30)

            effect = 5
        else
            target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_1, 1, 0, 60)
            
            if main then daze = 2 end
            effect = 1
        end

        if player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 + daze, 1, 0, 7200)
        elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_2 + daze, 1, 0, 7200)
        elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_3 + daze, 1, 0, 7200)
        elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_5, 1, 0, 7200)
        elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) then
            -- Skips
        else
            daze = daze - 1
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 + daze, 1, 0, 7200)
        end
    else
        ability:setMsg(tpz.msg.basic.JA_MISS)
    end

    action:animation(target:getID(), getStepAnimation(player:getWeaponSkillType(tpz.slot.MAIN)))
    action:speceffect(target:getID(), hit)

    return effect
end
