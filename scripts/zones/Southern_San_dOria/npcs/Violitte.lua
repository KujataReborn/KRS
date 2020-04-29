-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Violitte
-- Map Seller NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/magic_maps")
-----------------------------------

function onTrigger(player,npc)
    tpz.maps.displayMaps(595,player)
end

function onEventUpdate(player,csid,option)
    tpz.maps.updateMaps(player,option,ID)
end

function onEventFinish(player,csid,option)
end
