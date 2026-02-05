# TitanJunk

A World of Warcraft Classic: The Burning Crusade addon that integrates with Titan Panel to display the total vendor value of grey/junk items in your inventory.

## Features

- Displays total value of all grey (junk) items across all bags
- Shows value in standard gold-silver-copper format with icons
- Automatically updates when bag contents change
- Integrates seamlessly with Titan Panel

## Requirements

- World of Warcraft Classic: The Burning Crusade (TBC Classic)
- [Titan Panel](https://www.curseforge.com/wow/addons/titan-panel-classic) addon

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

## Version

Current Version: 1.0.0

## Author

AMGitsKriss

## License

See LICENSE file for details.
