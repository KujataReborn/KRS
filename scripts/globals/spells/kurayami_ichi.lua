-----------------------------------------
-- Spell: Kurayami:Ichi
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
        params.effect = tpz.effect.BLINDNESS
    local duration = 180 * applyResistance(caster, target, spell, params)
    local power = 20 -- Not affected by resistances.

    if math.random(100) >= target:getMod(tpz.mod.BLINDRES) then
        if duration >= 80 then
            if target:addStatusEffect(tpz.effect.BLINDNESS, power, 0, duration) then
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

    return tpz.effect.BLINDNESS
end
