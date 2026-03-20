--[[
    CommandService v1.0.0
    Developed by Script-hue
    Secure server-side command parsing system.
]]

local Players = game:GetService("Players")

-- Configuration
local COMMAND_PREFIX = "/"
local ADMIN_LIST = {
    [12345678] = true, -- Substitua pelo seu UserID do Roblox
}

local Commands = {}

-- Helper: Check Permissions
local function IsAdmin(player)
    return ADMIN_LIST[player.UserId] or false
end

-- Command: Kill
Commands.kill = function(admin, args)
    local targetName = args[1]
    if not targetName then return end
    
    local target = Players:FindFirstChild(targetName)
    if target and target.Character then
        target.Character:BreakJoints()
        print(admin.Name .. " killed " .. target.Name)
    end
end

-- Command: Teleport
Commands.tp = function(admin, args)
    local targetName = args[1]
    local destinationName = args[2]
    
    local target = Players:FindFirstChild(targetName)
    local destination = Players:FindFirstChild(destinationName)
    
    if target and destination and target.Character and destination.Character then
        target.Character:MoveTo(destination.Character.HumanoidRootPart.Position)
    end
end

-- Main Parser
local function OnPlayerChatted(player, message)
    if not IsAdmin(player) then return end
    if not message:find(COMMAND_PREFIX) == 1 then return end
    
    -- Remove prefix and split string into arguments
    local fullCommand = message:sub(#COMMAND_PREFIX + 1)
    local args = fullCommand:split(" ")
    local commandName = table.remove(args, 1):lower()
    
    -- Execute if command exists
    if Commands[commandName] then
        Commands[commandName](player, args)
    end
end

-- Connect Players
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        OnPlayerChatted(player, message)
    end)
end)

print("CommandService Active")
