local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedPeds = {}
local blips = {}

-- Utility function to create blips
local function CreateBlip(blipData)
    local blip = BlipAddForCoords(1664425300, blipData.location)
    SetBlipSprite(blip, joaat(blipData.sprite), true)
    SetBlipScale(blip, 0.8)
    SetBlipName(blip, blipData.name)
    BlipAddModifier(blip, joaat('BLIP_MODIFIER_MP_COLOR_8'))
    return blip
end

-- NPC Creation Thread
CreateThread(function()
    AddRelationshipGroup("NPC_GROUP")

    while true do
        Wait(1000)
        for k, v in pairs(Config.NPCs) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - vector3(v.location.x, v.location.y, v.location.z))

            -- Spawn NPC
            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = CreateNPC(v.model, v.location, v)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end

            -- Remove NPC
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                SetModelAsNoLongerNeeded(spawnedPeds[k].model)
                spawnedPeds[k] = nil
            end
        end
    end
end)

-- Blip Creation Thread
CreateThread(function()
    while true do
        Wait(1000)
        for k, v in pairs(Config.NPCs) do
            -- local playerCoords = GetEntityCoords(PlayerPedId())
            -- local distance = #(playerCoords - vector3(v.location.x, v.location.y, v.location.z))

            if not blips[k] then
                if v.blip then
                    blips[k] = CreateBlip(v.blip)
                end
            end

            -- -- Create Blip
            -- if distance < Config.DistanceSpawn and not blips[k] then
            --     if v.blip then
            --         blips[k] = CreateBlip(v.blip)
            --     end
            -- end

            -- -- Remove Blip
            -- if distance >= Config.DistanceSpawn and blips[k] then
            --     RemoveBlip(blips[k])
            --     blips[k] = nil
            -- end
        end
    end
end)

function CreateNPC(model, location, npcData)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(50)
    end
    local ped = CreatePed(model, location.x, location.y, location.z - 1.0, location.w, false, false, 0, 0)
    SetEntityAlpha(ped, 0, false)
    SetRandomOutfitVariation(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- Relationship group setup
    SetPedRelationshipGroupHash(ped, GetPedRelationshipGroupHash(ped))
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(ped), `PLAYER`)

    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(ped, i, false)
        end
    end

    -- Target setup
    if Config.EnableTarget then
        exports['rsg-target']:AddTargetEntity(ped, {
            options = {
                {
                    icon = "fas fa-money-bill-wave",
                    label = "Sell Items",
                    action = function()
                        OpenSellMenu(npcData.items) -- Pass items specific to this NPC
                    end
                },
            },
            distance = 3.0,
        })
    end
    return ped
end

-- Cleanup on resource stop
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for _, pedData in pairs(spawnedPeds) do
        DeletePed(pedData.spawnedPed)
    end
    spawnedPeds = {}

    -- Remove all blips
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end
    blips = {}
end)

-- Generate Random Price
local function GetRandomPrice(basePrice)
    local multiplier = math.random() * (Config.PriceVariance.max - Config.PriceVariance.min) + Config.PriceVariance.min
    return math.floor(basePrice * multiplier)
end

function OpenSellMenu(npcItems)
    if not npcItems or type(npcItems) ~= "table" then
        print("^1ERROR: NPC items are not defined or not a table.^7")
        return
    end

    local options = {}

    for _, item in ipairs(npcItems) do
        local randomPrice = GetRandomPrice(item.basePrice)
        table.insert(options, {
            title = item.label,
            description = "Click to Sell", -- string.format("Click to Sell", randomPrice),
            event = "boss-buyer:wantToSell",
            args = { item = item.name, price = randomPrice } -- Pass random price to the server
        })
    end

    lib.registerContext({
        id = "sell_menu",
        title = "Sell Items",
        options = options
    })

    lib.showContext("sell_menu")
end

RegisterNetEvent('boss-buyer:wantToSell', function(data)
    -- Ensure data contains the item and price before triggering the server event
    if data and data.item and data.price then
        -- Prompt the player to confirm the quantity they want to sell
        local input = lib.inputDialog('Sell Quantity', {
            { type = 'number', label = 'How many do you want to sell?', default = 1, min = 1 }
        })

        if input and input[1] then
            local quantity = tonumber(input[1])
            if quantity > 0 then
                TriggerServerEvent('boss-buyer:server:sellItemInput', data.item, data.price, quantity)
            else
                TriggerEvent("ox_lib:notify", {
                    title = "Boss Buyer",
                    description = "Invalid quantity entered.",
                    type = "error"
                })
            end
        end
    else
        print("^1ERROR: Invalid data received for item or price.^7")
    end
end)
