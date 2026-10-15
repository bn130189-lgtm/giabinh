local _MERGED = {}
_MERGED["Config.lua"] = [=[

_G.YOKUDO = {
    Name = "YOKUDO HUB | Steal An Egg",
    Version = "telegram : @maibigber",
    Author = "Yokudo",

    AssetID = "rbxassetid://101352576986760",

    UI = {
        Width = 480,
        Height = 340,
        SidebarWidth = 115,
        TabHeight = 32,
        Theme = {
            Background = Color3.fromRGB(16, 17, 23),
            Sidebar = Color3.fromRGB(20, 21, 28),
            TopBar = Color3.fromRGB(23, 24, 32),
            Accent = Color3.fromRGB(105, 90, 190),
            Text = Color3.fromRGB(255, 255, 255),
            SubText = Color3.fromRGB(145, 145, 165),

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["UI.lua"] = [=[

local Services = {
    Players = game:GetService("Players"),
    TweenService = game:GetService("TweenService"),
    UserInputService = game:GetService("UserInputService"),
    RunService = game:GetService("RunService"),
    CoreGui = game:GetService("CoreGui"),
    ContentProvider = game:GetService("ContentProvider"),

local Settings = _G.YOKUDO
local Theme = Settings.UI.Theme

local GuiParent = Services.CoreGui

pcall(function()
    if type(gethui) == "function" then
        local HUI = gethui()
        if HUI then GuiParent = HUI end
    end
end)

pcall(function()
    local Old = GuiParent:FindFirstChild("YOKUDO_HUB")
    if Old then Old:Destroy() end
    local OldToggle = GuiParent:FindFirstChild("ToggleGUI")
    if OldToggle then OldToggle:Destroy() end
end)

local ASSET_ID = Settings.AssetID
Services.ContentProvider:PreloadAsync({ASSET_ID})

local ToggleScreenGui = Instance.new("ScreenGui")
ToggleScreenGui.Name = "ToggleGUI"
ToggleScreenGui.ResetOnSpawn = false
ToggleScreenGui.IgnoreGuiInset = true
ToggleScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ToggleScreenGui.Parent = GuiParent

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Y"
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.Position = UDim2.new(0.02, 0, 0.5, -27.5)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Toggle.BorderSizePixel = 0
Toggle.BackgroundTransparency = 0
Toggle.Image = ASSET_ID
Toggle.ZIndex = 999
Toggle.Parent = ToggleScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = Toggle

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(200, 200, 220)
ToggleStroke.Thickness = 1.5
ToggleStroke.Transparency = 0.2
ToggleStroke.Parent = Toggle

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YOKUDO_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = GuiParent

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, Settings.UI.Width, 0, Settings.UI.Height)
Main.Position = UDim2.new(0.5, -Settings.UI.Width / 2, 0.5, -Settings.UI.Height / 2)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 0)
MainCorner.Parent = Main

local MainBorder = Instance.new("UIStroke")
MainBorder.Color = Color3.fromRGB(200, 200, 220)
MainBorder.Thickness = 2
MainBorder.Transparency = 0.1
MainBorder.Parent = Main

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 58)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BorderSizePixel = 0
TopBar.Active = true
TopBar.ZIndex = 20
TopBar.Parent = Main

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(36, 38, 53)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 23, 30))
TopGradient.Parent = TopBar

local TopLine = Instance.new("Frame")
TopLine.Name = "TopLine"
TopLine.Size = UDim2.new(1, 0, 0, 2)
TopLine.Position = UDim2.new(0, 0, 1, -2)
TopLine.BackgroundColor3 = Color3.fromRGB(200, 200, 220)
TopLine.BackgroundTransparency = 0.2
TopLine.BorderSizePixel = 0
TopLine.ZIndex = 22
TopLine.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -36, 0, 27)
Title.Position = UDim2.new(0, 18, 0, 7)
Title.BackgroundTransparency = 1
Title.Text = Settings.Name
Title.TextColor3 = Theme.Text
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 21
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, -36, 0, 18)
Subtitle.Position = UDim2.new(0, 18, 0, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = Settings.Version
Subtitle.TextColor3 = Theme.SubText
Subtitle.TextSize = 10
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.ZIndex = 21
Subtitle.Parent = TopBar

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, Settings.UI.SidebarWidth, 1, -58)
Sidebar.Position = UDim2.new(0, 0, 0, 58)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 5
Sidebar.Parent = Main

local SidebarLine = Instance.new("Frame")
SidebarLine.Name = "SidebarLine"
SidebarLine.Size = UDim2.new(0, 2, 1, 0)
SidebarLine.Position = UDim2.new(1, -2, 0, 0)
SidebarLine.BackgroundColor3 = Color3.fromRGB(200, 200, 220)
SidebarLine.BackgroundTransparency = 0.15
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 6
SidebarLine.Parent = Sidebar

local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Name = "TabScroll"
TabScroll.Size = UDim2.new(1, 0, 1, 0)
TabScroll.BackgroundTransparency = 1
TabScroll.BorderSizePixel = 0
TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabScroll.ScrollingDirection = Enum.ScrollingDirection.Y
TabScroll.ScrollBarThickness = 0
TabScroll.ScrollBarImageTransparency = 1
TabScroll.Active = true
TabScroll.ZIndex = 6
TabScroll.Parent = Sidebar

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 6)
TabPadding.PaddingBottom = UDim.new(0, 6)
TabPadding.PaddingLeft = UDim.new(0, 2)
TabPadding.PaddingRight = UDim.new(0, 2)
TabPadding.Parent = TabScroll

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 2)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Parent = TabScroll

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -Settings.UI.SidebarWidth, 1, -58)
Content.Position = UDim2.new(0, Settings.UI.SidebarWidth, 0, 58)
Content.BackgroundColor3 = Theme.Background
Content.BorderSizePixel = 0
Content.ZIndex = 5
Content.Parent = Main

_G.YOKUDO_Main = Main
_G.YOKUDO_TopBar = TopBar
_G.YOKUDO_Sidebar = Sidebar
_G.YOKUDO_TabScroll = TabScroll
_G.YOKUDO_Content = Content
_G.YOKUDO_ScreenGui = ScreenGui
_G.YOKUDO_Toggle = Toggle
_G.YOKUDO_GuiParent = GuiParent

local Dragging = false
local DragStart = nil
local StartPosition = nil
local ActiveTouch = nil

local function StartDrag(Input)
    if Dragging then return end
    if Input.UserInputType == Enum.UserInputType.Touch then
        ActiveTouch = Input
    end
    Dragging = true
    DragStart = Input.Position
    StartPosition = Main.Position
end

local function StopDrag()
    Dragging = false
    ActiveTouch = nil
    DragStart = nil
    StartPosition = nil
end

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or
       Input.UserInputType == Enum.UserInputType.Touch then
        StartDrag(Input)
    end
end)

local function CreateDragZone(Name, Position, Size)
    local Zone = Instance.new("Frame")
    Zone.Name = Name
    Zone.Position = Position
    Zone.Size = Size
    Zone.BackgroundTransparency = 1
    Zone.BorderSizePixel = 0
    Zone.Active = true
    Zone.ZIndex = 50
    Zone.Parent = Main

    Zone.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or
           Input.UserInputType == Enum.UserInputType.Touch then
            StartDrag(Input)
        end
    end)

    return Zone
end

CreateDragZone("DragTop", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 5))
CreateDragZone("DragBottom", UDim2.new(0, 0, 1, -5), UDim2.new(1, 0, 0, 5))
CreateDragZone("DragLeft", UDim2.new(0, 0, 0, 0), UDim2.new(0, 5, 1, 0))
CreateDragZone("DragRight", UDim2.new(1, -5, 0, 0), UDim2.new(0, 5, 1, 0))

Services.UserInputService.InputChanged:Connect(function(Input)
    if not Dragging then return end
    if Input.UserInputType == Enum.UserInputType.Touch then
        if ActiveTouch and Input ~= ActiveTouch then return end
    end
    if not DragStart or not StartPosition then return end
    if Input.UserInputType ~= Enum.UserInputType.MouseMovement and
       Input.UserInputType ~= Enum.UserInputType.Touch then return end

    local Delta = Input.Position - DragStart
    Main.Position = UDim2.new(
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Offset + Delta.Y
end)

Services.UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch then
        if ActiveTouch and Input == ActiveTouch then
            StopDrag()
        end
        return
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        if Dragging then StopDrag() end
    end
end)

local ToggleDragging = false
local ToggleDragStart = nil
local ToggleStartPos = nil
local ToggleActiveTouch = nil

local function StartToggleDrag(Input)
    if ToggleDragging then return end
    if Input.UserInputType == Enum.UserInputType.Touch then
        ToggleActiveTouch = Input
    end
    ToggleDragging = true
    ToggleDragStart = Input.Position
    ToggleStartPos = Toggle.Position
end

local function StopToggleDrag()
    ToggleDragging = false
    ToggleActiveTouch = nil
    ToggleDragStart = nil
    ToggleStartPos = nil
end

Toggle.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or
       Input.UserInputType == Enum.UserInputType.Touch then
        StartToggleDrag(Input)
    end
end)

Services.UserInputService.InputChanged:Connect(function(Input)
    if not ToggleDragging then return end
    if Input.UserInputType == Enum.UserInputType.Touch then
        if ToggleActiveTouch and Input ~= ToggleActiveTouch then return end
    end
    if not ToggleDragStart or not ToggleStartPos then return end
    if Input.UserInputType ~= Enum.UserInputType.MouseMovement and
       Input.UserInputType ~= Enum.UserInputType.Touch then return end

    local Delta = Input.Position - ToggleDragStart
    Toggle.Position = UDim2.new(
        ToggleStartPos.X.Offset + Delta.X,
        ToggleStartPos.Y.Offset + Delta.Y
end)

Services.UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch then
        if ToggleActiveTouch and Input == ToggleActiveTouch then
            StopToggleDrag()
        end
        return
    end
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        if ToggleDragging then StopToggleDrag() end
    end
end)

local isUIVisible = true

Toggle.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    ScreenGui.Enabled = isUIVisible

    Services.TweenService:Create(Toggle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 45, 0, 45)
    }):Play()
    task.wait(0.1)
    Services.TweenService:Create(Toggle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Components.lua"] = [=[

local TweenService = game:GetService("TweenService")

local function GetTabTextSize(Name)
    local Length = #Name
    if Length >= 16 then return 10
    elseif Length >= 13 then return 11
    elseif Length >= 9 then return 12
    elseif Length >= 6 then return 13
    else return 14 end
end

function CreateTab(Name, Order)
    local TabScroll = _G.YOKUDO_TabScroll
    local Tab = Instance.new("TextButton")
    Tab.Name = Name:gsub("%s+", "_") .. "_Tab"
    Tab.Size = UDim2.new(1, 0, 0, 32)
    Tab.BackgroundColor3 = Color3.fromRGB(38, 40, 52)
    Tab.BackgroundTransparency = 1
    Tab.BorderSizePixel = 0
    Tab.Text = ""
    Tab.AutoButtonColor = false
    Tab.LayoutOrder = Order or 1
    Tab.ZIndex = 7
    Tab.Parent = TabScroll

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Tab

    local TabBorder = Instance.new("UIStroke")
    TabBorder.Color = Color3.fromRGB(200, 200, 220)
    TabBorder.Thickness = 1
    TabBorder.Transparency = 0.2
    TabBorder.Parent = Tab

    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Size = UDim2.new(0, 3, 0, 18)
    Indicator.Position = UDim2.new(0, 2, 0.5, -9)
    Indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 220)
    Indicator.BackgroundTransparency = 1
    Indicator.BorderSizePixel = 0
    Indicator.ZIndex = 8
    Indicator.Parent = Tab

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    local Text = Instance.new("TextLabel")
    Text.Name = "TabText"
    Text.Size = UDim2.new(1, -10, 1, 0)
    Text.Position = UDim2.new(0, 8, 0, 0)
    Text.BackgroundTransparency = 1
    Text.Text = Name
    Text.TextColor3 = Color3.fromRGB(155, 155, 175)
    Text.TextSize = GetTabTextSize(Name)
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.TextYAlignment = Enum.TextYAlignment.Center
    Text.Font = Enum.Font.GothamMedium
    Text.TextTruncate = Enum.TextTruncate.AtEnd
    Text.Active = false
    Text.Selectable = false
    Text.ZIndex = 8
    Text.Parent = Tab

    return Tab
end

function CreatePage(Name)
    local Content = _G.YOKUDO_Content
    local Page = Instance.new("ScrollingFrame")
    Page.Name = Name .. "_Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Visible = false
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.ScrollingDirection = Enum.ScrollingDirection.Y
    Page.ScrollBarThickness = 4
    Page.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 220)
    Page.ScrollBarImageTransparency = 0.1
    Page.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    Page.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    Page.Active = true
    Page.Selectable = true
    Page.ZIndex = 6
    Page.Parent = Content

    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 12)
    Padding.PaddingBottom = UDim.new(0, 14)
    Padding.PaddingLeft = UDim.new(0, 14)
    Padding.PaddingRight = UDim.new(0, 12)
    Padding.Parent = Page

    local List = Instance.new("UIListLayout")
    List.Padding = UDim.new(0, 4)
    List.SortOrder = Enum.SortOrder.LayoutOrder
    List.Parent = Page

    return Page
end

function CreateSectionTitle(Parent, TextValue, Order)
    local Label = Instance.new("TextLabel")
    Label.Name = "SectionTitle"
    Label.Size = UDim2.new(1, 0, 0, 23)
    Label.BackgroundTransparency = 1
    Label.Text = TextValue
    Label.TextColor3 = Color3.fromRGB(235, 235, 245)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Font = Enum.Font.GothamBold
    Label.LayoutOrder = Order or 1
    Label.Active = false
    Label.Selectable = false
    Label.ZIndex = 8
    Label.Parent = Parent
    return Label
end

function CreateCheckbox(Parent, TextValue, Order)
    local Holder = Instance.new("Frame")
    Holder.Name = TextValue:gsub("%s+", "_")
    Holder.Size = UDim2.new(1, 0, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.BorderSizePixel = 0
    Holder.LayoutOrder = Order or 1
    Holder.Active = false
    Holder.ZIndex = 9
    Holder.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -38, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = TextValue
    Label.TextColor3 = Color3.fromRGB(205, 205, 220)
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Font = Enum.Font.GothamMedium
    Label.Active = false
    Label.Selectable = false
    Label.ZIndex = 10
    Label.Parent = Holder

    local CheckButton = Instance.new("TextButton")
    CheckButton.Name = "CheckBox"
    CheckButton.Size = UDim2.new(0, 26, 0, 26)
    CheckButton.Position = UDim2.new(1, -26, 0.5, -13)
    CheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
    CheckButton.BorderSizePixel = 0
    CheckButton.Text = ""
    CheckButton.AutoButtonColor = false
    CheckButton.Active = true
    CheckButton.ZIndex = 20
    CheckButton.Parent = Holder

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 6)
    BoxCorner.Parent = CheckButton

    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(200, 200, 220)
    BoxStroke.Thickness = 1.5
    BoxStroke.Parent = CheckButton

    local Check = Instance.new("TextLabel")
    Check.Name = "Check"
    Check.Size = UDim2.new(1, 0, 1, 0)
    Check.BackgroundTransparency = 1
    Check.Text = "✓"
    Check.TextColor3 = Color3.fromRGB(255, 255, 255)
    Check.TextSize = 18
    Check.Font = Enum.Font.GothamBold
    Check.Visible = false
    Check.Active = false
    Check.Selectable = false
    Check.ZIndex = 21
    Check.Parent = CheckButton

    local Enabled = false

    local function Toggle()
        Enabled = not Enabled
        Check.Visible = Enabled
        if Enabled then
            CheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            BoxStroke.Color = Color3.fromRGB(135, 120, 225)
        else
            CheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
            BoxStroke.Color = Color3.fromRGB(200, 200, 220)
        end
    end

    CheckButton.MouseButton1Click:Connect(function()
        Toggle()
    end)

    return Holder, CheckButton, function() return Enabled end
end

function CreateTextBoxWithCheckbox(Parent, TextValue, Order, DefaultValue, MinValue, MaxValue)
    DefaultValue = DefaultValue or 50
    MinValue = MinValue or 0
    MaxValue = MaxValue or 1000

    local Holder = Instance.new("Frame")
    Holder.Name = TextValue:gsub("%s+", "_")
    Holder.Size = UDim2.new(1, 0, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.BorderSizePixel = 0
    Holder.LayoutOrder = Order or 1
    Holder.Active = false
    Holder.ZIndex = 9
    Holder.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(0, 100, 1, 0)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = TextValue
    Label.TextColor3 = Color3.fromRGB(205, 205, 220)
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Font = Enum.Font.GothamMedium
    Label.Active = false
    Label.Selectable = false
    Label.ZIndex = 10
    Label.Parent = Holder

    local TextBox = Instance.new("TextBox")
    TextBox.Name = "TextBox"
    TextBox.Size = UDim2.new(0, 60, 1, -6)
    TextBox.Position = UDim2.new(0, 105, 0, 3)
    TextBox.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
    TextBox.BorderSizePixel = 0
    TextBox.Text = tostring(DefaultValue)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 12
    TextBox.TextXAlignment = Enum.TextXAlignment.Center
    TextBox.TextYAlignment = Enum.TextYAlignment.Center
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.ZIndex = 11
    TextBox.Parent = Holder

    local TBoxCorner = Instance.new("UICorner")
    TBoxCorner.CornerRadius = UDim.new(0, 4)
    TBoxCorner.Parent = TextBox

    local TBoxStroke = Instance.new("UIStroke")
    TBoxStroke.Color = Color3.fromRGB(200, 200, 220)
    TBoxStroke.Thickness = 0.5
    TBoxStroke.Transparency = 0.2
    TBoxStroke.Parent = TextBox

    local CheckButton = Instance.new("TextButton")
    CheckButton.Name = "CheckBox"
    CheckButton.Size = UDim2.new(0, 26, 0, 26)
    CheckButton.Position = UDim2.new(1, -26, 0.5, -13)
    CheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
    CheckButton.BorderSizePixel = 0
    CheckButton.Text = ""
    CheckButton.AutoButtonColor = false
    CheckButton.Active = true
    CheckButton.ZIndex = 20
    CheckButton.Parent = Holder

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 6)
    BoxCorner.Parent = CheckButton

    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(200, 200, 220)
    BoxStroke.Thickness = 1.5
    BoxStroke.Parent = CheckButton

    local Check = Instance.new("TextLabel")
    Check.Name = "Check"
    Check.Size = UDim2.new(1, 0, 1, 0)
    Check.BackgroundTransparency = 1
    Check.Text = "✓"
    Check.TextColor3 = Color3.fromRGB(255, 255, 255)
    Check.TextSize = 18
    Check.Font = Enum.Font.GothamBold
    Check.Visible = false
    Check.Active = false
    Check.Selectable = false
    Check.ZIndex = 21
    Check.Parent = CheckButton

    local Enabled = false
    local CurrentValue = DefaultValue

    local function UpdateValue()
        local val = tonumber(TextBox.Text)
        if val then
            CurrentValue = math.clamp(val, MinValue, MaxValue)
            TextBox.Text = tostring(CurrentValue)
        else
            TextBox.Text = tostring(CurrentValue)
        end
    end

    local function Toggle()
        Enabled = not Enabled
        Check.Visible = Enabled
        if Enabled then
            CheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            BoxStroke.Color = Color3.fromRGB(135, 120, 225)
        else
            CheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
            BoxStroke.Color = Color3.fromRGB(200, 200, 220)
        end
    end

    CheckButton.MouseButton1Click:Connect(function()
        Toggle()
    end)

    TextBox.FocusLost:Connect(function()
        UpdateValue()
    end)

    return Holder, CheckButton, function() return Enabled end, TextBox, function() return CurrentValue end
end

function CreateSmartCheckbox(Parent, LabelText, Order, ToggleFunction, GetStateFunction)
    local Holder = Instance.new("Frame")
    Holder.Size = UDim2.new(1, 0, 0, 32)
    Holder.BackgroundTransparency = 1
    Holder.LayoutOrder = Order or 1
    Holder.Parent = Parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -38, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = LabelText
    Label.TextColor3 = Color3.fromRGB(205, 205, 220)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Font = Enum.Font.GothamMedium
    Label.Parent = Holder

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 26, 0, 26)
    Button.Position = UDim2.new(1, -26, 0.5, -13)
    Button.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.Parent = Holder

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 6)
    BoxCorner.Parent = Button

    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(200, 200, 220)
    BoxStroke.Thickness = 1.5
    BoxStroke.Parent = Button

    local Check = Instance.new("TextLabel")
    Check.Size = UDim2.new(1, 0, 1, 0)
    Check.BackgroundTransparency = 1
    Check.Text = "✓"
    Check.TextColor3 = Color3.fromRGB(255, 255, 255)
    Check.TextSize = 18
    Check.Font = Enum.Font.GothamBold
    Check.Visible = false
    Check.Parent = Button

    local Enabled = false
    if GetStateFunction then
        Enabled = GetStateFunction()
        Check.Visible = Enabled
        if Enabled then
            Button.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            BoxStroke.Color = Color3.fromRGB(135, 120, 225)
        end
    end

    local function UpdateUI(state)
        Enabled = state
        Check.Visible = state
        if state then
            Button.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            BoxStroke.Color = Color3.fromRGB(135, 120, 225)
        else
            Button.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
            BoxStroke.Color = Color3.fromRGB(200, 200, 220)
        end
    end

    Button.MouseButton1Click:Connect(function()
        if ToggleFunction then
            local currentState = GetStateFunction and GetStateFunction() or Enabled
            local newState = not currentState
            UpdateUI(newState)
            task.spawn(function()
                ToggleFunction()
            end)
        end
    end)

    return {
        Holder = Holder,
        Button = Button,
        GetState = function() return Enabled end,
        SetState = UpdateUI,
        Update = UpdateUI,
end

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/Init.lua"] = [=[

local TweenService = game:GetService("TweenService")

local TabsManager = {}
TabsManager.Tabs = {}
TabsManager.Pages = {}
TabsManager.ActiveTab = nil
TabsManager.ActivePage = nil

function TabsManager:RegisterTab(Name, Order, PageName)
    local Tab = CreateTab(Name, Order)
    local Page = CreatePage(PageName or Name:upper())

    table.insert(self.Tabs, { Tab = Tab, Page = Page, Name = Name })

    Tab.MouseButton1Click:Connect(function()
        self:SelectTab(Tab, Page)
    end)

    return Tab, Page
end

function TabsManager:SelectTab(SelectedTab, SelectedPage)
    for _, data in ipairs(self.Tabs) do
        data.Page.Visible = false
        local Indicator = data.Tab:FindFirstChild("Indicator")
        local TabText = data.Tab:FindFirstChild("TabText")
        TweenService:Create(data.Tab, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        if Indicator then
            TweenService:Create(Indicator, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        end
        if TabText then
            TweenService:Create(TabText, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(155, 155, 175)}):Play()
        end
    end

    SelectedPage.Visible = true
    task.wait(0.05)
    pcall(function()
        SelectedPage.CanvasPosition = Vector2.new(0, 0)
    end)

    TweenService:Create(SelectedTab, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    local Indicator = SelectedTab:FindFirstChild("Indicator")
    local TabText = SelectedTab:FindFirstChild("TabText")
    if Indicator then
        TweenService:Create(Indicator, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    end
    if TabText then
        TweenService:Create(TabText, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end

    self.ActiveTab = SelectedTab
    self.ActivePage = SelectedPage
end

function TabsManager:GetTab(Name)
    for _, data in ipairs(self.Tabs) do
        if data.Name == Name then
            return data.Tab, data.Page
        end
    end
    return nil, nil
end

function TabsManager:SelectTabByName(Name)
    local Tab, Page = self:GetTab(Name)
    if Tab and Page then
        self:SelectTab(Tab, Page)
    end
end

_G.YOKUDO_TabsManager = TabsManager

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Features/AntiAFK.lua"] = [=[

local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local MOUSE_INTERVAL_MIN = 45
local MOUSE_INTERVAL_MAX = 120

local CAMERA_INTERVAL_MIN = 60
local CAMERA_INTERVAL_MAX = 180

local ZOOM_INTERVAL_MIN = 90
local ZOOM_INTERVAL_MAX = 240

local AntiAFKEnabled = false
local MouseThread = nil
local CameraThread = nil
local ZoomThread = nil

local function DoMouseMove()
    pcall(function()
        mousemoverel(math.random(-15, 15), math.random(-15, 15))
    end)
end

local function DoCameraRotation()
    pcall(function()
        local Camera = workspace.CurrentCamera
        if Camera then
            Camera.CFrame = Camera.CFrame * CFrame.Angles(
                math.rad(math.random(-2, 2)),
                math.rad(math.random(-3, 3)),
        end
    end)
end

local function DoCameraZoom()
    pcall(function()
        local Camera = workspace.CurrentCamera
        if Camera then
            local Original = Camera.FieldOfView
            Camera.FieldOfView = Original + math.random(-5, 5)
            task.wait(0.3)
            Camera.FieldOfView = Original
        end
    end)
end

local function EnableAntiAFK()
    if AntiAFKEnabled then return end
    AntiAFKEnabled = true

    MouseThread = task.spawn(function()
        while AntiAFKEnabled do
            local WaitTime = math.random(MOUSE_INTERVAL_MIN, MOUSE_INTERVAL_MAX)
            task.wait(WaitTime)
            if not AntiAFKEnabled then break end
            DoMouseMove()
            print("leak by https://discord.gg/TBBAUZu8cW")
        end
    end)

    CameraThread = task.spawn(function()
        while AntiAFKEnabled do
            local WaitTime = math.random(CAMERA_INTERVAL_MIN, CAMERA_INTERVAL_MAX)
            task.wait(WaitTime)
            if not AntiAFKEnabled then break end
            DoCameraRotation()
            print("leak by https://discord.gg/TBBAUZu8cW")
        end
    end)

    ZoomThread = task.spawn(function()
        while AntiAFKEnabled do
            local WaitTime = math.random(ZOOM_INTERVAL_MIN, ZOOM_INTERVAL_MAX)
            task.wait(WaitTime)
            if not AntiAFKEnabled then break end
            DoCameraZoom()
            print("leak by https://discord.gg/TBBAUZu8cW")
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")")
end

local function DisableAntiAFK()
    if not AntiAFKEnabled then return end
    AntiAFKEnabled = false

    if MouseThread then
        pcall(function() task.cancel(MouseThread) end)
        MouseThread = nil
    end
    if CameraThread then
        pcall(function() task.cancel(CameraThread) end)
        CameraThread = nil
    end
    if ZoomThread then
        pcall(function() task.cancel(ZoomThread) end)
        ZoomThread = nil
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleAntiAFK()
    if AntiAFKEnabled then
        DisableAntiAFK()
    else
        EnableAntiAFK()
    end
end

_G.YOKUDO_AntiAFK = {
    Enable = EnableAntiAFK,
    Disable = DisableAntiAFK,
    Toggle = ToggleAntiAFK,
    IsEnabled = function() return AntiAFKEnabled end,

    MOUSE_INTERVAL_MIN = MOUSE_INTERVAL_MIN,
    MOUSE_INTERVAL_MAX = MOUSE_INTERVAL_MAX,
    CAMERA_INTERVAL_MIN = CAMERA_INTERVAL_MIN,
    CAMERA_INTERVAL_MAX = CAMERA_INTERVAL_MAX,
    ZOOM_INTERVAL_MIN = ZOOM_INTERVAL_MIN,
    ZOOM_INTERVAL_MAX = ZOOM_INTERVAL_MAX

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/WalkSpeed.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local WalkSpeedEnabled = false
local WalkSpeedValue = 50
local OriginalWalkSpeed = 16
local Connection = nil

local function GetHumanoid()
    local Char = Player.Character
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Humanoid")
end

local function ApplyWalkSpeed()
    local Hum = GetHumanoid()
    if Hum then
        Hum.WalkSpeed = WalkSpeedValue
    end
end

local function StopWalkSpeed()
    local Hum = GetHumanoid()
    if Hum then
        Hum.WalkSpeed = OriginalWalkSpeed
    end
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
end

local function StartWalkSpeed()
    local Hum = GetHumanoid()
    if Hum then
        OriginalWalkSpeed = Hum.WalkSpeed
    end

    ApplyWalkSpeed()

    if Connection then
        Connection:Disconnect()
    end

    Connection = RunService.Heartbeat:Connect(function()
        if WalkSpeedEnabled then
            ApplyWalkSpeed()
        end
    end)
end

local function SetWalkSpeedValue(Value)
    WalkSpeedValue = math.clamp(Value, 50, 1000)
    if WalkSpeedEnabled then
        ApplyWalkSpeed()
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleWalkSpeed()
    WalkSpeedEnabled = not WalkSpeedEnabled

    if WalkSpeedEnabled then
        StartWalkSpeed()
        print("leak by https://discord.gg/TBBAUZu8cW")")
    else
        StopWalkSpeed()
        print("leak by https://discord.gg/TBBAUZu8cW")
    end
end

local function EnableWalkSpeed()
    WalkSpeedEnabled = true
    StartWalkSpeed()
    print("leak by https://discord.gg/TBBAUZu8cW")")
end

local function DisableWalkSpeed()
    WalkSpeedEnabled = false
    StopWalkSpeed()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

_G.YOKUDO_WalkSpeed = {
    Toggle = ToggleWalkSpeed,
    Enable = EnableWalkSpeed,
    Disable = DisableWalkSpeed,
    SetValue = SetWalkSpeedValue,
    IsEnabled = function() return WalkSpeedEnabled end,
    GetValue = function() return WalkSpeedValue end

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/AntiTrap.lua"] = [=[

local AntiTrapEnabled = false

local function RemoveDebrisChildren()
    local Folder = workspace:FindFirstChild("__DEBRIS")
    if not Folder then return end

    for _, child in ipairs(Folder:GetChildren()) do
        pcall(function()
            child:Destroy()
        end)
    end
end

local function EnableAntiTrap()
    if AntiTrapEnabled then return end
    AntiTrapEnabled = true

    RemoveDebrisChildren()

    task.spawn(function()
        while AntiTrapEnabled do
            task.wait(1)
            if AntiTrapEnabled then
                RemoveDebrisChildren()
            end
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableAntiTrap()
    AntiTrapEnabled = false
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleAntiTrap()
    if AntiTrapEnabled then
        DisableAntiTrap()
    else
        EnableAntiTrap()
    end
end

_G.YOKUDO_AntiTrap = {
    Toggle = ToggleAntiTrap,
    Enable = EnableAntiTrap,
    Disable = DisableAntiTrap,
    IsEnabled = function() return AntiTrapEnabled end

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Features/GodMode.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local GodModeEnabled = false
local GodModeConnection = nil
local GodMode = true

local function RunGodMode()
    local Character = Player.Character
    if not Character then return end

    local OldHumanoid = Character:FindFirstChildOfClass("Humanoid")
    if not OldHumanoid then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")

    local SavedJumpProperties = {}

    local function SaveJumpProperty(Property)
        local Success, Value = pcall(function()
            return OldHumanoid[Property]
        end)
        if Success then
            SavedJumpProperties[Property] = Value
        end
    end

    SaveJumpProperty("JumpPower")
    SaveJumpProperty("JumpHeight")
    SaveJumpProperty("UseJumpPower")

    local SavedEvaluateStateMachine
    pcall(function()
        SavedEvaluateStateMachine = OldHumanoid.EvaluateStateMachine
    end)

    local SavedStates = {}
    local States = {
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Running,
        Enum.HumanoidStateType.RunningNoPhysics,
        Enum.HumanoidStateType.Climbing,
        Enum.HumanoidStateType.StrafingNoPhysics,
        Enum.HumanoidStateType.Ragdoll,
        Enum.HumanoidStateType.GettingUp,
        Enum.HumanoidStateType.Jumping,
        Enum.HumanoidStateType.Landed,
        Enum.HumanoidStateType.Flying,
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.Seated,
        Enum.HumanoidStateType.PlatformStanding,
        Enum.HumanoidStateType.Dead,
        Enum.HumanoidStateType.Swimming,
        Enum.HumanoidStateType.Physics,

    for _, State in ipairs(States) do
        local Success, Enabled = pcall(function()
            return OldHumanoid:GetStateEnabled(State)
        end)
        if Success then
            SavedStates[State] = Enabled
        end
    end

    local NewHumanoid = OldHumanoid:Clone()
    if not NewHumanoid then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end
    NewHumanoid.Name = OldHumanoid.Name

    for _, Child in ipairs(OldHumanoid:GetChildren()) do
        local ExistingCloneChild = NewHumanoid:FindFirstChild(Child.Name)
        if ExistingCloneChild then
            pcall(function()
                ExistingCloneChild:Destroy()
            end)
        end
        pcall(function()
            Child.Parent = NewHumanoid
        end)
    end

    OldHumanoid:Destroy()
    task.wait()
    NewHumanoid.Parent = Character
    task.wait()

    if not NewHumanoid.Parent then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")

    pcall(function()
        NewHumanoid.UseJumpPower = SavedJumpProperties.UseJumpPower
    end)
    pcall(function()
        NewHumanoid.JumpPower = SavedJumpProperties.JumpPower
    end)
    pcall(function()
        NewHumanoid.JumpHeight = SavedJumpProperties.JumpHeight
    end)

    pcall(function()
        if SavedEvaluateStateMachine ~= nil then
            NewHumanoid.EvaluateStateMachine = SavedEvaluateStateMachine
        end
    end)

    for State, Enabled in pairs(SavedStates) do
        pcall(function()
            NewHumanoid:SetStateEnabled(State, Enabled)
        end)
    end

    local Animator = NewHumanoid:FindFirstChildOfClass("Animator")
    if not Animator then
        Animator = Instance.new("Animator")
        Animator.Parent = NewHumanoid
    end
    print("leak by https://discord.gg/TBBAUZu8cW")

    local Animate = Character:FindFirstChild("Animate")
    if Animate then
        print("leak by https://discord.gg/TBBAUZu8cW")
        pcall(function()
            Animate.Disabled = true
        end)
        task.wait()
        pcall(function()
            Animate.Disabled = false
        end)
        print("leak by https://discord.gg/TBBAUZu8cW")
    end

    task.wait(0.15)

    local function LockHealth()
        if GodMode and NewHumanoid and NewHumanoid.Parent then
            pcall(function()
                NewHumanoid.MaxHealth = math.huge
                NewHumanoid.Health = math.huge
            end)
        end
    end

    local function BlockDeathState()
        if not NewHumanoid or not NewHumanoid.Parent then return end
        pcall(function()
            NewHumanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end)
        pcall(function()
            NewHumanoid.BreakJointsOnDeath = false
        end)
        pcall(function()
            NewHumanoid.RequiresNeck = false
        end)
    end

    local function BindAntiDeath(Humanoid)
        if not Humanoid then return end
        Humanoid.HealthChanged:Connect(function(Health)
            if GodMode and Humanoid and Humanoid.Parent then
                if Health < Humanoid.MaxHealth then
                    pcall(function()
                        Humanoid.Health = Humanoid.MaxHealth
                    end)
                end
            end
        end)
        Humanoid.Died:Connect(function()
            if GodMode and Humanoid and Humanoid.Parent then
                pcall(function()
                    Humanoid.Health = Humanoid.MaxHealth
                end)
            end
        end)
    end

    LockHealth()
    BlockDeathState()
    BindAntiDeath(NewHumanoid)

    local function RefreshControls()
        local PlayerScripts = Player:FindFirstChild("PlayerScripts")
        if not PlayerScripts then return end
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        local Success, Module = pcall(function()
            return require(PlayerModule)
        end)
        if not Success or not Module then return end
        local Controls
        pcall(function()
            Controls = Module:GetControls()
        end)
        if not Controls then return end
        pcall(function()
            Controls:OnCharacterAdded(Character)
        end)
        task.wait()
        pcall(function()
            Controls:UpdateActiveControlModuleEnabled()
        end)
    end

    RefreshControls()

    pcall(function()
        local Camera = workspace.CurrentCamera
        if Camera then
            Camera.CameraSubject = NewHumanoid
        end
    end)

    task.wait(0.25)

    if not Character.Parent then return end

    local CurrentHumanoid = Character:FindFirstChildOfClass("Humanoid")
    if CurrentHumanoid ~= NewHumanoid then return end

    pcall(function()
        NewHumanoid.UseJumpPower = SavedJumpProperties.UseJumpPower
    end)
    pcall(function()
        NewHumanoid.JumpPower = SavedJumpProperties.JumpPower
    end)
    pcall(function()
        NewHumanoid.JumpHeight = SavedJumpProperties.JumpHeight
    end)
    pcall(function()
        if SavedEvaluateStateMachine ~= nil then
            NewHumanoid.EvaluateStateMachine = SavedEvaluateStateMachine
        end
    end)

    for State, Enabled in pairs(SavedStates) do
        pcall(function()
            NewHumanoid:SetStateEnabled(State, Enabled)
        end)
    end

    LockHealth()
    BlockDeathState()
    RefreshControls()

    pcall(function()
        local Camera = workspace.CurrentCamera
        if Camera then
            Camera.CameraSubject = NewHumanoid
        end
    end)

    local CurrentAnimate = Character:FindFirstChild("Animate")
    if CurrentAnimate then
        pcall(function()
            CurrentAnimate.Disabled = true
        end)
        task.wait()
        pcall(function()
            CurrentAnimate.Disabled = false
        end)
    end

    if GodModeConnection then
        GodModeConnection:Disconnect()
        GodModeConnection = nil
    end

    GodModeConnection = RunService.Heartbeat:Connect(function()
        if not GodModeEnabled then return end

        local Char = Player.Character
        if not Char then return end

        local Hum = Char:FindFirstChildOfClass("Humanoid")
        if not Hum then return end

        pcall(function()
            if Hum.Health < Hum.MaxHealth then
                Hum.Health = Hum.MaxHealth
            end
            Hum.MaxHealth = math.huge
            Hum.Health = math.huge
            Hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            Hum.BreakJointsOnDeath = false
            Hum.RequiresNeck = false
        end)
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function EnableGodMode()
    GodModeEnabled = true
    task.spawn(RunGodMode)
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableGodMode()
    GodModeEnabled = false
    if GodModeConnection then
        GodModeConnection:Disconnect()
        GodModeConnection = nil
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleGodMode()
    if GodModeEnabled then
        DisableGodMode()
    else
        EnableGodMode()
    end
end

_G.YOKUDO_GodMode = {
    Toggle = ToggleGodMode,
    Enable = EnableGodMode,
    Disable = DisableGodMode,
    IsEnabled = function() return GodModeEnabled end

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Features/TeleportSystem.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Container = workspace:WaitForChild("AreaEggSlotsClient")

local Config = {
    TeleportSpeed = 300,

    NearOffset = 20,

    FlyOffset = 3,
    ShotDistance = 25,
    LockAbove = 1,
    ArriveDistance = 2,
    SafeStopDistance = 5,

    Timeout = 20,
    CollectInterval = 0.05,
    TargetCollectTimeout = 10,
    MaxRecoveryAttempts = 10000,

    BodyVelocityP = 5000,
    BodyGyroP = 50000,
    BodyGyroD = 2000,

    SafeZone = Vector3.new(533, 70, -366),
    LockPosition = Vector3.new(607.6259155273438, 70.57420349121094, -326.8830261230469),

    SearchPrefix = "FirstAreaEgg",
    PositionThreshold = 1,

local CollectEvent = ReplicatedStorage.Packages.Networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
local ForestStrike = ReplicatedStorage.Packages.Networking:FindFirstChild("RE/GuardPatrol/ForestStrike")

if not CollectEvent then
    print("leak by https://discord.gg/TBBAUZu8cW")
    return
end

print("leak by https://discord.gg/TBBAUZu8cW")

local State = {
    Running = false,
    Step = "idle",
    Mode = "none",
    Method = "TeleportFly",
    TargetUid = nil,

    FlySequence = 0,

    TweenConnection = nil,
    FlyConnection = nil,
    LockConnection = nil,
    BodyVelocity = nil,
    BodyGyro = nil,
    ActiveHeartbeat = nil,

    FirstEggList = {},
    FirstEggUid = nil,
    FirstEggSlotKey = nil,

    SavedTargetPosition = nil,
    TargetLockedCFrame = nil,

    FlyTargetStarted = false,
    CollectDone = false,
    TargetCollected = false,
    RemotesFired = false,
    RecoveryTriggered = false,
    RecoveryAttempts = 0,

    CollectAttempts = 0,
    CollectTime = 0,
    TargetCollectStartTime = 0,

    PlayerGui = nil,
    DropHeldEgg = nil,
    DropHeldEggConnection = nil,

    RagdollEnabled = false,
    RagdollConnection = nil,
    ForceUpConnection = nil,

    SavedWalkSpeed = nil,
    SavedJumpPower = nil,
    SavedJumpHeight = nil,
    SavedUseJumpPower = nil,

local function GetHumanoid()
    local Char = Player.Character
    if not Char then return nil, nil end
    return Char:FindFirstChildOfClass("Humanoid"), Char:FindFirstChild("HumanoidRootPart")
end

local function GetPosition(Object)
    if not Object then return nil end
    if Object:IsA("Model") then
        if Object.PrimaryPart then return Object.PrimaryPart.Position end
        local Part = Object:FindFirstChildWhichIsA("BasePart")
        if Part then return Part.Position end
        for _, Desc in ipairs(Object:GetDescendants()) do
            if Desc:IsA("BasePart") then return Desc.Position end
        end
    elseif Object:IsA("BasePart") then
        return Object.Position
    end
    return nil
end

local function SaveStats()
    local Hum = GetHumanoid()
    if not Hum then return end
    if State.SavedWalkSpeed == nil then State.SavedWalkSpeed = Hum.WalkSpeed end
    if State.SavedJumpPower == nil then State.SavedJumpPower = Hum.JumpPower end
    if State.SavedJumpHeight == nil then State.SavedJumpHeight = Hum.JumpHeight end
    if State.SavedUseJumpPower == nil then State.SavedUseJumpPower = Hum.UseJumpPower end
end

local function RestoreStats()
    local Hum = GetHumanoid()
    if not Hum then return end
    if State.SavedWalkSpeed ~= nil then pcall(function() Hum.WalkSpeed = State.SavedWalkSpeed end) end
    if State.SavedJumpPower ~= nil then pcall(function() Hum.JumpPower = State.SavedJumpPower end) end
    if State.SavedJumpHeight ~= nil then pcall(function() Hum.JumpHeight = State.SavedJumpHeight end) end
    if State.SavedUseJumpPower ~= nil then pcall(function() Hum.UseJumpPower = State.SavedUseJumpPower end) end
end

local function ForceUp()
    local Hum, Root = GetHumanoid()
    if not Hum or not Root then return end
    pcall(function()
        if Hum:GetState() == Enum.HumanoidStateType.Physics then
            Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        Hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        Hum.PlatformStand = false
        Hum.Sit = false
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
        Root.CanCollide = true
        Hum.BreakJointsOnDeath = false
        Hum.RequiresNeck = false
    end)
end

local function CleanupRagdollConstraints()
    local Char = Player.Character
    if not Char then return end
    pcall(function()
        for _, d in ipairs(Char:GetDescendants()) do
            if d.Name:find("RagdollConstraint") or d.Name:find("RagdollAttachment") then
                d:Destroy()
            end
        end
        for _, d in ipairs(Char:GetDescendants()) do
            if d:IsA("Motor6D") then d.Enabled = true end
        end
    end)
end

local function EnableRagdollBypass()
    if State.RagdollEnabled then return end
    State.RagdollEnabled = true

    State.RagdollConnection = RunService.Heartbeat:Connect(function()
        if not State.RagdollEnabled then return end
        ForceUp()
    end)

    State.ForceUpConnection = task.spawn(function()
        while State.RagdollEnabled do
            task.wait(0.1)
            ForceUp()
            CleanupRagdollConstraints()
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableRagdollBypass()
    if not State.RagdollEnabled then return end
    State.RagdollEnabled = false
    if State.RagdollConnection then
        State.RagdollConnection:Disconnect()
        State.RagdollConnection = nil
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function CleanupMovers(KeepPlatformStand)
    if State.TweenConnection then
        pcall(function() State.TweenConnection:Cancel() end)
        State.TweenConnection = nil
    end
    if State.FlyConnection then
        State.FlyConnection:Disconnect()
        State.FlyConnection = nil
    end
    if State.LockConnection then
        State.LockConnection:Disconnect()
        State.LockConnection = nil
    end
    if State.BodyVelocity then
        pcall(function()
            State.BodyVelocity.Velocity = Vector3.zero
            State.BodyVelocity.MaxForce = Vector3.zero
        end)
        State.BodyVelocity:Destroy()
        State.BodyVelocity = nil
    end
    if State.BodyGyro then
        pcall(function() State.BodyGyro.MaxTorque = Vector3.zero end)
        State.BodyGyro:Destroy()
        State.BodyGyro = nil
    end

    local Hum, Root = GetHumanoid()
    if Root then
        for _, c in ipairs(Root:GetChildren()) do
            if c.Name == "YokudoBV" or c.Name == "YokudoBG" then
                pcall(function() c:Destroy() end)
            end
        end
    end

    if Hum and not KeepPlatformStand then
        pcall(function()
            Hum.PlatformStand = false
            Hum.Sit = false
        end)
    end

    if Root then
        pcall(function()
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end
end

local function StartLock(Position)
    if not Position then return end
    State.TargetLockedCFrame = CFrame.new(Position + Vector3.new(0, Config.LockAbove, 0))

    if State.LockConnection then State.LockConnection:Disconnect() end

    State.LockConnection = RunService.Heartbeat:Connect(function()
        if not State.Running then
            if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
            return
        end
        local _, Root = GetHumanoid()
        if not Root then return end
        Root.CFrame = State.TargetLockedCFrame
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
    end)
end

local function TweenTeleportDirect(Destination, Callback)
    State.FlySequence = State.FlySequence + 1
    local Seq = State.FlySequence

    CleanupMovers()

    local Hum, Root = GetHumanoid()
    if not Hum or not Root or Hum.Health <= 0 then
        if Callback then Callback() end
        return
    end

    local FlyPos = Vector3.new(Destination.X, Destination.Y + Config.FlyOffset, Destination.Z)
    local TargetCFrame = CFrame.new(FlyPos)

    Hum.PlatformStand = true

    local Distance = (FlyPos - Root.Position).Magnitude
    local Duration = Distance / Config.TeleportSpeed

    print(string.format("[YOKUDO] Tween Direct | Dist: %.0f | Speed: %d | Duration: %.3fs",
        Distance, Config.TeleportSpeed, Duration))

    local Tween = TweenService:Create(
        Root,
        TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
        { CFrame = TargetCFrame }
    State.TweenConnection = Tween
    Tween:Play()

    Tween.Completed:Wait()

    if Seq ~= State.FlySequence then return end
    if not State.Running then CleanupMovers() return end

    local Hum2, Root2 = GetHumanoid()
    if not Hum2 or not Root2 or Hum2.Health <= 0 then CleanupMovers() return end

    Root2.CFrame = TargetCFrame
    Root2.AssemblyLinearVelocity = Vector3.zero
    Root2.AssemblyAngularVelocity = Vector3.zero

    task.wait(0.05)

    CleanupMovers(true)

    if Callback then Callback() end
end

local function FlyTP(Destination, UseShotTP, IsSafeZone, Callback)
    State.FlySequence = State.FlySequence + 1
    local Seq = State.FlySequence

    CleanupMovers()

    local Hum, Root = GetHumanoid()
    if not Hum or not Root or Hum.Health <= 0 then return end

    local FlyPos = Vector3.new(Destination.X, Destination.Y + Config.FlyOffset, Destination.Z)
    local LockCFrame = CFrame.new(Destination + Vector3.new(0, Config.LockAbove, 0))

    Hum.PlatformStand = true

    local StartPos = Root.Position
    local Direction = (FlyPos - StartPos)
    local TotalDist = Direction.Magnitude
    local DirUnit = TotalDist > 0 and Direction.Unit or Vector3.new(0, 0, -1)

    local NearPos = FlyPos - (DirUnit * Config.NearOffset)
    local NearDist = (NearPos - StartPos).Magnitude
    local NearDuration = NearDist / Config.TeleportSpeed

    local TweenNear = TweenService:Create(
        Root,
        TweenInfo.new(NearDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
        { CFrame = CFrame.new(NearPos, FlyPos) }
    State.TweenConnection = TweenNear
    TweenNear:Play()

    task.spawn(function()
        TweenNear.Completed:Wait()

        if Seq ~= State.FlySequence then return end
        if not State.Running then CleanupMovers() return end

        task.wait(0.03)

        local Hum2, Root2 = GetHumanoid()
        if not Hum2 or not Root2 or Hum2.Health <= 0 then CleanupMovers() return end

        State.BodyVelocity = Instance.new("BodyVelocity")
        State.BodyVelocity.Name = "YokudoBV"
        State.BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        State.BodyVelocity.P = Config.BodyVelocityP
        State.BodyVelocity.Velocity = Vector3.zero
        State.BodyVelocity.Parent = Root2

        State.BodyGyro = Instance.new("BodyGyro")
        State.BodyGyro.Name = "YokudoBG"
        State.BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        State.BodyGyro.P = Config.BodyGyroP
        State.BodyGyro.D = Config.BodyGyroD
        State.BodyGyro.CFrame = Root2.CFrame
        State.BodyGyro.Parent = Root2

        local InitDir = (FlyPos - Root2.Position)
        if InitDir.Magnitude > 1 then
            State.BodyVelocity.Velocity = InitDir.Unit * Config.TeleportSpeed
        end

        local StartTime = tick()
        local ShotDone = false

        State.FlyConnection = RunService.Heartbeat:Connect(function()
            if Seq ~= State.FlySequence then
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end
                return
            end

            if not State.Running then CleanupMovers() return end

            local Hum3, Root3 = GetHumanoid()
            if not Hum3 or not Root3 or Hum3.Health <= 0 then CleanupMovers() return end
            if not State.BodyVelocity or not State.BodyGyro then CleanupMovers() return end

            local CurrentPos = Root3.Position
            local Dir = FlyPos - CurrentPos
            local HorizDist = Vector3.new(Dir.X, 0, Dir.Z).Magnitude
            local VertDist = math.abs(Dir.Y)
            local TotalDist2 = Dir.Magnitude

            if IsSafeZone and HorizDist <= Config.SafeStopDistance then
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                Root3.CFrame = CFrame.new(Config.SafeZone + Vector3.new(0, Config.FlyOffset, 0))
                Root3.AssemblyLinearVelocity = Vector3.zero
                Root3.AssemblyAngularVelocity = Vector3.zero

                task.spawn(function()
                    task.wait(0.1)
                    CleanupMovers()
                    if Callback then Callback() end
                end)
                return
            end

            if not IsSafeZone and UseShotTP and not ShotDone and HorizDist <= Config.ShotDistance then
                ShotDone = true
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                task.spawn(function()
                    task.wait(0.05)
                    CleanupMovers(true)
                    Root3.CFrame = LockCFrame
                    Root3.AssemblyLinearVelocity = Vector3.zero
                    Root3.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.05)
                    StartLock(Destination)
                    if Callback then Callback() end
                end)
                return
            end

            if HorizDist <= Config.ArriveDistance and VertDist <= 2 then
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                task.spawn(function()
                    task.wait(0.05)
                    CleanupMovers(true)
                    Root3.CFrame = LockCFrame
                    Root3.AssemblyLinearVelocity = Vector3.zero
                    Root3.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.05)
                    StartLock(Destination)
                    if Callback then Callback() end
                end)
                return
            end

            if tick() - StartTime > Config.Timeout then
                CleanupMovers()
                if Callback then Callback() end
                return
            end

            if TotalDist2 > 1 then
                State.BodyVelocity.Velocity = Dir.Unit * Config.TeleportSpeed
            else
                State.BodyVelocity.Velocity = Vector3.zero
            end

            State.BodyGyro.CFrame = CFrame.new(CurrentPos, CurrentPos + Vector3.new(Dir.X, 0, Dir.Z))
        end)
    end)
end

local function InstantTP(Destination, Callback)
    if not Destination then if Callback then Callback() end return end

    State.FlySequence = State.FlySequence + 1
    CleanupMovers()

    local Hum, Root = GetHumanoid()
    if not Hum or not Root or Hum.Health <= 0 then return end

    local LockCFrame = CFrame.new(Destination + Vector3.new(0, Config.LockAbove, 0))
    Hum.PlatformStand = true

    task.spawn(function()
        task.wait(0.03)
        Root.CFrame = LockCFrame
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
        task.wait(0.05)
        StartLock(Destination)
        if Callback then Callback() end
    end)
end

local function TeleportToTarget(TargetPos, Callback)
    if State.Method == "InstantTeleport" then
        print("leak by https://discord.gg/TBBAUZu8cW")
        InstantTP(TargetPos, Callback)
    else
        print("leak by https://discord.gg/TBBAUZu8cW")")
        FlyTP(TargetPos, false, false, Callback)
    end
end

local function RemoteCollectFirst()
    if not CollectEvent or not State.FirstEggSlotKey or not State.FirstEggUid then return false end
    local success = pcall(function()
        return CollectEvent:InvokeServer({
            FirstAreaSlotKey = State.FirstEggSlotKey,
            Uid = State.FirstEggUid
    end)
    return success
end

local function RemoteCollectTarget()
    if not CollectEvent or not State.TargetUid then return false end
    local success = pcall(function()
        return CollectEvent:InvokeServer({ Uid = State.TargetUid })
    end)
    return success
end

local function FireForestStrike()
    if State.RemotesFired then return end
    State.RemotesFired = true
    EnableRagdollBypass()

    pcall(function()
        ForestStrike:FireServer({
            EggUid = State.FirstEggUid,
            GuardCFrame = CFrame.new(Config.LockPosition)
    end)

    task.spawn(function()
        for i = 1, 10 do
            task.wait(0.05)
            ForceUp()
            CleanupRagdollConstraints()
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SetupDropHeldEgg()
    State.PlayerGui = Player:FindFirstChild("PlayerGui") or Player:WaitForChild("PlayerGui", 5)
    if not State.PlayerGui then return end

    State.DropHeldEgg = State.PlayerGui:FindFirstChild("DropHeldEgg")
    if not State.DropHeldEgg then print("leak by https://discord.gg/TBBAUZu8cW") return end

    if State.DropHeldEggConnection then State.DropHeldEggConnection:Disconnect() end
    State.DropHeldEggConnection = State.DropHeldEgg:GetPropertyChangedSignal("Enabled"):Connect(function()
        print("leak by https://discord.gg/TBBAUZu8cW")
    end)
end

local function IsTargetCollected()
    return State.DropHeldEgg and State.DropHeldEgg.Enabled == true
end

local function SearchFirstEggs()
    State.FirstEggList = {}
    if not Container then return end

    for _, Slot in ipairs(Container:GetChildren()) do
        if string.find(Slot.Name, Config.SearchPrefix) then
            local SlotNum = string.match(Slot.Name, "Slot_(%d+)")
            if SlotNum then
                table.insert(State.FirstEggList, {
                    Slot = Slot,
                    Uid = Slot.Name,
                    SlotKey = "Forest:Slot_" .. SlotNum,
            end
        end
    end
end

local function FindClosestEgg()
    local _, Root = GetHumanoid()
    if not Root then return nil end

    local Closest, ClosestDist = nil, 9999
    for _, Egg in ipairs(State.FirstEggList) do
        local Pos = GetPosition(Egg.Slot)
        if Pos then
            local Dist = (Pos - Root.Position).Magnitude
            if Dist < ClosestDist then
                ClosestDist = Dist
                Closest = Egg
            end
        end
    end

    if Closest then
        State.FirstEggUid = Closest.Uid
        State.FirstEggSlotKey = Closest.SlotKey
    end
    return Closest
end

local function IsFirstEggInWorkspace()
    return State.FirstEggUid and workspace:FindFirstChild(State.FirstEggUid) ~= nil
end

local function IsFirstEggInContainer()
    return State.FirstEggUid and Container and Container:FindFirstChild(State.FirstEggUid) ~= nil
end

local function IsTargetInContainer()
    return State.TargetUid and Container and Container:FindFirstChild(State.TargetUid) ~= nil
end

local function IsTargetInWorkspace()
    return State.TargetUid and workspace:FindFirstChild(State.TargetUid) ~= nil
end

local function AutoStop()
    if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
    State.TargetLockedCFrame = nil

    if State.ActiveHeartbeat then State.ActiveHeartbeat:Disconnect() State.ActiveHeartbeat = nil end

    CleanupMovers()
    DisableRagdollBypass()
    RestoreStats()

    State.Running = false
    State.Step = "done"
    State.FlySequence = State.FlySequence + 1

    State.FirstEggList = {}
    State.FirstEggUid = nil
    State.FirstEggSlotKey = nil
    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.SavedTargetPosition = nil

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function StartFlyToTarget()
    if State.FlyTargetStarted then return end
    State.FlyTargetStarted = true
    State.Step = "to_target"

    local TargetPos
    if State.Mode == "spawn" then
        local Egg = Container and Container:FindFirstChild(State.TargetUid)
        if Egg then TargetPos = GetPosition(Egg) end
    elseif State.Mode == "workspace" then
        TargetPos = State.SavedTargetPosition
        if not TargetPos then
            local Egg = workspace:FindFirstChild(State.TargetUid)
            if Egg then
                TargetPos = GetPosition(Egg)
                State.SavedTargetPosition = TargetPos
            end
        end
    end

    if not TargetPos then AutoStop() return end

    TeleportToTarget(TargetPos, function()
        State.TargetCollected = false
        State.CollectTime = 0
        State.CollectAttempts = 0
        State.RecoveryTriggered = false
        State.TargetCollectStartTime = tick()
        State.Step = "collect_target"
    end)
end

local function FlyToTargetAgain()
    State.RecoveryAttempts = State.RecoveryAttempts + 1
    if State.RecoveryAttempts > Config.MaxRecoveryAttempts then
        print("leak by https://discord.gg/TBBAUZu8cW")
        AutoStop()
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    State.Step = "recovery"

    State.FlySequence = State.FlySequence + 1
    CleanupMovers()

    local TargetPos
    if IsTargetInContainer() then
        State.Mode = "spawn"
        local Egg = Container:FindFirstChild(State.TargetUid)
        if Egg then TargetPos = GetPosition(Egg) end
    elseif IsTargetInWorkspace() then
        State.Mode = "workspace"
        local Egg = workspace:FindFirstChild(State.TargetUid)
        if Egg then
            TargetPos = GetPosition(Egg)
            State.SavedTargetPosition = TargetPos
        end
    else
        print("leak by https://discord.gg/TBBAUZu8cW")
        AutoStop()
        return
    end

    if not TargetPos then AutoStop() return end

    State.RecoveryTriggered = false
    State.TargetCollected = false

    print("leak by https://discord.gg/TBBAUZu8cW")
    TweenTeleportDirect(TargetPos, function()
        print("leak by https://discord.gg/TBBAUZu8cW")
        State.TargetCollected = false
        State.CollectTime = 0
        State.CollectAttempts = 0
        State.RecoveryTriggered = false
        State.RemotesFired = false
        State.TargetCollectStartTime = tick()
        State.Step = "collect_target"
    end)
end

local function FlyToSafeZone()
    State.Step = "to_safe"
    State.RecoveryTriggered = false
    State.TargetCollected = false

    print("leak by https://discord.gg/TBBAUZu8cW")

    FlyTP(Config.SafeZone, false, true, function()
        print("leak by https://discord.gg/TBBAUZu8cW")

        if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
        State.TargetLockedCFrame = nil

        if State.ActiveHeartbeat then State.ActiveHeartbeat:Disconnect() State.ActiveHeartbeat = nil end

        CleanupMovers()
        DisableRagdollBypass()
        RestoreStats()

        State.Running = false
        State.Step = "idle"
        State.Mode = "none"
        State.FlySequence = State.FlySequence + 1

        State.FirstEggList = {}
        State.FirstEggUid = nil
        State.FirstEggSlotKey = nil
        State.CollectAttempts = 0
        State.CollectTime = 0
        State.TargetCollectStartTime = 0
        State.FlyTargetStarted = false
        State.CollectDone = false
        State.TargetCollected = false
        State.RemotesFired = false
        State.RecoveryTriggered = false
        State.RecoveryAttempts = 0
        State.SavedTargetPosition = nil

        print("leak by https://discord.gg/TBBAUZu8cW")
    end)
end

local function StartActiveHeartbeat()
    if State.ActiveHeartbeat then State.ActiveHeartbeat:Disconnect() end

    State.ActiveHeartbeat = RunService.Heartbeat:Connect(function()
        if not State.Running then return end

        local Hum, Root = GetHumanoid()
        if not Hum or not Root or Hum.Health <= 0 then return end

        if State.Step == "collect_first" and not State.CollectDone then
            if IsFirstEggInWorkspace() then
                State.CollectDone = true
                FireForestStrike()
                State.Step = "wait_spawn_back"
                return
            end

            if tick() - State.CollectTime > Config.CollectInterval then
                State.CollectTime = tick()
                if IsFirstEggInContainer() then
                    RemoteCollectFirst()
                    State.CollectAttempts = State.CollectAttempts + 1
                elseif IsFirstEggInWorkspace() then
                    State.CollectDone = true
                    FireForestStrike()
                    State.Step = "wait_spawn_back"
                end
            end
        end

        if State.Step == "wait_spawn_back" and not State.FlyTargetStarted then
            if IsFirstEggInContainer() then
                task.spawn(function()
                    task.wait(0.05)
                    StartFlyToTarget()
                end)
            end
        end

        if State.Step == "collect_target" and not State.TargetCollected then
            if IsTargetCollected() then
                print("leak by https://discord.gg/TBBAUZu8cW")")
                State.TargetCollected = true
                State.RecoveryTriggered = false
                task.spawn(function() task.wait(0.05) FlyToSafeZone() end)
                return
            end

            if State.Mode == "spawn" then
                if workspace:FindFirstChild(State.TargetUid) then
                    State.TargetCollected = true
                    task.spawn(function() task.wait(0.05) FlyToSafeZone() end)
                    return
                end
            elseif State.Mode == "workspace" and State.SavedTargetPosition then
                local Egg = workspace:FindFirstChild(State.TargetUid)
                if Egg then
                    local Pos = GetPosition(Egg)
                    if Pos and (Pos - State.SavedTargetPosition).Magnitude >= Config.PositionThreshold then                        State.TargetCollected = true
                        task.spawn(function() task.wait(0.05) FlyToSafeZone() end)
                        return
                    end
                end
            end

            if tick() - State.CollectTime > Config.CollectInterval then
                State.CollectTime = tick()
                RemoteCollectTarget()
                State.CollectAttempts = State.CollectAttempts + 1
            end

            if tick() - State.TargetCollectStartTime > Config.TargetCollectTimeout then
                print("leak by https://discord.gg/TBBAUZu8cW")
                if not State.RecoveryTriggered then
                    State.RecoveryTriggered = true
                    task.spawn(function() task.wait(0.05) FlyToTargetAgain() end)
                end
            end
        end

        if State.Step == "to_safe" then
            if not IsTargetCollected() then
                if not State.RecoveryTriggered then
                    State.RecoveryTriggered = true
                    print("leak by https://discord.gg/TBBAUZu8cW")
                    task.spawn(function() task.wait(0.05) FlyToTargetAgain() end)
                end
            else
                State.RecoveryTriggered = false
            end
        end
    end)
end

local function StartProcess()
    State.Running = true
    State.Step = "search"
    State.FlySequence = 0

    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.SavedTargetPosition = nil
    State.TargetLockedCFrame = nil

    SetupDropHeldEgg()
    SaveStats()
    EnableRagdollBypass()

    if IsTargetInContainer() then
        State.Mode = "spawn"
        print("leak by https://discord.gg/TBBAUZu8cW")
    elseif IsTargetInWorkspace() then
        State.Mode = "workspace"
        local Egg = workspace:FindFirstChild(State.TargetUid)
        if Egg then State.SavedTargetPosition = GetPosition(Egg) end
        print("leak by https://discord.gg/TBBAUZu8cW")
    else
        local Waited = 0
        while State.Running and not IsTargetInContainer() and not IsTargetInWorkspace() do
            task.wait(0.2)
            Waited = Waited + 0.2
            if Waited > 30 then AutoStop() return end
        end
        if IsTargetInContainer() then
            State.Mode = "spawn"
        elseif IsTargetInWorkspace() then
            State.Mode = "workspace"
            local Egg = workspace:FindFirstChild(State.TargetUid)
            if Egg then State.SavedTargetPosition = GetPosition(Egg) end
        end
    end

    SearchFirstEggs()
    if #State.FirstEggList == 0 then AutoStop() return end

    local Closest = FindClosestEgg()
    if not Closest then AutoStop() return end

    local EggPos = GetPosition(Closest.Slot)
    if not EggPos then AutoStop() return end

    State.Step = "fly_first"
    StartActiveHeartbeat()

    print("leak by https://discord.gg/TBBAUZu8cW")")
    FlyTP(EggPos, true, false, function()
        State.CollectDone = false
        State.CollectTime = 0
        State.Step = "collect_first"
    end)
end

local function FullReset()
    if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
    State.TargetLockedCFrame = nil

    if State.ActiveHeartbeat then State.ActiveHeartbeat:Disconnect() State.ActiveHeartbeat = nil end

    if State.DropHeldEggConnection then
        State.DropHeldEggConnection:Disconnect()
        State.DropHeldEggConnection = nil
    end
    State.DropHeldEgg = nil
    State.PlayerGui = nil

    CleanupMovers()
    DisableRagdollBypass()
    RestoreStats()

    State.Running = false
    State.Step = "idle"
    State.Mode = "none"
    State.FlySequence = State.FlySequence + 1

    State.FirstEggList = {}
    State.FirstEggUid = nil
    State.FirstEggSlotKey = nil
    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.SavedTargetPosition = nil

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local TeleportSystem = {}

function TeleportSystem.Enable()
    if State.Running then return end
    if not CollectEvent then print("leak by https://discord.gg/TBBAUZu8cW") return end
    if not State.TargetUid then print("leak by https://discord.gg/TBBAUZu8cW") return end

    FullReset()
    StartProcess()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

function TeleportSystem.Disable()
    FullReset()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

function TeleportSystem.SetTargetId(Id)
    State.TargetUid = Id
    print("leak by https://discord.gg/TBBAUZu8cW"))
end

function TeleportSystem.SetSpeed(Value)
    Value = math.clamp(Value, 50, 1100)
    Config.TeleportSpeed = Value
    print("leak by https://discord.gg/TBBAUZu8cW"))
end

function TeleportSystem.SetMethod(Method)
    State.Method = (Method == "InstantTeleport") and "InstantTeleport" or "TeleportFly"
    print("leak by https://discord.gg/TBBAUZu8cW")
end

function TeleportSystem.GetMethod() return State.Method end
function TeleportSystem.GetSpeed() return Config.TeleportSpeed end
function TeleportSystem.IsEnabled() return State.Running end
function TeleportSystem.GetTargetId() return State.TargetUid end

_G.YOKUDO_TeleportSystem = TeleportSystem

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/AutoFarm.lua"] = [=[

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Container = workspace:WaitForChild("AreaEggSlotsClient")

local Cache = {
    MeshIdMap = {},
    MeshIdMapBuilt = false,
    PetData = {},
    UidCategory = {},

local AutoFarmEnabled = false
local SelectedEgg = nil
local EggList = {}

local Assets = ReplicatedStorage:WaitForChild("Data"):WaitForChild("Assets")
local Configs = Assets:WaitForChild("Configs")
local EggModels = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Models"):WaitForChild("Eggs")

local MutationsModule = nil
pcall(function()
    MutationsModule = require(ReplicatedStorage.Shared.Modules.Mutations)
end)

local function BuildMeshIdMap()
    if Cache.MeshIdMapBuilt then return end

    for _, Config in ipairs(Configs:GetChildren()) do
        local Success, Module = pcall(function()
            return require(Config)
        end)
        if Success and Module and Module.Egg then
            local ModelName = Module.Egg.ModelName or Config.Name
            local EggTemplate = EggModels:FindFirstChild(ModelName)
            if EggTemplate then
                for _, descendant in ipairs(EggTemplate:GetDescendants()) do
                    if descendant:IsA("MeshPart") and descendant.MeshId ~= "" then
                        Cache.MeshIdMap[descendant.MeshId] = Config.Name
                    end
                    if descendant:IsA("SpecialMesh") and descendant.MeshId ~= "" then
                        Cache.MeshIdMap[descendant.MeshId] = Config.Name
                    end
                end
            end
        end
    end

    Cache.MeshIdMapBuilt = true
    print("leak by https://discord.gg/TBBAUZu8cW")")
end

BuildMeshIdMap()

local function GetPetData(AssetCategory)
    if not AssetCategory then return nil end

    if Cache.PetData[AssetCategory] then
        return Cache.PetData[AssetCategory]
    end

    local Config = Configs:FindFirstChild(AssetCategory)
    if not Config then return nil end

    local Data = {
        Name = AssetCategory,
        DisplayName = AssetCategory,
        EarningRate = 0,
        Icon = nil

    local Success, Module = pcall(function()
        return require(Config)
    end)

    if Success and Module then
        Data.DisplayName = Module.DisplayName or AssetCategory
        Data.EarningRate = Module.EarningRate or 0
        Data.Icon = Module.Icon
    end

    Cache.PetData[AssetCategory] = Data
    return Data
end

local function FormatMoney(Amount)
    if type(Amount) ~= "number" then return tostring(Amount) end
    if Amount >= 1e12 then
        return string.format("%.2fT", Amount / 1e12)
    elseif Amount >= 1e9 then
        return string.format("%.2fB", Amount / 1e9)
    elseif Amount >= 1e6 then
        return string.format("%.2fM", Amount / 1e6)
    elseif Amount >= 1e3 then
        return string.format("%.2fK", Amount / 1e3)
    else
        return tostring(math.floor(Amount))
    end
end

local function CalculateRatePerSecond(EarningRate, Scale, Mutations)
    local PayoutFactor
    if Scale <= 5 then
        PayoutFactor = Scale ^ 1.85
    else
        PayoutFactor = (Scale / 5) ^ 1.2 * 19.637875755794113
    end

    local MutationMultiplier = 1
    if Mutations and #Mutations > 0 and MutationsModule then
        local Success, Result = pcall(function()
            return MutationsModule.EarningsFor(Mutations)
        end)
        if Success then
            MutationMultiplier = Result
        end
    end

    return math.round(EarningRate * PayoutFactor * MutationMultiplier)
end

local function FindAssetCategory(EggModel)
    if not EggModel then return nil end

    local Uid = EggModel.Name
    if Cache.UidCategory[Uid] then
        return Cache.UidCategory[Uid]
    end

    for _, descendant in ipairs(EggModel:GetDescendants()) do
        if descendant:IsA("MeshPart") and descendant.MeshId ~= "" then
            local Category = Cache.MeshIdMap[descendant.MeshId]
            if Category then
                Cache.UidCategory[Uid] = Category
                return Category
            end
        end
        if descendant:IsA("SpecialMesh") and descendant.MeshId ~= "" then
            local Category = Cache.MeshIdMap[descendant.MeshId]
            if Category then
                Cache.UidCategory[Uid] = Category
                return Category
            end
        end
    end
    return nil
end

local function ScanEggs()
    EggList = {}

    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("Model") then
            local AssetCategory = FindAssetCategory(child)
            if AssetCategory then
                local Data = GetPetData(AssetCategory)
                if Data then
                    local Scale = child:GetAttribute("AssetScale") or 1
                    local Mutations = child:GetAttribute("Mutations") or {}
                    local RealRate = CalculateRatePerSecond(Data.EarningRate, Scale, Mutations)

                    table.insert(EggList, {
                        Id = child.Name,
                        Category = AssetCategory,
                        DisplayName = Data.DisplayName,
                        Icon = Data.Icon,
                        EarningRate = RealRate,
                        Model = child
                end
            end
        end
    end

    table.sort(EggList, function(a, b)
        return a.EarningRate > b.EarningRate
    end)

    return EggList
end

local function EnableAutoFarm()
    AutoFarmEnabled = true
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableAutoFarm()
    AutoFarmEnabled = false
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SelectEgg(EggData)
    SelectedEgg = EggData
    print("leak by https://discord.gg/TBBAUZu8cW") .. "/s)")
end

local function StartTeleport()
    if not SelectedEgg then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    local Method = _G.YOKUDO_SelectedMethod or "TeleportFly"
    local Speed = _G.YOKUDO_TeleportSpeed or 300

    print("leak by https://discord.gg/TBBAUZu8cW"))

    if _G.YOKUDO_TeleportSystem then
        _G.YOKUDO_TeleportSystem.SetMethod(Method)
        _G.YOKUDO_TeleportSystem.SetSpeed(Speed)
        _G.YOKUDO_TeleportSystem.SetTargetId(SelectedEgg.Id)
        _G.YOKUDO_TeleportSystem.Enable()
    end
end

local function StopTeleport()
    if _G.YOKUDO_TeleportSystem then
        _G.YOKUDO_TeleportSystem.Disable()
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

_G.YOKUDO_AutoFarm = {
    Enable = EnableAutoFarm,
    Disable = DisableAutoFarm,
    IsEnabled = function() return AutoFarmEnabled end,
    ScanEggs = ScanEggs,
    GetEggList = function() return EggList end,
    SelectEgg = SelectEgg,
    StartTeleport = StartTeleport,
    StopTeleport = StopTeleport,
    GetSelectedEgg = function() return SelectedEgg end,
    FormatMoney = FormatMoney,

    ClearCache = function()
        Cache.UidCategory = {}
        print("leak by https://discord.gg/TBBAUZu8cW")
    end,

if _G.YOKUDO_CharacterSystem then
    _G.YOKUDO_CharacterSystem:RegisterFeature({
        Name = "AutoFarm",
        Enable = EnableAutoFarm,
        Disable = DisableAutoFarm,
        IsEnabled = function() return AutoFarmEnabled end,
        OnCharacterAdded = function(Char, Hum, Root)
            if AutoFarmEnabled and SelectedEgg then
                task.wait(2)
                pcall(function()
                    if _G.YOKUDO_TeleportSystem and _G.YOKUDO_TeleportSystem.IsEnabled() then
                        StartTeleport()
                    end
                end)
            end
        end
end

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/AutoAttack.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Backpack = Player:WaitForChild("Backpack")

local function GetBatSwingRemote()
    local Success, Remote = pcall(function()
        return ReplicatedStorage.Packages.Networking["RE/BatSwing/Trigger"]
    end)
    if Success and Remote then
        return Remote
    end
    return nil
end

local ATTACK_RANGE = 60
local FIRE_INTERVAL = 0.01

local AutoEquipEnabled = false
local AutoHitEnabled = false
local EquipConnection = nil
local HitConnection = nil
local CurrentBat = nil
local LastFire = 0
local TraceSequence = 0

local function GetHumanoid()
    local Char = Player.Character
    if not Char then return nil, nil end
    local Hum = Char:FindFirstChildOfClass("Humanoid")
    local Root = Char:FindFirstChild("HumanoidRootPart")
    return Hum, Root
end

local function FindBatTool()
    for _, tool in ipairs(Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            if tool.ToolTip == "Bat" or tool.Name:find("Bat") then
                return tool
            end
        end
    end
    local Char = Player.Character
    if Char then
        for _, tool in ipairs(Char:GetChildren()) do
            if tool:IsA("Tool") then
                if tool.ToolTip == "Bat" or tool.Name:find("Bat") then
                    return tool
                end
            end
        end
    end
    return nil
end

local function EquipBat()
    local Bat = FindBatTool()
    if not Bat then return false end
    if Bat.Parent == Backpack then
        local Hum, Root = GetHumanoid()
        if Hum then
            Hum:EquipTool(Bat)
            CurrentBat = Bat
            return true
        end
    elseif Bat.Parent == Player.Character then
        CurrentBat = Bat
        return true
    end
    return false
end

local function EnableAutoEquip()
    if AutoEquipEnabled then return end
    AutoEquipEnabled = true
    if EquipConnection then
        EquipConnection:Disconnect()
        EquipConnection = nil
    end
    EquipConnection = RunService.Heartbeat:Connect(function()
        if not AutoEquipEnabled then return end
        local Bat = FindBatTool()
        if Bat and Bat.Parent == Backpack then
            EquipBat()
        end
    end)
    EquipBat()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableAutoEquip()
    if not AutoEquipEnabled then return end
    AutoEquipEnabled = false
    if EquipConnection then
        EquipConnection:Disconnect()
        EquipConnection = nil
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleAutoEquip()
    if AutoEquipEnabled then DisableAutoEquip() else EnableAutoEquip() end
end

local function FindClosestPlayer()
    local Hum, Root = GetHumanoid()
    if not Root then return nil end

    local Closest = nil
    local ClosestDist = ATTACK_RANGE

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= Player then
            local otherChar = otherPlayer.Character
            if otherChar then
                local otherHum = otherChar:FindFirstChildOfClass("Humanoid")
                local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
                if otherHum and otherRoot and otherHum.Health > 0 then
                    local Dist = (otherRoot.Position - Root.Position).Magnitude
                    if Dist < ClosestDist then
                        ClosestDist = Dist
                        Closest = otherPlayer
                    end
                end
            end
        end
    end
    return Closest
end

local function FireRemote()
    local Target = FindClosestPlayer()
    if not Target then return end

    local Remote = GetBatSwingRemote()
    if not Remote then return end

    TraceSequence = TraceSequence + 1
    local TraceId = tostring(Player.UserId) .. ":" .. tostring(TraceSequence) .. ":" .. tostring(math.floor(workspace:GetServerTimeNow() * 1000))

    pcall(function()
        Remote:FireServer(Target, TraceId)
    end)
end

local function EnableAutoHit()
    if AutoHitEnabled then return end
    AutoHitEnabled = true
    if HitConnection then
        HitConnection:Disconnect()
        HitConnection = nil
    end
    HitConnection = RunService.Heartbeat:Connect(function()
        if not AutoHitEnabled then return end
        local now = tick()
        if now - LastFire < FIRE_INTERVAL then return end
        LastFire = now
        FireRemote()
    end)
    print("leak by https://discord.gg/TBBAUZu8cW"): ON")
end

local function DisableAutoHit()
    if not AutoHitEnabled then return end
    AutoHitEnabled = false
    if HitConnection then
        HitConnection:Disconnect()
        HitConnection = nil
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleAutoHit()
    if AutoHitEnabled then DisableAutoHit() else EnableAutoHit() end
end

_G.YOKUDO_AutoAttack = {
    ToggleAutoEquip = ToggleAutoEquip,
    EnableAutoEquip = EnableAutoEquip,
    DisableAutoEquip = DisableAutoEquip,
    IsAutoEquipEnabled = function() return AutoEquipEnabled end,
    ToggleAutoHit = ToggleAutoHit,
    EnableAutoHit = EnableAutoHit,
    DisableAutoHit = DisableAutoHit,
    IsAutoHitEnabled = function() return AutoHitEnabled end,
    FindBatTool = FindBatTool,
    GetBatSwingRemote = GetBatSwingRemote,
    FindClosestPlayer = FindClosestPlayer

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/AFKSystem.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local FLY_SPEED = 350
local ARRIVE_TIMEOUT = 15
local JUMP_DISTANCE_THRESHOLD = 5
local JUMP_MAX_ATTEMPTS = 50
local JUMP_ATTEMPT_WAIT = 0.2
local DIST_TREADMILL_THRESHOLD = 5
local DIST_CHECK_INTERVAL = 4
local SAFE_WAIT_TIME = 1
local SAFE_ZONE = Vector3.new(533, 70, -366)

local AFKEnabled = false
local MyPlot = nil
local MyTreadmill = nil
local MyTreadmillPos = nil
local FlyConnection = nil
local BodyVelocity = nil
local BodyGyro = nil
local IsFlying = false
local DistCheckThread = nil

local function GetHumanoid()
    local Char = Player.Character
    if not Char then return nil, nil end
    local Hum = Char:FindFirstChildOfClass("Humanoid")
    local Root = Char:FindFirstChild("HumanoidRootPart")
    return Hum, Root
end

local function CleanupMovers()
    if FlyConnection then FlyConnection:Disconnect() FlyConnection = nil end
    if BodyVelocity then
        pcall(function()
            BodyVelocity.Velocity = Vector3.zero
            BodyVelocity.MaxForce = Vector3.zero
        end)
        BodyVelocity:Destroy()
        BodyVelocity = nil
    end
    if BodyGyro then
        pcall(function() BodyGyro.MaxTorque = Vector3.zero end)
        BodyGyro:Destroy()
        BodyGyro = nil
    end

    local Hum, Root = GetHumanoid()
    if Root then
        for _, Child in ipairs(Root:GetChildren()) do
            if Child.Name == "YokudoBV" or Child.Name == "YokudoBG" then
                pcall(function() Child:Destroy() end)
            end
        end
    end
    if Hum then
        pcall(function()
            Hum.PlatformStand = false
            Hum.Sit = false
        end)
    end
    if Root then
        pcall(function()
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    IsFlying = false
end

local function FindMyPlotAndTreadmill()
    local Plots = workspace:FindFirstChild("Plots")
    if not Plots then return nil, nil end

    for _, plot in ipairs(Plots:GetChildren()) do
        if plot:IsA("Model") then
            local PlotSign = plot:FindFirstChild("PlotSign")
            if PlotSign then
                local PlayerPlotSign = PlotSign:FindFirstChild("PlayerPlotSign")
                if PlayerPlotSign then
                    local Frame = PlayerPlotSign:FindFirstChild("Frame")
                    if Frame then
                        local PlayerName = Frame:FindFirstChild("PlayerName")
                        if PlayerName and PlayerName:IsA("TextLabel") then
                            if PlayerName.Text == Player.Name
                            or PlayerName.Text == Player.DisplayName then
                                local Treadmill = plot:FindFirstChild("TreadmillBottom")
                                return plot, Treadmill
                            end
                        end
                    end
                end
            end
        end
    end
    return nil, nil
end

local function FlyTP(Destination, Callback)
    CleanupMovers()
    IsFlying = true

    local Hum, Root = GetHumanoid()
    if not Hum or not Root then
        IsFlying = false
        if Callback then Callback() end
        return
    end
    if Hum.Health <= 0 then
        IsFlying = false
        if Callback then Callback() end
        return
    end

    Hum.PlatformStand = true

    BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Name = "YokudoBV"
    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyVelocity.P = 1250
    BodyVelocity.Velocity = Vector3.zero
    BodyVelocity.Parent = Root

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.Name = "YokudoBG"
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.P = 3000
    BodyGyro.D = 500
    BodyGyro.CFrame = Root.CFrame
    BodyGyro.Parent = Root

    local StartTime = tick()

    FlyConnection = RunService.Heartbeat:Connect(function()
        if not AFKEnabled then
            CleanupMovers()
            return
        end

        local Hum2, Root2 = GetHumanoid()
        if not Hum2 or not Root2 then
            CleanupMovers()
            return
        end
        if Hum2.Health <= 0 then return end
        if not BodyVelocity or not BodyGyro then CleanupMovers() return end

        local CurrentPos = Root2.Position
        local Direction = Destination - CurrentPos
        local TotalDist = math.floor(Direction.Magnitude)

        if TotalDist <= 2 then
            CleanupMovers()
            Root2.AssemblyLinearVelocity = Vector3.zero
            Root2.AssemblyAngularVelocity = Vector3.zero
            if Callback then Callback() end
            return
        end

        if tick() - StartTime > ARRIVE_TIMEOUT then
            CleanupMovers()
            if Callback then Callback() end
            return
        end

        BodyVelocity.Velocity = Direction.Unit * FLY_SPEED
        BodyGyro.CFrame = CFrame.new(CurrentPos, Destination)
    end)
end

local function JumpOutTreadmill(TreadmillPos, Callback)
    local Hum, Root = GetHumanoid()
    if not Hum or not Root or not TreadmillPos then
        if Callback then Callback() end
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")

    task.spawn(function()
        local Attempts = 0
        while AFKEnabled and Attempts < JUMP_MAX_ATTEMPTS do
            local Hum2, Root2 = GetHumanoid()
            if not Hum2 or not Root2 then break end
            if Hum2.Health <= 0 then break end

            local DistToTreadmill = math.floor((Root2.Position - TreadmillPos).Magnitude)

            if DistToTreadmill > JUMP_DISTANCE_THRESHOLD then
                print("leak by https://discord.gg/TBBAUZu8cW")
                if Callback then Callback() end
                return
            end

            pcall(function() Hum2.Jump = true end)
            Attempts = Attempts + 1
            task.wait(JUMP_ATTEMPT_WAIT)
        end

        print("leak by https://discord.gg/TBBAUZu8cW")
        if Callback then Callback() end
    end)
end

local function StartDistanceCheck()
    if DistCheckThread then
        pcall(function() task.cancel(DistCheckThread) end)
        DistCheckThread = nil
    end

    DistCheckThread = task.spawn(function()
        while AFKEnabled do
            task.wait(DIST_CHECK_INTERVAL)
            if not AFKEnabled then break end

            local Hum, Root = GetHumanoid()
            if not Root or not MyTreadmillPos then continue end

            local DistToTreadmill = math.floor((Root.Position - MyTreadmillPos).Magnitude)

            if DistToTreadmill > DIST_TREADMILL_THRESHOLD then
                print("leak by https://discord.gg/TBBAUZu8cW")
                FlyTP(MyTreadmillPos)
            end
        end
    end)
end

local function EnableAFK()
    if AFKEnabled then return end
    AFKEnabled = true

    MyPlot, MyTreadmill = FindMyPlotAndTreadmill()
    if MyTreadmill then
        MyTreadmillPos = MyTreadmill.Position
        print("leak by https://discord.gg/TBBAUZu8cW"))
    else
        print("leak by https://discord.gg/TBBAUZu8cW")
        AFKEnabled = false
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    FlyTP(SAFE_ZONE, function()
        task.wait(SAFE_WAIT_TIME)
        print("leak by https://discord.gg/TBBAUZu8cW")
        FlyTP(MyTreadmillPos, function()
            print("leak by https://discord.gg/TBBAUZu8cW")
            StartDistanceCheck()
        end)
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableAFK()
    if not AFKEnabled then return end
    AFKEnabled = false

    if DistCheckThread then
        pcall(function() task.cancel(DistCheckThread) end)
        DistCheckThread = nil
    end

    CleanupMovers()
    MyPlot = nil
    MyTreadmill = nil
    MyTreadmillPos = nil

    print("leak by https://discord.gg/TBBAUZu8cW")
end

_G.YOKUDO_AFKSystem = {
    Enable = EnableAFK,
    Disable = DisableAFK,
    IsEnabled = function() return AFKEnabled end,
    FindMyPlotAndTreadmill = FindMyPlotAndTreadmill,
    FlyTP = FlyTP,
    JumpOutTreadmill = JumpOutTreadmill,
    GetMyTreadmillPos = function() return MyTreadmillPos end,
    GetMyTreadmill = function() return MyTreadmill end,
    GetMyPlot = function() return MyPlot end,
    IsFlying = function() return IsFlying end,
    SAFE_ZONE = SAFE_ZONE,

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/VIPTP.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Container = workspace:WaitForChild("AreaEggSlotsClient")

local Config = {
    FirstEggSpeed = 1000,
    RecoverySpeed = 1000,
    SafeZoneSpeed = 700,

    NearOffset = 20,

    FlyOffset = 5,
    ShotDistance = 25,
    LockAbove = 1,
    ArriveDistance = 2,
    SafeStopDistance = 5,

    Timeout = 20,
    CollectInterval = 0.05,
    TargetCollectTimeout = 10,
    MaxRecoveryAttempts = 10000,

    BodyVelocityP = 5000,
    BodyGyroP = 50000,
    BodyGyroD = 2000,

    SafeZone = Vector3.new(533, 70, -366),
    LockPosition = Vector3.new(607.6259155273438, 70.57420349121094, -326.8830261230469),

    MinSafeY = 60,
    SafeZoneWait = 0.2,

    SearchPrefix = "FirstAreaEgg",
    PositionThreshold = 1,

    RepeatCheckDelay = 0.05,

local CollectEvent = ReplicatedStorage.Packages.Networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
local ForestStrike = ReplicatedStorage.Packages.Networking:FindFirstChild("RE/GuardPatrol/ForestStrike")

if not CollectEvent then
    print("leak by https://discord.gg/TBBAUZu8cW")
    return
end

print("leak by https://discord.gg/TBBAUZu8cW")

local State = {
    Running = false,
    Step = "idle",
    Mode = "none",
    TargetUid = nil,

    FlySequence = 0,

    TweenConnection = nil,
    FlyConnection = nil,
    LockConnection = nil,
    BodyVelocity = nil,
    BodyGyro = nil,
    ActiveTask = nil,

    FirstEggList = {},
    FirstEggUid = nil,
    FirstEggSlotKey = nil,

    SavedTargetPosition = nil,
    TargetLockedCFrame = nil,

    FlyTargetStarted = false,
    CollectDone = false,
    TargetCollected = false,
    RemotesFired = false,
    RecoveryTriggered = false,
    RecoveryAttempts = 0,

    CollectAttempts = 0,
    CollectTime = 0,
    TargetCollectStartTime = 0,

    PlayerGui = nil,
    DropHeldEgg = nil,
    DropHeldEggConnection = nil,

    RagdollEnabled = false,
    RagdollConnection = nil,
    ForceUpConnection = nil,

    SavedWalkSpeed = nil,
    SavedJumpPower = nil,
    SavedJumpHeight = nil,
    SavedUseJumpPower = nil,

local function GetChar()
    return Player.Character
end

local function GetRoot()
    local Char = GetChar()
    if not Char then return nil end
    return Char:FindFirstChild("HumanoidRootPart")
end

local function GetHum()
    local Char = GetChar()
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Humanoid")
end

local function GetPosition(Object)
    if not Object then return nil end
    if Object:IsA("Model") then
        if Object.PrimaryPart then return Object.PrimaryPart.Position end
        local Part = Object:FindFirstChildWhichIsA("BasePart")
        if Part then return Part.Position end
        for _, Desc in ipairs(Object:GetDescendants()) do
            if Desc:IsA("BasePart") then return Desc.Position end
        end
    elseif Object:IsA("BasePart") then
        return Object.Position
    end
    return nil
end

local function SaveStats()
    local Hum = GetHum()
    if not Hum then return end
    if State.SavedWalkSpeed == nil then State.SavedWalkSpeed = Hum.WalkSpeed end
    if State.SavedJumpPower == nil then State.SavedJumpPower = Hum.JumpPower end
    if State.SavedJumpHeight == nil then State.SavedJumpHeight = Hum.JumpHeight end
    if State.SavedUseJumpPower == nil then State.SavedUseJumpPower = Hum.UseJumpPower end
end

local function RestoreStats()
    local Hum = GetHum()
    if not Hum then return end
    if State.SavedWalkSpeed ~= nil then pcall(function() Hum.WalkSpeed = State.SavedWalkSpeed end) end
    if State.SavedJumpPower ~= nil then pcall(function() Hum.JumpPower = State.SavedJumpPower end) end
    if State.SavedJumpHeight ~= nil then pcall(function() Hum.JumpHeight = State.SavedJumpHeight end) end
    if State.SavedUseJumpPower ~= nil then pcall(function() Hum.UseJumpPower = State.SavedUseJumpPower end) end
end

local function ForceUp()
    local Hum = GetHum()
    local Root = GetRoot()
    if not Hum or not Root then return end
    pcall(function()
        if Hum:GetState() == Enum.HumanoidStateType.Physics then
            Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        Hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        Hum.PlatformStand = false
        Hum.Sit = false
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
        Root.CanCollide = true
        Hum.BreakJointsOnDeath = false
        Hum.RequiresNeck = false
    end)
end

local function CleanupRagdollConstraints()
    local Char = GetChar()
    if not Char then return end
    pcall(function()
        for _, d in ipairs(Char:GetDescendants()) do
            if d.Name:find("RagdollConstraint") or d.Name:find("RagdollAttachment") then
                d:Destroy()
            end
        end
        for _, d in ipairs(Char:GetDescendants()) do
            if d:IsA("Motor6D") then d.Enabled = true end
        end
    end)
end

local function EnableRagdollBypass()
    if State.RagdollEnabled then return end
    State.RagdollEnabled = true

    State.RagdollConnection = RunService.Heartbeat:Connect(function()
        if not State.RagdollEnabled then return end
        ForceUp()
    end)

    State.ForceUpConnection = task.spawn(function()
        while State.RagdollEnabled do
            task.wait(0.1)
            ForceUp()
            CleanupRagdollConstraints()
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableRagdollBypass()
    if not State.RagdollEnabled then return end
    State.RagdollEnabled = false
    if State.RagdollConnection then
        State.RagdollConnection:Disconnect()
        State.RagdollConnection = nil
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function CleanupMovers(KeepPlatformStand)
    if State.TweenConnection then
        pcall(function() State.TweenConnection:Cancel() end)
        State.TweenConnection = nil
    end
    if State.FlyConnection then
        State.FlyConnection:Disconnect()
        State.FlyConnection = nil
    end
    if State.LockConnection then
        State.LockConnection:Disconnect()
        State.LockConnection = nil
    end
    if State.BodyVelocity then
        pcall(function()
            State.BodyVelocity.Velocity = Vector3.zero
            State.BodyVelocity.MaxForce = Vector3.zero
        end)
        State.BodyVelocity:Destroy()
        State.BodyVelocity = nil
    end
    if State.BodyGyro then
        pcall(function() State.BodyGyro.MaxTorque = Vector3.zero end)
        State.BodyGyro:Destroy()
        State.BodyGyro = nil
    end

    local Hum = GetHum()
    local Root = GetRoot()
    if Root then
        for _, c in ipairs(Root:GetChildren()) do
            if c.Name == "YokudoBV" or c.Name == "YokudoBG" then
                pcall(function() c:Destroy() end)
            end
        end
    end

    if Hum and not KeepPlatformStand then
        pcall(function()
            Hum.PlatformStand = false
            Hum.Sit = false
        end)
    end

    if Root then
        pcall(function()
            Root.CanCollide = true
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end
end

local function StartLock(Position)
    if not Position then return end
    State.TargetLockedCFrame = CFrame.new(Position + Vector3.new(0, Config.LockAbove, 0))

    if State.LockConnection then State.LockConnection:Disconnect() end

    State.LockConnection = RunService.Heartbeat:Connect(function()
        if not State.Running then
            if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
            return
        end
        local Root = GetRoot()
        if not Root then return end
        Root.CFrame = State.TargetLockedCFrame
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
    end)
end

local function TweenTeleportDirect(Destination, Speed, Callback)
    State.FlySequence = State.FlySequence + 1
    local Seq = State.FlySequence

    CleanupMovers()

    local Hum = GetHum()
    local Root = GetRoot()
    if not Hum or not Root or Hum.Health <= 0 then
        if Callback then Callback() end
        return
    end

    local FlyPos = Vector3.new(Destination.X, Destination.Y + Config.FlyOffset, Destination.Z)
    local TargetCFrame = CFrame.new(FlyPos)

    Hum.PlatformStand = true

    local Distance = (FlyPos - Root.Position).Magnitude
    local Duration = Distance / Speed

    print(string.format("[VIPTP] Tween Direct | Dist: %.0f | Speed: %d | Duration: %.3fs",
        Distance, Speed, Duration))

    local Tween = TweenService:Create(
        Root,
        TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
        { CFrame = TargetCFrame }
    State.TweenConnection = Tween
    Tween:Play()

    Tween.Completed:Wait()

    if Seq ~= State.FlySequence then return end
    if not State.Running then CleanupMovers() return end

    local Hum2 = GetHum()
    local Root2 = GetRoot()
    if not Hum2 or not Root2 or Hum2.Health <= 0 then CleanupMovers() return end

    Root2.CFrame = TargetCFrame
    Root2.AssemblyLinearVelocity = Vector3.zero
    Root2.AssemblyAngularVelocity = Vector3.zero

    task.wait(0.05)

    CleanupMovers(true)

    if Callback then Callback() end
end

local function FlyTP(Destination, Speed, UseShotTP, IsSafeZone, Callback)
    State.FlySequence = State.FlySequence + 1
    local Seq = State.FlySequence

    CleanupMovers()

    local Hum = GetHum()
    local Root = GetRoot()
    if not Hum or not Root or Hum.Health <= 0 then return end

    local FlyPos = Vector3.new(Destination.X, Destination.Y + Config.FlyOffset, Destination.Z)
    local LockCFrame = CFrame.new(Destination + Vector3.new(0, Config.LockAbove, 0))

    Hum.PlatformStand = true

    local StartPos = Root.Position
    local Direction = (FlyPos - StartPos)
    local TotalDist = Direction.Magnitude
    local DirUnit = TotalDist > 0 and Direction.Unit or Vector3.new(0, 0, -1)

    local NearPos = FlyPos - (DirUnit * Config.NearOffset)
    local NearDist = (NearPos - StartPos).Magnitude
    local NearDuration = NearDist / Speed

    print(string.format("[VIPTP] Tween Near | Dist: %.0f | Speed: %d | Duration: %.3fs",
        NearDist, Speed, NearDuration))

    local TweenNear = TweenService:Create(
        Root,
        TweenInfo.new(NearDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
        { CFrame = CFrame.new(NearPos, FlyPos) }
    State.TweenConnection = TweenNear
    TweenNear:Play()

    task.spawn(function()
        TweenNear.Completed:Wait()

        if Seq ~= State.FlySequence then return end
        if not State.Running then CleanupMovers() return end

        task.wait(0.03)

        local Hum2 = GetHum()
        local Root2 = GetRoot()
        if not Hum2 or not Root2 or Hum2.Health <= 0 then CleanupMovers() return end

        State.BodyVelocity = Instance.new("BodyVelocity")
        State.BodyVelocity.Name = "YokudoBV"
        State.BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        State.BodyVelocity.P = Config.BodyVelocityP
        State.BodyVelocity.Velocity = Vector3.zero
        State.BodyVelocity.Parent = Root2

        State.BodyGyro = Instance.new("BodyGyro")
        State.BodyGyro.Name = "YokudoBG"
        State.BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        State.BodyGyro.P = Config.BodyGyroP
        State.BodyGyro.D = Config.BodyGyroD
        State.BodyGyro.CFrame = Root2.CFrame
        State.BodyGyro.Parent = Root2

        local InitDir = (FlyPos - Root2.Position)
        if InitDir.Magnitude > 1 then
            State.BodyVelocity.Velocity = InitDir.Unit * Speed
        end

        local StartTime = tick()
        local ShotDone = false

        State.FlyConnection = RunService.Heartbeat:Connect(function()
            if Seq ~= State.FlySequence then
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end
                return
            end

            if not State.Running then CleanupMovers() return end

            local Hum3 = GetHum()
            local Root3 = GetRoot()
            if not Hum3 or not Root3 or Hum3.Health <= 0 then CleanupMovers() return end
            if not State.BodyVelocity or not State.BodyGyro then CleanupMovers() return end

            local CurrentPos = Root3.Position
            local Dir = FlyPos - CurrentPos
            local HorizDist = Vector3.new(Dir.X, 0, Dir.Z).Magnitude
            local VertDist = math.abs(Dir.Y)
            local TotalDist2 = Dir.Magnitude

            if IsSafeZone and HorizDist <= Config.SafeStopDistance then
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                Root3.CFrame = CFrame.new(Config.SafeZone)
                Root3.AssemblyLinearVelocity = Vector3.zero
                Root3.AssemblyAngularVelocity = Vector3.zero
                Root3.CanCollide = true

                task.spawn(function()
                    task.wait(Config.SafeZoneWait)

                    local Root4 = GetRoot()
                    if Root4 and Root4.Position.Y < Config.MinSafeY then
                        Root4.CFrame = CFrame.new(Config.SafeZone)
                        Root4.AssemblyLinearVelocity = Vector3.zero
                        Root4.AssemblyAngularVelocity = Vector3.zero
                    end

                    task.wait(0.1)

                    CleanupMovers()
                    if Callback then Callback() end
                end)
                return
            end

            if not IsSafeZone and UseShotTP and not ShotDone and HorizDist <= Config.ShotDistance then
                ShotDone = true
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                task.spawn(function()
                    task.wait(0.05)
                    CleanupMovers(true)
                    Root3.CFrame = LockCFrame
                    Root3.AssemblyLinearVelocity = Vector3.zero
                    Root3.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.05)
                    StartLock(Destination)
                    if Callback then Callback() end
                end)
                return
            end

            if HorizDist <= Config.ArriveDistance and VertDist <= 2 then
                if State.BodyVelocity then
                    State.BodyVelocity.Velocity = Vector3.zero
                    State.BodyVelocity.MaxForce = Vector3.zero
                end
                if State.BodyGyro then State.BodyGyro.MaxTorque = Vector3.zero end
                if State.FlyConnection then State.FlyConnection:Disconnect() State.FlyConnection = nil end

                task.spawn(function()
                    task.wait(0.05)
                    CleanupMovers(true)
                    Root3.CFrame = LockCFrame
                    Root3.AssemblyLinearVelocity = Vector3.zero
                    Root3.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.05)
                    StartLock(Destination)
                    if Callback then Callback() end
                end)
                return
            end

            if tick() - StartTime > Config.Timeout then
                CleanupMovers()
                if Callback then Callback() end
                return
            end

            if TotalDist2 > 1 then
                State.BodyVelocity.Velocity = Dir.Unit * Speed
            else
                State.BodyVelocity.Velocity = Vector3.zero
            end

            State.BodyGyro.CFrame = CFrame.new(CurrentPos, CurrentPos + Vector3.new(Dir.X, 0, Dir.Z))
        end)
    end)
end

local function InstantTP(Destination, Callback)
    if not Destination then if Callback then Callback() end return end

    State.FlySequence = State.FlySequence + 1
    CleanupMovers()

    local Hum = GetHum()
    local Root = GetRoot()
    if not Hum or not Root or Hum.Health <= 0 then return end

    local LockCFrame = CFrame.new(Destination + Vector3.new(0, Config.LockAbove, 0))
    Hum.PlatformStand = true

    task.spawn(function()
        task.wait(0.03)
        Root.CFrame = LockCFrame
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
        task.wait(0.1)
        StartLock(Destination)
        if Callback then Callback() end
    end)
end

local function RemoteCollectFirst()
    if not CollectEvent or not State.FirstEggSlotKey or not State.FirstEggUid then return false end
    local success = pcall(function()
        return CollectEvent:InvokeServer({
            FirstAreaSlotKey = State.FirstEggSlotKey,
            Uid = State.FirstEggUid
    end)
    return success
end

local function RemoteCollectTarget()
    if not CollectEvent or not State.TargetUid then return false end
    local success = pcall(function()
        return CollectEvent:InvokeServer({ Uid = State.TargetUid })
    end)
    return success
end

local function FireForestStrike()
    if State.RemotesFired then return end
    State.RemotesFired = true
    EnableRagdollBypass()

    pcall(function()
        ForestStrike:FireServer({
            EggUid = State.FirstEggUid,
            GuardCFrame = CFrame.new(Config.LockPosition)
    end)

    task.spawn(function()
        for i = 1, 10 do
            task.wait(0.05)
            ForceUp()
            CleanupRagdollConstraints()
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SetupDropHeldEgg()
    State.PlayerGui = Player:FindFirstChild("PlayerGui") or Player:WaitForChild("PlayerGui", 5)
    if not State.PlayerGui then return end

    State.DropHeldEgg = State.PlayerGui:FindFirstChild("DropHeldEgg")
    if not State.DropHeldEgg then print("leak by https://discord.gg/TBBAUZu8cW") return end

    if State.DropHeldEggConnection then State.DropHeldEggConnection:Disconnect() end
    State.DropHeldEggConnection = State.DropHeldEgg:GetPropertyChangedSignal("Enabled"):Connect(function()
        print("leak by https://discord.gg/TBBAUZu8cW")
    end)
end

local function IsTargetCollected()
    return State.DropHeldEgg and State.DropHeldEgg.Enabled == true
end

local function SearchFirstEggs()
    State.FirstEggList = {}
    if not Container then return end

    for _, Slot in ipairs(Container:GetChildren()) do
        if string.find(Slot.Name, Config.SearchPrefix) then
            local SlotNum = string.match(Slot.Name, "Slot_(%d+)")
            if SlotNum then
                table.insert(State.FirstEggList, {
                    Slot = Slot,
                    Uid = Slot.Name,
                    SlotKey = "Forest:Slot_" .. SlotNum,
            end
        end
    end
end

local function FindClosestEgg()
    local Root = GetRoot()
    if not Root then return nil end

    local Closest, ClosestDist = nil, 9999
    for _, Egg in ipairs(State.FirstEggList) do
        local Pos = GetPosition(Egg.Slot)
        if Pos then
            local Dist = (Pos - Root.Position).Magnitude
            if Dist < ClosestDist then
                ClosestDist = Dist
                Closest = Egg
            end
        end
    end

    if Closest then
        State.FirstEggUid = Closest.Uid
        State.FirstEggSlotKey = Closest.SlotKey
    end
    return Closest
end

local function IsFirstEggInWorkspace()
    return State.FirstEggUid and workspace:FindFirstChild(State.FirstEggUid) ~= nil
end

local function IsFirstEggInContainer()
    return State.FirstEggUid and Container and Container:FindFirstChild(State.FirstEggUid) ~= nil
end

local function CheckTargetUID(TargetUid, Mode)
    if not TargetUid then return "none" end
    Mode = Mode or "spawn_only"

    local InContainer = false
    if Container then
        InContainer = Container:FindFirstChild(TargetUid) ~= nil
    end

    if InContainer then return "spawn" end

    if Mode == "both" then
        local InWorkspace = workspace:FindFirstChild(TargetUid) ~= nil
        if InWorkspace then return "workspace" end
    end

    return "none"
end

local function ResetForRepeat(Location)
    State.Step = "search"
    State.FlySequence = State.FlySequence + 1

    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0

    State.FirstEggList = {}
    State.FirstEggUid = nil
    State.FirstEggSlotKey = nil

    if Location == "spawn" then
        State.Mode = "spawn"
        State.SavedTargetPosition = nil
    elseif Location == "workspace" then
        State.Mode = "workspace"
        local Egg = workspace:FindFirstChild(State.TargetUid)
        if Egg then State.SavedTargetPosition = GetPosition(Egg) end
    end

    if State.LockConnection then
        State.LockConnection:Disconnect()
        State.LockConnection = nil
    end
end

local function AutoStop()
    if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
    State.TargetLockedCFrame = nil

    if State.ActiveTask then
        pcall(function() task.cancel(State.ActiveTask) end)
        State.ActiveTask = nil
    end

    CleanupMovers()
    DisableRagdollBypass()
    RestoreStats()

    State.Running = false
    State.Step = "done"
    State.FlySequence = State.FlySequence + 1

    State.FirstEggList = {}
    State.FirstEggUid = nil
    State.FirstEggSlotKey = nil
    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.SavedTargetPosition = nil

    print("leak by https://discord.gg/TBBAUZu8cW")

    task.spawn(function()
        task.wait(0.2)
        if _G.YOKUDO_FarmingManager then
            if type(_G.YOKUDO_FarmingManager.OnVIPTPComplete) == "function" then
                local Success, Err = pcall(function()
                    _G.YOKUDO_FarmingManager.OnVIPTPComplete()
                end)
                if not Success then
                    print("leak by https://discord.gg/TBBAUZu8cW")
                end
            else
                print("leak by https://discord.gg/TBBAUZu8cW")")
            end
        else
            print("leak by https://discord.gg/TBBAUZu8cW")
        end
    end)
end

local function StartFlyToTarget()
    if State.FlyTargetStarted then return end
    State.FlyTargetStarted = true
    State.Step = "to_target"

    local Location = CheckTargetUID(State.TargetUid, "spawn_only")

    local TargetPos
    if Location == "spawn" then
        State.Mode = "spawn"
        local Egg = Container and Container:FindFirstChild(State.TargetUid)
        if Egg then TargetPos = GetPosition(Egg) end
    end

    if not TargetPos then
        print("leak by https://discord.gg/TBBAUZu8cW")
        AutoStop()
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")

    InstantTP(TargetPos, function()
        print("leak by https://discord.gg/TBBAUZu8cW")
        State.TargetCollected = false
        State.CollectTime = 0
        State.CollectAttempts = 0
        State.RecoveryTriggered = false
        State.TargetCollectStartTime = tick()
        State.Step = "collect_target"
    end)
end

local function FlyToTargetAgain()
    State.RecoveryAttempts = State.RecoveryAttempts + 1
    if State.RecoveryAttempts > Config.MaxRecoveryAttempts then
        print("leak by https://discord.gg/TBBAUZu8cW")
        AutoStop()
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    State.Step = "recovery"

    State.FlySequence = State.FlySequence + 1
    CleanupMovers()

    local TargetPos
    local Location = CheckTargetUID(State.TargetUid, "both")

    if Location == "workspace" then
        State.Mode = "workspace"
        local Egg = workspace:FindFirstChild(State.TargetUid)
        if Egg then
            TargetPos = GetPosition(Egg)
            State.SavedTargetPosition = TargetPos
        end
    elseif Location == "spawn" then
        State.Mode = "spawn"
        local Egg = Container:FindFirstChild(State.TargetUid)
        if Egg then TargetPos = GetPosition(Egg) end
    else
        print("leak by https://discord.gg/TBBAUZu8cW")
        AutoStop()
        return
    end

    if not TargetPos then AutoStop() return end

    State.RecoveryTriggered = false
    State.TargetCollected = false

    print("leak by https://discord.gg/TBBAUZu8cW")")
    TweenTeleportDirect(TargetPos, Config.RecoverySpeed, function()
        print("leak by https://discord.gg/TBBAUZu8cW")
        State.TargetCollected = false
        State.CollectTime = 0
        State.CollectAttempts = 0
        State.RecoveryTriggered = false
        State.RemotesFired = false
        State.TargetCollectStartTime = tick()
        State.Step = "collect_target"
    end)
end

local function FlyToSafeZone()
    State.Step = "to_safe"
    State.RecoveryTriggered = false
    State.TargetCollected = false

    print("leak by https://discord.gg/TBBAUZu8cW")")

    FlyTP(Config.SafeZone, Config.SafeZoneSpeed, false, true, function()
        print("leak by https://discord.gg/TBBAUZu8cW")

        task.spawn(function()
            task.wait(Config.RepeatCheckDelay)

            print("leak by https://discord.gg/TBBAUZu8cW")

            local NewUid = nil
            local NewLocation = "none"

            if _G.YOKUDO_FarmingManager and _G.YOKUDO_FarmingManager.FindBestEgg then
                local BestEgg = _G.YOKUDO_FarmingManager.FindBestEgg()
                if BestEgg then
                    NewUid = BestEgg.Uid
                    NewLocation = CheckTargetUID(NewUid, "spawn_only")
                    print("leak by https://discord.gg/TBBAUZu8cW")
                end
            end

            if NewUid and NewLocation ~= "none" then
                print("leak by https://discord.gg/TBBAUZu8cW")

                State.TargetUid = NewUid
                State.SavedTargetPosition = nil

                ResetForRepeat(NewLocation)
                task.wait(0.05)
                StartProcess()
            else
                print("leak by https://discord.gg/TBBAUZu8cW")
                AutoStop()
            end
        end)
    end)
end

local function StartActiveTask()
    if State.ActiveTask then
        pcall(function() task.cancel(State.ActiveTask) end)
        State.ActiveTask = nil
    end

    State.ActiveTask = task.spawn(function()
        while State.Running do
            task.wait(0.05)

            local Hum = GetHum()
            local Root = GetRoot()
            if not Hum or not Root or Hum.Health <= 0 then break end

            if State.Step == "collect_first" and not State.CollectDone then
                if IsFirstEggInWorkspace() then
                    State.CollectDone = true
                    FireForestStrike()
                    State.Step = "wait_spawn_back"
                elseif tick() - State.CollectTime > Config.CollectInterval then
                    State.CollectTime = tick()
                    if IsFirstEggInContainer() then
                        RemoteCollectFirst()
                        State.CollectAttempts = State.CollectAttempts + 1
                    elseif IsFirstEggInWorkspace() then
                        State.CollectDone = true
                        FireForestStrike()
                        State.Step = "wait_spawn_back"
                    end
                end
            end

            if State.Step == "wait_spawn_back" and not State.FlyTargetStarted then
                if IsFirstEggInContainer() then
                    task.spawn(function() StartFlyToTarget() end)
                end
            end

            if State.Step == "collect_target" and not State.TargetCollected then
                if IsTargetCollected() then
                    print("leak by https://discord.gg/TBBAUZu8cW")")
                    State.TargetCollected = true
                    State.RecoveryTriggered = false
                    task.spawn(function() FlyToSafeZone() end)
                else
                    if State.Mode == "spawn" then
                        if workspace:FindFirstChild(State.TargetUid) then
                            State.TargetCollected = true
                            task.spawn(function() FlyToSafeZone() end)
                        end
                    elseif State.Mode == "workspace" and State.SavedTargetPosition then
                        local Egg = workspace:FindFirstChild(State.TargetUid)
                        if Egg then
                            local Pos = GetPosition(Egg)
                            if Pos and (Pos - State.SavedTargetPosition).Magnitude >= Config.PositionThreshold then
                                State.TargetCollected = true
                                task.spawn(function() FlyToSafeZone() end)
                            end
                        end
                    end

                    if tick() - State.CollectTime > Config.CollectInterval then
                        State.CollectTime = tick()
                        RemoteCollectTarget()
                        State.CollectAttempts = State.CollectAttempts + 1
                    end

                    if tick() - State.TargetCollectStartTime > Config.TargetCollectTimeout then
                        print("leak by https://discord.gg/TBBAUZu8cW")
                        if not State.RecoveryTriggered then
                            State.RecoveryTriggered = true
                            task.spawn(function() FlyToTargetAgain() end)
                        end
                    end
                end
            end

            if State.Step == "to_safe" then
                if not IsTargetCollected() then
                    if not State.RecoveryTriggered then
                        State.RecoveryTriggered = true
                        print("leak by https://discord.gg/TBBAUZu8cW")
                        task.spawn(function() FlyToTargetAgain() end)
                    end
                else
                    State.RecoveryTriggered = false
                end
            end
        end
    end)
end

function StartProcess()
    State.Running = true
    State.Step = "search"
    State.FlySequence = 0

    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0

    SetupDropHeldEgg()
    SaveStats()
    EnableRagdollBypass()

    local Location = CheckTargetUID(State.TargetUid, "spawn_only")
    print("leak by https://discord.gg/TBBAUZu8cW")

    if Location == "spawn" then
        State.Mode = "spawn"
    else
        local Waited = 0
        while State.Running and CheckTargetUID(State.TargetUid, "spawn_only") == "none" do
            task.wait(0.1)
            Waited = Waited + 0.1
            if Waited > 3 then
                print("leak by https://discord.gg/TBBAUZu8cW")
                AutoStop()
                return
            end
        end
        State.Mode = "spawn"
    end

    SearchFirstEggs()

    if #State.FirstEggList == 0 then
        task.wait(0.3)
        SearchFirstEggs()
        if #State.FirstEggList == 0 then
            AutoStop()
            return
        end
    end

    local Closest = FindClosestEgg()
    if not Closest then AutoStop() return end

    local EggPos = GetPosition(Closest.Slot)
    if not EggPos then AutoStop() return end

    State.Step = "fly_first"
    StartActiveTask()

    print("leak by https://discord.gg/TBBAUZu8cW")")
    FlyTP(EggPos, Config.FirstEggSpeed, true, false, function()
        State.CollectDone = false
        State.CollectTime = 0
        State.Step = "collect_first"
    end)
end

local function FullReset()
    if State.LockConnection then State.LockConnection:Disconnect() State.LockConnection = nil end
    State.TargetLockedCFrame = nil

    if State.ActiveTask then
        pcall(function() task.cancel(State.ActiveTask) end)
        State.ActiveTask = nil
    end

    if State.DropHeldEggConnection then
        State.DropHeldEggConnection:Disconnect()
        State.DropHeldEggConnection = nil
    end
    State.DropHeldEgg = nil
    State.PlayerGui = nil

    CleanupMovers()
    DisableRagdollBypass()
    RestoreStats()

    State.Running = false
    State.Step = "idle"
    State.Mode = "none"
    State.FlySequence = State.FlySequence + 1

    State.FirstEggList = {}
    State.FirstEggUid = nil
    State.FirstEggSlotKey = nil
    State.CollectAttempts = 0
    State.CollectTime = 0
    State.TargetCollectStartTime = 0
    State.FlyTargetStarted = false
    State.CollectDone = false
    State.TargetCollected = false
    State.RemotesFired = false
    State.RecoveryTriggered = false
    State.RecoveryAttempts = 0
    State.SavedTargetPosition = nil

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function Enable()
    if State.Running then return end
    if not CollectEvent then print("leak by https://discord.gg/TBBAUZu8cW") return end
    if not State.TargetUid then print("leak by https://discord.gg/TBBAUZu8cW") return end

    FullReset()
    StartProcess()

    print("leak by https://discord.gg/TBBAUZu8cW"))
end

local function Disable()
    FullReset()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SetTargetId(Id)
    State.TargetUid = Id
    print("leak by https://discord.gg/TBBAUZu8cW"))
end

_G.YOKUDO_VIPTP = {
    Enable = Enable,
    Disable = Disable,
    SetTargetId = SetTargetId,
    IsEnabled = function() return State.Running end,
    GetTargetId = function() return State.TargetUid end,
    GetMode = function() return State.Mode end,
    FIRST_EGG_SPEED = Config.FirstEggSpeed,
    RECOVERY_SPEED = Config.RecoverySpeed,
    SAFE_ZONE_SPEED = Config.SafeZoneSpeed,
    FLY_OFFSET = Config.FlyOffset,
    SAFE_ZONE = Config.SafeZone,

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/AttackDrone.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer

local ATTACK_RANGE = 16
local ATTACK_INTERVAL = 0.05
local FOLLOW_SPEED = 500
local FOLLOW_BEHIND_DISTANCE = 3
local SHORT_TP_DISTANCE = 20
local SPAWN_POSITION_1 = Vector3.new(2140, 77, -367)
local SPAWN_POSITION_2 = Vector3.new(5723, 77, -376)
local SAFE_ZONE = Vector3.new(533, 70, -366)
local POINT_1 = Vector3.new(559, 70, -370)
local SAFE_WAIT_TIME = 1
local SPAWN_WAIT_TIME = 2
local ARRIVE_TIMEOUT = 15
local CONTAINER_NAME = "ScrambleLocalVisuals"
local SEARCH_PREFIXES = { "DroneVisual_", "PersonalDrone_" }

local TIER_PRIORITY = {
    ["AugmentedDrone"] = 1,
    ["ReactorDrone"] = 2,
    ["ScrapDrone"] = 3,
local MAX_ALLOWED_PRIORITY = 3

local AttackDroneEnabled = false
local AttackConnection = nil
local FollowConnection = nil
local LockConnection = nil
local BodyVelocity = nil
local BodyGyro = nil
local CurrentTarget = nil
local CurrentTargetPriority = nil
local LastFire = 0
local TraceSequence = 0
local IsLocked = false
local LockCFrame = nil
local Phase = "idle"
local CurrentSpawnIndex = 1
local IsFlying = false
local SpawnLoopRunning = false

local SavedStats = {
    WalkSpeed = nil,
    JumpPower = nil,
    JumpHeight = nil,
    UseJumpPower = nil,
    Humanoid = nil,

local StartFollow
local FlyTPToPosition
local StartAttackLoop
local SpawnLoop
local StopAttack
local InitialFlyAndStartLoop

local function GetHumanoid()
    local Char = Player.Character
    if not Char then return nil, nil end
    local Hum = Char:FindFirstChildOfClass("Humanoid")
    local Root = Char:FindFirstChild("HumanoidRootPart")
    return Hum, Root
end

local function GetBatSwingRemote()
    local Success, Remote = pcall(function()
        return ReplicatedStorage.Packages.Networking["RE/BatSwing/Trigger"]
    end)
    if Success and Remote then return Remote end
    return nil
end

local function SaveLiveStats()
    local Hum = GetHumanoid()
    if not Hum then return end
    SavedStats.Humanoid = Hum
    SavedStats.WalkSpeed = Hum.WalkSpeed
    SavedStats.JumpPower = Hum.JumpPower
    SavedStats.JumpHeight = Hum.JumpHeight
    SavedStats.UseJumpPower = Hum.UseJumpPower
end

local function RestoreLiveStats()
    local Hum = GetHumanoid()
    if not Hum then return end
    if SavedStats.WalkSpeed ~= nil then pcall(function() Hum.WalkSpeed = SavedStats.WalkSpeed end) end
    if SavedStats.JumpPower ~= nil then pcall(function() Hum.JumpPower = SavedStats.JumpPower end) end
    if SavedStats.JumpHeight ~= nil then pcall(function() Hum.JumpHeight = SavedStats.JumpHeight end) end
    if SavedStats.UseJumpPower ~= nil then pcall(function() Hum.UseJumpPower = SavedStats.UseJumpPower end) end
end

local function EnsureStatsAlive()
    local Hum = GetHumanoid()
    if not Hum then return end
    if SavedStats.Humanoid ~= Hum then
        SavedStats.Humanoid = Hum
        SavedStats.WalkSpeed = Hum.WalkSpeed
        SavedStats.JumpPower = Hum.JumpPower
        SavedStats.JumpHeight = Hum.JumpHeight
        SavedStats.UseJumpPower = Hum.UseJumpPower
    end
end

local function CleanupMovers()
    if FollowConnection then FollowConnection:Disconnect() FollowConnection = nil end
    if LockConnection then LockConnection:Disconnect() LockConnection = nil end
    if BodyVelocity then
        pcall(function()
            BodyVelocity.Velocity = Vector3.zero
            BodyVelocity.MaxForce = Vector3.zero
        end)
        BodyVelocity:Destroy()
        BodyVelocity = nil
    end
    if BodyGyro then
        pcall(function() BodyGyro.MaxTorque = Vector3.zero end)
        BodyGyro:Destroy()
        BodyGyro = nil
    end

    local Hum, Root = GetHumanoid()
    if Root then
        for _, Child in ipairs(Root:GetChildren()) do
            if Child.Name == "YokudoBV" or Child.Name == "YokudoBG" then
                pcall(function() Child:Destroy() end)
            end
        end
    end
    if Hum then
        pcall(function()
            Hum.PlatformStand = false
            Hum.Sit = false
        end)
    end
    if Root then
        pcall(function()
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    IsLocked = false
    LockCFrame = nil
end

local function GetPosition(Object)
    if not Object then return nil end
    if Object:IsA("Model") then
        if Object.PrimaryPart then return Object.PrimaryPart.Position end
        local Part = Object:FindFirstChildWhichIsA("BasePart")
        if Part then return Part.Position end
        for _, Desc in ipairs(Object:GetDescendants()) do
            if Desc:IsA("BasePart") then return Desc.Position end
        end
    elseif Object:IsA("BasePart") then
        return Object.Position
    end
    return nil
end

local function GetLookVector(Object)
    if not Object then return Vector3.new(0, 0, -1) end
    local Part = nil
    if Object:IsA("Model") then
        Part = Object.PrimaryPart or Object:FindFirstChildWhichIsA("BasePart")
        if not Part then
            for _, Desc in ipairs(Object:GetDescendants()) do
                if Desc:IsA("BasePart") then Part = Desc break end
            end
        end
    elseif Object:IsA("BasePart") then
        Part = Object
    end
    if Part then return Part.CFrame.LookVector end
    return Vector3.new(0, 0, -1)
end

local function FindAllDrones()
    local Container = workspace:FindFirstChild(CONTAINER_NAME)
    if not Container then return {} end
    local Drones = {}
    for _, obj in ipairs(Container:GetChildren()) do
        for _, prefix in ipairs(SEARCH_PREFIXES) do
            if string.sub(obj.Name, 1, #prefix) == prefix then
                table.insert(Drones, obj)
                break
            end
        end
    end
    return Drones
end

local function GetDroneTier(Drone)
    if not Drone then return nil end
    local Tier = nil
    pcall(function() Tier = Drone:GetAttribute("ScrambleTier") end)
    return Tier
end

local function GetDronePriority(Drone)
    local Tier = GetDroneTier(Drone)
    if not Tier then return nil end
    return TIER_PRIORITY[Tier]
end

local function FindBestDrone()
    local Drones = FindAllDrones()
    if #Drones == 0 then return nil end
    local CurrentSpawn = (CurrentSpawnIndex == 1) and SPAWN_POSITION_1 or SPAWN_POSITION_2
    local Best = nil
    local BestPriority = math.huge
    local BestDist = math.huge

    for _, Drone in ipairs(Drones) do
        local Priority = GetDronePriority(Drone)
        if Priority and Priority <= MAX_ALLOWED_PRIORITY then
            local Pos = GetPosition(Drone)
            if Pos then
                local Dist = math.floor((Pos - CurrentSpawn).Magnitude)
                if Priority < BestPriority or (Priority == BestPriority and Dist < BestDist) then
                    BestPriority = Priority
                    BestDist = Dist
                    Best = Drone
                end
            end
        end
    end
    return Best, BestPriority, BestDist
end

local function GetBehindPosition(Target)
    local TargetPos = GetPosition(Target)
    if not TargetPos then return nil end
    local LookVector = GetLookVector(Target)
    local BehindPos = TargetPos - (LookVector * FOLLOW_BEHIND_DISTANCE)
    BehindPos = Vector3.new(BehindPos.X, TargetPos.Y + 1, BehindPos.Z)
    return BehindPos
end

local function StartLock(Position, LookAt)
    LockCFrame = CFrame.new(Position, LookAt or (Position + Vector3.new(0, 0, -1)))
    if LockConnection then LockConnection:Disconnect() end
    IsLocked = true

    LockConnection = RunService.Heartbeat:Connect(function()
        if not AttackDroneEnabled then
            if LockConnection then LockConnection:Disconnect() LockConnection = nil end
            IsLocked = false
            return
        end
        local Hum, Root = GetHumanoid()
        if not Root then return end
        if CurrentTarget and CurrentTarget.Parent then
            local NewBehind = GetBehindPosition(CurrentTarget)
            local NewTargetPos = GetPosition(CurrentTarget)
            if NewBehind and NewTargetPos then
                LockCFrame = CFrame.new(NewBehind, NewTargetPos)
            end
        end
        Root.CFrame = LockCFrame
        Root.AssemblyLinearVelocity = Vector3.zero
        Root.AssemblyAngularVelocity = Vector3.zero
    end)
end

function StartFollow()
    CleanupMovers()
    local Hum, Root = GetHumanoid()
    if not Hum or not Root then return end
    if Hum.Health <= 0 then return end

    Hum.PlatformStand = true

    BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Name = "YokudoBV"
    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyVelocity.P = 1250
    BodyVelocity.Velocity = Vector3.zero
    BodyVelocity.Parent = Root

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.Name = "YokudoBG"
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.P = 3000
    BodyGyro.D = 500
    BodyGyro.CFrame = Root.CFrame
    BodyGyro.Parent = Root

    FollowConnection = RunService.Heartbeat:Connect(function()
        if not AttackDroneEnabled then CleanupMovers() return end
        local Hum2, Root2 = GetHumanoid()
        if not Hum2 or not Root2 then CleanupMovers() return end
        if Hum2.Health <= 0 then return end
        if not BodyVelocity or not BodyGyro then CleanupMovers() return end
        if not CurrentTarget or not CurrentTarget.Parent then CleanupMovers() return end

        local TargetPos = GetPosition(CurrentTarget)
        if not TargetPos then CleanupMovers() return end
        local BehindPos = GetBehindPosition(CurrentTarget)
        if not BehindPos then CleanupMovers() return end

        local CurrentPos = Root2.Position
        local Direction = BehindPos - CurrentPos
        local TotalDist = math.floor(Direction.Magnitude)

        if TotalDist <= SHORT_TP_DISTANCE then
            if BodyVelocity then
                BodyVelocity.Velocity = Vector3.zero
                BodyVelocity.MaxForce = Vector3.zero
            end
            if BodyGyro then
                BodyGyro.MaxTorque = Vector3.zero
            end

            task.wait(0.1)
            CleanupMovers()

            Root2.CFrame = CFrame.new(BehindPos, TargetPos)
            Root2.AssemblyLinearVelocity = Vector3.zero
            Root2.AssemblyAngularVelocity = Vector3.zero
            StartLock(BehindPos, TargetPos)
            return
        end

        BodyVelocity.Velocity = Direction.Unit * FOLLOW_SPEED
        BodyGyro.CFrame = CFrame.new(CurrentPos, TargetPos)
    end)
end

function FlyTPToPosition(Destination, Callback)
    CleanupMovers()
    IsFlying = true

    local Hum, Root = GetHumanoid()
    if not Hum or not Root then IsFlying = false if Callback then Callback() end return end
    if Hum.Health <= 0 then IsFlying = false if Callback then Callback() end return end

    Hum.PlatformStand = true

    BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Name = "YokudoBV"
    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyVelocity.P = 1250
    BodyVelocity.Velocity = Vector3.zero
    BodyVelocity.Parent = Root

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.Name = "YokudoBG"
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.P = 3000
    BodyGyro.D = 500
    BodyGyro.CFrame = Root.CFrame
    BodyGyro.Parent = Root

    local StartTime = tick()

    FollowConnection = RunService.Heartbeat:Connect(function()
        if not AttackDroneEnabled then CleanupMovers() IsFlying = false return end
        local Hum2, Root2 = GetHumanoid()
        if not Hum2 or not Root2 then CleanupMovers() IsFlying = false return end
        if Hum2.Health <= 0 then return end
        if not BodyVelocity or not BodyGyro then CleanupMovers() IsFlying = false return end

        local CurrentPos = Root2.Position
        local Direction = Destination - CurrentPos
        local TotalDist = math.floor(Direction.Magnitude)

        if TotalDist <= 2 then
            if BodyVelocity then
                BodyVelocity.Velocity = Vector3.zero
                BodyVelocity.MaxForce = Vector3.zero
            end
            if BodyGyro then
                BodyGyro.MaxTorque = Vector3.zero
            end

            task.wait(0.1)
            CleanupMovers()
            IsFlying = false

            Root2.CFrame = CFrame.new(Destination)
            Root2.AssemblyLinearVelocity = Vector3.zero
            Root2.AssemblyAngularVelocity = Vector3.zero

            if Callback then Callback() end
            return
        end

        if tick() - StartTime > ARRIVE_TIMEOUT then
            CleanupMovers()
            IsFlying = false
            if Callback then Callback() end
            return
        end

        BodyVelocity.Velocity = Direction.Unit * FOLLOW_SPEED
        BodyGyro.CFrame = CFrame.new(CurrentPos, Destination)
    end)
end

function StopAttack()
    print("leak by https://discord.gg/TBBAUZu8cW")
    CleanupMovers()
    CurrentTarget = nil
    CurrentTargetPriority = nil
    SpawnLoopRunning = false
end

function SpawnLoop()
    if SpawnLoopRunning then return end
    SpawnLoopRunning = true

    task.spawn(function()
        while AttackDroneEnabled do
            local CurrentSpawn = (CurrentSpawnIndex == 1) and SPAWN_POSITION_1 or SPAWN_POSITION_2

            if CurrentTarget and CurrentTarget.Parent then
                task.wait(0.5)
                continue
            end

            print("leak by https://discord.gg/TBBAUZu8cW")

            local Arrived = false
            FlyTPToPosition(CurrentSpawn, function() Arrived = true end)

            local WaitTime = 0
            while AttackDroneEnabled and not Arrived and WaitTime < ARRIVE_TIMEOUT do
                task.wait(0.1)
                WaitTime = WaitTime + 0.1
            end

            if not AttackDroneEnabled then break end
            task.wait(SPAWN_WAIT_TIME)
            if not AttackDroneEnabled then break end

            local Found = FindBestDrone()
            if Found and Found.Parent then
                print("leak by https://discord.gg/TBBAUZu8cW")) .. " at Spawn " .. CurrentSpawnIndex)
                CurrentTarget = Found
                StartFollow()
                while AttackDroneEnabled and CurrentTarget and CurrentTarget.Parent do
                    task.wait(0.5)
                end
                print("leak by https://discord.gg/TBBAUZu8cW")
                CurrentSpawnIndex = 1
            else
                print("leak by https://discord.gg/TBBAUZu8cW")
                CurrentSpawnIndex = (CurrentSpawnIndex == 1) and 2 or 1
            end

            task.wait(0.2)
        end
        SpawnLoopRunning = false
    end)
end

local function FireAtDrone(Drone)
    if not Drone or not Drone.Parent then return end

    local isDrone = false
    for _, prefix in ipairs(SEARCH_PREFIXES) do
        if string.sub(Drone.Name, 1, #prefix) == prefix then
            isDrone = true
            break
        end
    end
    if not isDrone then return end

    local Remote = GetBatSwingRemote()
    if not Remote then return end

    local Hum, Root = GetHumanoid()
    if not Root then return end

    local DronePos = GetPosition(Drone)
    if not DronePos then return end

    local Dist = math.floor((DronePos - Root.Position).Magnitude)
    if Dist > ATTACK_RANGE then return end

    TraceSequence = TraceSequence + 1
    local TraceId = tostring(Player.UserId) .. ":" .. tostring(TraceSequence) .. ":" .. tostring(math.floor(workspace:GetServerTimeNow() * 1000))

    pcall(function() Remote:FireServer(Drone, TraceId) end)
end

function StartAttackLoop()
    if AttackConnection then AttackConnection:Disconnect() AttackConnection = nil end

    AttackConnection = RunService.Heartbeat:Connect(function()
        if not AttackDroneEnabled then return end
        if IsFlying then return end

        local Hum, Root = GetHumanoid()
        if not Hum or not Root then return end
        if Hum.Health <= 0 then return end

        EnsureStatsAlive()

        if not CurrentTarget or not CurrentTarget.Parent then
            local NewTarget, NewPriority = FindBestDrone()
            if NewTarget then
                CurrentTarget = NewTarget
                CurrentTargetPriority = NewPriority
                StartFollow()
            end
            return
        end

        local CurrentPriority = GetDronePriority(CurrentTarget)
        local BestDrone, BestPriority = FindBestDrone()

        if BestDrone and BestPriority and CurrentPriority and BestPriority < CurrentPriority then
            print("leak by https://discord.gg/TBBAUZu8cW")
            CurrentTarget = BestDrone
            CurrentTargetPriority = BestPriority
            StartFollow()
            return
        end

        local now = tick()
        if now - LastFire >= ATTACK_INTERVAL then
            LastFire = now
            FireAtDrone(CurrentTarget)
        end
    end)
end

function InitialFlyAndStartLoop()
    local Hum, Root = GetHumanoid()
    if not Root then return end

    local PlayerPos = Root.Position
    local PlayerToPoint1Signed = math.floor(PlayerPos.X - POINT_1.X)

    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW"):     ", PlayerToPoint1Signed)
    print("leak by https://discord.gg/TBBAUZu8cW")

    if PlayerToPoint1Signed > 0 then
        print("leak by https://discord.gg/TBBAUZu8cW") → Fly to Spawn 1")
        CurrentSpawnIndex = 1
        SpawnLoop()
    else
        print("leak by https://discord.gg/TBBAUZu8cW") → Fly to Safe first")
        local SafeArrived = false
        FlyTPToPosition(SAFE_ZONE, function()
            SafeArrived = true
            print("leak by https://discord.gg/TBBAUZu8cW")
        end)

        local WaitTime = 0
        while AttackDroneEnabled and not SafeArrived and WaitTime < ARRIVE_TIMEOUT do
            task.wait(0.1)
            WaitTime = WaitTime + 0.1
        end

        if not AttackDroneEnabled then return end
        task.wait(SAFE_WAIT_TIME)
        print("leak by https://discord.gg/TBBAUZu8cW")
        CurrentSpawnIndex = 1
        SpawnLoop()
    end
end

local function StartAttack()
    if AttackDroneEnabled then return end
    AttackDroneEnabled = true

    SaveLiveStats()

    if _G.YOKUDO_AutoAttack then
        _G.YOKUDO_AutoAttack.EnableAutoEquip()
    end

    StartAttackLoop()

    print("leak by https://discord.gg/TBBAUZu8cW")")

    task.spawn(function()
        InitialFlyAndStartLoop()
    end)
end

local function StopAttackDrone()
    if not AttackDroneEnabled then return end
    AttackDroneEnabled = false

    if AttackConnection then AttackConnection:Disconnect() AttackConnection = nil end

    CleanupMovers()
    CurrentTarget = nil
    CurrentTargetPriority = nil
    CurrentSpawnIndex = 1
    IsFlying = false
    SpawnLoopRunning = false

    RestoreLiveStats()

    if _G.YOKUDO_AutoAttack then
        _G.YOKUDO_AutoAttack.DisableAutoEquip()
    end

    local Hum, Root = GetHumanoid()
    if Root then
        pcall(function()
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
end

_G.YOKUDO_AttackDrone = {
    Start = StartAttack,
    Stop = StopAttackDrone,
    Enable = StartAttack,
    Disable = StopAttackDrone,
    Toggle = function()
        if AttackDroneEnabled then StopAttackDrone() else StartAttack() end
    end,
    IsEnabled = function() return AttackDroneEnabled end,
    StopAttack = StopAttack,
    SpawnLoop = SpawnLoop,
    InitialFlyAndStartLoop = InitialFlyAndStartLoop,
    FindAllDrones = FindAllDrones,
    FindBestDrone = FindBestDrone,
    GetDronePriority = GetDronePriority,
    GetBatSwingRemote = GetBatSwingRemote,
    GetSavedStats = function() return SavedStats end,
    SPAWN_POSITION_1 = SPAWN_POSITION_1,
    SPAWN_POSITION_2 = SPAWN_POSITION_2,
    SAFE_ZONE = SAFE_ZONE,
    POINT_1 = POINT_1,
    TIER_PRIORITY = TIER_PRIORITY,
    MAX_ALLOWED_PRIORITY = MAX_ALLOWED_PRIORITY,
    FOLLOW_SPEED = FOLLOW_SPEED

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/ManagerDrone.lua"] = [=[

local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local EVENT_CHECK_INTERVAL = 1
local EVENT_STOP_ATTACK_THRESHOLD = 10
local SAFE_WAIT_TIME = 1
local SAFE_ZONE = Vector3.new(533, 70, -366)
local AFK_JUMP_WAIT = 0.5

local ManagerEnabled = false
local LastEventSec = 0
local LastEventText = ""
local ManagerThread = nil

local function GetEventInfo()
    local Success, Value = pcall(function()
        return game:GetService("Players").LocalPlayer.PlayerGui
    end)
    if not Success or not Value then
        return 0, "", false
    end

    local Text = tostring(Value)

    local HasEventEnds = string.find(Text, "Event ends") ~= nil
    local IsEventActive = HasEventEnds

    local M = tonumber(string.match(Text, "(%d+)m")) or 0
    local S = tonumber(string.match(Text, "(%d+)s")) or 0
    local TotalSec = M * 60 + S

    return TotalSec, Text, IsEventActive
end

local function ForceStopAll()
    print("leak by https://discord.gg/TBBAUZu8cW")

    if _G.YOKUDO_AttackDrone then
        pcall(function() _G.YOKUDO_AttackDrone.Stop() end)
    end
    if _G.YOKUDO_AFKSystem then
        pcall(function() _G.YOKUDO_AFKSystem.Disable() end)
    end
end

local function SwitchAFKToAttack()
    print("leak by https://discord.gg/TBBAUZu8cW")

    local TreadmillPos = nil
    if _G.YOKUDO_AFKSystem then
        TreadmillPos = _G.YOKUDO_AFKSystem.GetMyTreadmillPos()
    end

    if not TreadmillPos and _G.YOKUDO_AFKSystem then
        local _, Treadmill = _G.YOKUDO_AFKSystem.FindMyPlotAndTreadmill()
        if Treadmill then
            TreadmillPos = Treadmill.Position
        end
    end

    if not TreadmillPos then
        print("leak by https://discord.gg/TBBAUZu8cW")
        if _G.YOKUDO_AFKSystem then
            _G.YOKUDO_AFKSystem.Disable()
        end
        task.wait(0.5)
        if _G.YOKUDO_AttackDrone then
            _G.YOKUDO_AttackDrone.Start()
        end
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    _G.YOKUDO_AFKSystem.JumpOutTreadmill(TreadmillPos, function()
        print("leak by https://discord.gg/TBBAUZu8cW")

        if _G.YOKUDO_AFKSystem then
            _G.YOKUDO_AFKSystem.Disable()
        end

        task.wait(AFK_JUMP_WAIT)

        print("leak by https://discord.gg/TBBAUZu8cW")
        if _G.YOKUDO_AttackDrone then
            _G.YOKUDO_AttackDrone.Start()
        end
    end)
end

local function MainLoop()
    while ManagerEnabled do
        local EventSec, EventText, IsEventActive = GetEventInfo()

        local EventNotActive = not IsEventActive
        local EventStopAttack = IsEventActive and EventSec > 0 and EventSec <= EVENT_STOP_ATTACK_THRESHOLD
        local EventActive = IsEventActive and EventSec > EVENT_STOP_ATTACK_THRESHOLD

        print("leak by https://discord.gg/TBBAUZu8cW")

        if EventNotActive then
            if _G.YOKUDO_AttackDrone and _G.YOKUDO_AttackDrone.IsEnabled() then
                print("leak by https://discord.gg/TBBAUZu8cW")
                _G.YOKUDO_AttackDrone.Stop()
            end

            if _G.YOKUDO_AFKSystem and not _G.YOKUDO_AFKSystem.IsEnabled() then
                print("leak by https://discord.gg/TBBAUZu8cW")
                _G.YOKUDO_AFKSystem.Enable()
            end
        elseif EventStopAttack then
            if _G.YOKUDO_AttackDrone and _G.YOKUDO_AttackDrone.IsEnabled() then
                print("leak by https://discord.gg/TBBAUZu8cW")
                _G.YOKUDO_AttackDrone.Stop()
            end

            if _G.YOKUDO_AFKSystem and not _G.YOKUDO_AFKSystem.IsEnabled() then
                _G.YOKUDO_AFKSystem.Enable()
            end
        elseif EventActive then
            if _G.YOKUDO_AFKSystem and _G.YOKUDO_AFKSystem.IsEnabled() then
                print("leak by https://discord.gg/TBBAUZu8cW")
                SwitchAFKToAttack()
            elseif _G.YOKUDO_AttackDrone and not _G.YOKUDO_AttackDrone.IsEnabled() then
                print("leak by https://discord.gg/TBBAUZu8cW")
                _G.YOKUDO_AttackDrone.Start()
            end
        end

        LastEventSec = EventSec
        LastEventText = EventText
        task.wait(EVENT_CHECK_INTERVAL)
    end

    ForceStopAll()
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function EnableManager()
    if ManagerEnabled then return end
    ManagerEnabled = true

    if ManagerThread then
        pcall(function() task.cancel(ManagerThread) end)
        ManagerThread = nil
    end

    ManagerThread = task.spawn(function() MainLoop() end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableManager()
    if not ManagerEnabled then return end
    ManagerEnabled = false

    if ManagerThread then
        pcall(function() task.cancel(ManagerThread) end)
        ManagerThread = nil
    end

    ForceStopAll()

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleManager()
    if ManagerEnabled then
        DisableManager()
    else
        EnableManager()
    end
end

Player.CharacterAdded:Connect(function(Char)
    if ManagerEnabled then
        print("leak by https://discord.gg/TBBAUZu8cW")
        task.wait(1)

        LastEventSec = 0
        LastEventText = ""

        if ManagerThread then
            pcall(function() task.cancel(ManagerThread) end)
            ManagerThread = nil
        end

        ManagerThread = task.spawn(function() MainLoop() end)

        print("leak by https://discord.gg/TBBAUZu8cW")
    end
end)

_G.YOKUDO_ManagerDrone = {
    Enable = EnableManager,
    Disable = DisableManager,
    Toggle = ToggleManager,
    IsEnabled = function() return ManagerEnabled end,
    GetEventInfo = GetEventInfo,
    ForceStopAll = ForceStopAll,
    SwitchAFKToAttack = SwitchAFKToAttack,

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/ManualFastClick.lua"] = [=[

local ProximityPromptService = game:GetService("ProximityPromptService")
local RunService = game:GetService("RunService")

local ManualFastClickEnabled = false
local PromptConnection = nil
local HeartbeatConnection = nil

local function ApplyHoldDuration(prompt)
    if not prompt then return end
    pcall(function()
        prompt.HoldDuration = 0
    end)
end

local function ScanAllPrompts()
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            ApplyHoldDuration(descendant)
        end
    end

    local Player = game.Players.LocalPlayer
    if Player then
        local PlayerGui = Player:FindFirstChild("PlayerGui")
        if PlayerGui then
            for _, descendant in ipairs(PlayerGui:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    ApplyHoldDuration(descendant)
                end
            end
        end
    end
end

local function EnableManualFastClick()
    if ManualFastClickEnabled then return end
    ManualFastClickEnabled = true

    ScanAllPrompts()

    if PromptConnection then
        PromptConnection:Disconnect()
        PromptConnection = nil
    end
    PromptConnection = ProximityPromptService.PromptShown:Connect(function(prompt)
        if not ManualFastClickEnabled then return end
        ApplyHoldDuration(prompt)
    end)

    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()
        HeartbeatConnection = nil
    end
    local Counter = 0
    HeartbeatConnection = RunService.Heartbeat:Connect(function()
        if not ManualFastClickEnabled then return end
        Counter = Counter + 1
        if Counter >= 30 then
            Counter = 0
            ScanAllPrompts()
        end
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function DisableManualFastClick()
    if not ManualFastClickEnabled then return end
    ManualFastClickEnabled = false

    if PromptConnection then
        PromptConnection:Disconnect()
        PromptConnection = nil
    end
    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()
        HeartbeatConnection = nil
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function ToggleManualFastClick()
    if ManualFastClickEnabled then
        DisableManualFastClick()
    else
        EnableManualFastClick()
    end
end

_G.YOKUDO_ManualFastClick = {
    Enable = EnableManualFastClick,
    Disable = DisableManualFastClick,
    Toggle = ToggleManualFastClick,
    IsEnabled = function() return ManualFastClickEnabled end,
    ScanAllPrompts = ScanAllPrompts,
    ApplyHoldDuration = ApplyHoldDuration

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Features/FarmingManager.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

local AreaEggCycle = nil
pcall(function()
    AreaEggCycle = require(ReplicatedStorage.Shared.Util.AreaEggCycle)
end)

if not AreaEggCycle then
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local NIGHT_CHECK_INTERVAL = 0.03
local DAY_CHECK_INTERVAL = 0.05
local SAFE_ZONE = Vector3.new(533, 70, -366)
local SAFE_ZONE_DIST = 5
local SAFE_WAIT_AFTER_REACH = 1
local FLY_SPEED = 1000
local SAFE_FLY_SPEED = 500
local RETURN_SPEED = 800
local FLY_OFFSET = 15
local METHOD = "InstantTeleport"

local Cache = {
    MeshIdMap = {},
    MeshIdMapBuilt = false,
    PetData = {},
    UidCategory = {},

local SelectedRarities = { Divine = true, Eternal = true, Secret = true }

local RARITY_PRIORITY = {
    Divine = 1,
    Eternal = 2,
    Secret = 3

local function BuildMeshIdMap()
    if Cache.MeshIdMapBuilt then return end

    local Assets = ReplicatedStorage:FindFirstChild("Data")
    if not Assets then return end
    Assets = Assets:FindFirstChild("Assets")
    if not Assets then return end
    local Configs = Assets:FindFirstChild("Configs")
    local EggModels = ReplicatedStorage:FindFirstChild("Assets")
    if EggModels then EggModels = EggModels:FindFirstChild("Models") end
    if EggModels then EggModels = EggModels:FindFirstChild("Eggs") end
    if not Configs or not EggModels then return end

    for _, Config in ipairs(Configs:GetChildren()) do
        local Success, Module = pcall(function() return require(Config) end)
        if Success and Module and Module.Egg then
            local ModelName = Module.Egg.ModelName or Config.Name
            local Template = EggModels:FindFirstChild(ModelName)
            if Template then
                for _, Desc in ipairs(Template:GetDescendants()) do
                    if Desc:IsA("MeshPart") and Desc.MeshId ~= "" then
                        Cache.MeshIdMap[Desc.MeshId] = Config.Name
                    end
                    if Desc:IsA("SpecialMesh") and Desc.MeshId ~= "" then
                        Cache.MeshIdMap[Desc.MeshId] = Config.Name
                    end
                end
            end
        end
    end

    Cache.MeshIdMapBuilt = true
    print("leak by https://discord.gg/TBBAUZu8cW")")
end

local function GetPetData(AssetCategory)
    if not AssetCategory then return nil end

    if Cache.PetData[AssetCategory] then
        return Cache.PetData[AssetCategory]
    end

    local Assets = ReplicatedStorage:FindFirstChild("Data")
    if not Assets then return nil end
    Assets = Assets:FindFirstChild("Assets")
    if not Assets then return nil end
    local Configs = Assets:FindFirstChild("Configs")
    if not Configs then return nil end

    local Config = Configs:FindFirstChild(AssetCategory)
    if not Config then return nil end

    local Success, Module = pcall(function() return require(Config) end)
    if not Success or not Module then return nil end

    local Data = {
        Rarity = Module.Rarity and (Module.Rarity._id or Module.Rarity.RarityId) or nil,
        EarningRate = Module.EarningRate or 0,
        DisplayName = Module.DisplayName or AssetCategory

    Cache.PetData[AssetCategory] = Data
    return Data
end

local function FindAssetCategory(EggModel)
    if not EggModel then return nil end

    local Uid = EggModel.Name
    if Cache.UidCategory[Uid] then
        return Cache.UidCategory[Uid]
    end

    if not Cache.MeshIdMapBuilt then BuildMeshIdMap() end

    for _, Desc in ipairs(EggModel:GetDescendants()) do
        if Desc:IsA("MeshPart") and Desc.MeshId ~= "" then
            local Cat = Cache.MeshIdMap[Desc.MeshId]
            if Cat then
                Cache.UidCategory[Uid] = Cat
                return Cat
            end
        end
        if Desc:IsA("SpecialMesh") and Desc.MeshId ~= "" then
            local Cat = Cache.MeshIdMap[Desc.MeshId]
            if Cat then
                Cache.UidCategory[Uid] = Cat
                return Cat
            end
        end
    end

    return nil
end

local function SortEggs(EggList)
    table.sort(EggList, function(a, b)
        local Pa = RARITY_PRIORITY[a.Rarity] or 999
        local Pb = RARITY_PRIORITY[b.Rarity] or 999
        if Pa ~= Pb then return Pa < Pb end
        return a.EarningRate > b.EarningRate
    end)
end

local function FindBestEgg()
    local EggList = {}

    local Container = workspace:FindFirstChild("AreaEggSlotsClient")
    if Container then
        for _, Slot in ipairs(Container:GetChildren()) do
            if Slot:IsA("Model") then
                local Category = FindAssetCategory(Slot)
                if Category then
                    local Data = GetPetData(Category)
                    if Data and SelectedRarities[Data.Rarity] then
                        table.insert(EggList, {
                            Slot = Slot,
                            Uid = Slot.Name,
                            Rarity = Data.Rarity,
                            EarningRate = Data.EarningRate,
                            DisplayName = Data.DisplayName,
                            Location = "spawn"
                    end
                end
            end
        end
    end

    if #EggList > 0 then
        SortEggs(EggList)
        return EggList[1]
    end

    for _, Obj in ipairs(workspace:GetChildren()) do
        if Obj:IsA("Model") and string.find(Obj.Name, "FirstAreaEgg") then
            local Category = FindAssetCategory(Obj)
            if Category then
                local Data = GetPetData(Category)
                if Data and SelectedRarities[Data.Rarity] then
                    table.insert(EggList, {
                        Slot = Obj,
                        Uid = Obj.Name,
                        Rarity = Data.Rarity,
                        EarningRate = Data.EarningRate,
                        DisplayName = Data.DisplayName,
                        Location = "workspace"
                end
            end
        end
    end

    if #EggList == 0 then return nil end
    SortEggs(EggList)
    return EggList[1]
end

local function SetRarities(List)
    SelectedRarities = {}
    for _, r in ipairs(List) do
        SelectedRarities[r] = true
    end
    print("leak by https://discord.gg/TBBAUZu8cW"))
end

local FarmingEnabled = false
local CurrentState = "IDLE"
local CurrentPhase = "UNKNOWN"
local FarmingThread = nil
local AFKStarted = false
local PendingEggUid = nil
local WaitingForVIPTP = false

local FlyConnection = nil
local BodyVelocity = nil
local BodyGyro = nil

local function GetChar()
    return Player.Character
end

local function GetRoot()
    local Char = GetChar()
    if not Char then return nil end
    return Char:FindFirstChild("HumanoidRootPart")
end

local function GetHum()
    local Char = GetChar()
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Humanoid")
end

local function CleanupFly()
    if FlyConnection then
        FlyConnection:Disconnect()
        FlyConnection = nil
    end
    if BodyVelocity then
        pcall(function()
            BodyVelocity.Velocity = Vector3.zero
            BodyVelocity.MaxForce = Vector3.zero
        end)
        BodyVelocity:Destroy()
        BodyVelocity = nil
    end
    if BodyGyro then
        pcall(function() BodyGyro.MaxTorque = Vector3.zero end)
        BodyGyro:Destroy()
        BodyGyro = nil
    end
    local Hum = GetHum()
    local Root = GetRoot()
    if Hum then
        pcall(function()
            Hum.PlatformStand = false
            Hum.Sit = false
        end)
    end
    if Root then
        pcall(function()
            Root.AssemblyLinearVelocity = Vector3.zero
            Root.AssemblyAngularVelocity = Vector3.zero
        end)
    end
end

local function SelfFlyTP(Destination, Speed, Callback)
    CleanupFly()

    local Hum = GetHum()
    local Root = GetRoot()
    if not Hum or not Root then
        if Callback then Callback() end
        return
    end
    if Hum.Health <= 0 then
        if Callback then Callback() end
        return
    end

    Hum.PlatformStand = true

    BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Name = "YokudoBV"
    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyVelocity.P = 1250
    BodyVelocity.Velocity = Vector3.zero
    BodyVelocity.Parent = Root

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.Name = "YokudoBG"
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.P = 3000
    BodyGyro.D = 500
    BodyGyro.CFrame = Root.CFrame
    BodyGyro.Parent = Root

    local StartTime = tick()

    FlyConnection = RunService.Heartbeat:Connect(function()
        if not FarmingEnabled then
            CleanupFly()
            return
        end

        local Hum2 = GetHum()
        local Root2 = GetRoot()
        if not Hum2 or not Root2 then
            CleanupFly()
            return
        end
        if Hum2.Health <= 0 then return end
        if not BodyVelocity or not BodyGyro then CleanupFly() return end

        local CurrentPos = Root2.Position
        local Direction = Destination - CurrentPos
        local TotalDist = Direction.Magnitude

        if TotalDist <= 3 then
            CleanupFly()
            Root2.CFrame = CFrame.new(Destination)
            Root2.AssemblyLinearVelocity = Vector3.zero
            Root2.AssemblyAngularVelocity = Vector3.zero
            if Callback then Callback() end
            return
        end

        if tick() - StartTime > 30 then
            CleanupFly()
            if Callback then Callback() end
            return
        end

        BodyVelocity.Velocity = Direction.Unit * Speed
        BodyGyro.CFrame = CFrame.new(CurrentPos, Destination)
    end)
end

local function GetPhase()
    if AreaEggCycle then
        local Success, IsNight = pcall(function()
            return AreaEggCycle.IsNightPhase(Workspace:GetServerTimeNow())
        end)
        if Success then
            return IsNight and "Night" or "Day"
        end
    end

    local Success, Text = pcall(function()
        return Player.PlayerGui.HUD.GameHUD.BottomRight.NightTimer.Value.Text
    end)
    if Success and Text then
        local M = tonumber(string.match(Text, "(%d+)m")) or 0
        local S = tonumber(string.match(Text, "(%d+)s")) or 0
        local Sec = M * 60 + S
        return Sec > 10 and "Day" or "Night"
    end

    return "UNKNOWN"
end

local function StopAll()
    if _G.YOKUDO_AFKSystem and _G.YOKUDO_AFKSystem.IsEnabled() then
        local TreadmillPos = _G.YOKUDO_AFKSystem.GetMyTreadmillPos()
        if not TreadmillPos then
            local _, Treadmill = _G.YOKUDO_AFKSystem.FindMyPlotAndTreadmill()
            if Treadmill then TreadmillPos = Treadmill.Position end
        end
        if TreadmillPos then
            _G.YOKUDO_AFKSystem.JumpOutTreadmill(TreadmillPos, function()
                _G.YOKUDO_AFKSystem.Disable()
                AFKStarted = false
            end)
        else
            _G.YOKUDO_AFKSystem.Disable()
            AFKStarted = false
        end
    end

    if _G.YOKUDO_VIPTP and _G.YOKUDO_VIPTP.IsEnabled() then
        _G.YOKUDO_VIPTP.Disable()
    end
    if _G.YOKUDO_TeleportSystem and _G.YOKUDO_TeleportSystem.IsEnabled() then
        _G.YOKUDO_TeleportSystem.Disable()
    end

    CleanupFly()
end

local function FlyToSafeZoneAndWait()
    local Root = GetRoot()
    if not Root then return false end

    local DistToSafe = (Root.Position - SAFE_ZONE).Magnitude
    if DistToSafe <= SAFE_ZONE_DIST then
        return true
    end

    SelfFlyTP(SAFE_ZONE, SAFE_FLY_SPEED)

    local WaitTime = 0
    while FarmingEnabled and WaitTime < 10 do
        local Root2 = GetRoot()
        if Root2 then
            local Dist = (Root2.Position - SAFE_ZONE).Magnitude
            if Dist <= SAFE_ZONE_DIST then return true end
        end
        task.wait(0.05)
        WaitTime = WaitTime + 0.05
    end

    return false
end

local function StartVIPTP(EggUid)
    if not _G.YOKUDO_VIPTP then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")

    WaitingForVIPTP = true
    _G.YOKUDO_VIPTP.SetTargetId(EggUid)
    _G.YOKUDO_VIPTP.Enable()
end

local function OnVIPTPComplete()
    if not FarmingEnabled then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end
    if not WaitingForVIPTP then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    WaitingForVIPTP = false
    AFKStarted = false
    print("leak by https://discord.gg/TBBAUZu8cW")

    local BestEgg = FindBestEgg()

    if BestEgg then
        print("leak by https://discord.gg/TBBAUZu8cW")
        PendingEggUid = BestEgg.Uid

        task.spawn(function()
            local ReachedSafe = FlyToSafeZoneAndWait()
            if ReachedSafe and PendingEggUid then
                task.wait(SAFE_WAIT_AFTER_REACH)
                StartVIPTP(PendingEggUid)
                PendingEggUid = nil
            else
                print("leak by https://discord.gg/TBBAUZu8cW")
                if _G.YOKUDO_AFKSystem and not _G.YOKUDO_AFKSystem.IsEnabled() then
                    _G.YOKUDO_AFKSystem.Enable()
                    AFKStarted = true
                end
            end
        end)
    else
        print("leak by https://discord.gg/TBBAUZu8cW")

        if _G.YOKUDO_AFKSystem then
            if not _G.YOKUDO_AFKSystem.IsEnabled() then
                _G.YOKUDO_AFKSystem.Enable()
                AFKStarted = true
                print("leak by https://discord.gg/TBBAUZu8cW")
            else
                print("leak by https://discord.gg/TBBAUZu8cW")
            end
        else
            print("leak by https://discord.gg/TBBAUZu8cW")
        end
    end
end

local function WaitForDay()
    while FarmingEnabled do
        local Phase = GetPhase()
        CurrentPhase = Phase
        if Phase == "Day" then return true end
        task.wait(DAY_CHECK_INTERVAL)
    end
    return false
end

local function NightLoop()
    print("leak by https://discord.gg/TBBAUZu8cW")")

    while FarmingEnabled do
        local Phase = GetPhase()
        CurrentPhase = Phase

        if Phase == "Day" then return end

        local BestEgg = FindBestEgg()

        if BestEgg then
            print("leak by https://discord.gg/TBBAUZu8cW")
            PendingEggUid = BestEgg.Uid

            StopAll()
            task.wait(0.3)

            local ReachedSafe = FlyToSafeZoneAndWait()
            if ReachedSafe then
                task.wait(SAFE_WAIT_AFTER_REACH)
                local IsDay = WaitForDay()
                if IsDay and PendingEggUid then
                    StartVIPTP(PendingEggUid)
                    PendingEggUid = nil
                    while WaitingForVIPTP and FarmingEnabled do
                        task.wait(0.2)
                    end
                end
            end
            return
        else
            if not AFKStarted then
                if _G.YOKUDO_AFKSystem and not _G.YOKUDO_AFKSystem.IsEnabled() then
                    _G.YOKUDO_AFKSystem.Enable()
                    AFKStarted = true
                end
            end
        end

        task.wait(NIGHT_CHECK_INTERVAL)
    end
end

local function DayLoop()
    print("leak by https://discord.gg/TBBAUZu8cW")")

    while FarmingEnabled do
        local Phase = GetPhase()
        CurrentPhase = Phase

        if Phase == "Night" then return end

        local BestEgg = FindBestEgg()

        if BestEgg then
            print("leak by https://discord.gg/TBBAUZu8cW")

            StopAll()
            task.wait(0.3)

            FlyToSafeZoneAndWait()
            task.wait(0.5)

            StartVIPTP(BestEgg.Uid)

            while WaitingForVIPTP and FarmingEnabled do
                task.wait(0.2)
            end
        else
            if _G.YOKUDO_AFKSystem and not _G.YOKUDO_AFKSystem.IsEnabled() then
                _G.YOKUDO_AFKSystem.Enable()
                AFKStarted = true
            end
        end

        task.wait(DAY_CHECK_INTERVAL)
    end
end

local function MainLoop()
    print("leak by https://discord.gg/TBBAUZu8cW")

    while FarmingEnabled do
        local Phase = GetPhase()
        CurrentPhase = Phase

        if Phase == "Day" then
            DayLoop()
        else
            NightLoop()
        end

        task.wait(0.05)
    end
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function Enable()
    if FarmingEnabled then return end
    FarmingEnabled = true
    CurrentState = "CHECK_TIME"
    AFKStarted = false
    PendingEggUid = nil
    WaitingForVIPTP = false

    if FarmingThread then
        pcall(function() task.cancel(FarmingThread) end)
        FarmingThread = nil
    end
    FarmingThread = task.spawn(function() MainLoop() end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function Disable()
    if not FarmingEnabled then return end
    FarmingEnabled = false

    if FarmingThread then
        pcall(function() task.cancel(FarmingThread) end)
        FarmingThread = nil
    end

    StopAll()

    AFKStarted = false
    PendingEggUid = nil
    WaitingForVIPTP = false
    CurrentState = "IDLE"
    CurrentPhase = "UNKNOWN"
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function Toggle()
    if FarmingEnabled then Disable() else Enable() end
end

_G.YOKUDO_FarmingManager = {
    Enable = Enable,
    Disable = Disable,
    Toggle = Toggle,
    IsEnabled = function() return FarmingEnabled end,
    SetRarities = SetRarities,
    GetState = function() return CurrentState end,
    GetPhase = function() return CurrentPhase end,
    FindBestEgg = FindBestEgg,

    GetEggData = function(Uid)
        if not Uid then return nil end
        local Container = workspace:FindFirstChild("AreaEggSlotsClient")
        local Slot = (Container and Container:FindFirstChild(Uid)) or workspace:FindFirstChild(Uid)
        if not Slot then return nil end
        local Category = FindAssetCategory(Slot)
        if not Category then return nil end
        return GetPetData(Category)
    end,

    GetUidLocation = function(Uid)
        if not Uid then return "none" end
        local Container = workspace:FindFirstChild("AreaEggSlotsClient")
        local InContainer = Container and Container:FindFirstChild(Uid) ~= nil
        if InContainer then return "spawn" end
        local InWorkspace = workspace:FindFirstChild(Uid) ~= nil
        if InWorkspace then return "workspace" end
        return "none"
    end,

    NIGHT_CHECK_INTERVAL = NIGHT_CHECK_INTERVAL,
    DAY_CHECK_INTERVAL = DAY_CHECK_INTERVAL,
    FLY_SPEED = FLY_SPEED,
    SAFE_FLY_SPEED = SAFE_FLY_SPEED,
    RETURN_SPEED = RETURN_SPEED,
    FLY_OFFSET = FLY_OFFSET,
    METHOD = METHOD,
    OnVIPTPComplete = OnVIPTPComplete,

task.spawn(function()
    task.wait(1)
    BuildMeshIdMap()
    print("leak by https://discord.gg/TBBAUZu8cW")
end)

task.spawn(function()
    while task.wait(30) do
        Cache.UidCategory = {}
        print("leak by https://discord.gg/TBBAUZu8cW")
    end
end)

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Features/ConfigSystem.lua"] = [=[

local HttpService = game:GetService("HttpService")

local CONFIG_FOLDER = "YOKUDO-SAE"
local CONFIG_FILE = CONFIG_FOLDER .. "/yokudo.json"

local DefaultConfig = {
    SelectedMethod = "TeleportFly",
    TeleportSpeed = 300

local function EnsureFolder()
    pcall(function()
        if not isfolder(CONFIG_FOLDER) then
            makefolder(CONFIG_FOLDER)
        end
    end)
end

local function FileExists(Path)
    local Exists = false
    pcall(function()
        Exists = isfile(Path)
    end)
    return Exists
end

local function LoadConfig()
    EnsureFolder()

    local Config = table.clone(DefaultConfig)

    if not FileExists(CONFIG_FILE) then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return Config
    end

    local Success, RawData = pcall(function()
        return readfile(CONFIG_FILE)
    end)

    if not Success or not RawData or RawData == "" then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return Config
    end

    local DecodeSuccess, DecodedData = pcall(function()
        return HttpService:JSONDecode(RawData)
    end)

    if not DecodeSuccess or type(DecodedData) ~= "table" then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return Config
    end

    if type(DecodedData.SelectedMethod) == "string" then
        if DecodedData.SelectedMethod == "TeleportFly" or DecodedData.SelectedMethod == "InstantTeleport" then
            Config.SelectedMethod = DecodedData.SelectedMethod
        end
    end

    if type(DecodedData.TeleportSpeed) == "number" then
        Config.TeleportSpeed = math.clamp(DecodedData.TeleportSpeed, 50, 1100)
    end

    print("leak by https://discord.gg/TBBAUZu8cW"))

    return Config
end

local function SaveConfig(Config)
    EnsureFolder()

    local DataToSave = {
        SelectedMethod = Config.SelectedMethod or DefaultConfig.SelectedMethod,
        TeleportSpeed = Config.TeleportSpeed or DefaultConfig.TeleportSpeed

    local EncodeSuccess, EncodedData = pcall(function()
        return HttpService:JSONEncode(DataToSave)
    end)

    if not EncodeSuccess then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return false
    end

    local WriteSuccess = pcall(function()
        writefile(CONFIG_FILE, EncodedData)
    end)

    if WriteSuccess then
        print("leak by https://discord.gg/TBBAUZu8cW"))
        return true
    else
        print("leak by https://discord.gg/TBBAUZu8cW")
        return false
    end
end

local function ApplyConfig(Config)
    _G.YOKUDO_SelectedMethod = Config.SelectedMethod
    _G.YOKUDO_TeleportSpeed = Config.TeleportSpeed
end

local LoadedConfig = LoadConfig()
ApplyConfig(LoadedConfig)

_G.YOKUDO_ConfigSystem = {
    Folder = CONFIG_FOLDER,
    File = CONFIG_FILE,
    Default = DefaultConfig,

    Load = function()
        local Config = LoadConfig()
        ApplyConfig(Config)

        task.spawn(function()
            task.wait(0.5)

            if _G.YOKUDO_RefreshSettingUI then
                _G.YOKUDO_RefreshSettingUI()
            end
        end)

        return Config
    end,

    Save = function()
        local Config = {
            SelectedMethod = _G.YOKUDO_SelectedMethod or DefaultConfig.SelectedMethod,
            TeleportSpeed = _G.YOKUDO_TeleportSpeed or DefaultConfig.TeleportSpeed
        return SaveConfig(Config)
    end,

    Get = function()
        return {
            SelectedMethod = _G.YOKUDO_SelectedMethod or DefaultConfig.SelectedMethod,
            TeleportSpeed = _G.YOKUDO_TeleportSpeed or DefaultConfig.TeleportSpeed
    end,

    Reset = function()
        ApplyConfig(DefaultConfig)
        return SaveConfig(DefaultConfig)
    end

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_MERGED["Tabs/Info.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")

local InfoTab, InfoPage = TabsManager:RegisterTab("Info", 1, "INFO")

CreateSectionTitle(InfoPage, "YOKUDO HUB | Steal An Egg", 1)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 26)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Join Group For Notification Update Script"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.LayoutOrder = 2
TitleLabel.Parent = InfoPage

local GroupLabel = Instance.new("TextLabel")
GroupLabel.Size = UDim2.new(1, 0, 0, 24)
GroupLabel.BackgroundTransparency = 1
GroupLabel.Text = "Group Discord"
GroupLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
GroupLabel.TextSize = 13
GroupLabel.TextXAlignment = Enum.TextXAlignment.Left
GroupLabel.Font = Enum.Font.GothamMedium
GroupLabel.LayoutOrder = 3
GroupLabel.Parent = InfoPage

local LinkBtn = Instance.new("TextButton")
LinkBtn.Size = UDim2.new(1, 0, 0, 30)
LinkBtn.BackgroundColor3 = Color3.fromRGB(28, 29, 42)
LinkBtn.BorderSizePixel = 0
LinkBtn.Text = "Link : https://discord.gg/TBBAUZu8cW"
LinkBtn.TextColor3 = Color3.fromRGB(120, 180, 255)
LinkBtn.TextSize = 12
LinkBtn.TextXAlignment = Enum.TextXAlignment.Left
LinkBtn.Font = Enum.Font.GothamMedium
LinkBtn.AutoButtonColor = false
LinkBtn.LayoutOrder = 4
LinkBtn.Parent = InfoPage

local LinkCorner = Instance.new("UICorner")
LinkCorner.CornerRadius = UDim.new(0, 6)
LinkCorner.Parent = LinkBtn

local LinkStroke = Instance.new("UIStroke")
LinkStroke.Color = Color3.fromRGB(105, 90, 190)
LinkStroke.Thickness = 1
LinkStroke.Transparency = 0.4
LinkStroke.Parent = LinkBtn

local LinkPadding = Instance.new("UIPadding")
LinkPadding.PaddingLeft = UDim.new(0, 10)
LinkPadding.PaddingRight = UDim.new(0, 10)
LinkPadding.Parent = LinkBtn

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0, 120, 0, 32)
CopyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
CopyBtn.BorderSizePixel = 0
CopyBtn.Text = "COPY LINK"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.TextSize = 12
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.AutoButtonColor = false
CopyBtn.LayoutOrder = 5
CopyBtn.Parent = InfoPage

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 6)
CopyCorner.Parent = CopyBtn

local CopyStroke = Instance.new("UIStroke")
CopyStroke.Color = Color3.fromRGB(120, 130, 255)
CopyStroke.Thickness = 1.5
CopyStroke.Transparency = 0.3
CopyStroke.Parent = CopyBtn

local DISCORD_LINK = "https://discord.gg/TBBAUZu8cW"

local function CopyDiscord()
    local Success = pcall(function()
        setclipboard(DISCORD_LINK)
    end)

    if Success then
        CopyBtn.Text = "COPIED!"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 60)

        task.delay(1.5, function()
            CopyBtn.Text = "COPY LINK"
            CopyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        end)

        print("leak by https://discord.gg/TBBAUZu8cW")
    else
        CopyBtn.Text = "FAILED!"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)

        task.delay(1.5, function()
            CopyBtn.Text = "COPY LINK"
            CopyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        end)

        print("leak by https://discord.gg/TBBAUZu8cW")
    end
end

CopyBtn.MouseButton1Click:Connect(CopyDiscord)
LinkBtn.MouseButton1Click:Connect(CopyDiscord)

CopyBtn.MouseEnter:Connect(function()
    if CopyBtn.Text == "COPY LINK" then
        TweenService:Create(CopyBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(108, 121, 255)
        }):Play()
    end
end)

CopyBtn.MouseLeave:Connect(function()
    if CopyBtn.Text == "COPY LINK" then
        TweenService:Create(CopyBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        }):Play()
    end
end)

LinkBtn.MouseEnter:Connect(function()
    TweenService:Create(LinkBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(38, 39, 55)
    }):Play()
end)

LinkBtn.MouseLeave:Connect(function()
    TweenService:Create(LinkBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(28, 29, 42)
    }):Play()
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/Farming.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")

local FarmingTab, FarmingPage = TabsManager:RegisterTab("Farming", 2, "FARMING")

CreateSectionTitle(FarmingPage, "Farming", 1)

local RarityHolder = Instance.new("Frame")
RarityHolder.Size = UDim2.new(1, 0, 0, 52)
RarityHolder.BackgroundTransparency = 1
RarityHolder.LayoutOrder = 2
RarityHolder.ZIndex = 100
RarityHolder.Parent = FarmingPage

local RarityLabel = Instance.new("TextLabel")
RarityLabel.Size = UDim2.new(1, -120, 0, 20)
RarityLabel.Position = UDim2.new(0, 0, 0, 2)
RarityLabel.BackgroundTransparency = 1
RarityLabel.Text = "Select Egg Type"
RarityLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
RarityLabel.TextSize = 13
RarityLabel.TextXAlignment = Enum.TextXAlignment.Left
RarityLabel.TextYAlignment = Enum.TextYAlignment.Center
RarityLabel.Font = Enum.Font.GothamBold
RarityLabel.ZIndex = 101
RarityLabel.Parent = RarityHolder

local RarityTitle = Instance.new("TextLabel")
RarityTitle.Size = UDim2.new(1, -120, 0, 18)
RarityTitle.Position = UDim2.new(0, 0, 0, 24)
RarityTitle.BackgroundTransparency = 1
RarityTitle.Text = "Select Rarity to Farm"
RarityTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
RarityTitle.TextSize = 10
RarityTitle.TextXAlignment = Enum.TextXAlignment.Left
RarityTitle.Font = Enum.Font.Gotham
RarityTitle.ZIndex = 101
RarityTitle.Parent = RarityHolder

local SelectedRarities = { Secret = true, Eternal = true, Divine = true }

local function GetSelectedText()
    local List = {}
    if SelectedRarities.Secret then table.insert(List, "Secret") end
    if SelectedRarities.Eternal then table.insert(List, "Eternal") end
    if SelectedRarities.Divine then table.insert(List, "Divine") end
    if #List == 0 then return "None" end
    if #List == 3 then return "All" end
    return table.concat(List, ", ")
end

local DropdownBtn = Instance.new("TextButton")
DropdownBtn.Size = UDim2.new(0, 120, 0, 28)
DropdownBtn.Position = UDim2.new(1, -120, 0.5, -14)
DropdownBtn.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
DropdownBtn.BorderSizePixel = 0
DropdownBtn.Text = GetSelectedText() .. " ▼"
DropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.TextSize = 11
DropdownBtn.Font = Enum.Font.GothamBold
DropdownBtn.AutoButtonColor = false
DropdownBtn.ZIndex = 101
DropdownBtn.Parent = RarityHolder

local DdCorner = Instance.new("UICorner")
DdCorner.CornerRadius = UDim.new(0, 6)
DdCorner.Parent = DropdownBtn

local DdStroke = Instance.new("UIStroke")
DdStroke.Color = Color3.fromRGB(200, 200, 220)
DdStroke.Thickness = 1
DdStroke.Transparency = 0.3
DdStroke.Parent = DropdownBtn

local DropdownList = Instance.new("Frame")
DropdownList.Size = UDim2.new(0, 120, 0, 80)
DropdownList.Position = UDim2.new(1, -120, 1, 2)
DropdownList.BackgroundColor3 = Color3.fromRGB(25, 26, 38)
DropdownList.BorderSizePixel = 0
DropdownList.Visible = false
DropdownList.ZIndex = 200
DropdownList.Parent = RarityHolder

local DlCorner = Instance.new("UICorner")
DlCorner.CornerRadius = UDim.new(0, 6)
DlCorner.Parent = DropdownList

local DlStroke = Instance.new("UIStroke")
DlStroke.Color = Color3.fromRGB(200, 200, 220)
DlStroke.Thickness = 1
DlStroke.Transparency = 0.3
DlStroke.Parent = DropdownList

local DlLayout = Instance.new("UIListLayout")
DlLayout.Padding = UDim.new(0, 2)
DlLayout.SortOrder = Enum.SortOrder.LayoutOrder
DlLayout.Parent = DropdownList

local DlPadding = Instance.new("UIPadding")
DlPadding.PaddingTop = UDim.new(0, 4)
DlPadding.PaddingBottom = UDim.new(0, 4)
DlPadding.PaddingLeft = UDim.new(0, 4)
DlPadding.PaddingRight = UDim.new(0, 4)
DlPadding.Parent = DropdownList

local OptionButtons = {}

local function UpdateOptionVisual(Name)
    local Option = OptionButtons[Name]
    if not Option then return end

    if SelectedRarities[Name] then
        Option.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        Option.Text = "✓ " .. Name
    else
        Option.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
        Option.Text = Name
    end
end

local function CreateDropdownOption(Name, Order)
    local Option = Instance.new("TextButton")
    Option.Size = UDim2.new(1, 0, 0, 22)
    Option.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
    Option.BorderSizePixel = 0
    Option.Text = Name
    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    Option.TextSize = 11
    Option.Font = Enum.Font.GothamMedium
    Option.AutoButtonColor = false
    Option.LayoutOrder = Order
    Option.ZIndex = 201
    Option.Parent = DropdownList

    local OptCorner = Instance.new("UICorner")
    OptCorner.CornerRadius = UDim.new(0, 4)
    OptCorner.Parent = Option

    OptionButtons[Name] = Option

    Option.MouseButton1Click:Connect(function()
        SelectedRarities[Name] = not SelectedRarities[Name]
        UpdateOptionVisual(Name)
        DropdownBtn.Text = GetSelectedText() .. " ▼"

        if _G.YOKUDO_EggCheckPremium then
            local List = {}
            if SelectedRarities.Secret then table.insert(List, "Secret") end
            if SelectedRarities.Eternal then table.insert(List, "Eternal") end
            if SelectedRarities.Divine then table.insert(List, "Divine") end
            _G.YOKUDO_EggCheckPremium.SetRarities(List)
        end

        if _G.YOKUDO_FarmingManager then
            local List = {}
            if SelectedRarities.Secret then table.insert(List, "Secret") end
            if SelectedRarities.Eternal then table.insert(List, "Eternal") end
            if SelectedRarities.Divine then table.insert(List, "Divine") end
            _G.YOKUDO_FarmingManager.SetRarities(List)
        end

        print("leak by https://discord.gg/TBBAUZu8cW"))
    end)

    Option.MouseEnter:Connect(function()
        if not SelectedRarities[Name] then
            TweenService:Create(Option, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(45, 46, 60)
            }):Play()
        end
    end)

    Option.MouseLeave:Connect(function()
        UpdateOptionVisual(Name)
    end)

    UpdateOptionVisual(Name)
end

CreateDropdownOption("Secret", 1)
CreateDropdownOption("Eternal", 2)
CreateDropdownOption("Divine", 3)

DropdownBtn.MouseButton1Click:Connect(function()
    DropdownList.Visible = not DropdownList.Visible
end)

local FarmHolder = Instance.new("Frame")
FarmHolder.Size = UDim2.new(1, 0, 0, 52)
FarmHolder.BackgroundTransparency = 1
FarmHolder.LayoutOrder = 3
FarmHolder.Parent = FarmingPage

local FarmLabel = Instance.new("TextLabel")
FarmLabel.Size = UDim2.new(1, -50, 0, 20)
FarmLabel.Position = UDim2.new(0, 0, 0, 2)
FarmLabel.BackgroundTransparency = 1
FarmLabel.Text = "Auto AFK Farming Egg"
FarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmLabel.TextSize = 13
FarmLabel.TextXAlignment = Enum.TextXAlignment.Left
FarmLabel.TextYAlignment = Enum.TextYAlignment.Center
FarmLabel.Font = Enum.Font.GothamBold
FarmLabel.Parent = FarmHolder

local FarmSub = Instance.new("TextLabel")
FarmSub.Size = UDim2.new(1, -50, 0, 18)
FarmSub.Position = UDim2.new(0, 0, 0, 24)
FarmSub.BackgroundTransparency = 1
FarmSub.Text = "No farm egg noob2"
FarmSub.TextColor3 = Color3.fromRGB(150, 150, 170)
FarmSub.TextSize = 10
FarmSub.TextXAlignment = Enum.TextXAlignment.Left
FarmSub.Font = Enum.Font.Gotham
FarmSub.Parent = FarmHolder

local FarmButton = Instance.new("TextButton")
FarmButton.Size = UDim2.new(0, 26, 0, 26)
FarmButton.Position = UDim2.new(1, -26, 0.5, -13)
FarmButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
FarmButton.BorderSizePixel = 0
FarmButton.Text = ""
FarmButton.AutoButtonColor = false
FarmButton.Parent = FarmHolder

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 6)
FarmCorner.Parent = FarmButton

local FarmStroke = Instance.new("UIStroke")
FarmStroke.Color = Color3.fromRGB(200, 200, 220)
FarmStroke.Thickness = 1.5
FarmStroke.Parent = FarmButton

local FarmCheck = Instance.new("TextLabel")
FarmCheck.Size = UDim2.new(1, 0, 1, 0)
FarmCheck.BackgroundTransparency = 1
FarmCheck.Text = "✓"
FarmCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmCheck.TextSize = 18
FarmCheck.Font = Enum.Font.GothamBold
FarmCheck.Visible = false
FarmCheck.Parent = FarmButton

local FarmEnabled = false

local function ToggleFarm()
    if not _G.YOKUDO_FarmingManager then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    FarmEnabled = not FarmEnabled
    FarmCheck.Visible = FarmEnabled

    if FarmEnabled then
        FarmButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        FarmStroke.Color = Color3.fromRGB(135, 120, 225)

        if _G.YOKUDO_EggCheckPremium then
            local List = {}
            if SelectedRarities.Secret then table.insert(List, "Secret") end
            if SelectedRarities.Eternal then table.insert(List, "Eternal") end
            if SelectedRarities.Divine then table.insert(List, "Divine") end
            _G.YOKUDO_EggCheckPremium.SetRarities(List)
        end

        if _G.YOKUDO_FarmingManager then
            local List = {}
            if SelectedRarities.Secret then table.insert(List, "Secret") end
            if SelectedRarities.Eternal then table.insert(List, "Eternal") end
            if SelectedRarities.Divine then table.insert(List, "Divine") end
            _G.YOKUDO_FarmingManager.SetRarities(List)
        end

        _G.YOKUDO_FarmingManager.Enable()
    else
        FarmButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        FarmStroke.Color = Color3.fromRGB(200, 200, 220)
        _G.YOKUDO_FarmingManager.Disable()
    end
end

FarmButton.MouseButton1Click:Connect(function()
    ToggleFarm()
end)

task.spawn(function()
    task.wait(1)
    if _G.YOKUDO_FarmingManager then
        local State = _G.YOKUDO_FarmingManager.IsEnabled()
        FarmEnabled = State
        FarmCheck.Visible = State
        if State then
            FarmButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            FarmStroke.Color = Color3.fromRGB(135, 120, 225)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.YOKUDO_FarmingManager then
            local CurrentState = _G.YOKUDO_FarmingManager.IsEnabled()
            local UIState = FarmCheck.Visible

            if CurrentState ~= UIState then
                FarmEnabled = CurrentState
                FarmCheck.Visible = CurrentState

                if CurrentState then
                    FarmButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
                    FarmStroke.Color = Color3.fromRGB(135, 120, 225)
                else
                    FarmButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
                    FarmStroke.Color = Color3.fromRGB(200, 200, 220)
                end

                print("leak by https://discord.gg/TBBAUZu8cW"))
            end
        end
    end
end)

_G.YOKUDO_RefreshFarmingUI = function()
    if _G.YOKUDO_FarmingManager then
        local State = _G.YOKUDO_FarmingManager.IsEnabled()
        FarmEnabled = State
        FarmCheck.Visible = State

        if State then
            FarmButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            FarmStroke.Color = Color3.fromRGB(135, 120, 225)
        else
            FarmButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
            FarmStroke.Color = Color3.fromRGB(200, 200, 220)
        end

        print("leak by https://discord.gg/TBBAUZu8cW"))
    end
end

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/Combat.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager

local CombatTab, CombatPage = TabsManager:RegisterTab("Combat", 3, "COMBAT")

CreateSectionTitle(CombatPage, "Combat", 1)

local AutoEquipHolder = Instance.new("Frame")
AutoEquipHolder.Size = UDim2.new(1, 0, 0, 32)
AutoEquipHolder.BackgroundTransparency = 1
AutoEquipHolder.LayoutOrder = 2
AutoEquipHolder.Parent = CombatPage

local AutoEquipLabel = Instance.new("TextLabel")
AutoEquipLabel.Size = UDim2.new(1, -50, 1, 0)
AutoEquipLabel.BackgroundTransparency = 1
AutoEquipLabel.Text = "Auto Equip Bat"
AutoEquipLabel.TextColor3 = Color3.fromRGB(220, 220, 235)
AutoEquipLabel.TextSize = 13
AutoEquipLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoEquipLabel.TextYAlignment = Enum.TextYAlignment.Center
AutoEquipLabel.Font = Enum.Font.GothamBold
AutoEquipLabel.Parent = AutoEquipHolder

local AutoEquipCheckButton = Instance.new("TextButton")
AutoEquipCheckButton.Size = UDim2.new(0, 26, 0, 26)
AutoEquipCheckButton.Position = UDim2.new(1, -26, 0.5, -13)
AutoEquipCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
AutoEquipCheckButton.BorderSizePixel = 0
AutoEquipCheckButton.Text = ""
AutoEquipCheckButton.AutoButtonColor = false
AutoEquipCheckButton.Parent = AutoEquipHolder

local AutoEquipCorner = Instance.new("UICorner")
AutoEquipCorner.CornerRadius = UDim.new(0, 6)
AutoEquipCorner.Parent = AutoEquipCheckButton

local AutoEquipStroke = Instance.new("UIStroke")
AutoEquipStroke.Color = Color3.fromRGB(200, 200, 220)
AutoEquipStroke.Thickness = 1.5
AutoEquipStroke.Parent = AutoEquipCheckButton

local AutoEquipCheck = Instance.new("TextLabel")
AutoEquipCheck.Size = UDim2.new(1, 0, 1, 0)
AutoEquipCheck.BackgroundTransparency = 1
AutoEquipCheck.Text = "✓"
AutoEquipCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoEquipCheck.TextSize = 18
AutoEquipCheck.Font = Enum.Font.GothamBold
AutoEquipCheck.Visible = false
AutoEquipCheck.Parent = AutoEquipCheckButton

local function ToggleAutoEquip()
    AutoEquipCheck.Visible = not AutoEquipCheck.Visible
    if AutoEquipCheck.Visible then
        AutoEquipCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        AutoEquipStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_AutoAttack then
            _G.YOKUDO_AutoAttack.EnableAutoEquip()
        end
    else
        AutoEquipCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        AutoEquipStroke.Color = Color3.fromRGB(200, 200, 220)
        if _G.YOKUDO_AutoAttack then
            _G.YOKUDO_AutoAttack.DisableAutoEquip()
        end
    end
end

AutoEquipCheckButton.MouseButton1Click:Connect(function()
    ToggleAutoEquip()
end)

local AutoHitHolder = Instance.new("Frame")
AutoHitHolder.Size = UDim2.new(1, 0, 0, 52)
AutoHitHolder.BackgroundTransparency = 1
AutoHitHolder.LayoutOrder = 3
AutoHitHolder.Parent = CombatPage

local AutoHitLabel = Instance.new("TextLabel")
AutoHitLabel.Size = UDim2.new(1, -50, 0, 20)
AutoHitLabel.Position = UDim2.new(0, 0, 0, 2)
AutoHitLabel.BackgroundTransparency = 1
AutoHitLabel.Text = "Auto Hit Player"
AutoHitLabel.TextColor3 = Color3.fromRGB(220, 220, 235)
AutoHitLabel.TextSize = 13
AutoHitLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoHitLabel.TextYAlignment = Enum.TextYAlignment.Center
AutoHitLabel.Font = Enum.Font.GothamBold
AutoHitLabel.Parent = AutoHitHolder

local AutoHitTitle = Instance.new("TextLabel")
AutoHitTitle.Size = UDim2.new(1, -50, 0, 18)
AutoHitTitle.Position = UDim2.new(0, 0, 0, 24)
AutoHitTitle.BackgroundTransparency = 1
AutoHitTitle.Text = "Range: 50 studs"
AutoHitTitle.TextColor3 = Color3.fromRGB(150, 150, 170)
AutoHitTitle.TextSize = 10
AutoHitTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoHitTitle.Font = Enum.Font.Gotham
AutoHitTitle.Parent = AutoHitHolder

local AutoHitCheckButton = Instance.new("TextButton")
AutoHitCheckButton.Size = UDim2.new(0, 26, 0, 26)
AutoHitCheckButton.Position = UDim2.new(1, -26, 0.5, -13)
AutoHitCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
AutoHitCheckButton.BorderSizePixel = 0
AutoHitCheckButton.Text = ""
AutoHitCheckButton.AutoButtonColor = false
AutoHitCheckButton.Parent = AutoHitHolder

local AutoHitCorner = Instance.new("UICorner")
AutoHitCorner.CornerRadius = UDim.new(0, 6)
AutoHitCorner.Parent = AutoHitCheckButton

local AutoHitStroke = Instance.new("UIStroke")
AutoHitStroke.Color = Color3.fromRGB(200, 200, 220)
AutoHitStroke.Thickness = 1.5
AutoHitStroke.Parent = AutoHitCheckButton

local AutoHitCheck = Instance.new("TextLabel")
AutoHitCheck.Size = UDim2.new(1, 0, 1, 0)
AutoHitCheck.BackgroundTransparency = 1
AutoHitCheck.Text = "✓"
AutoHitCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoHitCheck.TextSize = 18
AutoHitCheck.Font = Enum.Font.GothamBold
AutoHitCheck.Visible = false
AutoHitCheck.Parent = AutoHitCheckButton

local function ToggleAutoHit()
    AutoHitCheck.Visible = not AutoHitCheck.Visible
    if AutoHitCheck.Visible then
        AutoHitCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        AutoHitStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_AutoAttack then
            _G.YOKUDO_AutoAttack.EnableAutoHit()
        end
    else
        AutoHitCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        AutoHitStroke.Color = Color3.fromRGB(200, 200, 220)
        if _G.YOKUDO_AutoAttack then
            _G.YOKUDO_AutoAttack.DisableAutoHit()
        end
    end
end

AutoHitCheckButton.MouseButton1Click:Connect(function()
    ToggleAutoHit()
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/AutoFarming.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")

local AutoFarmingTab, AutoFarmingPage = TabsManager:RegisterTab("Auto Farming", 4, "AUTO_FARMING")

CreateSectionTitle(AutoFarmingPage, "Auto Farming", 1)

local GetEggBox = Instance.new("Frame")
GetEggBox.Size = UDim2.new(1, 0, 0, 60)
GetEggBox.BackgroundColor3 = Color3.fromRGB(28, 29, 42)
GetEggBox.BorderSizePixel = 0
GetEggBox.LayoutOrder = 2
GetEggBox.Parent = AutoFarmingPage

local GetEggBoxCorner = Instance.new("UICorner")
GetEggBoxCorner.CornerRadius = UDim.new(0, 8)
GetEggBoxCorner.Parent = GetEggBox

local GetEggBoxStroke = Instance.new("UIStroke")
GetEggBoxStroke.Color = Color3.fromRGB(105, 90, 190)
GetEggBoxStroke.Thickness = 1.5
GetEggBoxStroke.Transparency = 0.4
GetEggBoxStroke.Parent = GetEggBox

local GetEggIcon = Instance.new("ImageLabel")
GetEggIcon.Size = UDim2.new(0, 40, 0, 40)
GetEggIcon.Position = UDim2.new(0, 10, 0.5, -20)
GetEggIcon.BackgroundColor3 = Color3.fromRGB(40, 42, 58)
GetEggIcon.BorderSizePixel = 0
GetEggIcon.Image = ""
GetEggIcon.Parent = GetEggBox

local GetEggIconCorner = Instance.new("UICorner")
GetEggIconCorner.CornerRadius = UDim.new(0, 6)
GetEggIconCorner.Parent = GetEggIcon

local GetEggName = Instance.new("TextLabel")
GetEggName.Size = UDim2.new(1, -140, 0, 16)
GetEggName.Position = UDim2.new(0, 58, 0, 10)
GetEggName.BackgroundTransparency = 1
GetEggName.Text = "No Egg Selected"
GetEggName.TextColor3 = Color3.fromRGB(255, 255, 255)
GetEggName.TextSize = 12
GetEggName.TextXAlignment = Enum.TextXAlignment.Left
GetEggName.Font = Enum.Font.GothamBold
GetEggName.Parent = GetEggBox

local GetEggRate = Instance.new("TextLabel")
GetEggRate.Size = UDim2.new(1, -140, 0, 16)
GetEggRate.Position = UDim2.new(0, 58, 0, 30)
GetEggRate.BackgroundTransparency = 1
GetEggRate.Text = "$0/s"
GetEggRate.TextColor3 = Color3.fromRGB(100, 255, 100)
GetEggRate.TextSize = 11
GetEggRate.TextXAlignment = Enum.TextXAlignment.Left
GetEggRate.Font = Enum.Font.Gotham
GetEggRate.Parent = GetEggBox

local GetEggCheckButton = Instance.new("TextButton")
GetEggCheckButton.Size = UDim2.new(0, 34, 0, 34)
GetEggCheckButton.Position = UDim2.new(1, -44, 0.5, -17)
GetEggCheckButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GetEggCheckButton.BackgroundTransparency = 0.85
GetEggCheckButton.BorderSizePixel = 0
GetEggCheckButton.Text = ""
GetEggCheckButton.AutoButtonColor = false
GetEggCheckButton.Parent = GetEggBox

local GetEggCheckCorner = Instance.new("UICorner")
GetEggCheckCorner.CornerRadius = UDim.new(0, 8)
GetEggCheckCorner.Parent = GetEggCheckButton

local GetEggCheckStroke = Instance.new("UIStroke")
GetEggCheckStroke.Color = Color3.fromRGB(255, 255, 255)
GetEggCheckStroke.Thickness = 2
GetEggCheckStroke.Parent = GetEggCheckButton

local GetEggCheck = Instance.new("TextLabel")
GetEggCheck.Size = UDim2.new(1, 0, 1, 0)
GetEggCheck.BackgroundTransparency = 1
GetEggCheck.Text = "✓"
GetEggCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
GetEggCheck.TextSize = 20
GetEggCheck.Font = Enum.Font.GothamBold
GetEggCheck.Visible = false
GetEggCheck.Parent = GetEggCheckButton

local SelectedEggId = nil
local SelectedEggData = nil
local GetEggEnabled = false

local function UpdateGetEggBox(Icon, Name, Rate, EggId)
    GetEggIcon.Image = Icon or ""
    GetEggName.Text = Name or "No Egg Selected"
    GetEggRate.Text = "$" .. (_G.YOKUDO_AutoFarm and _G.YOKUDO_AutoFarm.FormatMoney(Rate or 0) or tostring(Rate or 0)) .. "/s"
    SelectedEggId = EggId

    GetEggIcon.ImageTransparency = 1
    GetEggName.TextTransparency = 1
    GetEggRate.TextTransparency = 1

    TweenService:Create(GetEggIcon, TweenInfo.new(0.2), {ImageTransparency = 0}):Play()
    TweenService:Create(GetEggName, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
    TweenService:Create(GetEggRate, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
end

local function ToggleGetEgg()
    GetEggEnabled = not GetEggEnabled
    GetEggCheck.Visible = GetEggEnabled
    if GetEggEnabled then
        GetEggCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        GetEggCheckButton.BackgroundTransparency = 0
        GetEggCheckStroke.Color = Color3.fromRGB(135, 120, 225)

        if _G.YOKUDO_AutoFarm then
            _G.YOKUDO_AutoFarm.StartTeleport()
        end
    else
        GetEggCheckButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        GetEggCheckButton.BackgroundTransparency = 0.85
        GetEggCheckStroke.Color = Color3.fromRGB(255, 255, 255)

        if _G.YOKUDO_AutoFarm then
            _G.YOKUDO_AutoFarm.StopTeleport()
        end
    end
end

GetEggCheckButton.MouseButton1Click:Connect(function()
    ToggleGetEgg()
end)

local CheckEggHolder = Instance.new("Frame")
CheckEggHolder.Size = UDim2.new(1, 0, 0, 44)
CheckEggHolder.BackgroundColor3 = Color3.fromRGB(28, 29, 42)
CheckEggHolder.BorderSizePixel = 0
CheckEggHolder.LayoutOrder = 3
CheckEggHolder.Parent = AutoFarmingPage

local CheckEggHolderCorner = Instance.new("UICorner")
CheckEggHolderCorner.CornerRadius = UDim.new(0, 8)
CheckEggHolderCorner.Parent = CheckEggHolder

local CheckEggHolderStroke = Instance.new("UIStroke")
CheckEggHolderStroke.Color = Color3.fromRGB(105, 90, 190)
CheckEggHolderStroke.Thickness = 1.5
CheckEggHolderStroke.Transparency = 0.4
CheckEggHolderStroke.Parent = CheckEggHolder

local CheckEggLabel = Instance.new("TextLabel")
CheckEggLabel.Size = UDim2.new(1, -140, 1, 0)
CheckEggLabel.Position = UDim2.new(0, 12, 0, 0)
CheckEggLabel.BackgroundTransparency = 1
CheckEggLabel.Text = "Start Check Egg"
CheckEggLabel.TextColor3 = Color3.fromRGB(220, 220, 235)
CheckEggLabel.TextSize = 13
CheckEggLabel.TextXAlignment = Enum.TextXAlignment.Left
CheckEggLabel.TextYAlignment = Enum.TextYAlignment.Center
CheckEggLabel.Font = Enum.Font.GothamBold
CheckEggLabel.Parent = CheckEggHolder

local CheckEggCount = Instance.new("TextLabel")
CheckEggCount.Size = UDim2.new(0, 80, 1, 0)
CheckEggCount.Position = UDim2.new(1, -150, 0, 0)
CheckEggCount.BackgroundTransparency = 1
CheckEggCount.Text = "Egg: 0"
CheckEggCount.TextColor3 = Color3.fromRGB(100, 255, 100)
CheckEggCount.TextSize = 10
CheckEggCount.TextXAlignment = Enum.TextXAlignment.Right
CheckEggCount.TextYAlignment = Enum.TextYAlignment.Center
CheckEggCount.Font = Enum.Font.Gotham
CheckEggCount.Parent = CheckEggHolder

local CheckEggCheckButton = Instance.new("TextButton")
CheckEggCheckButton.Size = UDim2.new(0, 30, 0, 30)
CheckEggCheckButton.Position = UDim2.new(1, -40, 0.5, -15)
CheckEggCheckButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CheckEggCheckButton.BackgroundTransparency = 0.85
CheckEggCheckButton.BorderSizePixel = 0
CheckEggCheckButton.Text = ""
CheckEggCheckButton.AutoButtonColor = false
CheckEggCheckButton.Parent = CheckEggHolder

local CheckEggCorner = Instance.new("UICorner")
CheckEggCorner.CornerRadius = UDim.new(0, 8)
CheckEggCorner.Parent = CheckEggCheckButton

local CheckEggStroke = Instance.new("UIStroke")
CheckEggStroke.Color = Color3.fromRGB(255, 255, 255)
CheckEggStroke.Thickness = 2
CheckEggStroke.Parent = CheckEggCheckButton

local CheckEggCheck = Instance.new("TextLabel")
CheckEggCheck.Size = UDim2.new(1, 0, 1, 0)
CheckEggCheck.BackgroundTransparency = 1
CheckEggCheck.Text = "✓"
CheckEggCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckEggCheck.TextSize = 20
CheckEggCheck.Font = Enum.Font.GothamBold
CheckEggCheck.Visible = false
CheckEggCheck.Parent = CheckEggCheckButton

local CheckEggEnabled = false
local EggScrollFrame = nil
local EggEntries = {}

local function CreateEggEntry(EggData)
    local Entry = Instance.new("Frame")
    Entry.Size = UDim2.new(1, -8, 0, 44)
    Entry.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
    Entry.BorderSizePixel = 0
    Entry.Parent = EggScrollFrame

    local EntryCorner = Instance.new("UICorner")
    EntryCorner.CornerRadius = UDim.new(0, 6)
    EntryCorner.Parent = Entry

    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 34, 0, 34)
    IconFrame.Position = UDim2.new(0, 5, 0.5, -17)
    IconFrame.BackgroundColor3 = Color3.fromRGB(40, 42, 58)
    IconFrame.BorderSizePixel = 0
    IconFrame.Parent = Entry

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 6)
    IconCorner.Parent = IconFrame

    local IconImage = Instance.new("ImageLabel")
    IconImage.Size = UDim2.new(1, -4, 1, -4)
    IconImage.Position = UDim2.new(0, 2, 0, 2)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = EggData.Icon or ""
    IconImage.Parent = IconFrame

    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 6)
    ImageCorner.Parent = IconImage

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -140, 0, 16)
    NameLabel.Position = UDim2.new(0, 48, 0, 6)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = EggData.DisplayName
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 11
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.Parent = Entry

    local RateLabel = Instance.new("TextLabel")
    RateLabel.Size = UDim2.new(1, -140, 0, 14)
    RateLabel.Position = UDim2.new(0, 48, 0, 24)
    RateLabel.BackgroundTransparency = 1
    RateLabel.Text = "$" .. (_G.YOKUDO_AutoFarm and _G.YOKUDO_AutoFarm.FormatMoney(EggData.EarningRate) or tostring(EggData.EarningRate)) .. "/s"
    RateLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    RateLabel.TextSize = 10
    RateLabel.TextXAlignment = Enum.TextXAlignment.Left
    RateLabel.Font = Enum.Font.Gotham
    RateLabel.Parent = Entry

    local SelectButton = Instance.new("TextButton")
    SelectButton.Size = UDim2.new(0, 70, 0, 28)
    SelectButton.Position = UDim2.new(1, -75, 0.5, -14)
    SelectButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    SelectButton.BorderSizePixel = 0
    SelectButton.Text = "Select"
    SelectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SelectButton.TextSize = 12
    SelectButton.Font = Enum.Font.GothamBold
    SelectButton.AutoButtonColor = false
    SelectButton.Parent = Entry

    local SelectCorner = Instance.new("UICorner")
    SelectCorner.CornerRadius = UDim.new(0, 6)
    SelectCorner.Parent = SelectButton

    local SelectStroke = Instance.new("UIStroke")
    SelectStroke.Color = Color3.fromRGB(140, 125, 240)
    SelectStroke.Thickness = 1.5
    SelectStroke.Transparency = 0.3
    SelectStroke.Parent = SelectButton

    SelectButton.MouseButton1Click:Connect(function()
        UpdateGetEggBox(EggData.Icon, EggData.DisplayName, EggData.EarningRate, EggData.Id)

        SelectedEggData = EggData

        if _G.YOKUDO_AutoFarm then
            _G.YOKUDO_AutoFarm.SelectEgg(EggData)
        end
    end)

    return Entry
end

local function RefreshEggList()
    if not CheckEggEnabled then return end
    if not _G.YOKUDO_AutoFarm then return end

    for _, child in ipairs(EggScrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end

    EggEntries = {}

    local Eggs = _G.YOKUDO_AutoFarm.ScanEggs()
    for _, EggData in ipairs(Eggs) do
        local Entry = CreateEggEntry(EggData)
        table.insert(EggEntries, Entry)
    end
    EggScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #Eggs * 48)
    CheckEggCount.Text = "Egg: " .. #Eggs
end

local function ToggleCheckEgg()
    CheckEggEnabled = not CheckEggEnabled
    CheckEggCheck.Visible = CheckEggEnabled
    if CheckEggEnabled then
        CheckEggCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        CheckEggCheckButton.BackgroundTransparency = 0
        CheckEggStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_AutoFarm then
            _G.YOKUDO_AutoFarm.Enable()
        end
        RefreshEggList()
    else
        CheckEggCheckButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CheckEggCheckButton.BackgroundTransparency = 0.85
        CheckEggStroke.Color = Color3.fromRGB(255, 255, 255)
        if _G.YOKUDO_AutoFarm then
            _G.YOKUDO_AutoFarm.Disable()
        end
        for _, child in ipairs(EggScrollFrame:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        CheckEggCount.Text = "Egg: 0"
    end
end

CheckEggCheckButton.MouseButton1Click:Connect(function()
    ToggleCheckEgg()
end)

EggScrollFrame = Instance.new("ScrollingFrame")
EggScrollFrame.Size = UDim2.new(1, 0, 0, 200)
EggScrollFrame.BackgroundTransparency = 1
EggScrollFrame.BorderSizePixel = 0
EggScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
EggScrollFrame.ScrollBarThickness = 4
EggScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 220)
EggScrollFrame.LayoutOrder = 4
EggScrollFrame.Parent = AutoFarmingPage

local EggListLayout = Instance.new("UIListLayout")
EggListLayout.Padding = UDim.new(0, 4)
EggListLayout.SortOrder = Enum.SortOrder.LayoutOrder
EggListLayout.Parent = EggScrollFrame

workspace.AreaEggSlotsClient.ChildAdded:Connect(function()
    task.wait(0.2)
    if CheckEggEnabled then
        RefreshEggList()
    end
end)

workspace.AreaEggSlotsClient.ChildRemoved:Connect(function()
    task.wait(0.2)
    if CheckEggEnabled then
        RefreshEggList()
    end
end)

task.spawn(function()
    while task.wait(3) do
        if CheckEggEnabled then
            RefreshEggList()
        end
    end
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/Event.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")

local EventTab, EventPage = TabsManager:RegisterTab("Event", 5, "EVENT")

CreateSectionTitle(EventPage, "Event", 1)

local ManagerHolder = Instance.new("Frame")
ManagerHolder.Size = UDim2.new(1, 0, 0, 52)
ManagerHolder.BackgroundTransparency = 1
ManagerHolder.LayoutOrder = 2
ManagerHolder.Parent = EventPage

local ManagerLabel = Instance.new("TextLabel")
ManagerLabel.Size = UDim2.new(1, -50, 0, 20)
ManagerLabel.Position = UDim2.new(0, 0, 0, 2)
ManagerLabel.BackgroundTransparency = 1
ManagerLabel.Text = "Auto Attack Drone"
ManagerLabel.TextColor3 = Color3.fromRGB(220, 220, 235)
ManagerLabel.TextSize = 13
ManagerLabel.TextXAlignment = Enum.TextXAlignment.Left
ManagerLabel.TextYAlignment = Enum.TextYAlignment.Center
ManagerLabel.Font = Enum.Font.GothamBold
ManagerLabel.Parent = ManagerHolder

local ManagerSub = Instance.new("TextLabel")
ManagerSub.Size = UDim2.new(1, -50, 0, 18)
ManagerSub.Position = UDim2.new(0, 0, 0, 24)
ManagerSub.BackgroundTransparency = 1
ManagerSub.Text = "AFK Farm Drone"
ManagerSub.TextColor3 = Color3.fromRGB(150, 150, 170)
ManagerSub.TextSize = 10
ManagerSub.TextXAlignment = Enum.TextXAlignment.Left
ManagerSub.Font = Enum.Font.Gotham
ManagerSub.Parent = ManagerHolder

local ManagerButton = Instance.new("TextButton")
ManagerButton.Size = UDim2.new(0, 26, 0, 26)
ManagerButton.Position = UDim2.new(1, -26, 0.5, -13)
ManagerButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
ManagerButton.BorderSizePixel = 0
ManagerButton.Text = ""
ManagerButton.AutoButtonColor = false
ManagerButton.Parent = ManagerHolder

local ManagerCorner = Instance.new("UICorner")
ManagerCorner.CornerRadius = UDim.new(0, 6)
ManagerCorner.Parent = ManagerButton

local ManagerStroke = Instance.new("UIStroke")
ManagerStroke.Color = Color3.fromRGB(200, 200, 220)
ManagerStroke.Thickness = 1.5
ManagerStroke.Parent = ManagerButton

local ManagerCheck = Instance.new("TextLabel")
ManagerCheck.Size = UDim2.new(1, 0, 1, 0)
ManagerCheck.BackgroundTransparency = 1
ManagerCheck.Text = "✓"
ManagerCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
ManagerCheck.TextSize = 18
ManagerCheck.Font = Enum.Font.GothamBold
ManagerCheck.Visible = false
ManagerCheck.Parent = ManagerButton

local function UpdateManagerUI(State)
    ManagerCheck.Visible = State
    if State then
        ManagerButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        ManagerStroke.Color = Color3.fromRGB(135, 120, 225)
    else
        ManagerButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        ManagerStroke.Color = Color3.fromRGB(200, 200, 220)
    end
end

ManagerButton.MouseButton1Click:Connect(function()
    if not _G.YOKUDO_ManagerDrone then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    local NewState = not _G.YOKUDO_ManagerDrone.IsEnabled()
    UpdateManagerUI(NewState)

    if NewState then
        _G.YOKUDO_ManagerDrone.Enable()
    else
        _G.YOKUDO_ManagerDrone.Disable()
    end
end)

task.spawn(function()
    task.wait(1)
    if _G.YOKUDO_ManagerDrone then
        local State = _G.YOKUDO_ManagerDrone.IsEnabled()
        UpdateManagerUI(State)
    end
end)

_G.YOKUDO_RefreshEventUI = function()
    if _G.YOKUDO_ManagerDrone then
        local State = _G.YOKUDO_ManagerDrone.IsEnabled()
        UpdateManagerUI(State)
        print("leak by https://discord.gg/TBBAUZu8cW"))
    end
end

task.spawn(function()
    while task.wait(1) do
        if _G.YOKUDO_ManagerDrone then
            local CurrentState = _G.YOKUDO_ManagerDrone.IsEnabled()
            local UIState = ManagerCheck.Visible

            if CurrentState ~= UIState then
                UpdateManagerUI(CurrentState)
                print("leak by https://discord.gg/TBBAUZu8cW"))
            end
        end
    end
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/HopServer.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local PLACE_ID = 107778070777162

local HopServerTab, HopServerPage = TabsManager:RegisterTab("Hop Server", 6, "HOP_SERVER")

CreateSectionTitle(HopServerPage, "Hop Server", 1)

local FeatureHolder = Instance.new("Frame")
FeatureHolder.Size = UDim2.new(1, 0, 0, 60)
FeatureHolder.BackgroundColor3 = Color3.fromRGB(28, 29, 42)
FeatureHolder.BorderSizePixel = 0
FeatureHolder.LayoutOrder = 2
FeatureHolder.Parent = HopServerPage

local FeatureCorner = Instance.new("UICorner")
FeatureCorner.CornerRadius = UDim.new(0, 8)
FeatureCorner.Parent = FeatureHolder

local FeatureStroke = Instance.new("UIStroke")
FeatureStroke.Color = Color3.fromRGB(105, 90, 190)
FeatureStroke.Thickness = 1.5
FeatureStroke.Transparency = 0.4
FeatureStroke.Parent = FeatureHolder

local FeatureName = Instance.new("TextLabel")
FeatureName.Size = UDim2.new(1, -100, 0, 20)
FeatureName.Position = UDim2.new(0, 12, 0, 10)
FeatureName.BackgroundTransparency = 1
FeatureName.Text = "Check Hop Server Low Player"
FeatureName.TextColor3 = Color3.fromRGB(255, 255, 255)
FeatureName.TextSize = 13
FeatureName.TextXAlignment = Enum.TextXAlignment.Left
FeatureName.Font = Enum.Font.GothamBold
FeatureName.Parent = FeatureHolder

local FeatureStatus = Instance.new("TextLabel")
FeatureStatus.Size = UDim2.new(1, -100, 0, 16)
FeatureStatus.Position = UDim2.new(0, 12, 0, 32)
FeatureStatus.BackgroundTransparency = 1
FeatureStatus.Text = "Click to search servers"
FeatureStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
FeatureStatus.TextSize = 10
FeatureStatus.TextXAlignment = Enum.TextXAlignment.Left
FeatureStatus.Font = Enum.Font.Gotham
FeatureStatus.Parent = FeatureHolder

local ClickBtn = Instance.new("TextButton")
ClickBtn.Size = UDim2.new(0, 70, 0, 30)
ClickBtn.Position = UDim2.new(1, -82, 0.5, -15)
ClickBtn.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
ClickBtn.BorderSizePixel = 0
ClickBtn.Text = "Click"
ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickBtn.TextSize = 12
ClickBtn.Font = Enum.Font.GothamBold
ClickBtn.AutoButtonColor = false
ClickBtn.Parent = FeatureHolder

local ClickCorner = Instance.new("UICorner")
ClickCorner.CornerRadius = UDim.new(0, 6)
ClickCorner.Parent = ClickBtn

local ClickStroke = Instance.new("UIStroke")
ClickStroke.Color = Color3.fromRGB(140, 125, 240)
ClickStroke.Thickness = 1.5
ClickStroke.Transparency = 0.3
ClickStroke.Parent = ClickBtn

ClickBtn.MouseEnter:Connect(function()
    TweenService:Create(ClickBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(125, 110, 220)
    }):Play()
end)

ClickBtn.MouseLeave:Connect(function()
    TweenService:Create(ClickBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    }):Play()
end)

local ServerScroll = Instance.new("ScrollingFrame")
ServerScroll.Size = UDim2.new(1, 0, 0, 220)
ServerScroll.BackgroundTransparency = 1
ServerScroll.BorderSizePixel = 0
ServerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ServerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ServerScroll.ScrollingDirection = Enum.ScrollingDirection.Y
ServerScroll.ScrollBarThickness = 4
ServerScroll.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 220)
ServerScroll.ScrollBarImageTransparency = 0.1
ServerScroll.LayoutOrder = 3
ServerScroll.Parent = HopServerPage

local ServerListLayout = Instance.new("UIListLayout")
ServerListLayout.Padding = UDim.new(0, 4)
ServerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ServerListLayout.Parent = ServerScroll

local function ClearList()
    for _, child in ipairs(ServerScroll:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

local function CreateEntry(index, server)
    local Entry = Instance.new("Frame")
    Entry.Size = UDim2.new(1, -6, 0, 52)
    Entry.BackgroundColor3 = Color3.fromRGB(28, 29, 42)
    Entry.BorderSizePixel = 0
    Entry.LayoutOrder = index
    Entry.Parent = ServerScroll

    local EntryCorner = Instance.new("UICorner")
    EntryCorner.CornerRadius = UDim.new(0, 6)
    EntryCorner.Parent = Entry

    local EntryStroke = Instance.new("UIStroke")
    EntryStroke.Color = Color3.fromRGB(105, 90, 190)
    EntryStroke.Thickness = 1
    EntryStroke.Transparency = 0.6
    EntryStroke.Parent = Entry

    local IndexLabel = Instance.new("TextLabel")
    IndexLabel.Size = UDim2.new(0, 26, 1, 0)
    IndexLabel.Position = UDim2.new(0, 6, 0, 0)
    IndexLabel.BackgroundTransparency = 1
    IndexLabel.Text = tostring(index)
    IndexLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    IndexLabel.TextSize = 14
    IndexLabel.Font = Enum.Font.GothamBold
    IndexLabel.TextXAlignment = Enum.TextXAlignment.Center
    IndexLabel.TextYAlignment = Enum.TextYAlignment.Center
    IndexLabel.Parent = Entry

    local JobLabel = Instance.new("TextLabel")
    JobLabel.Size = UDim2.new(1, -110, 1, 0)
    JobLabel.Position = UDim2.new(0, 36, 0, 0)
    JobLabel.BackgroundTransparency = 1
    JobLabel.Text = "Jobid : " .. server.id
    JobLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    JobLabel.TextSize = 11
    JobLabel.Font = Enum.Font.GothamMedium
    JobLabel.TextXAlignment = Enum.TextXAlignment.Left
    JobLabel.TextYAlignment = Enum.TextYAlignment.Center
    JobLabel.TextTruncate = Enum.TextTruncate.AtEnd
    JobLabel.Parent = Entry

    local JoinBtn = Instance.new("TextButton")
    JoinBtn.Size = UDim2.new(0, 60, 0, 30)
    JoinBtn.Position = UDim2.new(1, -68, 0.5, -15)
    JoinBtn.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    JoinBtn.BorderSizePixel = 0
    JoinBtn.Text = "Join"
    JoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    JoinBtn.TextSize = 12
    JoinBtn.Font = Enum.Font.GothamBold
    JoinBtn.AutoButtonColor = false
    JoinBtn.Parent = Entry

    local JoinCorner = Instance.new("UICorner")
    JoinCorner.CornerRadius = UDim.new(0, 6)
    JoinCorner.Parent = JoinBtn

    local JoinStroke = Instance.new("UIStroke")
    JoinStroke.Color = Color3.fromRGB(140, 125, 240)
    JoinStroke.Thickness = 1.5
    JoinStroke.Transparency = 0.3
    JoinStroke.Parent = JoinBtn

    JoinBtn.MouseEnter:Connect(function()
        TweenService:Create(JoinBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(125, 110, 220)
        }):Play()
    end)

    JoinBtn.MouseLeave:Connect(function()
        TweenService:Create(JoinBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        }):Play()
    end)

    JoinBtn.MouseButton1Click:Connect(function()
        FeatureStatus.Text = "Teleporting to server..."
        FeatureStatus.TextColor3 = Color3.fromRGB(0, 255, 105)

        local success, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(PLACE_ID, server.id, game.Players.LocalPlayer)
        end)

        if not success then
            FeatureStatus.Text = "Failed: " .. tostring(err)
            FeatureStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end

local function FetchServers()
    local allServers = {}
    local seen = {}
    local cursor = ""
    local pageCount = 0
    local maxPages = 5

    repeat
        pageCount = pageCount + 1

        local url = string.format(
            "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&cursor=%s",
            PLACE_ID,
            cursor

        local success, response = pcall(function()
        end)

        if not success or not response or not response.data then
            break
        end

        for _, server in ipairs(response.data) do
            if server.playing == 1
               and server.id ~= game.JobId
               and server.maxPlayers > 1
               and server.playing < server.maxPlayers then
                if not seen[server.id] then
                    seen[server.id] = true
                    table.insert(allServers, server)
                end
            end
        end

        cursor = response.next_cursor or ""
        task.wait(0.15)

    until cursor == "" or pageCount >= maxPages

    return allServers
end

ClickBtn.MouseButton1Click:Connect(function()
    FeatureStatus.Text = "Searching fresh servers..."
    FeatureStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
    ClearList()

    local servers = FetchServers()

    if #servers == 0 then
        FeatureStatus.Text = "No servers with 1 player found."
        FeatureStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    table.sort(servers, function(a, b)
        return a.id < b.id
    end)

    for i, server in ipairs(servers) do
        CreateEntry(i, server)
    end

    FeatureStatus.Text = "Found " .. #servers .. " server(s) with 1 player."
    FeatureStatus.TextColor3 = Color3.fromRGB(0, 255, 105)
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Tabs/Setting.lua"] = [=[

local TabsManager = _G.YOKUDO_TabsManager
local TweenService = game:GetService("TweenService")

local SettingTab, SettingPage = TabsManager:RegisterTab("Setting", 7, "SETTING")

CreateSectionTitle(SettingPage, "Settings", 1)

local MethodHolder = Instance.new("Frame")
MethodHolder.Size = UDim2.new(1, 0, 0, 52)
MethodHolder.BackgroundTransparency = 1
MethodHolder.LayoutOrder = 2
MethodHolder.ZIndex = 100
MethodHolder.Parent = SettingPage

local MethodLabel = Instance.new("TextLabel")
MethodLabel.Size = UDim2.new(1, -120, 0, 20)
MethodLabel.Position = UDim2.new(0, 0, 0, 2)
MethodLabel.BackgroundTransparency = 1
MethodLabel.Text = "Select Method Teleport"
MethodLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MethodLabel.TextSize = 13
MethodLabel.TextXAlignment = Enum.TextXAlignment.Left
MethodLabel.TextYAlignment = Enum.TextYAlignment.Center
MethodLabel.Font = Enum.Font.GothamBold
MethodLabel.ZIndex = 101
MethodLabel.Parent = MethodHolder

local MethodTitle = Instance.new("TextLabel")
MethodTitle.Size = UDim2.new(1, -120, 0, 18)
MethodTitle.Position = UDim2.new(0, 0, 0, 24)
MethodTitle.BackgroundTransparency = 1
MethodTitle.Text = "TeleportFly or InstantTeleport"
MethodTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
MethodTitle.TextSize = 10
MethodTitle.TextXAlignment = Enum.TextXAlignment.Left
MethodTitle.Font = Enum.Font.Gotham
MethodTitle.ZIndex = 101
MethodTitle.Parent = MethodHolder

local SelectedMethod = _G.YOKUDO_SelectedMethod or "TeleportFly"

local DropdownBtn = Instance.new("TextButton")
DropdownBtn.Size = UDim2.new(0, 110, 0, 28)
DropdownBtn.Position = UDim2.new(1, -110, 0.5, -14)
DropdownBtn.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
DropdownBtn.BorderSizePixel = 0
DropdownBtn.Text = SelectedMethod .. " ▼"
DropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.TextSize = 11
DropdownBtn.Font = Enum.Font.GothamBold
DropdownBtn.AutoButtonColor = false
DropdownBtn.ZIndex = 101
DropdownBtn.Parent = MethodHolder

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 6)
DropdownCorner.Parent = DropdownBtn

local DropdownStroke = Instance.new("UIStroke")
DropdownStroke.Color = Color3.fromRGB(200, 200, 220)
DropdownStroke.Thickness = 1
DropdownStroke.Transparency = 0.3
DropdownStroke.Parent = DropdownBtn

local DropdownList = Instance.new("Frame")
DropdownList.Size = UDim2.new(0, 110, 0, 60)
DropdownList.Position = UDim2.new(1, -110, 1, 2)
DropdownList.BackgroundColor3 = Color3.fromRGB(25, 26, 38)
DropdownList.BorderSizePixel = 0
DropdownList.Visible = false
DropdownList.ZIndex = 200
DropdownList.Parent = MethodHolder

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 6)
ListCorner.Parent = DropdownList

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(200, 200, 220)
ListStroke.Thickness = 1
ListStroke.Transparency = 0.3
ListStroke.Parent = DropdownList

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 2)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = DropdownList

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 4)
ListPadding.PaddingBottom = UDim.new(0, 4)
ListPadding.PaddingLeft = UDim.new(0, 4)
ListPadding.PaddingRight = UDim.new(0, 4)
ListPadding.Parent = DropdownList

local function CreateOption(Name, Order)
    local Option = Instance.new("TextButton")
    Option.Size = UDim2.new(1, 0, 0, 22)
    Option.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
    Option.BorderSizePixel = 0
    Option.Text = Name
    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    Option.TextSize = 11
    Option.Font = Enum.Font.GothamMedium
    Option.AutoButtonColor = false
    Option.LayoutOrder = Order
    Option.ZIndex = 201
    Option.Parent = DropdownList

    local OptionCorner = Instance.new("UICorner")
    OptionCorner.CornerRadius = UDim.new(0, 4)
    OptionCorner.Parent = Option

    Option.MouseButton1Click:Connect(function()
        SelectedMethod = Name
        DropdownBtn.Text = Name .. " ▼"
        DropdownList.Visible = false

        _G.YOKUDO_SelectedMethod = Name

        if _G.YOKUDO_ConfigSystem then
            _G.YOKUDO_ConfigSystem.Save()
        end

        print("leak by https://discord.gg/TBBAUZu8cW")
    end)

    Option.MouseEnter:Connect(function()
        TweenService:Create(Option, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(45, 46, 60)
        }):Play()
    end)

    Option.MouseLeave:Connect(function()
        TweenService:Create(Option, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(30, 31, 45)
        }):Play()
    end)
end

CreateOption("TeleportFly", 1)
CreateOption("InstantTeleport", 2)

DropdownBtn.MouseButton1Click:Connect(function()
    DropdownList.Visible = not DropdownList.Visible
end)

if _G.YOKUDO_SelectedMethod == nil then
    _G.YOKUDO_SelectedMethod = "TeleportFly"
end

local SpeedHolder = Instance.new("Frame")
SpeedHolder.Size = UDim2.new(1, 0, 0, 52)
SpeedHolder.BackgroundTransparency = 1
SpeedHolder.LayoutOrder = 3
SpeedHolder.ZIndex = 1
SpeedHolder.Parent = SettingPage

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, -120, 0, 20)
SpeedLabel.Position = UDim2.new(0, 0, 0, 2)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Teleport Speed"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 13
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.TextYAlignment = Enum.TextYAlignment.Center
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.ZIndex = 2
SpeedLabel.Parent = SpeedHolder

local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Size = UDim2.new(1, -120, 0, 18)
SpeedTitle.Position = UDim2.new(0, 0, 0, 24)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "Range: 50 - 1100 (Default: 300)"
SpeedTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SpeedTitle.TextSize = 10
SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
SpeedTitle.Font = Enum.Font.Gotham
SpeedTitle.ZIndex = 2
SpeedTitle.Parent = SpeedHolder

local InitialSpeed = _G.YOKUDO_TeleportSpeed or 300

local SpeedTextBox = Instance.new("TextBox")
SpeedTextBox.Size = UDim2.new(0, 80, 0, 28)
SpeedTextBox.Position = UDim2.new(1, -80, 0.5, -14)
SpeedTextBox.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
SpeedTextBox.BorderSizePixel = 0
SpeedTextBox.Text = tostring(InitialSpeed)
SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTextBox.TextSize = 12
SpeedTextBox.TextXAlignment = Enum.TextXAlignment.Center
SpeedTextBox.Font = Enum.Font.GothamBold
SpeedTextBox.ZIndex = 2
SpeedTextBox.Parent = SpeedHolder

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedTextBox

local SpeedStroke = Instance.new("UIStroke")
SpeedStroke.Color = Color3.fromRGB(200, 200, 220)
SpeedStroke.Thickness = 1
SpeedStroke.Transparency = 0.3
SpeedStroke.Parent = SpeedTextBox

local IsEditingSpeed = false

SpeedTextBox.Focused:Connect(function()
    IsEditingSpeed = true
end)

SpeedTextBox.FocusLost:Connect(function()
    IsEditingSpeed = false

    local Value = tonumber(SpeedTextBox.Text)

    if Value then
        Value = math.clamp(Value, 50, 1100)
        SpeedTextBox.Text = tostring(Value)

        _G.YOKUDO_TeleportSpeed = Value

        if _G.YOKUDO_TeleportSystem then
            _G.YOKUDO_TeleportSystem.SetSpeed(Value)
        end

        if _G.YOKUDO_ConfigSystem then
            _G.YOKUDO_ConfigSystem.Save()
        end

        print("leak by https://discord.gg/TBBAUZu8cW"))
    else
        SpeedTextBox.Text = "300"
        _G.YOKUDO_TeleportSpeed = 300

        if _G.YOKUDO_TeleportSystem then
            _G.YOKUDO_TeleportSystem.SetSpeed(300)
        end

        if _G.YOKUDO_ConfigSystem then
            _G.YOKUDO_ConfigSystem.Save()
        end
    end
end)

if _G.YOKUDO_TeleportSpeed == nil then
    _G.YOKUDO_TeleportSpeed = 300
end

local WalkSpeedHolder = Instance.new("Frame")
WalkSpeedHolder.Size = UDim2.new(1, 0, 0, 32)
WalkSpeedHolder.BackgroundTransparency = 1
WalkSpeedHolder.LayoutOrder = 4
WalkSpeedHolder.Parent = SettingPage

local WalkSpeedLabel = Instance.new("TextLabel")
WalkSpeedLabel.Size = UDim2.new(0, 100, 1, 0)
WalkSpeedLabel.BackgroundTransparency = 1
WalkSpeedLabel.Text = "Walk Speed"
WalkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedLabel.TextSize = 12
WalkSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
WalkSpeedLabel.TextYAlignment = Enum.TextYAlignment.Center
WalkSpeedLabel.Font = Enum.Font.GothamMedium
WalkSpeedLabel.Parent = WalkSpeedHolder

local WalkSpeedTextBox = Instance.new("TextBox")
WalkSpeedTextBox.Size = UDim2.new(0, 40, 1, -6)
WalkSpeedTextBox.Position = UDim2.new(0, 105, 0, 3)
WalkSpeedTextBox.BackgroundColor3 = Color3.fromRGB(30, 31, 45)
WalkSpeedTextBox.BorderSizePixel = 0
WalkSpeedTextBox.Text = "50"
WalkSpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedTextBox.TextSize = 12
WalkSpeedTextBox.TextXAlignment = Enum.TextXAlignment.Center
WalkSpeedTextBox.TextYAlignment = Enum.TextYAlignment.Center
WalkSpeedTextBox.Font = Enum.Font.GothamMedium
WalkSpeedTextBox.Parent = WalkSpeedHolder

local WalkSpeedBoxCorner = Instance.new("UICorner")
WalkSpeedBoxCorner.CornerRadius = UDim.new(0, 4)
WalkSpeedBoxCorner.Parent = WalkSpeedTextBox

local WalkSpeedBoxStroke = Instance.new("UIStroke")
WalkSpeedBoxStroke.Color = Color3.fromRGB(200, 200, 220)
WalkSpeedBoxStroke.Thickness = 0.5
WalkSpeedBoxStroke.Transparency = 0.2
WalkSpeedBoxStroke.Parent = WalkSpeedTextBox

local WalkSpeedCheckButton = Instance.new("TextButton")
WalkSpeedCheckButton.Size = UDim2.new(0, 26, 0, 26)
WalkSpeedCheckButton.Position = UDim2.new(1, -26, 0.5, -13)
WalkSpeedCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
WalkSpeedCheckButton.BorderSizePixel = 0
WalkSpeedCheckButton.Text = ""
WalkSpeedCheckButton.AutoButtonColor = false
WalkSpeedCheckButton.Parent = WalkSpeedHolder

local WalkSpeedCorner = Instance.new("UICorner")
WalkSpeedCorner.CornerRadius = UDim.new(0, 6)
WalkSpeedCorner.Parent = WalkSpeedCheckButton

local WalkSpeedStroke = Instance.new("UIStroke")
WalkSpeedStroke.Color = Color3.fromRGB(200, 200, 220)
WalkSpeedStroke.Thickness = 1.5
WalkSpeedStroke.Parent = WalkSpeedCheckButton

local WalkSpeedCheck = Instance.new("TextLabel")
WalkSpeedCheck.Size = UDim2.new(1, 0, 1, 0)
WalkSpeedCheck.BackgroundTransparency = 1
WalkSpeedCheck.Text = "✓"
WalkSpeedCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedCheck.TextSize = 18
WalkSpeedCheck.Font = Enum.Font.GothamBold
WalkSpeedCheck.Visible = false
WalkSpeedCheck.Parent = WalkSpeedCheckButton

local WalkSpeedEnabled = false
local WalkSpeedValue = 50

local function ToggleWalkSpeed()
    WalkSpeedEnabled = not WalkSpeedEnabled
    WalkSpeedCheck.Visible = WalkSpeedEnabled
    if WalkSpeedEnabled then
        WalkSpeedCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        WalkSpeedStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_WalkSpeed then
            _G.YOKUDO_WalkSpeed.SetValue(WalkSpeedValue)
            _G.YOKUDO_WalkSpeed.Enable()
        end
    else
        WalkSpeedCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        WalkSpeedStroke.Color = Color3.fromRGB(200, 200, 220)
        if _G.YOKUDO_WalkSpeed then
            _G.YOKUDO_WalkSpeed.Disable()
        end
    end
end

WalkSpeedCheckButton.MouseButton1Click:Connect(function()
    ToggleWalkSpeed()
end)

WalkSpeedTextBox.FocusLost:Connect(function()
    local val = tonumber(WalkSpeedTextBox.Text)
    if val then
        WalkSpeedValue = math.clamp(val, 50, 1000)
        WalkSpeedTextBox.Text = tostring(WalkSpeedValue)
        if WalkSpeedEnabled and _G.YOKUDO_WalkSpeed then
            _G.YOKUDO_WalkSpeed.SetValue(WalkSpeedValue)
        end
    else
        WalkSpeedTextBox.Text = tostring(WalkSpeedValue)
    end
end)

local AntiTrapHolder = Instance.new("Frame")
AntiTrapHolder.Size = UDim2.new(1, 0, 0, 52)
AntiTrapHolder.BackgroundTransparency = 1
AntiTrapHolder.LayoutOrder = 5
AntiTrapHolder.Parent = SettingPage

local AntiTrapLabel = Instance.new("TextLabel")
AntiTrapLabel.Size = UDim2.new(1, -50, 0, 20)
AntiTrapLabel.Position = UDim2.new(0, 0, 0, 2)
AntiTrapLabel.BackgroundTransparency = 1
AntiTrapLabel.Text = "Anti Trap"
AntiTrapLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiTrapLabel.TextSize = 13
AntiTrapLabel.TextXAlignment = Enum.TextXAlignment.Left
AntiTrapLabel.TextYAlignment = Enum.TextYAlignment.Center
AntiTrapLabel.Font = Enum.Font.GothamBold
AntiTrapLabel.Parent = AntiTrapHolder

local AntiTrapTitle = Instance.new("TextLabel")
AntiTrapTitle.Size = UDim2.new(1, -50, 0, 18)
AntiTrapTitle.Position = UDim2.new(0, 0, 0, 24)
AntiTrapTitle.BackgroundTransparency = 1
AntiTrapTitle.Text = "click for remove Trap"
AntiTrapTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
AntiTrapTitle.TextSize = 10
AntiTrapTitle.TextXAlignment = Enum.TextXAlignment.Left
AntiTrapTitle.Font = Enum.Font.Gotham
AntiTrapTitle.Parent = AntiTrapHolder

local AntiTrapCheckButton = Instance.new("TextButton")
AntiTrapCheckButton.Size = UDim2.new(0, 26, 0, 26)
AntiTrapCheckButton.Position = UDim2.new(1, -26, 0.5, -13)
AntiTrapCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
AntiTrapCheckButton.BorderSizePixel = 0
AntiTrapCheckButton.Text = ""
AntiTrapCheckButton.AutoButtonColor = false
AntiTrapCheckButton.Parent = AntiTrapHolder

local AntiTrapCorner = Instance.new("UICorner")
AntiTrapCorner.CornerRadius = UDim.new(0, 6)
AntiTrapCorner.Parent = AntiTrapCheckButton

local AntiTrapStroke = Instance.new("UIStroke")
AntiTrapStroke.Color = Color3.fromRGB(200, 200, 220)
AntiTrapStroke.Thickness = 1.5
AntiTrapStroke.Parent = AntiTrapCheckButton

local AntiTrapCheck = Instance.new("TextLabel")
AntiTrapCheck.Size = UDim2.new(1, 0, 1, 0)
AntiTrapCheck.BackgroundTransparency = 1
AntiTrapCheck.Text = "✓"
AntiTrapCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiTrapCheck.TextSize = 18
AntiTrapCheck.Font = Enum.Font.GothamBold
AntiTrapCheck.Visible = false
AntiTrapCheck.Parent = AntiTrapCheckButton

local AntiTrapEnabled = false

local function ToggleAntiTrap()
    AntiTrapEnabled = not AntiTrapEnabled
    AntiTrapCheck.Visible = AntiTrapEnabled
    if AntiTrapEnabled then
        AntiTrapCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        AntiTrapStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_AntiTrap then
            _G.YOKUDO_AntiTrap.Enable()
        end
    else
        AntiTrapCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        AntiTrapStroke.Color = Color3.fromRGB(200, 200, 220)
        if _G.YOKUDO_AntiTrap then
            _G.YOKUDO_AntiTrap.Disable()
        end
    end
end

AntiTrapCheckButton.MouseButton1Click:Connect(function()
    ToggleAntiTrap()
end)

local GodModeHolder = Instance.new("Frame")
GodModeHolder.Size = UDim2.new(1, 0, 0, 52)
GodModeHolder.BackgroundTransparency = 1
GodModeHolder.LayoutOrder = 6
GodModeHolder.Parent = SettingPage

local GodModeLabel = Instance.new("TextLabel")
GodModeLabel.Size = UDim2.new(1, -90, 0, 20)
GodModeLabel.Position = UDim2.new(0, 0, 0, 2)
GodModeLabel.BackgroundTransparency = 1
GodModeLabel.Text = "God Mode"
GodModeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GodModeLabel.TextSize = 13
GodModeLabel.TextXAlignment = Enum.TextXAlignment.Left
GodModeLabel.TextYAlignment = Enum.TextYAlignment.Center
GodModeLabel.Font = Enum.Font.GothamBold
GodModeLabel.Parent = GodModeHolder

local GodModeTitle = Instance.new("TextLabel")
GodModeTitle.Size = UDim2.new(1, -90, 0, 18)
GodModeTitle.Position = UDim2.new(0, 0, 0, 24)
GodModeTitle.BackgroundTransparency = 1
GodModeTitle.Text = "When Character Dead click God Mode"
GodModeTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
GodModeTitle.TextSize = 10
GodModeTitle.TextXAlignment = Enum.TextXAlignment.Left
GodModeTitle.Font = Enum.Font.Gotham
GodModeTitle.Parent = GodModeHolder

local GodModeButton = Instance.new("TextButton")
GodModeButton.Size = UDim2.new(0, 70, 0, 26)
GodModeButton.Position = UDim2.new(1, -70, 0.5, -13)
GodModeButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
GodModeButton.BorderSizePixel = 0
GodModeButton.Text = "Click"
GodModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GodModeButton.TextSize = 12
GodModeButton.Font = Enum.Font.GothamBold
GodModeButton.AutoButtonColor = false
GodModeButton.Parent = GodModeHolder

local GodModeCorner = Instance.new("UICorner")
GodModeCorner.CornerRadius = UDim.new(0, 6)
GodModeCorner.Parent = GodModeButton

local GodModeStroke = Instance.new("UIStroke")
GodModeStroke.Color = Color3.fromRGB(140, 125, 240)
GodModeStroke.Thickness = 1.5
GodModeStroke.Transparency = 0.3
GodModeStroke.Parent = GodModeButton

GodModeButton.MouseEnter:Connect(function()
    TweenService:Create(GodModeButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(125, 110, 220)
    }):Play()
end)

GodModeButton.MouseLeave:Connect(function()
    TweenService:Create(GodModeButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    }):Play()
end)

local function ShowNotification(Text)
    local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Name = "YokudoNotify"
    NotifyGui.ResetOnSpawn = false
    NotifyGui.DisplayOrder = 999
    NotifyGui.Parent = PlayerGui

    local NotifyFrame = Instance.new("Frame")
    NotifyFrame.Size = UDim2.new(0, 220, 0, 50)
    NotifyFrame.Position = UDim2.new(0, -250, 0, 20)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyFrame.BackgroundTransparency = 0.85
    NotifyFrame.BorderSizePixel = 0
    NotifyFrame.Parent = NotifyGui

    local NotifyCorner = Instance.new("UICorner")
    NotifyCorner.CornerRadius = UDim.new(0, 10)
    NotifyCorner.Parent = NotifyFrame

    local NotifyStroke = Instance.new("UIStroke")
    NotifyStroke.Color = Color3.fromRGB(255, 255, 255)
    NotifyStroke.Thickness = 1
    NotifyStroke.Transparency = 0.7
    NotifyStroke.Parent = NotifyFrame

    local NotifyText = Instance.new("TextLabel")
    NotifyText.Size = UDim2.new(1, -20, 1, 0)
    NotifyText.Position = UDim2.new(0, 10, 0, 0)
    NotifyText.BackgroundTransparency = 1
    NotifyText.Text = Text
    NotifyText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifyText.TextSize = 13
    NotifyText.TextXAlignment = Enum.TextXAlignment.Left
    NotifyText.TextYAlignment = Enum.TextYAlignment.Center
    NotifyText.Font = Enum.Font.GothamBold
    NotifyText.Parent = NotifyFrame

    TweenService:Create(NotifyFrame, TweenInfo.new(0.4), {
        Position = UDim2.new(0, 20, 0, 20)
    }):Play()

    task.wait(5)

    TweenService:Create(NotifyFrame, TweenInfo.new(0.3), {
        Position = UDim2.new(0, -250, 0, 20),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(NotifyText, TweenInfo.new(0.3), {
        TextTransparency = 1
    }):Play()
    TweenService:Create(NotifyStroke, TweenInfo.new(0.3), {
        Transparency = 1
    }):Play()

    task.wait(0.3)
    NotifyGui:Destroy()
end

GodModeButton.MouseButton1Down:Connect(function()
    TweenService:Create(GodModeButton, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 62, 0, 23),
        BackgroundColor3 = Color3.fromRGB(85, 70, 170)
    }):Play()
end)

GodModeButton.MouseButton1Up:Connect(function()
    TweenService:Create(GodModeButton, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 70, 0, 26),
        BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    }):Play()
end)

GodModeButton.MouseButton1Click:Connect(function()
    if _G.YOKUDO_GodMode then
        _G.YOKUDO_GodMode.Enable()
    end
    ShowNotification("God Mode Start")
end)

local FastClickHolder = Instance.new("Frame")
FastClickHolder.Size = UDim2.new(1, 0, 0, 52)
FastClickHolder.BackgroundTransparency = 1
FastClickHolder.LayoutOrder = 7
FastClickHolder.Parent = SettingPage

local FastClickLabel = Instance.new("TextLabel")
FastClickLabel.Size = UDim2.new(1, -90, 0, 20)
FastClickLabel.Position = UDim2.new(0, 0, 0, 2)
FastClickLabel.BackgroundTransparency = 1
FastClickLabel.Text = "Manual Fast Click"
FastClickLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FastClickLabel.TextSize = 13
FastClickLabel.TextXAlignment = Enum.TextXAlignment.Left
FastClickLabel.TextYAlignment = Enum.TextYAlignment.Center
FastClickLabel.Font = Enum.Font.GothamBold
FastClickLabel.Parent = FastClickHolder

local FastClickTitle = Instance.new("TextLabel")
FastClickTitle.Size = UDim2.new(1, -90, 0, 18)
FastClickTitle.Position = UDim2.new(0, 0, 0, 24)
FastClickTitle.BackgroundTransparency = 1
FastClickTitle.Text = "Enable Click Egg Fast by hand"
FastClickTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
FastClickTitle.TextSize = 10
FastClickTitle.TextXAlignment = Enum.TextXAlignment.Left
FastClickTitle.Font = Enum.Font.Gotham
FastClickTitle.Parent = FastClickHolder

local FastClickButton = Instance.new("TextButton")
FastClickButton.Size = UDim2.new(0, 70, 0, 26)
FastClickButton.Position = UDim2.new(1, -70, 0.5, -13)
FastClickButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
FastClickButton.BorderSizePixel = 0
FastClickButton.Text = "Click"
FastClickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FastClickButton.TextSize = 12
FastClickButton.Font = Enum.Font.GothamBold
FastClickButton.AutoButtonColor = false
FastClickButton.Parent = FastClickHolder

local FastClickCorner = Instance.new("UICorner")
FastClickCorner.CornerRadius = UDim.new(0, 6)
FastClickCorner.Parent = FastClickButton

local FastClickStroke = Instance.new("UIStroke")
FastClickStroke.Color = Color3.fromRGB(140, 125, 240)
FastClickStroke.Thickness = 1.5
FastClickStroke.Transparency = 0.3
FastClickStroke.Parent = FastClickButton

FastClickButton.MouseEnter:Connect(function()
    TweenService:Create(FastClickButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(125, 110, 220)
    }):Play()
end)

FastClickButton.MouseLeave:Connect(function()
    TweenService:Create(FastClickButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    }):Play()
end)

FastClickButton.MouseButton1Down:Connect(function()
    TweenService:Create(FastClickButton, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 62, 0, 23),
        BackgroundColor3 = Color3.fromRGB(85, 70, 170)
    }):Play()
end)

FastClickButton.MouseButton1Up:Connect(function()
    TweenService:Create(FastClickButton, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 70, 0, 26),
        BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    }):Play()
end)

FastClickButton.MouseButton1Click:Connect(function()
    if not _G.YOKUDO_ManualFastClick then
        print("leak by https://discord.gg/TBBAUZu8cW")
        ShowNotification("Manual Fast Click Not Loaded")
        return
    end

    if _G.YOKUDO_ManualFastClick.IsEnabled() then
        _G.YOKUDO_ManualFastClick.Disable()
        ShowNotification("Manual Fast Click Stop")
    else
        _G.YOKUDO_ManualFastClick.Enable()
        ShowNotification("Manual Fast Click Start")
    end
end)

task.spawn(function()
    task.wait(0.5)
    if _G.YOKUDO_ManualFastClick then
        if _G.YOKUDO_ManualFastClick.IsEnabled() then
            FastClickButton.Text = "Stop"
        else
            FastClickButton.Text = "Click"
        end
    end
end)

local AntiAFKHolder = Instance.new("Frame")
AntiAFKHolder.Size = UDim2.new(1, 0, 0, 52)
AntiAFKHolder.BackgroundTransparency = 1
AntiAFKHolder.LayoutOrder = 8
AntiAFKHolder.Parent = SettingPage

local AntiAFKLabel = Instance.new("TextLabel")
AntiAFKLabel.Size = UDim2.new(1, -50, 0, 20)
AntiAFKLabel.Position = UDim2.new(0, 0, 0, 2)
AntiAFKLabel.BackgroundTransparency = 1
AntiAFKLabel.Text = "Anti AFK"
AntiAFKLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFKLabel.TextSize = 13
AntiAFKLabel.TextXAlignment = Enum.TextXAlignment.Left
AntiAFKLabel.TextYAlignment = Enum.TextYAlignment.Center
AntiAFKLabel.Font = Enum.Font.GothamBold
AntiAFKLabel.Parent = AntiAFKHolder

local AntiAFKTitle = Instance.new("TextLabel")
AntiAFKTitle.Size = UDim2.new(1, -50, 0, 18)
AntiAFKTitle.Position = UDim2.new(0, 0, 0, 24)
AntiAFKTitle.BackgroundTransparency = 1
AntiAFKTitle.Text = "Click when AFK"
AntiAFKTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
AntiAFKTitle.TextSize = 10
AntiAFKTitle.TextXAlignment = Enum.TextXAlignment.Left
AntiAFKTitle.Font = Enum.Font.Gotham
AntiAFKTitle.Parent = AntiAFKHolder

local AntiAFKCheckButton = Instance.new("TextButton")
AntiAFKCheckButton.Size = UDim2.new(0, 26, 0, 26)
AntiAFKCheckButton.Position = UDim2.new(1, -26, 0.5, -13)
AntiAFKCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
AntiAFKCheckButton.BorderSizePixel = 0
AntiAFKCheckButton.Text = ""
AntiAFKCheckButton.AutoButtonColor = false
AntiAFKCheckButton.Parent = AntiAFKHolder

local AntiAFKCorner = Instance.new("UICorner")
AntiAFKCorner.CornerRadius = UDim.new(0, 6)
AntiAFKCorner.Parent = AntiAFKCheckButton

local AntiAFKStroke = Instance.new("UIStroke")
AntiAFKStroke.Color = Color3.fromRGB(200, 200, 220)
AntiAFKStroke.Thickness = 1.5
AntiAFKStroke.Parent = AntiAFKCheckButton

local AntiAFKCheck = Instance.new("TextLabel")
AntiAFKCheck.Size = UDim2.new(1, 0, 1, 0)
AntiAFKCheck.BackgroundTransparency = 1
AntiAFKCheck.Text = "✓"
AntiAFKCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFKCheck.TextSize = 18
AntiAFKCheck.Font = Enum.Font.GothamBold
AntiAFKCheck.Visible = false
AntiAFKCheck.Parent = AntiAFKCheckButton

local AntiAFKEnabled = false

local function ToggleAntiAFK()
    AntiAFKEnabled = not AntiAFKEnabled
    AntiAFKCheck.Visible = AntiAFKEnabled
    if AntiAFKEnabled then
        AntiAFKCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
        AntiAFKStroke.Color = Color3.fromRGB(135, 120, 225)
        if _G.YOKUDO_AntiAFK then
            _G.YOKUDO_AntiAFK.Enable()
        end
    else
        AntiAFKCheckButton.BackgroundColor3 = Color3.fromRGB(28, 29, 39)
        AntiAFKStroke.Color = Color3.fromRGB(200, 200, 220)
        if _G.YOKUDO_AntiAFK then
            _G.YOKUDO_AntiAFK.Disable()
        end
    end
end

AntiAFKCheckButton.MouseButton1Click:Connect(function()
    ToggleAntiAFK()
end)

task.spawn(function()
    task.wait(0.5)

    if _G.YOKUDO_SelectedMethod then
        SelectedMethod = _G.YOKUDO_SelectedMethod
        DropdownBtn.Text = SelectedMethod .. " ▼"
    end

    if _G.YOKUDO_TeleportSpeed then
        SpeedTextBox.Text = tostring(_G.YOKUDO_TeleportSpeed)
    end

    if _G.YOKUDO_AntiAFK then
        if _G.YOKUDO_AntiAFK.IsEnabled() then
            AntiAFKEnabled = true
            AntiAFKCheck.Visible = true
            AntiAFKCheckButton.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
            AntiAFKStroke.Color = Color3.fromRGB(135, 120, 225)
        end
    end
end)

print("leak by https://discord.gg/TBBAUZu8cW")

]=]

_MERGED["Features/BypassAntiCheat.lua"] = [=[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local BypassEnabled = true
local ReapplyThread = nil
local DiedConnection = nil
local CharacterConnection = nil

local function RunBypassAntiCheat()
    local Character = Player.Character
    if not Character then return end

    local OldHumanoid = Character:FindFirstChildOfClass("Humanoid")
    if not OldHumanoid then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    local ExistingBypass = OldHumanoid:GetAttribute("YokudoBypass")
    if ExistingBypass then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")

    local GodMode = true

    local SavedJumpProperties = {}

    local function SaveJumpProperty(Property)
        local Success, Value = pcall(function()
            return OldHumanoid[Property]
        end)
        if Success then
            SavedJumpProperties[Property] = Value
        end
    end

    SaveJumpProperty("JumpPower")
    SaveJumpProperty("JumpHeight")
    SaveJumpProperty("UseJumpPower")

    local SavedEvaluateStateMachine
    pcall(function()
        SavedEvaluateStateMachine = OldHumanoid.EvaluateStateMachine
    end)

    local SavedStates = {}
    local States = {
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Running,
        Enum.HumanoidStateType.RunningNoPhysics,
        Enum.HumanoidStateType.Climbing,
        Enum.HumanoidStateType.StrafingNoPhysics,
        Enum.HumanoidStateType.Ragdoll,
        Enum.HumanoidStateType.GettingUp,
        Enum.HumanoidStateType.Jumping,
        Enum.HumanoidStateType.Landed,
        Enum.HumanoidStateType.Flying,
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.Seated,
        Enum.HumanoidStateType.PlatformStanding,
        Enum.HumanoidStateType.Dead,
        Enum.HumanoidStateType.Swimming,
        Enum.HumanoidStateType.Physics,

    for _, State in ipairs(States) do
        local Success, Enabled = pcall(function()
            return OldHumanoid:GetStateEnabled(State)
        end)
        if Success then
            SavedStates[State] = Enabled
        end
    end

    local NewHumanoid = OldHumanoid:Clone()
    if not NewHumanoid then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end
    NewHumanoid.Name = OldHumanoid.Name

    NewHumanoid:SetAttribute("YokudoBypass", true)

    for _, Child in ipairs(OldHumanoid:GetChildren()) do
        local ExistingCloneChild = NewHumanoid:FindFirstChild(Child.Name)
        if ExistingCloneChild then
            pcall(function()
                ExistingCloneChild:Destroy()
            end)
        end
        pcall(function()
            Child.Parent = NewHumanoid
        end)
    end

    OldHumanoid:Destroy()
    task.wait()
    NewHumanoid.Parent = Character
    task.wait()

    if not NewHumanoid.Parent then
        print("leak by https://discord.gg/TBBAUZu8cW")
        return
    end

    print("leak by https://discord.gg/TBBAUZu8cW")

    if _G.YOKUDO_CharacterSystem then
        _G.YOKUDO_CharacterSystem.CurrentHumanoid = NewHumanoid
        _G.YOKUDO_CharacterSystem.CurrentRoot = Character:FindFirstChild("HumanoidRootPart")
        print("leak by https://discord.gg/TBBAUZu8cW")
    end

    pcall(function()
        NewHumanoid.UseJumpPower = SavedJumpProperties.UseJumpPower
    end)
    pcall(function()
        NewHumanoid.JumpPower = SavedJumpProperties.JumpPower
    end)
    pcall(function()
        NewHumanoid.JumpHeight = SavedJumpProperties.JumpHeight
    end)

    pcall(function()
        if SavedEvaluateStateMachine ~= nil then
            NewHumanoid.EvaluateStateMachine = SavedEvaluateStateMachine
        end
    end)

    for State, Enabled in pairs(SavedStates) do
        pcall(function()
            NewHumanoid:SetStateEnabled(State, Enabled)
        end)
    end

    local Animator = NewHumanoid:FindFirstChildOfClass("Animator")
    if not Animator then
        Animator = Instance.new("Animator")
        Animator.Parent = NewHumanoid
    end

    local Animate = Character:FindFirstChild("Animate")
    if Animate then
        pcall(function()
            Animate.Disabled = true
        end)
        task.wait()
        pcall(function()
            Animate.Disabled = false
        end)
    end

    task.wait(0.1)

    local function LockHealth()
        if GodMode and NewHumanoid and NewHumanoid.Parent then
            pcall(function()
                NewHumanoid.MaxHealth = math.huge
                NewHumanoid.Health = math.huge
            end)
        end
    end

    local function BlockDeathState()
        if not NewHumanoid or not NewHumanoid.Parent then return end
        pcall(function()
            NewHumanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end)
        pcall(function()
            NewHumanoid.BreakJointsOnDeath = false
        end)
        pcall(function()
            NewHumanoid.RequiresNeck = false
        end)
    end

    local function BindAntiDeath(Humanoid)
        if not Humanoid then return end
        Humanoid.HealthChanged:Connect(function(Health)
            if GodMode and Humanoid and Humanoid.Parent then
                if Health < Humanoid.MaxHealth then
                    pcall(function()
                        Humanoid.Health = Humanoid.MaxHealth
                    end)
                end
            end
        end)
        Humanoid.Died:Connect(function()
            if GodMode and Humanoid and Humanoid.Parent then
                pcall(function()
                    Humanoid.Health = Humanoid.MaxHealth
                end)
            end
        end)
    end

    LockHealth()
    BlockDeathState()
    BindAntiDeath(NewHumanoid)

    task.spawn(function()
        while BypassEnabled do
            task.wait(0.1)
            if GodMode and NewHumanoid and NewHumanoid.Parent then
                pcall(function()
                    if NewHumanoid.Health < NewHumanoid.MaxHealth then
                        NewHumanoid.Health = NewHumanoid.MaxHealth
                    end
                    NewHumanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                end)
            end
        end
    end)

    local function RefreshControls()
        local PlayerScripts = Player:FindFirstChild("PlayerScripts")
        if not PlayerScripts then return end
        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")
        if not PlayerModule then return end
        local Success, Module = pcall(function()
            return require(PlayerModule)
        end)
        if not Success or not Module then return end
        local Controls
        pcall(function()
            Controls = Module:GetControls()
        end)
        if not Controls then return end
        pcall(function()
            Controls:OnCharacterAdded(Character)
        end)
        task.wait()
        pcall(function()
            Controls:UpdateActiveControlModuleEnabled()
        end)
    end

    RefreshControls()

    pcall(function()
        local Camera = workspace.CurrentCamera
        if Camera then
            Camera.CameraSubject = NewHumanoid
        end
    end)

    if _G.YOKUDO_CharacterSystem then
        task.spawn(function()
            task.wait(0.3)
            _G.YOKUDO_CharacterSystem:RestartAllFeatures()
        end)
    end

    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SetupDiedListener(Humanoid)
    if not Humanoid then return end

    if DiedConnection then
        DiedConnection:Disconnect()
        DiedConnection = nil
    end

    DiedConnection = Humanoid.Died:Connect(function()
        print("leak by https://discord.gg/TBBAUZu8cW")

        task.wait(0.5)

        task.spawn(function()
            RunBypassAntiCheat()
        end)
    end)

    print("leak by https://discord.gg/TBBAUZu8cW")
end

local function SetupCharacterListener()
    if CharacterConnection then
        CharacterConnection:Disconnect()
        CharacterConnection = nil
    end

    CharacterConnection = Player.CharacterAdded:Connect(function(Character)
        print("leak by https://discord.gg/TBBAUZu8cW")

        task.wait(1)

        local Hum = Character:FindFirstChildOfClass("Humanoid")
        if Hum then
            SetupDiedListener(Hum)
        end

        RunBypassAntiCheat()
    end)
end

local function SetupHumanoidDiedCheck()
    task.spawn(function()
        while BypassEnabled do
            task.wait(1)

            local Char = Player.Character
            if Char then
                local Hum = Char:FindFirstChildOfClass("Humanoid")
                if Hum then
                    if not DiedConnection or not DiedConnection.Connected then
                        SetupDiedListener(Hum)
                    end
                end
            end
        end
    end)
end

task.spawn(function()
    task.wait(2)
    RunBypassAntiCheat()

    SetupCharacterListener()
    SetupHumanoidDiedCheck()

    local Char = Player.Character
    if Char then
        local Hum = Char:FindFirstChildOfClass("Humanoid")
        if Hum then
            SetupDiedListener(Hum)
        end
    end
end)

print("leak by https://discord.gg/TBBAUZu8cW")")

]=]

_G.YOKUDO_EnablePrint = false
local oldPrint = print
print = function(...)
    if _G.YOKUDO_EnablePrint then
        oldPrint(...)
    end
end

_G.YOKUDO_Cache = _G.YOKUDO_Cache or {}

local function GetScript(path)
    if _G.YOKUDO_Cache[path] then
        return _G.YOKUDO_Cache[path]
    end
    local src = _MERGED[path]
    if not src then
        error("Missing merged module: " .. tostring(path), 0)
    end
    _G.YOKUDO_Cache[path] = src
    return src
end

local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
print("leak by https://discord.gg/TBBAUZu8cW")

local function CreateLoadingScreen()
    local LoadingGui = Instance.new("ScreenGui")
    LoadingGui.Name = "LoadingScreen"
    LoadingGui.ResetOnSpawn = false
    LoadingGui.IgnoreGuiInset = true
    LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LoadingGui.DisplayOrder = 9999
    LoadingGui.Parent = CoreGui

    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(0, 280, 0, 110)
    Container.Position = UDim2.new(0.5, -140, 0.5, -55)
    Container.BackgroundColor3 = Color3.fromRGB(16, 17, 23)
    Container.BackgroundTransparency = 0.1
    Container.BorderSizePixel = 0
    Container.ClipsDescendants = true
    Container.Parent = LoadingGui

    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 14)
    ContainerCorner.Parent = Container

    local ContainerBorder = Instance.new("UIStroke")
    ContainerBorder.Color = Color3.fromRGB(105, 90, 190)
    ContainerBorder.Thickness = 2
    ContainerBorder.Transparency = 0.2
    ContainerBorder.Parent = Container

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -30, 0, 28)
    Title.Position = UDim2.new(0, 15, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = "YOKUDO HUB"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.TextYAlignment = Enum.TextYAlignment.Center
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Container

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Size = UDim2.new(1, -30, 0, 14)
    Subtitle.Position = UDim2.new(0, 15, 0, 36)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Steal An Egg"
    Subtitle.TextColor3 = Color3.fromRGB(145, 145, 175)
    Subtitle.TextSize = 9
    Subtitle.TextXAlignment = Enum.TextXAlignment.Center
    Subtitle.TextYAlignment = Enum.TextYAlignment.Center
    Subtitle.Font = Enum.Font.GothamMedium
    Subtitle.Parent = Container

    local BarBg = Instance.new("Frame")
    BarBg.Name = "BarBg"
    BarBg.Size = UDim2.new(0.75, 0, 0, 4)
    BarBg.Position = UDim2.new(0.125, 0, 0.5, 0)
    BarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    BarBg.BorderSizePixel = 0
    BarBg.Parent = Container

    local BarBgCorner = Instance.new("UICorner")
    BarBgCorner.CornerRadius = UDim.new(1, 0)
    BarBgCorner.Parent = BarBg

    local Bar = Instance.new("Frame")
    Bar.Name = "Bar"
    Bar.Size = UDim2.new(0, 0, 1, 0)
    Bar.BackgroundColor3 = Color3.fromRGB(105, 90, 190)
    Bar.BorderSizePixel = 0
    Bar.Parent = BarBg

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = Bar

    local Percent = Instance.new("TextLabel")
    Percent.Name = "Percent"
    Percent.Size = UDim2.new(1, -30, 0, 22)
    Percent.Position = UDim2.new(0, 15, 0.7, 0)
    Percent.BackgroundTransparency = 1
    Percent.Text = "0%"
    Percent.TextColor3 = Color3.fromRGB(105, 90, 190)
    Percent.TextSize = 18
    Percent.TextXAlignment = Enum.TextXAlignment.Center
    Percent.TextYAlignment = Enum.TextYAlignment.Center
    Percent.Font = Enum.Font.GothamBold
    Percent.Parent = Container

    local function UpdateProgress(percent)
        percent = math.clamp(percent, 0, 100)
        Bar.Size = UDim2.new(percent / 100, 0, 1, 0)
        Percent.Text = math.floor(percent) .. "%"
    end

    return {
        Gui = LoadingGui,
        Update = UpdateProgress,
        Destroy = function()
            LoadingGui:Destroy()
        end
end

local Loading = CreateLoadingScreen()
Loading.Update(5)

Loading.Update(10)

Loading.Update(15)

Loading.Update(20)

Loading.Update(25)

Loading.Update(28)

Loading.Update(30)

Loading.Update(33)

Loading.Update(36)

Loading.Update(39)

Loading.Update(42)

Loading.Update(45)

Loading.Update(48)

Loading.Update(50)

Loading.Update(51)

Loading.Update(54)

Loading.Update(57)

Loading.Update(59)

Loading.Update(60)

Loading.Update(62)

Loading.Update(65)

Loading.Update(70)

Loading.Update(75)

Loading.Update(80)

Loading.Update(85)

Loading.Update(90)

Loading.Update(92)
if _G.YOKUDO_TabsManager then
    _G.YOKUDO_TabsManager:SelectTabByName("Info")
end

Loading.Update(95)

Loading.Update(98)

print("leak by https://discord.gg/TBBAUZu8cW")
task.wait(2)

if _G.YOKUDO_ConfigSystem then
    print("leak by https://discord.gg/TBBAUZu8cW")
    _G.YOKUDO_ConfigSystem.Load()
end

Loading.Update(100)

task.wait(0.3)
Loading.Destroy()
print("leak by https://discord.gg/TBBAUZu8cW")
print("leak by https://discord.gg/TBBAUZu8cW")