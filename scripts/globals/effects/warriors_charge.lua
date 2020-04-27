-----------------------------------
--
-- tpz.effect.WARRIOR_S_CHARGE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.DOUBLE_ATTACK, 100)
end
