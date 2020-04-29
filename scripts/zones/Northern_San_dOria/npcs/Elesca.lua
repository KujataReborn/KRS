-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Elesca
-- Map Seller NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/magic_maps")
-----------------------------------

function onTrigger(player,npc)
    tpz.maps.displayMaps(567,player)
end

function onEventUpdate(player,csid,option)
    tpz.maps.updateMaps(player,option,ID)
end

function onEventFinish(player,csid,option)
end
