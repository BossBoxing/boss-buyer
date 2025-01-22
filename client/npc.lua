-- NPC Creation
CreateThread(function()
    RequestModel(Config.NPC.model)
    while not HasModelLoaded(Config.NPC.model) do
        Wait(100)
    end

    local npc = CreatePed(Config.NPC.model, Config.NPC.location.x, Config.NPC.location.y, Config.NPC.location.z, Config.NPC.location.heading, false, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

    exports["rsg-target"]:AddTargetEntity(npc, {
        options = {
            {
                label = "Sell Items",
                icon = "fas fa-money-bill-wave",
                action = function()
                    OpenSellMenu()
                end
            }
        },
        distance = 2.5
    })
end)