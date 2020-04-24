-----------------------------------
--
-- tpz.effect.LETHARGIC_DAZE_4
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.EVA, -20)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.EVA, -20)
end
