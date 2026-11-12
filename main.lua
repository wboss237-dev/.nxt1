
-- NXT | Made by Waleed
-- Copy-only menu
-- Executor environment required for clipboard

local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "NXT"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local function make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local main = make("Frame", {
    Size = UDim2.fromOffset(300, 380),
    Position = UDim2.new(.5, -150, .5, -190),
    BackgroundColor3 = Color3.fromRGB(20,20,25),
    Visible = false
}, gui)

make("UICorner", {CornerRadius=UDim.new(0,12)}, main)

local toggle = make("TextButton", {
    Size = UDim2.fromOffset(55,55),
    Position = UDim2.new(0,20,.5,-25),
    Text = "NXT",
    TextColor3 = Color3.new(1,1,1),
    BackgroundColor3 = Color3.fromRGB(40,40,55),
    TextSize = 18
}, gui)
make("UICorner", {CornerRadius=UDim.new(1,0)}, toggle)

toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

make("TextLabel", {
    Size = UDim2.new(1,0,0,40),
    BackgroundTransparency = 1,
    Text = "NXT | Made by Waleed",
    TextColor3 = Color3.new(1,1,1),
    TextSize = 20
}, main)

local info = make("TextLabel", {
    Position = UDim2.fromOffset(5,40),
    Size = UDim2.new(1,-10,0,25),
    BackgroundTransparency = 1,
    TextColor3 = Color3.new(1,1,1),
    Text = "FPS: -- | Ping: --"
}, main)

task.spawn(function()
    while gui.Parent do
        local fps = math.floor(1 / math.max(task.wait(),.001))
        local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        info.Text = "FPS: "..fps.." | Ping: "..math.floor(ping).." ms"
    end
end)

local scroll = make("ScrollingFrame", {
    Position = UDim2.fromOffset(8,72),
    Size = UDim2.new(1,-16,1,-80),
    BackgroundTransparency = 1,
    CanvasSize = UDim2.new(0,0,0,850),
    ScrollBarThickness = 4
}, main)

local layout = make("UIListLayout", {
    Padding = UDim.new(0,6),
    SortOrder = Enum.SortOrder.LayoutOrder
}, scroll)

local scripts = {
    {"Steal a Egg",{
        {"TOP 1 - Chilli","https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua","Keyless"},
        {"Break and Steal Egg","https://scriptblox.com/raw/Break-and-Steal-an-Egg-Best-Script-Autofarm-Auto-Break-Auto-Steal-Keyless-and-More-232332","Keyless"},
        {"Insta Teleport","https://scriptblox.com/raw/Steal-An-Egg-Insta-Teleport-Steal-divine-secret-and-more-229612","Keyless"},
        {"Moondiety","https://scriptblox.com/raw/Universal-Script-Moondiety-Scripts-Hub-45712","Keyless"}
    }},
    {"Blox Fruits",{
        {"Zero Point","https://scriptblox.com/raw/Blox-Fruits-Zero-Point-Auto-Level-Kill-Aura-Mob-Magnet-and-More-BETA-232179","Key Required"},
        {"Snowy Hub","https://scriptblox.com/raw/Blox-Fruits-Snowy-Hub-Auto-Farm-Kill-Aura-Bring-Mob-More-238694","Key Required"},
        {"Redz Hub","https://scriptblox.com/raw/Universal-Script-Redz-hub-240444","Keyless"}
    }},
    {"Steal a Brainrot",{
        {"Moondiety","https://scriptblox.com/raw/Universal-Script-Moondiety-Scripts-Hub-45712","Keyless"},
        {"LightningHub","https://scriptblox.com/raw/Universal-Script-LightningHub-+10-Script-BEST-No-Key-227304","Keyless"},
        {"Auto Steal Egg","https://scriptblox.com/raw/Steal-A-Brainrot-Egg-BEST-Auto-Steal-Eggs-or-God-Mode-or-Auto-Hatch-and-Sell-or-Mobile-228337","Keyless"}
    }}
}

local function addLabel(text)
    make("TextLabel",{
        Size=UDim2.new(1,-5,0,30),
        BackgroundColor3=Color3.fromRGB(45,45,60),
        TextColor3=Color3.new(1,1,1),
        Text=text,
        TextSize=16
    },scroll)
end

local function addButton(name, code, status)
    local b = make("TextButton",{
        Size=UDim2.new(1,-5,0,48),
        BackgroundColor3=Color3.fromRGB(35,35,43),
        TextColor3=Color3.new(1,1,1),
        Text=name.." | "..status.." | COPY",
        TextSize=12
    },scroll)
    make("UICorner",{CornerRadius=UDim.new(0,7)},b)

    b.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard('loadstring(game:HttpGet("'..code..'"))()')
            b.Text = "COPIED!"
            task.wait(1)
            b.Text = name.." | "..status.." | COPY"
        end
    end)
end

for _, section in ipairs(scripts) do
    addLabel(section[1])
    for _, item in ipairs(section[2]) do
        addButton(item[1],item[2],item[3])
    end
end

addLabel("FPS BOOST | SERVER HOP")
addLabel("NXT | Made by Waleed")
