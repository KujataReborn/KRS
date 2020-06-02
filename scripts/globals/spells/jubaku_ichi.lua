-----------------------------------------
-- Spell: Jubaku: Ichi
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and INT.
-- taken from paralyze
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
        params.attribute = tpz.mod.INT
        params.skillType = tpz.skill.NINJUTSU
        params.bonus = 0
        params.effect = tpz.effect.PARALYSIS
    local duration = 180 * applyResistance(caster, target, spell, params)
    local power = 20 -- Not affected by resistaces.

    if math.random(100) >= target:getMod(tpz.mod.PARALYZERES) then
        if duration >= 80 then
            local paralysis = target:getStatusEffect(effect)
            if paralysis ~= nil then -- Erases a weaker paralys and applies the stronger one
                if paralysis:getPower() < power then
                    target:delStatusEffect(tpz.effect.PARALYSIS)
                    target:addStatusEffect(tpz.effect.PARALYSIS, power, 0, duration)
                    spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
                else
                    spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
                end
            else
                target:addStatusEffect(tpz.effect.PARALYSIS, power, 0, duration)
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
            end
        else
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST_2)
    end

    return effect
end
