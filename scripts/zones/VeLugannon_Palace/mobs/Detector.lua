-----------------------------------
-- Area: VeLugannon Palace
--  MOB: Detector
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/regimes")
-----------------------------------

-- TODOS -----------------------------------------------------------------------------------
-- Casting animation for before summons. When he spawns them isn't exactly retail accurate.
-- Should be ~10s to start cast, and another ~5 to finish.

function onMobSpawn(mob)
    mob:setLocalVar("index", 1)
end

function onMobFight(mob,target)
    local index = mob:getLocalVar("index")

    if
        index <= 5 and
        mob:getLocalVar("pet") == 0 and
        mob:getBattleTime() > 3 and
        mob:getBattleTime() % 15 < 3
    then
        local mobID = mob:getID()
        local pet   = GetMobByID(mobID + 1)

        -- Only specific Detectors are able to spawn Caretaker
        if mobID >= ID.mob.STEAM_CLEANER_PH_OFFSET then
            if
                os.time() >= GetServerVariable("[SKY]SteamCleanerRespawn") and
                math.random(100) <= 100
            then
                pet = GetMobByID(ID.mob.STEAM_CLEANER)
            end
        end
    
        pet:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1)
        pet:spawn()
        pet:setLocalVar("detector", mobID)
        pet:updateEnmity(target)

        mob:setLocalVar("index", index + 1)
        mob:setLocalVar("pet", 1)
    end
end


function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 743, 1, tpz.regime.type.GROUNDS)

    local caretaker = GetMobByID(mob:getID() + 1)

    if caretaker:isSpawned() then
        caretaker:setHP(0)
    end
end

function onMobDespawn(mob)
    local mobID = mob:getID()

    -- Only specific Detectors are able to spawn Caretaker
    if mobID >= ID.mob.STEAM_CLEANER_PH_OFFSET then
        GetMobByID(mobID):setRespawnTime(1200) -- 30 minutes
    end
end
