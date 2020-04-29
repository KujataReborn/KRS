-----------------------------------
-- Area: Port Windurst
--  NPC: Mhoji Roccoruh
-- Map Seller NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/magic_maps")
-----------------------------------

function onTrigger(player,npc)
    tpz.maps.displayMaps(10000,player)
end

function onEventUpdate(player,csid,option)
    tpz.maps.updateMaps(player,option,ID)
end

function onEventFinish(player,csid,option)
end
