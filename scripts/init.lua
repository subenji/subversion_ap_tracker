DEBUG_MODE = true
ENABLE_DEBUG_LOG = false or DEBUG_MODE

print("-- SM AP Tracker --")
print("Loaded tracker : ", Tracker.ActiveVariantUID)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end


-- Logic
ScriptHost:LoadScript("scripts/logic/utils.lua")
--[[ScriptHost:LoadScript("scripts/logic/items.lua")
ScriptHost:LoadScript("scripts/logic/areas.lua")
ScriptHost:LoadScript("scripts/logic/doors.lua")]]
ScriptHost:LoadScript("scripts/logic/locations.lua")
--ScriptHost:LoadScript("scripts/logic/logic.lua")


-- Custom Items
--[[ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/custom_item_progressive_toggle.lua")
ScriptHost:LoadScript("scripts/custom_items/custom_item_progressive_toggle2.lua")
ScriptHost:LoadScript("scripts/custom_items/door.lua")
ScriptHost:LoadScript("scripts/custom_items/transition.lua")
]]

-- Items
Tracker:AddItems("items/items.json")
--Tracker:AddItems("items/entrances.json")
-- Doors
--ScriptHost:LoadScript("scripts/init_doors.lua")
-- Transitions
--ScriptHost:LoadScript("scripts/init_transitions.lua")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
if DEBUG_MODE then
    --Tracker:AddLocations("locations/debug.json")  
end
Tracker:AddLocations("locations/spaceport.json")
Tracker:AddLocations("locations/oceania.json")
Tracker:AddLocations("locations/caves.json")
Tracker:AddLocations("locations/depths.json")
Tracker:AddLocations("locations/valley.json")
Tracker:AddLocations("locations/island.json")
Tracker:AddLocations("locations/peaks.json")
Tracker:AddLocations("locations/overworld.json")
--Tracker:AddLocations("locations/doors.json")

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
