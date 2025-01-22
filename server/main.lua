local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent("boss-buyer:server:sellItemInput", function(item, price, quantity)
    local src = source

    -- Ensure item, price, and quantity are provided
    if not item or not price or not quantity then
        print("^1ERROR: Invalid data received for item, price, or quantity.^7")
        return
    end

    -- Make sure the quantity is valid
    if quantity < 1 then
        TriggerClientEvent("ox_lib:notify", src, {
            title = "Boss Buyer",
            description = "Invalid quantity entered.",
            type = "error"
        })
        return
    end

    -- Check if the player has enough items to sell
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItems = false
    local itemData = Player.Functions.GetItemByName(item)

    -- Check if player has the required quantity of the item
    if itemData and itemData.amount >= quantity then
        hasItems = true
    end

    if hasItems then
        -- Proceed with removing the items from the player's inventory
        if Player.Functions.RemoveItem(item, quantity) then
            local totalPrice = price * quantity
            -- Add money to the player’s account
            Player.Functions.AddMoney("cash", totalPrice)

            -- Notify the player
            TriggerClientEvent("ox_lib:notify", src, {
                title = "Boss Buyer",
                description = string.format("You sold %d %s for $%d.", quantity, item, totalPrice),
                type = "success"
            })

            -- Show item removal in inventory (optional)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")

        else
            -- If the player couldn't remove the items
            TriggerClientEvent("ox_lib:notify", src, {
                title = "Boss Buyer",
                description = "There was an issue removing the items from your inventory.",
                type = "error"
            })
        end
    else
        -- If the player doesn't have enough items
        TriggerClientEvent("ox_lib:notify", src, {
            title = "Boss Buyer",
            description = "You don't have enough items to sell.",
            type = "error"
        })
    end
end)
