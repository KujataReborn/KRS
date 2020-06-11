-----------------------------------------
-- Spell: Hojo:Ni
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
        params.attribute = tpz.mod.INT
        params.skillType = tpz.skill.NINJUTSU
        params.bonus = 0
        params.effect = tpz.effect.SLOW
    local duration = 300 * applyResistance(caster, target, spell, params)
    local power = 2000 -- Power is a flat 19.5% reduction

    if math.random(100) >= target:getMod(tpz.mod.SLOWRES) then
        if duration >= 150 then -- Spell succeeds if a 1 or 1/2 resist check is achieved
            if target:addStatusEffect(tpz.effect.SLOW, power, 0, duration) then
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

    return tpz.effect.SLOW
end
