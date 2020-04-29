-----------------------------------
-- Area: Port Bastok
--  NPC: Rex
-- Map Seller NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/magic_maps")
-----------------------------------

function onTrigger(player,npc)
    tpz.maps.displayMaps(115,player)
end

function onEventUpdate(player,csid,option)
    tpz.maps.updateMaps(player,option,ID)
end

function onEventFinish(player,csid,option)
end
