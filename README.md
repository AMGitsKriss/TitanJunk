# TitanJunk

A World of Warcraft Classic: The Burning Crusade addon that integrates with Titan Panel to display the total vendor value of grey/junk items in your inventory.

## Features

- Displays total value of all grey (junk) items across all bags
- Shows value in standard gold-silver-copper format with icons
- Automatically updates when bag contents change
- Integrates seamlessly with Titan Panel

## Requirements

- World of Warcraft Classic: The Burning Crusade (TBC Classic) - Patch 2.5.4 or later
- [Titan Panel](https://www.curseforge.com/wow/addons/titan-panel-classic) addon

**Note**: This addon uses the `C_Container` API introduced in TBC Classic 2.5.4 (Interface 20504). If you're using an earlier version of TBC Classic, the addon will not work.

## Installation

1. Download or clone this repository
2. Copy the `TitanJunk` folder to your WoW AddOns directory:
   - Windows: `C:\Program Files (x86)\World of Warcraft\_classic_\Interface\AddOns\`
   - Mac: `/Applications/World of Warcraft/_classic_/Interface/AddOns/`
3. Restart World of Warcraft or reload your UI with `/reload`
4. Enable the addon in the character selection screen if needed

## Usage

1. Make sure Titan Panel is installed and enabled
2. Right-click on the Titan Panel bar
3. Navigate to `Plugins` → `Information` → `Junk`
4. The junk value will now appear on your Titan Panel bar
5. The value automatically updates as you loot, sell, or move items

## How It Works

The addon scans all your bag slots (bags 0-4) for items with "Poor" quality (grey items) and calculates their total vendor sell price. The value is displayed on the Titan Panel bar in the familiar gold, silver, and copper format.

The addon uses the modern `C_Container` API introduced in TBC Classic 2.5.4 for bag/container operations.

## Troubleshooting

### Plugin Not Showing in Titan Panel Menu

If the addon is enabled but you can't find it in the Titan Panel menu:

1. Make sure Titan Panel is installed and enabled
2. Try reloading your UI with `/reload`
3. Check that both TitanJunk and Titan Panel are enabled in the AddOns list at character selection
4. Look for "Junk" under: Right-click Titan Panel → Plugins → Information → Junk

### Common Issues

- **Addon shows as "Dependency Missing"**: Titan Panel must be installed first
- **Error about GetContainerNumSlots**: Make sure you're running TBC Classic 2.5.4 or later. Earlier versions don't have the `C_Container` API.
- **Values not updating**: The addon updates when you loot items or when bags change. Try moving an item to trigger an update.
- **No grey items showing**: You need to have grey/junk quality items in your bags (0-4) for a value to display

## Version

Current Version: 1.0.0

## Author

AMGitsKriss

## License

See LICENSE file for details.
