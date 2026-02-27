local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local InstagramLink = "https://www.instagram.com/nmtomato_/"
local Instagram = "@nmtomato_"

-- ระบบคัดลอกลิงก์
if setclipboard then
    setclipboard(InstagramLink)
elseif syn and syn.write_clipboard then
    syn.write_clipboard(InstagramLink)
end

local function createUI()
    if CoreGui:FindFirstChild("TomatoGUI") then
        CoreGui.TomatoGUI:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TomatoGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MainFrame.Size = UDim2.new(0, 350, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
    MainFrame.BorderSizePixel = 0
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Thickness = 3
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local MainGrad = Instance.new("UIGradient", MainStroke)
    MainGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 150))
    }

    local TitleLabel1 = Instance.new("TextLabel", MainFrame)
    TitleLabel1.BackgroundTransparency = 1
    TitleLabel1.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel1.Font = Enum.Font.GothamBlack
    TitleLabel1.Text = "TomatoGUI"
    TitleLabel1.TextSize = 26 -- แก้ขนาดตรงนี้
    TitleLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)

    local FunctionButtonsFrame = Instance.new("ScrollingFrame", MainFrame)
    FunctionButtonsFrame.BackgroundTransparency = 1
    FunctionButtonsFrame.Size = UDim2.new(1, -20, 1, -100)
    FunctionButtonsFrame.Position = UDim2.new(0, 10, 0, 90)
    FunctionButtonsFrame.ScrollBarThickness = 5
    FunctionButtonsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    FunctionButtonsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

    -- จุดที่แก้ไข: ใส่เครื่องหมาย , หลังปิดปีกกา } ของแต่ละหมวดหมู่
    local functionCategories = {
        ["Farm Blox Fruits"] = {
            ["Maru ( มารุ )"] = [[(getgenv()).key = 'MARUT8S89LBUWJUJPTF34FZN7P'; (getgenv()).id = '825661579067785217'; loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/MaruComkak/main/PCBit.lua'))()]]
        }, -- ใส่คอมม่าตรงนี้
        ["PVP Blox Fruits"] = {
            ["Hermanos"] = [[getgenv().script_mode = 'PVP'; loadstring(game:HttpGet('https://raw.githubusercontent.com/hermanos-dev/hermanos-hub/refs/heads/main/Loader.lua'))()]]
        } -- จบหมวดหมู่สุดท้าย
    }

    local yOffset = 0
    for category, scripts in pairs(functionCategories) do
        local label = Instance.new("TextLabel", FunctionButtonsFrame)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, -20, 0, 30)
        label.Position = UDim2.new(0, 10, 0, yOffset)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 18 -- เพิ่มขนาดตัวหนังสือหัวข้อ
        label.TextColor3 = Color3.fromRGB(100, 200, 255)
        label.Text = category
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        yOffset += 35
        for name, url in pairs(scripts) do
            local btn = Instance.new("TextButton", FunctionButtonsFrame)
            btn.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
            btn.Size = UDim2.new(1, -20, 0, 40)
            btn.Position = UDim2.new(0, 10, 0, yOffset)
            btn.Font = Enum.Font.GothamBold
            btn.Text = name
            btn.TextSize = 16 -- เพิ่มขนาดตัวหนังสือปุ่ม
            btn.TextColor3 = Color3.fromRGB(230, 230, 255)
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

            btn.MouseButton1Click:Connect(function()
                loadstring(url)()
            end)
            yOffset += 45
        end
        yOffset += 15
    end

    local Toggle = Instance.new("TextButton", ScreenGui)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Position = UDim2.new(0, 20, 0, 20)
    Toggle.Text = "W"
    Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
    
    local isVisible = true
    Toggle.MouseButton1Click:Connect(function()
        isVisible = not isVisible
        MainFrame.Visible = isVisible
    end)
end

createUI()