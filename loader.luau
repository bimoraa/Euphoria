local cloneref = cloneref or function(x) return x end

local game          = cloneref(game)
local http_service  = cloneref(game:GetService("HttpService"))
local players       = cloneref(game:GetService("Players"))
local starter_gui   = cloneref(game:GetService("StarterGui"))
--@eu_guards 
-- https://getsades.net/Module/__guard_core?init_id=script_key
-- https://getsades.net/Module/__whitelist_check.lua?key=script_key
-- https://getsades.net/Module/_init_safeguard_v2.luau?init_id=script_key
-- https://getsades.net/Module/____eu_validate____.luau?token=script_key
-- https://getsades.net/Module/guard_proxy/__init__.luau?init_id=script_key
-- https://getsades.net/Module/white_gatekeeper-01.luau?init_id=script_key
-- https://getsades.net/Module/secure/__init_guard_router.luau?key=script_key
-- https://getsades.net/Module/verify/____script_key_check.luau?init=script_key
-- https://getsades.net/Module/locks/__eu_whitelist_init.luau?init_id=script_key
-- https://getsades.net/Module/__init_shield_v3__.luau?init_id=script_key
-- https://getsades.net/Module/cloud/__verify_cloud_device?cloud_id=CLOUD_IP&CLOUD_API_KEY&CLOUD_HWID&CLOUD_FINGERPRINT
-- ininya execute aja di main script biar gabisa di hook

local __cache = "__lgcache8"

if isfolder(__cache) then
    delfolder(__cache)
end


--@types
type loader_config = {
	name: string,
	url: string,
	version: string?,
	author: string?,
}
--@list_game_loaders
local ___loaders: { [number]: loader_config } = {
	[121864768012064] = {
		name    = "fish it",
		url     = "https://luaegis.net/scripts/v4/loaders/8686cf63-8b4b-4537-ad62-46370cd123c9.lua",
		version = "1.0.0",
		author  = "euphoria",
	},
    [6911148748] = {
        name    = "cedit",
        url     = "https://luaegis.net/scripts/v4/loaders/9a49143d-e012-4adc-8184-7daaa663c287.lua",
        version = "4.2.5",
        author  = "kimmy",
    },
    [77747658251236] = {
        name    = "sailor-piece",
        url     = "https://api.luarmor.net/files/v4/loaders/bb6b824d6b34ae2345aeedf237580bb5.lua",
        version = "0.0.1",
        author  = "atomic",
    },
}
local ___default_loader: loader_config = {
	name    = "cedit",
	url     = "https://luaegis.net/scripts/v4/loaders/9a49143d-e012-4adc-8184-7daaa663c287.lua",
	version = "4.2.5",
	author  = "kimmy",
}
--@utility
local function __notify(title: string, text: string): ()
	pcall(function()
		starter_gui:SetCore("SendNotification", {
			Title    = title,
			Text     = text,
			Duration = 5,
		})
	end)
end
--@loader
local function __load_script(url: string): boolean
	local success: boolean, result: any = pcall(function()
		local script_content: string = game:HttpGet(url)
		local loaded_function: any = loadstring(script_content)
		
		if loaded_function then
			loaded_function()
			return true
		else
			error("failed to compile script")
		end
	end)
	
	if not success then
		warn("[loader] failed:", result)
		__notify("euphoria loader", "failed to load script")
		return false
	end
	
	return true
end
--@main loader
local current_place_id: number = game.PlaceId
local loader_config: loader_config = ___loaders[current_place_id] or ___default_loader
--@main execution
__load_script(loader_config.url)
