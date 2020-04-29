---------------------------------------------
--    Function that all map NPCS use.
---------------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/zone")
---------------------------------------------

tpz = tpz or {}
tpz.maps = tpz.maps or {}

local maps = {
    [1] = {
        [ 1] = { ki = tpz.ki.MAP_OF_THE_SAN_DORIA_AREA, price = 200 },
        [ 2] = { ki = tpz.ki.MAP_OF_THE_BASTOK_AREA, price = 200 },
        [ 3] = { ki = tpz.ki.MAP_OF_THE_WINDURST_AREA, price = 200 },
        [ 4] = { ki = tpz.ki.MAP_OF_THE_JEUNO_AREA, price = 200 },
        [ 5] = { ki = tpz.ki.MAP_OF_ORDELLES_CAVES, price = 200 },
        [ 6] = { ki = tpz.ki.MAP_OF_GHELSBA, price = 200 },
        [ 7] = { ki = tpz.ki.MAP_OF_DAVOI, price = 200 },
        [ 8] = { ki = tpz.ki.MAP_OF_CARPENTERS_LANDING, price = 200 },
        [ 9] = { ki = tpz.ki.MAP_OF_THE_ZERUHN_MINES, price = 200 },
        [10] = { ki = tpz.ki.MAP_OF_THE_PALBOROUGH_MINES, price = 200 },
        [11] = { ki = tpz.ki.MAP_OF_BEADEAUX, price = 200 },
        [12] = { ki = tpz.ki.MAP_OF_GIDDEUS, price = 200 },
        [13] = { ki = tpz.ki.MAP_OF_CASTLE_OZTROJA, price = 200 },
        [14] = { ki = tpz.ki.MAP_OF_THE_MAZE_OF_SHAKHRAMI, price = 200 },
        [15] = { ki = tpz.ki.MAP_OF_THE_LITELOR_REGION, price = 200 },
        [16] = { ki = tpz.ki.MAP_OF_BIBIKI_BAY, price = 200 },
        [17] = { ki = tpz.ki.MAP_OF_QUFIM_ISLAND, price = 200 },
        [18] = { ki = tpz.ki.MAP_OF_THE_ELDIEME_NECROPOLIS, price = 200 },
        [19] = { ki = tpz.ki.MAP_OF_THE_GARLAIGE_CITADEL, price = 200 },
        [20] = { ki = tpz.ki.MAP_OF_THE_ELSHIMO_REGIONS, price = 200 },
        [21] = { ki = tpz.ki.MAP_OF_THE_NORTHLANDS_AREA, price = 200 },
        [22] = { ki = tpz.ki.MAP_OF_KING_RANPERRES_TOMB, price = 200 },
        [23] = { ki = tpz.ki.MAP_OF_THE_DANGRUF_WADI, price = 200 },
        [24] = { ki = tpz.ki.MAP_OF_THE_HORUTOTO_RUINS, price = 200 },
        [25] = { ki = tpz.ki.MAP_OF_BOSTAUNIEUX_OUBLIETTE, price = 200 },
        [26] = { ki = tpz.ki.MAP_OF_THE_TORAIMARAI_CANAL, price = 200 },
        [27] = { ki = tpz.ki.MAP_OF_THE_GUSGEN_MINES, price = 200 },
        [28] = { ki = tpz.ki.MAP_OF_THE_CRAWLERS_NEST, price = 200 },
        [29] = { ki = tpz.ki.MAP_OF_THE_RANGUEMONT_PASS, price = 200 },
        [30] = { ki = tpz.ki.MAP_OF_DELKFUTTS_TOWER, price = 200 },
        [31] = { ki = tpz.ki.MAP_OF_FEIYIN, price = 200 },
        [32] = { ki = tpz.ki.MAP_OF_CASTLE_ZVAHL, price = 200 },
    },
    [2] = {
        [33] = { ki = tpz.ki.MAP_OF_THE_KUZOTZ_REGION, price = 200 },
        [34] = { ki = tpz.ki.MAP_OF_THE_RUAUN_GARDENS, price = 200 },
        [35] = { ki = tpz.ki.MAP_OF_NORG, price = 200 },
        [36] = { ki = tpz.ki.MAP_OF_THE_TEMPLE_OF_UGGALEPIH, price = 200 },
        [37] = { ki = tpz.ki.MAP_OF_THE_DEN_OF_RANCOR, price = 200 },
        [38] = { ki = tpz.ki.MAP_OF_THE_KORROLOKA_TUNNEL, price = 200 },
        [39] = { ki = tpz.ki.MAP_OF_THE_KUFTAL_TUNNEL, price = 200 },
        [40] = { ki = tpz.ki.MAP_OF_THE_BOYAHDA_TREE, price = 200 },
        [41] = { ki = tpz.ki.MAP_OF_THE_VELUGANNON_PALACE, price = 200 },
        [42] = { ki = tpz.ki.MAP_OF_IFRITS_CAULDRON, price = 200 },
        [43] = { ki = tpz.ki.MAP_OF_THE_QUICKSAND_CAVES, price = 200 },
        [44] = { ki = tpz.ki.MAP_OF_THE_SEA_SERPENT_GROTTO, price = 200 },
        [45] = { ki = tpz.ki.MAP_OF_THE_VOLLBOW_REGION, price = 200 },
        [46] = { ki = tpz.ki.MAP_OF_THE_LABYRINTH_OF_ONZOZO, price = 200 },
        [47] = { ki = tpz.ki.MAP_OF_THE_ULEGUERAND_RANGE, price = 200 },
        [48] = { ki = tpz.ki.MAP_OF_THE_ATTOHWA_CHASM, price = 200 },
        [49] = { ki = tpz.ki.MAP_OF_PSOXJA, price = 200 },
        [50] = { ki = tpz.ki.MAP_OF_OLDTON_MOVALPOLOS, price = 200 },
        [51] = { ki = tpz.ki.MAP_OF_NEWTON_MOVALPOLOS, price = 200 },
        [52] = { ki = tpz.ki.MAP_OF_TAVNAZIA, price = 200 },
        [53] = { ki = tpz.ki.MAP_OF_THE_AQUEDUCTS, price = 200 },
        [54] = { ki = tpz.ki.MAP_OF_THE_SACRARIUM, price = 200 },
        [55] = { ki = tpz.ki.MAP_OF_CAPE_RIVERNE, price = 200 },
        [56] = { ki = tpz.ki.MAP_OF_ALTAIEU, price = 200 },
        [57] = { ki = tpz.ki.MAP_OF_HUXZOI, price = 200 },
        [58] = { ki = tpz.ki.MAP_OF_RUHMET, price = 200 },
        [59] = { ki = tpz.ki.MAP_OF_AL_ZAHBI, price = 200 },
        [60] = { ki = tpz.ki.MAP_OF_NASHMAU, price = 200 },
        [61] = { ki = tpz.ki.MAP_OF_WAJAOM_WOODLANDS, price = 200 },
        [62] = { ki = tpz.ki.MAP_OF_CAEDARVA_MIRE, price = 200 },
        [63] = { ki = tpz.ki.MAP_OF_MOUNT_ZHAYOLM, price = 200 },
        [64] = { ki = tpz.ki.MAP_OF_AYDEEWA_SUBTERRANE, price = 200 },
    },
    [3] = {
        [65] = { ki = tpz.ki.MAP_OF_MAMOOK, price = 200 },
        [66] = { ki = tpz.ki.MAP_OF_HALVUNG, price = 200 },
        [67] = { ki = tpz.ki.MAP_OF_ARRAPAGO_REEF, price = 200 },
        [68] = { ki = tpz.ki.MAP_OF_ALZADAAL_RUINS, price = 200 },
        [69] = { ki = tpz.ki.MAP_OF_BHAFLAU_THICKETS, price = 200 },
        [70] = { ki = tpz.ki.MAP_OF_VUNKERL_INLET, price = 200 },
        [71] = { ki = tpz.ki.MAP_OF_GRAUBERG, price = 200 },
        [72] = { ki = tpz.ki.MAP_OF_FORT_KARUGONARUGO, price = 200 },
    }
}

local defaults = {
    [tpz.zone.BASTOK_MARKETS]       = { -1808, -1, 255 },      -- Karine
    [tpz.zone.PORT_BASTOK]          = { -1808, -1, 255 },      -- Rex
    [tpz.zone.NORTHERN_SAN_DORIA]   = { -256, -1, 255 },       -- Elesca
    [tpz.zone.SOUTHERN_SAN_DORIA]   = { -256, -1, 255 },       -- Violitte
    [tpz.zone.PORT_WINDURST]        = { -14352, -1, 255 },     -- Mhoji Roccoruh
    [tpz.zone.WINDURST_WOODS]       = { -14352, -1, 255 },     -- Pehki Machumaht
    [tpz.zone.MHAURA]               = { -49168, -1, 255 },     -- Ludwig
    [tpz.zone.SELBINA]              = { -16, -1, 255 },        -- Lombaria
    [tpz.zone.LOWER_JEUNO]          = { -983056, -1, 255 },    -- Promurouve
    [tpz.zone.UPPER_JEUNO]          = { -983056, -1, 255 },    -- Rusese
    [tpz.zone.AHT_URHGAN_WHITEGATE] = { -1, 3825205247, 239 }, -- Riyadahf
}

local function filterOwnedMaps(player)
    local p1 = 0
    local p2 = 0
    local p3 = 0

    if not ENABLE_SELLING_QUESTED_MAPS then
        local zone = player:getZoneID()
        p1 = defaults[zone][1]
        p2 = defaults[zone][2]
        p3 = defaults[zone][3]
    end

    for index, map in ipairs(maps[1]) do
        if player:hasKeyItem(map.ki) then
            p1 = bit.bor(p1, bit.lshift(1, index - 1))
        end
    end

    for index, map in ipairs(maps[2]) do
        if player:hasKeyItem(map.ki) then
            p2 = bit.bor(p2, bit.lshift(1, index - 1))
        end
    end

    for index, map in ipairs(maps[3]) do
        if player:hasKeyItem(map.ki) then
            p3 = bit.bor(p3, bit.lshift(1, index - 1))
        end
    end

    return p1, p2, p3
end
    
tpz.maps.displayMaps = function(csid,player)
    local p1, p2, p3 = filterOwnedMaps(player)

    player:startEvent(csid, p1, p2, p3)
end

tpz.maps.updateMaps = function(player,option,ID)
    local offset = 65536
    local index = 1 + math.floor(option / offset)
    local map = maps[1][index] or maps[2][index] or maps[3][index]

    if player:getGil() >= map.price then
        player:delGil(map.price)
        player:addKeyItem(map.ki)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, map.ki)
    else
        player:messageSpecial(ID.text.NOT_HAVE_ENOUGH_GIL)
    end

    local p1, p2, p3 = filterOwnedMaps(player)

    player:updateEvent(p1, p2, p3)
end
