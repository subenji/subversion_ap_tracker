--As "crash" is progressive, not a toggle (so 'extra' crash checks don't reflip a toggle)
--the "not crashed" state is always true - so we need a false state to disable
--spaceport locations after the crash
function spaceport_not_crashed()
    return Tracker:ProviderCountForCode("crash") < 1
end

--this isn't necessary as just checking the "crash" code is functionally the same
--but it reads cleaner in visibility rules
function spaceport_crashed()
    return Tracker:ProviderCountForCode("crash") > 0
end

function any_bomb()
    return has("morph") and (has("bomb") or has("pb"))
end

function has(item)
    return Tracker:ProviderCountForCode(item)
end

function lab1()
    return false
end

local upper_spaceport_rules = {
    ["Torpedo Bay"] = function() return true end,
    ["Weapon Locker"] = function() return has("missile") end,
    ["Aft Battery"] = function() return has("morph") end,
    ["Forward Battery"] = function() return has("morph") and has("missile") end,
    ["Gantry"] = function() return has("missile") end,
    ["Ready Room"] = function() return has("super") end,
    ["Extract Storage"] = function() return has("morph") and has("pb") end
}

local lower_spaceport_rules = {
    ["Docking Port 4"] = function() return has("grapple") or (lab1() and has("metroid")) or (lab1() and has("power")) end,
    ["Docking Port 3"] = function() return has("grapple") or (lab1() and has("metroid")) or (lab1() and has("power")) end,
}

local oceania_rules = {
    ["Impact Crater"] = function() return has("spazer") and has("morph") end,
    ["Subterranean Burrow"] = function() return true end,
    ["Impact Crater Alcove"] = function() return any_bomb() and has("space") end,
}

function upper_spaceport(loc)
    local func = upper_spaceport_rules[loc]
    return func()
end

function lower_spaceport(loc)
    local func = lower_spaceport_rules[loc]
    return func()
end

function oceania(loc)
    if not has("missile") then return false end
    local func = oceania_rules[loc]
    if func then return func() end
    return false
end

local loc_area = {
    --Spaceport - these will need modifying for after the crash
    ["Torpedo Bay"] = upper_spaceport,
    ["Weapon Locker"] = upper_spaceport,
    ["Aft Battery"] = upper_spaceport,
    ["Forward Battery"] = upper_spaceport,
    ["Gantry"] = upper_spaceport,
    ["Ready Room"] = upper_spaceport,
    ["Extract Storage"] = upper_spaceport,
    ["Docking Port 4"] = lower_spaceport,
    ["Docking Port 3"] = lower_spaceport,
    --Oceania

}

function get_access_to_loc(loc)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
        --print(string.format("get_access_to_loc: checking location %s", loc))
    end
    local func = loc_area[loc]
    if func then
        return func(loc)
    end
    return false
end
