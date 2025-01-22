local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent("boss-buyer:sellItem", function(data)
    local item = data.item
    local price = data.price

    if exports["rsg-core"]:RemoveItem(item, 1) then
        exports["rsg-core"]:AddMoney("cash", price)
        lib.notify({
            title = "Boss Buyer",
            description = string.format("You sold 1 %s for $%d.", item, price),
            type = "success"
        })
    else
        lib.notify({
            title = "Boss Buyer",
            description = "You don't have enough items to sell.",
            type = "error"
        })
    end
end)