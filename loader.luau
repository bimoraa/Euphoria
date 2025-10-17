local http_service: HttpService = game:GetService("HttpService")
local players: Players          = game:GetService("Players")
local starter_gui: StarterGui   = game:GetService("StarterGui")

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
		url     = "https://api.luarmor.net/files/v3/loaders/0ef4e27ac6957fc36ee7113bffa52c69.lua",
		version = "1.0.0",
		author  = "euphoria",
	},
    [6911148748] = {
        name    = "cedit",
        url     = "https://api.luarmor.net/files/v3/loaders/69b3e3559dd7add9f6450a2e13e831ac.lua",
        version = "4.2.5",
        author  = "kimmy",
    }
}

local ___default_loader: loader_config = {
	name    = "cedit",
	url     = "https://api.luarmor.net/files/v3/loaders/69b3e3559dd7add9f6450a2e13e831ac.lua",
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



