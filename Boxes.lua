local plr = game.Players.LocalPlayer
local box = Instance.new('BillboardGui')
local frame = Instance.new('Frame')
local Teams = game:GetService('Teams'):GetTeams()

box.Name = 'Name'
frame.Name = 'Name'

box.Size = UDim2.new(4.5, 0,6.5, 0)
box.Parent = nil
box.AlwaysOnTop = true

frame.Size = UDim2.new(1, 0,1, 0)
frame.Position = UDim2.new(0,0,0,0)
frame.BackgroundColor3 = Color3.fromRGB(170,0,0)
frame.BackgroundTransparency = 0.75
frame.Parent = box

local function setup(player)
	if player == plr then return end
	local boxESP = box:Clone()
	local char = player.Character or player.CharacterAdded:Wait()
	
	local humRP = char:WaitForChild('HumanoidRootPart')
	if #Teams > 0 then
		if player.Team == plr.Team then return end
	end
  if humRP:FindFirstChild('Name') then return end
	if humRP then boxESP.Parent = humRP else return end
end

local function addPlr(player)
	setup(player)
	
	player.CharacterAdded:Connect(function()
		setup(player)
	end)
end


local players = game:GetService('Players'):GetPlayers()

for _, plrs in ipairs(players) do
	addPlr(plrs)
end

game.Players.PlayerAdded:Connect(function(plr)
	addPlr(plr)
end)
