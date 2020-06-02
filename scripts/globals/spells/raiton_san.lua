-----------------------------------------
-- Spell: Raiton: San
-- Deals lightning damage to an enemy and lowers its resistance against earth.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local duration = 15 + caster:getMerit(tpz.merit.RAITON_EFFECT) -- Bonus debuff duration
    local bonusAcc = 0
    local bonusMab = caster:getMerit(tpz.merit.RAITON_EFFECT) -- Bonus magic damage
    
    if caster:getMerit(tpz.merit.RAITON_SAN) > 1 then
        bonusAcc = bonusAcc + caster:getMerit(tpz.merit.RAITON_SAN)
        bonusMab = bonusMab + caster:getMerit(tpz.merit.RAITON_SAN)
    end

    local params = {}
        params.dmg = 134
        params.multiplier = 1.5
        params.hasMultipleTargetReduction = false
        params.resistBonus = bonusAcc
        params.mabBonus = bonusMab
    dmg = doNinjutsuNuke(caster, target, spell, params)
    handleNinjutsuDebuff(caster, target, spell, 30, duration, tpz.mod.EARTHRES)

    return dmg
end
