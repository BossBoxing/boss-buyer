# BOSS-BUYER

BOSS-BUYER is a FiveM script designed to create NPC-based item-selling functionality. Players can interact with NPCs to sell specific items at dynamic prices. Each NPC has a unique set of items they accept, adding variety and depth to the gameplay.

---

## Features

- **NPC Item Selling:** Each NPC accepts specific items for selling.
- **Dynamic Pricing:** Randomized prices for items based on configurable price variance.
- **Target Integration:** Interact with NPCs using a target system (e.g., `rsg-target`).
- **Configurable NPCs:** Add multiple NPCs with unique models, locations, and item lists.
- **Smooth NPC Spawn/Despawn:** NPCs spawn and despawn dynamically based on player proximity, with optional fade-in/out effects.
- **Blip Integration:** Add customizable blips for each NPC with unique names and locations.
- **Inventory Integration:** Uses `rsg-core` for item and money handling.

---

## Requirements

- **[rsg-core](https://github.com/rsg-core)**
- **[rsg-target](https://github.com/rsg-target)**
- **[ox_lib](https://overextended.github.io/ox_lib/)**

---

## Installation

1. **Download and Extract:**
   - Download the BOSS-BUYER script and extract it into your server's `resources` folder.

2. **Add to Server Config:**
   - Add the following line to your `server.cfg` file:
     ```plaintext
     ensure BOSS-BUYER
     ```

3. **Dependencies:**
   - Ensure all dependencies (`rsg-core`, `rsg-target`, `ox_lib`) are properly installed and running on your server.

4. **Configuration:**
   - Open the `config.lua` file and configure NPCs, items, price variance, blips, and other settings.

---

## Configuration

### NPCs
Define NPCs in the `Config.NPCs` table:
```lua
Config.NPCs = {
    {
        model = "u_m_m_valbutcher_01", -- NPC model
        location = vec4(-803.63, -1281.76, 43.53, 230.58), -- NPC location
        blip = {
            name = "Butcher Shop", -- Blip name
            location = vec3(-803.63, -1281.76, 43.53), -- Blip location
            sprite = 52, -- Blip sprite ID
            color = 1  -- Blip color ID
        },
        items = { -- Items specific to this NPC
            { name = "wheat", label = "Wheat", basePrice = 8 },
            { name = "corn", label = "Corn", basePrice = 10 }
        }
    },
    {
        model = "u_m_m_valbutcher_01",
        location = vec4(1234.0, -567.0, 78.0, 45.0),
        blip = {
            name = "Farmers Market",
            location = vec3(1234.0, -567.0, 78.0),
            sprite = 85,
            color = 2
        },
        items = {
            { name = "carrot", label = "Carrot", basePrice = 7 },
            { name = "apple", label = "Apple", basePrice = 6 }
        }
    }
}
```

### Price Variance
Control price fluctuation:
```lua
Config.PriceVariance = {
    min = 0.8, -- Minimum price multiplier (80% of base price)
    max = 1.2  -- Maximum price multiplier (120% of base price)
}
```

---

## Usage

1. **Approach an NPC:**
   - Walk near an NPC defined in `config.lua`.

2. **Interact with the NPC:**
   - Use the target system (e.g., `rsg-target`) to open the sell menu.

3. **Sell Items:**
   - Select an item and confirm the quantity to sell.
   - Receive cash for the sold items.

4. **Blips:**
   - NPC locations are marked on the map with blips. Blip names, sprites, and colors are configurable.

---

## Example Workflow

1. Player approaches an NPC at `-803.63, -1281.76`.
2. The player interacts with the NPC and opens the sell menu.
3. Items available for sale (`wheat`, `corn`) are displayed with randomized prices.
4. The player selects an item and specifies the quantity to sell.
5. If the player has enough items, they receive cash based on the randomized price.
6. Notifications confirm the transaction.

---

## Developer Notes

- Ensure `rsg-core` item definitions match the item names used in the configuration.
- Prices are dynamically generated for each interaction, ensuring variability.
- NPC spawn/despawn logic optimizes server performance by managing entities based on player proximity.
- Blips enhance visibility and ease of access for players to locate NPCs.

---

## Support

For any issues or questions, feel free to open an issue on the repository or contact the developer.

---

## License

This script is provided under the MIT License. See the `LICENSE` file for more details.
