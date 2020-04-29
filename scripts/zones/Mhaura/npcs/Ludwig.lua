-----------------------------------
-- Area: Mhaura
--  NPC: Ludwig
-- Map Seller NPC
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/magic_maps")
-----------------------------------

function onTrigger(player,npc)
    tpz.maps.displayMaps(500,player)
end

function onEventUpdate(player,csid,option)
    tpz.maps.updateMaps(player,option,ID)
end

function onEventFinish(player,csid,option)
end
