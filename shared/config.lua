Config = {}

Config.NPC = {
    model = "mp_u_m_m_nbxgeneralstoreowner_01",
    location = { x = -815.0, y = -1279.0, z = 43.0, heading = 90.0 }
}

Config.Items = {
    { name = "corn", label = "Corn", basePrice = 5 },
    { name = "wheat", label = "Wheat", basePrice = 8 },
    { name = "potato", label = "Potato", basePrice = 10 }
}

Config.PriceVariance = {
    min = 0.8, -- Minimum price multiplier (80% of base price)
    max = 1.2  -- Maximum price multiplier (120% of base price)
}