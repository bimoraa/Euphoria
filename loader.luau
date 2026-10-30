
local cloneref = cloneref or function(x)
    return x
end

local game = cloneref(game)
local starter_gui = cloneref(game:GetService("StarterGui"))

-- Types
type loader_config = {
    name: string,
    url: string,
    version: string?,
    author: string?,
}

-- Game loaders
local ___loaders: { [number]: loader_config } = {
    [6701277882] = {
        name = "fish it",
        url = "https://luaegis.net/scripts/v4/loaders/8686cf63-8b4b-4537-ad62-46370cd123c9.lua",
        version = "1.0.0",
        author = "euphoria",
    },

    [2640407187] = {
        name = "cedit",
        url = "https://luaegis.net/scripts/v4/loaders/9a49143d-e012-4adc-8184-7daaa663c287.lua",
        version = "4.2.5",
        author = "kimmy",
    },

    [9186719164] = {
        name = "sailor-piece",
        url = "https://api.luarmor.net/files/v4/loaders/bb6b824d6b34ae2345aeedf237580bb5.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [7089588429] = {
        name = "drag-drive-simulator-dds",
        url = "https://luaegis.net/scripts/v4/loaders/cf0d5530-e8d7-4ebd-9979-78b4358332af.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [6739698191] = {
        name = "violence-district",
        url = "https://luaegis.net/scripts/v4/loaders/1878d5d6-3c23-4737-98a9-527a72648456.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [10004244222] = {
        name = "kick-a-lucky-block",
        url = "https://luaegis.net/scripts/v4/loaders/022ddf9e-e2da-461d-a1e5-4e421dadc2ec.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [10200395747] = {
        name = "grow-a-garden2",
        url = "https://luaegis.net/scripts/v4/loaders/7b8ee026-c7cd-44ea-ba82-131087e8751a.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [9826885587] = {
        name = "evomon",
        url = "https://luaegis.net/scripts/v4/loaders/d2d69abb-e664-42fc-8e8b-72666fd81acf.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [5750914919] = {
        name = "fisch",
        url = "https://luaegis.net/scripts/v4/loaders/9332ba9b-6190-45b8-9e1c-0629282f9d78.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [7613921865] = {
        name = "Anime Expeditions",
        url = "https://luaegis.net/scripts/v4/loaders/0400cbe0-d0a7-4c3d-a234-8dedb385cdb9.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [10148749921] = {
        name = "Animal Hospital",
        url = "https://luaegis.net/scripts/v4/loaders/8a55ab5d-6ac7-4bd4-854b-69f3b577799e.lua",
        version = "0.0.1",
        author = "atomic",
    },

    [10708913337] = {
        name = "Anime Dice",
        url = "https://pastefy.app/91iF1i4S/raw",
        version = "0.0.1",
        author = "ATOMIC",
    },
}

-- Place loaders
local ___place_loaders: { [number]: loader_config } = {
    [132986577553100] = {
        name = "cdid-sapi-quest",
        url = "https://luaegis.net/scripts/v4/loaders/45250ba9-a034-47a0-b938-d6d4978e064c.lua",
        version = "0.0.1",
        author = "atomic",
    },
}

-- Notification
local function __notify(title: string, message: string)
    pcall(function()
        starter_gui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = 5,
        })
    end)
end

-- Script loader
local function __load_script(config: loader_config): boolean
    if type(config.url) ~= "string" or config.url == "" then
        __notify("euphoria loader", "invalid script URL")
        return false
    end

    if type(loadstring) ~= "function" then
        __notify("euphoria loader", "loadstring is unavailable")
        return false
    end

    local success, err = pcall(function()
        local source = game:HttpGet(config.url)

        assert(type(source) == "string" and #source > 0,
            "empty or invalid script response")

        local compiled, compile_error = loadstring(source)

        if not compiled then
            error(compile_error or "failed to compile script")
        end

        local executed, execution_error = xpcall(
            compiled,
            function(e)
                return tostring(e)
            end
        )

        if not executed then
            error(execution_error)
        end
    end)

    if not success then
        warn("[euphoria loader] failed:", err)
        __notify("euphoria loader", "failed to load " .. config.name)
        return false
    end

    print("[euphoria loader] loaded:", config.name)
    __notify("euphoria loader", "loaded " .. config.name)

    return true
end

-- Main
local place_id = game.PlaceId
local universe_id = game.GameId

local config: loader_config? =
    ___place_loaders[place_id]
    or ___loaders[universe_id]

-- Execution
if not config then
    warn("[euphoria loader] unsupported game:", place_id, universe_id)
    __notify("euphoria loader", "this game is not supported")
    return
end

print("[euphoria loader] detected:", config.name)

__load_script(config)
