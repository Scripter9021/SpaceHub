-- LocalScript to highlight every player

-- Function to add a highlight to a player
local function highlightPlayer(player)
    -- Check if the character exists and has a HumanoidRootPart
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Check if the highlight already exists and remove it to prevent duplicates
        if player.Character:FindFirstChildOfClass("Highlight") then
            player.Character:FindFirstChildOfClass("Highlight"):Destroy()
        end
        
        -- Create a new Highlight object
        local highlight = Instance.new("Highlight")
        
        -- Set the properties of the Highlight
        highlight.Adornee = player.Character -- Adorn the character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- White outline
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Ensure it's always visible
        
        -- Parent the Highlight to the player's character
        highlight.Parent = player.Character
    end
end

-- Function to highlight all players
local function highlightAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        highlightPlayer(player)
    end
end

-- Loop every 1 seconds to highlight all players
while true do
    highlightAllPlayers()
    wait(1) -- Wait for 1 seconds before repeating
end

-- Listen for new players joining and highlight them
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayer(player)
    end)
end)

-- Listen for existing players who respawn and re-highlight them
game.Players.PlayerRemoving:Connect(function(player)
    -- Optional: If you want to remove the highlight when the player leaves
end)
