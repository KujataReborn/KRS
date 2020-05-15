-----------------------------------
--
-- tpz.effect.AGGRESSOR
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower()
    target:addMod(tpz.mod.ACC, power)
    target:addMod(tpz.mod.EVA, -power)

    -- Aggresive Aim
    local subpower = effect:getSubPower()
    target:addMod(tpz.mod.RACC, subpower)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    target:delMod(tpz.mod.RACC, power)
    target:delMod(tpz.mod.EVA, -power)

    -- Aggresive Aim
    local subpower = effect:getSubPower()
    target:delMod(tpz.mod.ACC, subpower)
end
