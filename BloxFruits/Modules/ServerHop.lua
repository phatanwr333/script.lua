local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local ServerHop = {}

local PlaceID = game.PlaceId
local actualHour = os.date("!*t").hour

local AllIDs = { actualHour }
local cursor = ""

function ServerHop:Hop()
	local function TPReturner()
		local url = "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
		if cursor ~= "" then
			url = url .. "&cursor=" .. cursor
		end

		local data = HttpService:JSONDecode(game:HttpGet(url))
		cursor = data.nextPageCursor or ""

		for _, server in pairs(data.data) do
			local id = server.id
			if server.playing < server.maxPlayers then
				local isNew = true
				for _, existing in pairs(AllIDs) do
					if id == existing then
						isNew = false
						break
					end
				end

				if isNew then
					table.insert(AllIDs, id)
					task.wait()
					pcall(function()
						TeleportService:TeleportToPlaceInstance(PlaceID, id, Players.LocalPlayer)
					end)
					task.wait(4)
				end
			end
		end
	end

	task.spawn(function()
		while task.wait() do
			pcall(TPReturner)
			if cursor ~= "" then
				pcall(TPReturner)
			end
		end
	end)
end

function ServerHop:HopLowestPlayer()
	local bestServer = nil
	local lowestPlayers = math.huge
	local link = "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"

	local function search()
		local data = HttpService:JSONDecode(game:HttpGet(link))
		for _, server in pairs(data.data) do
			if server.playing and server.playing < lowestPlayers and server.id ~= game.JobId then
				bestServer = server.id
				lowestPlayers = server.playing
			end
		end
		if data.nextPageCursor then
			link = link .. "&cursor=" .. data.nextPageCursor
			search()
		end
	end

	pcall(search)

	if bestServer then
		local success = pcall(function()
			TeleportService:TeleportToPlaceInstance(PlaceID, bestServer)
		end)
		if not success then
			task.wait(2)
			TeleportService:TeleportToPlaceInstance(PlaceID, bestServer)
		end
	end
end

return ServerHop
