-- TitanJunk - A Titan Panel plugin to display total value of grey/junk items in bags
-- Author: AMGitsKriss

local TITAN_JUNK_ID = "Junk";
local TITAN_JUNK_VERSION = "1.0.0";

-- Localization
local L = {};
L["TITAN_JUNK_MENU_TEXT"] = "Junk";
L["TITAN_JUNK_BUTTON_LABEL"] = "Junk: ";
L["TITAN_JUNK_TOOLTIP"] = "Junk Item Value";
L["TITAN_JUNK_TOOLTIP_HINT"] = "Shows the total vendor value of grey/junk items in your bags.";

-- Calculate total value of all grey/junk items in bags
function TitanPanelJunkButton_GetJunkValue()
	local totalValue = 0;
	
	-- Iterate through all bags (0-4 for main bags)
	for bag = 0, 4 do
		local numSlots = GetContainerNumSlots(bag);
		if numSlots then
			for slot = 1, numSlots do
				local _, itemCount, _, quality, _, _, itemLink = GetContainerItemInfo(bag, slot);
				
				-- Quality 0 = Poor (grey/junk)
				if itemLink and quality == 0 then
					local _, _, _, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(itemLink);
					if vendorPrice and vendorPrice > 0 then
						totalValue = totalValue + (vendorPrice * (itemCount or 1));
					end
				end
			end
		end
	end
	
	return totalValue;
end

-- Format copper amount to gold-silver-copper text
function TitanPanelJunkButton_GetButtonText(id)
	local junkValue = TitanPanelJunkButton_GetJunkValue();
	local buttonText = TitanUtils_GetColoredText(L["TITAN_JUNK_BUTTON_LABEL"], TitanPanelGetVar(id, "ShowLabelText"));
	local valueText = TitanUtils_GetColoredText(GetCoinTextureString(junkValue), TitanPanelGetVar(id, "ShowColoredText"));
	
	return L["TITAN_JUNK_BUTTON_LABEL"], valueText;
end

-- Show tooltip
function TitanPanelJunkButton_GetTooltipText()
	local junkValue = TitanPanelJunkButton_GetJunkValue();
	local tooltipText = L["TITAN_JUNK_TOOLTIP"].."\n"..
		TitanUtils_GetGreenText(GetCoinTextureString(junkValue)).."\n"..
		TitanUtils_GetGreenText(L["TITAN_JUNK_TOOLTIP_HINT"]);
	
	return tooltipText;
end

-- OnLoad handler
function TitanPanelJunkButton_OnLoad(self)
	self.registry = {
		id = TITAN_JUNK_ID,
		version = TITAN_JUNK_VERSION,
		menuText = L["TITAN_JUNK_MENU_TEXT"],
		buttonTextFunction = "TitanPanelJunkButton_GetButtonText",
		tooltipTitle = L["TITAN_JUNK_TOOLTIP"],
		tooltipTextFunction = "TitanPanelJunkButton_GetTooltipText",
		category = "Information",
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
			ShowColoredText = 1,
		}
	};
	
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("BAG_UPDATE");
	self:RegisterEvent("ITEM_LOCK_CHANGED");
end

-- OnEvent handler
function TitanPanelJunkButton_OnEvent(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		-- Initialize on login
		TitanPanelButton_UpdateButton(TITAN_JUNK_ID);
	elseif event == "BAG_UPDATE" or event == "ITEM_LOCK_CHANGED" then
		-- Update when bags change
		TitanPanelButton_UpdateButton(TITAN_JUNK_ID);
	end
end

-- OnClick handler
function TitanPanelJunkButton_OnClick(self, button)
	-- Could add menu or actions here in the future
end
