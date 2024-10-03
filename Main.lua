local addonName, addon = ...
LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceConsole-3.0')

-- the prefix here is to get the category to sort to the end of the bag,
-- since the pipe symbol's code is greater than all alphanumerics
local categoryName = "|cffff8080Lootable|r"

local bb = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
local categories = bb:GetModule('Categories')
local context = bb:GetModule('Context')
local ctx = context:New('bbLootable')
local L = bb:GetModule('Localization')

-- pre-create the category so we can turn off the save flag (default)
categories:CreateCategory(ctx, {
   name = L:G(categoryName),
   itemList = {}, -- required member
   save = false,
})

categories:RegisterCategoryFunction("LootableFilter", function (data)

  if data.containerInfo.hasLoot then
    return L:G(categoryName)
  end

  return nil
end)
