-----------------------------------
--
-- tpz.effect.YONIN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:delMod(tpz.mod.ACC, effect:getPower())
    target:addMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:addMod(tpz.mod.ENMITY, effect:getSubPower())
end

function onEffectTick(target,effect)
    -- Tick down the effect and reduce the overall power
    effect:setPower(effect:getPower() - 1)
    target:addMod(tpz.mod.ACC, 1)
    target:delMod(tpz.mod.NINJA_TOOL, 1)

    -- Enmity+ decays from 20 to 10, so half as often as the rest
    if effect:getPower() % 2 == 0 then
        effect:setSubPower(effect:getSubPower() - 1)
        target:delMod(tpz.mod.ENMITY, 1)
    end
end

function onEffectLose(target,effect)
    -- Remove the remaining power
    target:addMod(tpz.mod.ACC, effect:getPower())
    target:delMod(tpz.mod.NINJA_TOOL, effect:getPower())
    target:delMod(tpz.mod.ENMITY, effect:getSubPower())
end
