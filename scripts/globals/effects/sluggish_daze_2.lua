-----------------------------------
--
-- tpz.effect.SLUGGISH_DAZE_2
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DEFP, -7)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.DEFP, -7)
end
