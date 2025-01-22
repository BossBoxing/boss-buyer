# Boss Buyer

**Boss Buyer** is a RedM script designed for the RSG V2 Framework. This script allows players to sell items to a designated NPC (non-player character) in-game, making it easier for server owners to implement a simple and efficient selling system.

---

## Features

- Seamless integration with the RSG V2 Framework.
- Allows players to interact with an NPC to sell items.
- Customizable items and pricing.
- Easy configuration for server admins.
- Supports immersive roleplay scenarios.

---

## Installation

1. **Download and Extract**
   - Clone or download the repository.
   - Extract the files into your server's `resources` folder.

   ```bash
   git clone https://github.com/your-repo/boss-buyer.git
   ```

2. **Add to Server Configuration**
   - Open your `server.cfg` file.
   - Add the following line to ensure the script starts correctly:

     ```cfg
     ensure boss-buyer
     ```

3. **Configure Script**
   - Open the `config.lua` file.
   - Set up the items, prices, and NPC details to match your server's needs.

4. **Restart Server**
   - Restart your RedM server to load the script.

---

## Configuration

Modify the `config.lua` file to customize the script. Below are the key parameters:

- **NPC Location**: Set the coordinates for the NPC.
- **Sellable Items**: Define which items can be sold and their respective prices.
- **Dialogue**: Customize the NPC's dialogue to match your server's theme.

Example:

```lua
Config = {
    NPC = {
        model = "mp_u_m_m_nbxgeneralstoreowner_01",
        location = { x = -815.0, y = -1279.0, z = 43.0, heading = 90.0 }
    },
    Items = {
        { name = "gold_bar", price = 100 },
        { name = "pelt", price = 50 },
    }
}
```

---

## Usage

1. Players approach the NPC in the game.
2. Interact with the NPC using the configured interaction key (default: `E`).
3. A menu will appear showing the items they can sell.
4. Players select the item and confirm the sale to receive in-game currency.

---

## Dependencies

- **RSG V2 Framework**: Ensure your server is running the RSG V2 Framework for compatibility.

---

## Contributing

We welcome contributions to improve this script! If you encounter issues or have suggestions, feel free to:

- Submit a pull request.
- Open an issue on the GitHub repository.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

## Credits

- Script developed by [Your Name/Team Name].
- Special thanks to the RedM and RSG communities for their support.

---

## Support

For questions or support, join our Discord server [here](https://discord.gg/mPvcbAN3e7).

---

Enjoy the script and happy roleplaying!
