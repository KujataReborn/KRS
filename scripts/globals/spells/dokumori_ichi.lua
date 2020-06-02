-----------------------------------------
-- Spell: Dokumori: Ichi
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
        params.effect = tpz.effect.POISON
    local duration = 60 * applyResistance(caster, target, spell, params)
    local power = 3 -- Not affected by resistances.

    -- Do not overwrite
    if target:hasStatusEffect(tpz.effect.POISON) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)

        return effect
    end

    if math.random(100) >= target:getMod(tpz.mod.POISONRES) then
        if duration >= 30 then
            if target:addStatusEffect(effect, power, 3, duration) then
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
            else
                spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
            end
        else
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST_2)
    end

    return effect
end
