-----------------------------------
-- Ability: No Foot Rise
-- Instantly grants additional Finishing Moves.
-- Obtained: Dancer Level 75 Merit Group 2
-- Recast Time: 00:03:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) then
        return 561,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    local moves = player:getMerit(tpz.merit.NO_FOOT_RISE)
    if player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) then
        moves = math.min(moves, 4)

        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 + moves, 1, 0, 7200)

        return moves + 1
    elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) then
        moves = math.min(moves, 3)

        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_2 + moves, 1, 0, 7200)

        return moves + 2
    elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) then
        moves = math.min(moves, 2)

        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_3 + moves, 1, 0, 7200)

        return moves + 3
    elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) then
        moves = math.min(moves, 1)

        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_4 + moves, 1, 0, 7200)

        return moves + 4
    else
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 + moves - 1, 1, 0, 7200)

        return moves
    end
end
