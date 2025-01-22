-- Configuration
Config = {
    DistanceSpawn = 50.0,
    FadeIn = true,
    EnableTarget = true
}

Config.NPCs = {
    {
        model = "g_m_m_unimountainmen_01",
        location = vec4(-1328.54, 2471.91, 309.61, 208.45),
        blip = {
            name = "Cotton Buyer",
            location = vec3(-1328.54, 2471.91, 309.61),
            sprite = 819673798, -- Blip sprite ID for RedM
            color = 2           -- Blip color ID
        },
        items = {
            { name = "wheat", label = "Wheat", basePrice = 8 },
            { name = "corn", label = "Corn", basePrice = 10 }
        }
    },
    {
        model = "MP_U_M_M_PROTECT_FRIENDLY_ARMADILLO_01",
        location = vec4(-5487.46, -2944.25, -1.07, 210.92),
        blip = {
            name = "Tobacco & Potato Buyer",
            location = vec3(-5487.46, -2944.25, -1.07),
            sprite = 819673798,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    },
    {
        model = "MP_U_M_M_PROTECT_FRIENDLY_ARMADILLO_01",
        location = vec4(-242.11, 753.35, 117.74, 63.85),
        blip = {
            name = "Carrot & Corn Buyer",
            location = vec3(-242.11, 753.35, 117.74),
            sprite = 819673798,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    },
    {
        model = "u_m_m_valbutcher_01",
        location = vec4(-868.14, -1339.63, 43.32, 248.81),
        blip = {
            name = "Wheat & Orange Buyer",
            location = vec3(-868.14, -1339.63, 43.32),
            sprite = 819673798,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    },
    {
        model = "u_m_m_valbutcher_01",
        location = vec4(2845.62, -1226.32, 47.66, 357.39),
        blip = {
            name = "Grape & Tomato Buyer",
            location = vec3(2845.62, -1226.32, 47.66),
            sprite = 819673798,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    },
    {
        model = "u_m_m_valbutcher_01",
        location = vec4(2948.22, 1344.59, 44.89, 68.57),
        blip = {
            name = "Apple & Broccoli Buyer",
            location = vec3(2948.22, 1344.59, 44.89),
            sprite = 819673798,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    }
}

Config.PriceVariance = {
    min = 0.8, -- Minimum price multiplier (80% of base price)
    max = 1.2  -- Maximum price multiplier (120% of base price)
}