-----------------------------------
--
-- tpz.effect.DEFENDER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower()
    target:addMod(tpz.mod.DEFP, power)
    target:addMod(tpz.mod.RATTP, -power)
    target:addMod(tpz.mod.ATTP, -power)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    target:delMod(tpz.mod.DEFP, power)
    target:delMod(tpz.mod.ATTP, -power)
    target:delMod(tpz.mod.RATTP, -power)
end
