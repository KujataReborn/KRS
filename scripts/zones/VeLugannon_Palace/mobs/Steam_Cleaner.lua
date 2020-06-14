-----------------------------------
-- Area: Ve'Lugannon Palace
--   NM: Steam Cleaner
-----------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
end

function onAdditionalEffect(mob,target,damage)
    if math.random(100) <= 10 then
        local drain = math.random(15, 30)
        
        target:delTP(drain)

        return tpz.subEffect.TP_DRAIN, tpz.msg.basic.ADD_EFFECT_TP_DRAIN, drain
    else
        return 0, 0, 0
    end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
