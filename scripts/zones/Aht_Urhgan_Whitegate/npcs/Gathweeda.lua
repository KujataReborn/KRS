-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Gathweeda
--  Guild Merchant: Alchemist Guild
-- !pos -81.322 -6.000 140.273 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:sendGuild(60431, 8, 23, 6) then
        player:showText(npc, ID.text.GATHWEEDA_SHOP_DIALOG)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
