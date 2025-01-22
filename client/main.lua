local RSGCore = exports['rsg-core']:GetCoreObject()

local function GetRandomPrice(basePrice)
    local multiplier = math.random() * (Config.PriceVariance.max - Config.PriceVariance.min) + Config.PriceVariance.min
    return math.floor(basePrice * multiplier)
end

function OpenSellMenu()
    local options = {}

    for _, item in ipairs(Config.Items) do
        local randomPrice = GetRandomPrice(item.basePrice)
        table.insert(options, {
            title = item.label,
            description = string.format("Sell for $%d each", randomPrice),
            event = "boss-buyer:sellItem",
            args = { item = item.name, price = randomPrice }
        })
    end

    lib.registerContext({
        id = "sell_menu",
        title = "Sell Items",
        options = options
    })

    lib.showContext("sell_menu")
end