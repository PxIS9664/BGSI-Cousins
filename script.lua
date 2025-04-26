local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "🔥 BGSI | COUSINS 💥",
    LoadingTitle = "🔥 BGSI | COUSINS 💥",
    LoadingSubtitle = "by lx5h1 , kh8k",
    ConfigurationSaving = {Enabled = false, FolderName = nil, FileName = "BLBOOL EL3OOD"},
    Discord = {Enabled = true, Invite = "A58zhWUa", RememberJoins = true},
    KeySystem = true,
    KeySettings = {
        Title = "BGSI COUSINS | KEY",
        Subtitle = "link in discord server",
        Note = "Key In Discord Server",
        FileName = "BO7Balq",
        SaveKey = false,
        GrabKeyFromSite = true,
        Key = {"https://pastebin.com/raw/ttiDd6CW"}
    }
})
Rayfield:Notify({Title = "You executed", Content = "https://discord.gg/A58zhWUa", Duration = 5, Actions = {Ignore = {Name = "Okay!", Callback = function()print("The user tapped Okay!")end}}})
local MainTab = Window:CreateTab("Main")
local TeleportTab = Window:CreateTab("Teleports")
local MiscTab = Window:CreateTab("🎲 Misc")
MainTab:CreateSection("Main Controls")
MiscTab:CreateSection("Egg Hatching")
local autoBlowEnabled = false
MainTab:CreateButton({
    Name = "Toggle Auto Blow Bubble 🎈",
    Callback = function()
        autoBlowEnabled = not autoBlowEnabled
        if autoBlowEnabled then
            Rayfield:Notify({Title = "✅ Auto Blow Started", Content = "Blowing every 0.2s!", Duration = 4})
            task.spawn(function()
                while autoBlowEnabled do
                    local args = {[1] = "BlowBubble"}
                    pcall(function()
                        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                    end)
                    task.wait(0.2)
                end
            end)
        else
            Rayfield:Notify({Title = "🛑 Auto Blow Stopped", Content = "Stopped blowing.", Duration = 4})
        end
    end
})
local function teleport(path)
    local args = {[1] = "Teleport", [2] = path}
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
end
TeleportTab:CreateSection("Islands 🌎")
TeleportTab:CreateButton({Name = "Teleport to Spawn", Callback = function() teleport("Workspace.Worlds.The Overworld.PortalSpawn") end})
TeleportTab:CreateButton({Name = "Teleport to Floating Island", Callback = function() teleport("Workspace.Worlds.The Overworld.Islands.Floating Island.Island.Portal.Spawn") end})
TeleportTab:CreateButton({Name = "Teleport to Zen", Callback = function() teleport("Workspace.Worlds.The Overworld.Islands.Zen.Island.Portal.Spawn") end})
TeleportTab:CreateButton({Name = "Teleport to The Void", Callback = function() teleport("Workspace.Worlds.The Overworld.Islands.The Void.Island.Portal.Spawn") end})
TeleportTab:CreateButton({Name = "Teleport to Twilight", Callback = function() teleport("Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn") end})
TeleportTab:CreateButton({Name = "Teleport to Outer Space", Callback = function() teleport("Workspace.Worlds.The Overworld.Islands.Outer Space.Island.Portal.Spawn") end})
TeleportTab:CreateSection("Limited 🥚")
TeleportTab:CreateButton({Name = "Teleport to Easter Event 🌸", Callback = function() teleport("Workspace.Event.Portal.Spawn") end})
local amountToHatch = 6
MiscTab:CreateInput({
    Name = "Set Amount of Eggs to Hatch 🎯",
    PlaceholderText = "Enter amount (1-6)",
    RemoveTextAfterFocusLost = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            amountToHatch = num
            Rayfield:Notify({Title = "✅ Hatch Amount Set", Content = "Now hatching "..num.." eggs!", Duration = 4})
        else
            Rayfield:Notify({Title = "❌ Error", Content = "Please enter a number!", Duration = 4})
        end
    end
})
local autoHatchBunny, autoHatchThrowback, autoHatchPastel = false, false, false
local function startAutoHatch(eggName, flagName)
    if _G[flagName] then
        _G[flagName] = false
        Rayfield:Notify({Title = "🛑 Auto Hatch Stopped", Content = eggName.." stopped.", Duration = 4})
    else
        _G[flagName] = true
        Rayfield:Notify({Title = "✅ Auto Hatch Started", Content = "Hatching "..eggName.."!", Duration = 4})
        task.spawn(function()
            while _G[flagName] do
                local args = {[1] = "HatchEgg", [2] = eggName, [3] = amountToHatch}
                pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                end)
                task.wait(3)
            end
        end)
    end
end
MiscTab:CreateButton({Name = "Toggle Auto Hatch Bunny Egg 🐰", Callback = function() startAutoHatch("Bunny Egg", "autoHatchBunny") end})
MiscTab:CreateButton({Name = "Toggle Auto Hatch Throwback Egg 🕰️", Callback = function() startAutoHatch("Throwback Egg", "autoHatchThrowback") end})
MiscTab:CreateButton({Name = "Toggle Auto Hatch Pastel Egg 🎨", Callback = function() startAutoHatch("Pastel Egg", "autoHatchPastel") end})
