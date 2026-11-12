
-- NXT | Made by Waleed
-- Copy-only UI

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")

local gui = Instance.new("ScreenGui")
gui.Name = "NXT"
gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local function new(class, props, parent)
    local obj = Instance.new(class)
    for k,v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local function round(obj, radius)
    new("UICorner", {
        CornerRadius = UDim.new(0, radius)
    }, obj)
end

local games = {
    ["Steal a Egg"] = {
        {"TOP 1 - Chilli", "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua", "Keyless"},
        {"Break and Steal Egg", "https://scriptblox.com/raw/Break-and-Steal-an-Egg-Best-Script-Autofarm-Auto-Break-Auto-Steal-Keyless-and-More-232332", "Keyless"},
        {"Insta Teleport", "https://scriptblox.com/raw/Steal-An-Egg-Insta-Teleport-Steal-divine-secret-and-more-229612", "Keyless"},
        {"Moondiety", "https://scriptblox.com/raw/Universal-Script-Moondiety-Scripts-Hub-45712", "Keyless"}
    },
    ["Blox Fruits"] = {
        {"Zero Point", "https://scriptblox.com/raw/Blox-Fruits-Zero-Point-Auto-Level-Kill-Aura-Mob-Magnet-and-More-BETA-232179", "Key Required"},
        {"Snowy Hub", "https://scriptblox.com/raw/Blox-Fruits-Snowy-Hub-Auto-Farm-Kill-Aura-Bring-Mob-More-238694", "Key Required"},
        {"Redz Hub", "https://scriptblox.com/raw/Universal-Script-Redz-hub-240444", "Keyless"}
    },
    ["Steal a Brainrot"] = {
        {"Moondiety", "https://scriptblox.com/raw/Universal-Script-Moondiety-Scripts-Hub-45712", "Keyless"},
        {"LightningHub", "https://scriptblox.com/raw/Universal-Script-LightningHub-+10-Script-BEST-No-Key-227304", "Keyless"},
        {"Auto Steal Egg", "https://scriptblox.com/raw/Steal-A-Brainrot-Egg-BEST-Auto-Steal-Eggs-or-God-Mode-or-Auto-Hatch-and-Sell-or-Mobile-228337", "Keyless"}
    }
}

local main = new("Frame", {
    Size = UDim2.fromOffset(340, 420),
    Position = UDim2.new(0.5, -170, 0.5, -210),
    BackgroundColor3 = Color3.fromRGB(18,18,25),
    Visible = false
}, gui)
round(main, 14)

new("TextLabel", {
    Size = UDim2.new(1,0,0,45),
    BackgroundTransparency = 1,
    Text = "NXT | MADE BY WALEED",
    TextColor3 = Color3.new(1,1,1),
    TextSize = 19,
    Font = Enum.Font.GothamBold
}, main)

local statsLabel = new("TextLabel", {
    Position = UDim2.fromOffset(8,43),
    Size = UDim2.new(1,-16,0,25),
    BackgroundTransparency = 1,
    Text = "FPS: -- | Ping: --",
    TextColor3 = Color3.fromRGB(90,190,255),
    TextSize = 13
}, main)

local tabs = new("Frame", {
    Position = UDim2.fromOffset(8,75),
    Size = UDim2.new(1,-16,0,38),
    BackgroundTransparency = 1
}, main)

local body = new("ScrollingFrame", {
    Position = UDim2.fromOffset(8,120),
    Size = UDim2.new(1,-16,1,-128),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    CanvasSize = UDim2.new(0,0,0,0)
}, main)

local layout = new("UIListLayout", {
    Padding = UDim.new(0,8),
    SortOrder = Enum.SortOrder.LayoutOrder
}, body)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    body.CanvasSize = UDim2.fromOffset(0,layout.AbsoluteContentSize.Y+8)
end)

local function showGame(name)
    for _,v in ipairs(body:GetChildren()) do
        if v:IsA("GuiObject") and v ~= layout then
            v:Destroy()
        end
    end

    for _,item in ipairs(games[name]) do
        local row = new("Frame", {
            Size = UDim2.new(1,-5,0,58),
            BackgroundColor3 = Color3.fromRGB(32,32,43)
        }, body)
        round(row,8)

        new("TextLabel", {
            Position = UDim2.fromOffset(9,5),
            Size = UDim2.new(1,-100,0,25),
            BackgroundTransparency = 1,
            Text = item[1],
            TextColor3 = Color3.new(1,1,1),
            TextSize = 12,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left
        }, row)

        new("TextLabel", {
            Position = UDim2.fromOffset(9,30),
            Size = UDim2.new(1,-100,0,20),
            BackgroundTransparency = 1,
            Text = item[3],
            TextColor3 = Color3.fromRGB(160,160,175),
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left
        }, row)

        local copy = new("TextButton", {
            Position = UDim2.new(1,-78,0.5,-15),
            Size = UDim2.fromOffset(68,30),
            BackgroundColor3 = Color3.fromRGB(40,110,180),
            Text = "COPY",
            TextColor3 = Color3.new(1,1,1),
            TextSize = 12,
            Font = Enum.Font.GothamBold
        }, row)
        round(copy,6)

        copy.MouseButton1Click:Connect(function()
            local fullText = 'loadstring(game:HttpGet("' .. item[2] .. '"))()'
            if setclipboard then
                local ok = pcall(setclipboard, fullText)
                copy.Text = ok and "COPIED!" or "ERROR"
            else
                copy.Text = "NO CLIP"
            end
            task.delay(1.2, function()
                if copy.Parent then copy.Text = "COPY" end
            end)
        end)
    end
end

local names = {"Steal a Egg","Blox Fruits","Steal a Brainrot"}

for i,name in ipairs(names) do
    local tab = new("TextButton", {
        Position = UDim2.new((i-1)/3,2,0,0),
        Size = UDim2.new(1/3,-4,1,0),
        BackgroundColor3 = Color3.fromRGB(42,42,56),
        Text = name,
        TextColor3 = Color3.new(1,1,1),
        TextSize = 9,
        Font = Enum.Font.GothamBold
    }, tabs)
    round(tab,6)

    tab.MouseButton1Click:Connect(function()
        showGame(name)
    end)
end

showGame(names[1])

local circle = new("TextButton", {
    Size = UDim2.fromOffset(60,60),
    Position = UDim2.new(0,25,0.5,-30),
    BackgroundColor3 = Color3.fromRGB(35,110,190),
    Text = "NXT",
    TextColor3 = Color3.new(1,1,1),
    TextSize = 18,
    Font = Enum.Font.GothamBold
}, gui)
round(circle,100)

circle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- Drag floating circle
local dragging = false
local dragStart, startPos

circle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = circle.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        circle.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- FPS / Ping display
local frames, elapsed = 0, 0

RunService.RenderStepped:Connect(function(dt)
    frames += 1
    elapsed += dt

    if elapsed >= 1 then
        local ping = "--"
        pcall(function()
            ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
        end)
        statsLabel.Text = "FPS: " .. frames .. " | Ping: " .. ping
        frames, elapsed = 0, 0
    end
end)
