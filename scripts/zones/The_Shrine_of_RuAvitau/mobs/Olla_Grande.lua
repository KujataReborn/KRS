-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Olla Grande
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end


function onAdditionalEffect(mob, target, damage)
    if math.random(100) <= 15 then
        local effect = target:dispelStatusEffect()

        if effect ~= tpz.effect.NONE then
            return tpz.subEffect.DISPEL, tpz.msg.basic.ADD_EFFECT_DISPEL, effect
        end
    end

    return 0, 0, 0
end

function onMobDeath(mob,player,isKiller)
end

function onMobDespawn(mob)
    GetNPCByID(ID.npc.OLLAS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
end
