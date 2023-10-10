DEBUG_MODE = false
ENABLE_DEBUG_LOG = false or DEBUG_MODE

print("-- SM AP Tracker --")
print("Loaded tracker : ", Tracker.ActiveVariantUID)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Items
Tracker:AddItems("items/items.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
if DEBUG_MODE then
    Tracker:AddLocations("locations/debug.json")  
else
    Tracker:AddLocations("locations/locations.json")
end

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
