local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Notification function
local onMessage = function(message)  
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Notification",
        Text = message,
        Duration = 10,
        Icon = "rbxassetid://120191430745933"
    })
end

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Bakmix - KeySytem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame - Dark black background
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 320) -- เพิ่มความสูงเพื่อให้พอดีกับปุ่มใหม่
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- เปลี่ยนเป็นสีดำ
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Main frame corner
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Top section with close button and key icon
local TopSection = Instance.new("Frame")
TopSection.Name = "TopSection"
TopSection.Size = UDim2.new(1, 0, 0, 50)
TopSection.BackgroundTransparency = 1
TopSection.Parent = MainFrame

-- Close button (X) - top right
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(25, 35, 50) -- เข้มขึ้น
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 12
CloseButton.Parent = TopSection

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

-- Key icon - top left (cyan colored key)
local KeyIcon = Instance.new("ImageLabel")
KeyIcon.Name = "KeyIcon"
KeyIcon.Size = UDim2.new(0, 24, 0, 24)
KeyIcon.Position = UDim2.new(0, 25, 0, 15)
KeyIcon.BackgroundTransparency = 1
KeyIcon.Image = "rbxassetid://120191430745933" -- Key icon
KeyIcon.ImageColor3 = Color3.fromRGB(100, 150, 255) -- เปลี่ยนเป็นฟ้าเข้ม
KeyIcon.Parent = TopSection

-- Title "Key Status"
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -100, 0, 25)
Title.Position = UDim2.new(0, 25, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Key Status"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, -50, 0, 20)
Subtitle.Position = UDim2.new(0, 25, 0, 75)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Bakmix – Free Scripts for Everyone!"
Subtitle.TextColor3 = Color3.fromRGB(180, 190, 200)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 12
Subtitle.Parent = MainFrame

-- Key input box
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(1, -50, 0, 35)
KeyInput.Position = UDim2.new(0, 25, 0, 110)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 30, 40) -- เข้มขึ้น
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 130, 140)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 13
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.ClearTextOnFocus = false
KeyInput.TextWrapped = false -- ปิดเพื่อให้ข้อความเรียงต่อกันไป
KeyInput.TextScaled = false -- ไม่ให้ปรับขนาดข้อความอัตโนมัติ
KeyInput.ClipsDescendants = true -- ตัดข้อความที่เกิน
KeyInput.Parent = MainFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInput

-- Input padding
local KeyInputPadding = Instance.new("UIPadding")
KeyInputPadding.PaddingLeft = UDim.new(0, 12)
KeyInputPadding.PaddingRight = UDim.new(0, 12) -- เพิ่ม padding ขวา
KeyInputPadding.Parent = KeyInput

-- Get Key button (blue color)
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Size = UDim2.new(1, -50, 0, 35)
GetKeyButton.Position = UDim2.new(0, 25, 0, 155)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200) -- ฟ้าเข้มขึ้น
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = "🔑 Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.TextSize = 13
GetKeyButton.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyButton

-- Check Expiry Date button (darker blue/gray)
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Size = UDim2.new(1, -50, 0, 35)
CheckKeyButton.Position = UDim2.new(0, 25, 0, 198)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(35, 45, 60) -- เข้มขึ้น
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Text = "🔍 Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.TextSize = 13
CheckKeyButton.Parent = MainFrame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKeyButton

-- Bottom info text with clock icon (ย้ายขึ้นมาข้างบน)
local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Size = UDim2.new(1, -50, 0, 20)
InfoText.Position = UDim2.new(0, 25, 0, 245)
InfoText.BackgroundTransparency = 1
InfoText.Text = "⏱ Free 1-day keys available | 🔑Monthly premium keys starting at $0.69"
InfoText.TextColor3 = Color3.fromRGB(120, 130, 140)
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 11
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Parent = MainFrame

-- Website button (bottom left) - ปรับตำแหน่งใหม่
local WebsiteButton = Instance.new("TextButton")
WebsiteButton.Name = "WebsiteButton"
WebsiteButton.Size = UDim2.new(0, 85, 0, 30)
WebsiteButton.Position = UDim2.new(0, 25, 1, -45)
WebsiteButton.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
WebsiteButton.BorderSizePixel = 0
WebsiteButton.Text = "Website"
WebsiteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
WebsiteButton.Font = Enum.Font.GothamBold
WebsiteButton.TextSize = 11
WebsiteButton.Parent = MainFrame

local WebsiteCorner = Instance.new("UICorner")
WebsiteCorner.CornerRadius = UDim.new(0, 6)
WebsiteCorner.Parent = WebsiteButton

-- Discord button (ข้างๆ Website) - ปรับตำแหน่งใหม่
local DiscordButton = Instance.new("TextButton")
DiscordButton.Name = "DiscordButton"
DiscordButton.Size = UDim2.new(0, 85, 0, 30)
DiscordButton.Position = UDim2.new(0, 120, 1, -45) -- เว้นระยะ 10px จาก Website
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.BorderSizePixel = 0
DiscordButton.Text = "Discord"
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.TextSize = 11
DiscordButton.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 6)
DiscordCorner.Parent = DiscordButton

-- Add to screen
MainFrame.Parent = ScreenGui
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Draggable functionality
local dragging = false
local dragInput
local dragStart  
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

-- Make the whole frame draggable (not just top bar)
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Button hover effects
local function createHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

-- Apply hover effects
createHoverEffect(CloseButton, Color3.fromRGB(255, 100, 100), Color3.fromRGB(25, 35, 50))
createHoverEffect(GetKeyButton, Color3.fromRGB(90, 150, 220), Color3.fromRGB(70, 130, 200))
createHoverEffect(CheckKeyButton, Color3.fromRGB(55, 65, 80), Color3.fromRGB(35, 45, 60))
createHoverEffect(DiscordButton, Color3.fromRGB(108, 121, 255), Color3.fromRGB(88, 101, 242))
createHoverEffect(WebsiteButton, Color3.fromRGB(70, 80, 100), Color3.fromRGB(50, 60, 80))

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Get Key button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro/key-sytem")
    onMessage("🌐 Key website copied to clipboard")
end)

-- Website button functionality
WebsiteButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro")
    onMessage("🌐 Website URL copied to clipboard")
end)

-- Discord button functionality
DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/9vWsKfRnQr")
    onMessage("🌐 Discord link copied to clipboard")
end)

-- Check Key button functionality
CheckKeyButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text:gsub("%s+", "")
    
    if key == "" then
        onMessage("🔑 Please enter a key!")
        return
    end
    
    -- Create request URL
    local url = "https://bakmix.pro/raw/callback?key=" .. HttpService:UrlEncode(key)
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        if data.status == "success" then
            -- First check if in supported map after successful key validation
            local allowedPlaces = {
                {placeId = 3678761576, scriptUrl = "https://bakmix.pro/raw/script/ww1.lua"}
            }
            
            local playerPlaceId = game.PlaceId
            local scriptToLoad = nil
            
            for _, place in ipairs(allowedPlaces) do
                if playerPlaceId == place.placeId then
                    scriptToLoad = place.scriptUrl
                    break
                end
            end
            
            if not scriptToLoad then
                onMessage("✅ Key is valid!")
                onMessage("❌ The script does not support this map")
                return
            end
            
            -- Set global variables
            _G.Key = key
            _G.PASSWORD = "24122009"
            
            -- Load script
            loadstring(game:HttpGet(scriptToLoad))()
            wait(1)
            loadstring(game:HttpGet"https://bakmix.pro/raw/webhook.lua")()
            
            -- Close GUI
            ScreenGui:Destroy()
            
            -- Show notifications
            onMessage("🔑 Key: " .. data.data.key)
            onMessage("⏳ Expires: " .. data.data.expires_at)
        else
            onMessage("❌ " .. (data.message or "Invalid key"))
        end
    else
        onMessage("🌐 Please notify in Discord to make corrections")
        warn("❌ Request Error: " .. response)
    end
end)

-- Mobile and desktop responsive design
local function updateUIScale()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local isMobile = viewportSize.X < 800
    
    if isMobile then
        -- Mobile adjustments
        MainFrame.Size = UDim2.new(0, math.min(380, viewportSize.X - 20), 0, 320)
        MainFrame.Position = UDim2.new(0.5, -math.min(190, (viewportSize.X - 20) / 2), 0.5, -160)
        
        -- Smaller text on mobile
        Title.TextSize = 16
        Subtitle.TextSize = 11
        KeyInput.TextSize = 12
        GetKeyButton.TextSize = 12
        CheckKeyButton.TextSize = 12
        InfoText.TextSize = 10
        DiscordButton.TextSize = 10
        WebsiteButton.TextSize = 10
    else
        -- Desktop size
        MainFrame.Size = UDim2.new(0, 400, 0, 320)
        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
        
        -- Normal text sizes
        Title.TextSize = 18
        Subtitle.TextSize = 12
        KeyInput.TextSize = 13
        GetKeyButton.TextSize = 13
        CheckKeyButton.TextSize = 13
        InfoText.TextSize = 11
        DiscordButton.TextSize = 11
        WebsiteButton.TextSize = 11
    end
end

updateUIScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateUIScale)
