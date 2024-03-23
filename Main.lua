local addonName, addon = ...
LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceConsole-3.0')

local bb = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
local categories = bb:GetModule('Categories')
local L = bb:GetModule('Localization')

categories:RegisterCategoryFunction("LootableFilter", function (data)

  if data.containerInfo.hasLoot then
    -- the prefix here is to get it to sort to the end of the bag
    return L:G("~Lootable")
  end

  return nil
end)
