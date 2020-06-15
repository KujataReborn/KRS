-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Caretaker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobRoam(mob)
    local detector = GetMobByID(mob:getLocalVar("detector"))

    if detector:getTarget() ~= nil then
        mob:updateEnmity(detector:getTarget())
    end
end

function onMobDeath(mob,player,isKiller)
    tpz.regime.checkRegime(player, mob, 743, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 746, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    GetMobByID(mob:getLocalVar("detector")):setLocalVar("pet", 0)
end
