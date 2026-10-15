--[[
    KHAYHUB ANTI HIT UI
    Leaked by iminthekinggg
    Discord: https://discord.gg/sourceshubs
]]

local G = {}

-- KHAY_HUB (ScreenGui)
G.KHAY_HUB = Instance.new("ScreenGui")
G.KHAY_HUB.Name = "KHAY_HUB"
G.KHAY_HUB.ResetOnSpawn = false
G.KHAY_HUB.DisplayOrder = 1000
G.KHAY_HUB.IgnoreGuiInset = true
G.KHAY_HUB.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets

-- KHAY_CINEMATIC_INTRO (Frame)
G.KHAY_CINEMATIC_INTRO = Instance.new("Frame")
G.KHAY_CINEMATIC_INTRO.Name = "KHAY_CINEMATIC_INTRO"
G.KHAY_CINEMATIC_INTRO.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
G.KHAY_CINEMATIC_INTRO.BackgroundTransparency = 1
G.KHAY_CINEMATIC_INTRO.BorderSizePixel = 0
G.KHAY_CINEMATIC_INTRO.Size = UDim2.new(1, 0, 1, 0)
G.KHAY_CINEMATIC_INTRO.Visible = false
G.KHAY_CINEMATIC_INTRO.ZIndex = 1000
G.KHAY_CINEMATIC_INTRO.Parent = G.KHAY_HUB

-- Folder (Folder)
G.Folder = Instance.new("Folder")
G.Folder.Parent = G.KHAY_CINEMATIC_INTRO

-- Frame (Frame)
G.Frame = Instance.new("Frame")
G.Frame.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame.BackgroundTransparency = 0.55000001192092896
G.Frame.BorderSizePixel = 0
G.Frame.Position = UDim2.new(0.77639317512512207, 0, 0.23252475261688232, 0)
G.Frame.Size = UDim2.new(0, 3, 0, 3)
G.Frame.ZIndex = 1000
G.Frame.Parent = G.Folder

-- UICorner (UICorner)
G.UICorner = Instance.new("UICorner")
G.UICorner.CornerRadius = UDim.new(1, 0)
G.UICorner.Parent = G.Frame

-- Frame_2 (Frame)
G.Frame_2 = Instance.new("Frame")
G.Frame_2.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_2.BackgroundTransparency = 0.51999998092651367
G.Frame_2.BorderSizePixel = 0
G.Frame_2.Position = UDim2.new(0.081276901066303253, 0, 0.68154233694076538, 0)
G.Frame_2.Size = UDim2.new(0, 1, 0, 1)
G.Frame_2.ZIndex = 1000
G.Frame_2.Parent = G.Folder

-- UICorner_2 (UICorner)
G.UICorner_2 = Instance.new("UICorner")
G.UICorner_2.CornerRadius = UDim.new(1, 0)
G.UICorner_2.Parent = G.Frame_2

-- Frame_3 (Frame)
G.Frame_3 = Instance.new("Frame")
G.Frame_3.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_3.BackgroundTransparency = 0.56000000238418579
G.Frame_3.BorderSizePixel = 0
G.Frame_3.Position = UDim2.new(0.48749479651451111, 0, 0.61103862524032593, 0)
G.Frame_3.Size = UDim2.new(0, 1, 0, 1)
G.Frame_3.ZIndex = 1000
G.Frame_3.Parent = G.Folder

-- UICorner_3 (UICorner)
G.UICorner_3 = Instance.new("UICorner")
G.UICorner_3.CornerRadius = UDim.new(1, 0)
G.UICorner_3.Parent = G.Frame_3

-- Frame_4 (Frame)
G.Frame_4 = Instance.new("Frame")
G.Frame_4.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_4.BackgroundTransparency = 0.49000000953674316
G.Frame_4.BorderSizePixel = 0
G.Frame_4.Position = UDim2.new(0.67828035354614258, 0, 0.38488650321960449, 0)
G.Frame_4.Size = UDim2.new(0, 3, 0, 3)
G.Frame_4.ZIndex = 1000
G.Frame_4.Parent = G.Folder

-- UICorner_4 (UICorner)
G.UICorner_4 = Instance.new("UICorner")
G.UICorner_4.CornerRadius = UDim.new(1, 0)
G.UICorner_4.Parent = G.Frame_4

-- Frame_5 (Frame)
G.Frame_5 = Instance.new("Frame")
G.Frame_5.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_5.BackgroundTransparency = 0.6600000262260437
G.Frame_5.BorderSizePixel = 0
G.Frame_5.Position = UDim2.new(0.81562072038650513, 0, 0.4933222234249115, 0)
G.Frame_5.Size = UDim2.new(0, 1, 0, 1)
G.Frame_5.ZIndex = 1000
G.Frame_5.Parent = G.Folder

-- UICorner_5 (UICorner)
G.UICorner_5 = Instance.new("UICorner")
G.UICorner_5.CornerRadius = UDim.new(1, 0)
G.UICorner_5.Parent = G.Frame_5

-- Frame_6 (Frame)
G.Frame_6 = Instance.new("Frame")
G.Frame_6.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_6.BackgroundTransparency = 0.81999999284744263
G.Frame_6.BorderSizePixel = 0
G.Frame_6.Position = UDim2.new(0.74000000953674316, 0, 0.77999997138977051, 0)
G.Frame_6.Size = UDim2.new(0, 1, 0, 1)
G.Frame_6.ZIndex = 1000
G.Frame_6.Parent = G.Folder

-- UICorner_6 (UICorner)
G.UICorner_6 = Instance.new("UICorner")
G.UICorner_6.CornerRadius = UDim.new(1, 0)
G.UICorner_6.Parent = G.Frame_6

-- Frame_7 (Frame)
G.Frame_7 = Instance.new("Frame")
G.Frame_7.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_7.BackgroundTransparency = 0.56999999284744263
G.Frame_7.BorderSizePixel = 0
G.Frame_7.Position = UDim2.new(0.31211745738983154, 0, 0.19705814123153687, 0)
G.Frame_7.Size = UDim2.new(0, 2, 0, 2)
G.Frame_7.ZIndex = 1000
G.Frame_7.Parent = G.Folder

-- UICorner_7 (UICorner)
G.UICorner_7 = Instance.new("UICorner")
G.UICorner_7.CornerRadius = UDim.new(1, 0)
G.UICorner_7.Parent = G.Frame_7

-- Frame_8 (Frame)
G.Frame_8 = Instance.new("Frame")
G.Frame_8.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_8.BackgroundTransparency = 0.61000001430511475
G.Frame_8.BorderSizePixel = 0
G.Frame_8.Position = UDim2.new(0.61219030618667603, 0, 0.24876125156879425, 0)
G.Frame_8.Size = UDim2.new(0, 1, 0, 1)
G.Frame_8.ZIndex = 1000
G.Frame_8.Parent = G.Folder

-- UICorner_8 (UICorner)
G.UICorner_8 = Instance.new("UICorner")
G.UICorner_8.CornerRadius = UDim.new(1, 0)
G.UICorner_8.Parent = G.Frame_8

-- Frame_9 (Frame)
G.Frame_9 = Instance.new("Frame")
G.Frame_9.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_9.BackgroundTransparency = 0.4699999988079071
G.Frame_9.BorderSizePixel = 0
G.Frame_9.Position = UDim2.new(0.67494058609008789, 0, 0.8069731593132019, 0)
G.Frame_9.Size = UDim2.new(0, 3, 0, 3)
G.Frame_9.ZIndex = 1000
G.Frame_9.Parent = G.Folder

-- UICorner_9 (UICorner)
G.UICorner_9 = Instance.new("UICorner")
G.UICorner_9.CornerRadius = UDim.new(1, 0)
G.UICorner_9.Parent = G.Frame_9

-- Frame_10 (Frame)
G.Frame_10 = Instance.new("Frame")
G.Frame_10.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_10.BackgroundTransparency = 0.67000001668930054
G.Frame_10.BorderSizePixel = 0
G.Frame_10.Position = UDim2.new(0.22729161381721497, 0, 0.32771602272987366, 0)
G.Frame_10.Size = UDim2.new(0, 3, 0, 3)
G.Frame_10.ZIndex = 1000
G.Frame_10.Parent = G.Folder

-- UICorner_10 (UICorner)
G.UICorner_10 = Instance.new("UICorner")
G.UICorner_10.CornerRadius = UDim.new(1, 0)
G.UICorner_10.Parent = G.Frame_10

-- Frame_11 (Frame)
G.Frame_11 = Instance.new("Frame")
G.Frame_11.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_11.BackgroundTransparency = 0.72000002861022949
G.Frame_11.BorderSizePixel = 0
G.Frame_11.Position = UDim2.new(0.70454633235931396, 0, 0.70247858762741089, 0)
G.Frame_11.Size = UDim2.new(0, 1, 0, 1)
G.Frame_11.ZIndex = 1000
G.Frame_11.Parent = G.Folder

-- UICorner_11 (UICorner)
G.UICorner_11 = Instance.new("UICorner")
G.UICorner_11.CornerRadius = UDim.new(1, 0)
G.UICorner_11.Parent = G.Frame_11

-- Frame_12 (Frame)
G.Frame_12 = Instance.new("Frame")
G.Frame_12.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_12.BackgroundTransparency = 0.72000002861022949
G.Frame_12.BorderSizePixel = 0
G.Frame_12.Position = UDim2.new(0.72030872106552124, 0, 0.33938255906105042, 0)
G.Frame_12.Size = UDim2.new(0, 2, 0, 2)
G.Frame_12.ZIndex = 1000
G.Frame_12.Parent = G.Folder

-- UICorner_12 (UICorner)
G.UICorner_12 = Instance.new("UICorner")
G.UICorner_12.CornerRadius = UDim.new(1, 0)
G.UICorner_12.Parent = G.Frame_12

-- Frame_13 (Frame)
G.Frame_13 = Instance.new("Frame")
G.Frame_13.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_13.BackgroundTransparency = 0.55000001192092896
G.Frame_13.BorderSizePixel = 0
G.Frame_13.Position = UDim2.new(0.44231000542640686, 0, 0.77740460634231567, 0)
G.Frame_13.Size = UDim2.new(0, 1, 0, 1)
G.Frame_13.ZIndex = 1000
G.Frame_13.Parent = G.Folder

-- UICorner_13 (UICorner)
G.UICorner_13 = Instance.new("UICorner")
G.UICorner_13.CornerRadius = UDim.new(1, 0)
G.UICorner_13.Parent = G.Frame_13

-- Frame_14 (Frame)
G.Frame_14 = Instance.new("Frame")
G.Frame_14.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_14.BackgroundTransparency = 0.77999997138977051
G.Frame_14.BorderSizePixel = 0
G.Frame_14.Position = UDim2.new(0.53502047061920166, 0, 0.65057319402694702, 0)
G.Frame_14.Size = UDim2.new(0, 3, 0, 3)
G.Frame_14.ZIndex = 1000
G.Frame_14.Parent = G.Folder

-- UICorner_14 (UICorner)
G.UICorner_14 = Instance.new("UICorner")
G.UICorner_14.CornerRadius = UDim.new(1, 0)
G.UICorner_14.Parent = G.Frame_14

-- Frame_15 (Frame)
G.Frame_15 = Instance.new("Frame")
G.Frame_15.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_15.BackgroundTransparency = 0.74000000953674316
G.Frame_15.BorderSizePixel = 0
G.Frame_15.Position = UDim2.new(0.076707080006599426, 0, 0.38786214590072632, 0)
G.Frame_15.Size = UDim2.new(0, 1, 0, 1)
G.Frame_15.ZIndex = 1000
G.Frame_15.Parent = G.Folder

-- UICorner_15 (UICorner)
G.UICorner_15 = Instance.new("UICorner")
G.UICorner_15.CornerRadius = UDim.new(1, 0)
G.UICorner_15.Parent = G.Frame_15

-- Frame_16 (Frame)
G.Frame_16 = Instance.new("Frame")
G.Frame_16.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_16.BackgroundTransparency = 0.82999998331069946
G.Frame_16.BorderSizePixel = 0
G.Frame_16.Position = UDim2.new(0.53144681453704834, 0, 0.42201524972915649, 0)
G.Frame_16.Size = UDim2.new(0, 1, 0, 1)
G.Frame_16.ZIndex = 1000
G.Frame_16.Parent = G.Folder

-- UICorner_16 (UICorner)
G.UICorner_16 = Instance.new("UICorner")
G.UICorner_16.CornerRadius = UDim.new(1, 0)
G.UICorner_16.Parent = G.Frame_16

-- Frame_17 (Frame)
G.Frame_17 = Instance.new("Frame")
G.Frame_17.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_17.BackgroundTransparency = 0.8399999737739563
G.Frame_17.BorderSizePixel = 0
G.Frame_17.Position = UDim2.new(0.57069361209869385, 0, 0.19551444053649902, 0)
G.Frame_17.Size = UDim2.new(0, 3, 0, 3)
G.Frame_17.ZIndex = 1000
G.Frame_17.Parent = G.Folder

-- UICorner_17 (UICorner)
G.UICorner_17 = Instance.new("UICorner")
G.UICorner_17.CornerRadius = UDim.new(1, 0)
G.UICorner_17.Parent = G.Frame_17

-- Frame_18 (Frame)
G.Frame_18 = Instance.new("Frame")
G.Frame_18.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_18.BackgroundTransparency = 0.55000001192092896
G.Frame_18.BorderSizePixel = 0
G.Frame_18.Position = UDim2.new(0.69279730319976807, 0, 0.27905875444412231, 0)
G.Frame_18.Size = UDim2.new(0, 2, 0, 2)
G.Frame_18.ZIndex = 1000
G.Frame_18.Parent = G.Folder

-- UICorner_18 (UICorner)
G.UICorner_18 = Instance.new("UICorner")
G.UICorner_18.CornerRadius = UDim.new(1, 0)
G.UICorner_18.Parent = G.Frame_18

-- Frame_19 (Frame)
G.Frame_19 = Instance.new("Frame")
G.Frame_19.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_19.BackgroundTransparency = 0.46000000834465027
G.Frame_19.BorderSizePixel = 0
G.Frame_19.Position = UDim2.new(0.52186810970306396, 0, 0.2319217324256897, 0)
G.Frame_19.Size = UDim2.new(0, 3, 0, 3)
G.Frame_19.ZIndex = 1000
G.Frame_19.Parent = G.Folder

-- UICorner_19 (UICorner)
G.UICorner_19 = Instance.new("UICorner")
G.UICorner_19.CornerRadius = UDim.new(1, 0)
G.UICorner_19.Parent = G.Frame_19

-- Frame_20 (Frame)
G.Frame_20 = Instance.new("Frame")
G.Frame_20.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_20.BackgroundTransparency = 0.61000001430511475
G.Frame_20.BorderSizePixel = 0
G.Frame_20.Position = UDim2.new(0.15262091159820557, 0, 0.25387337803840637, 0)
G.Frame_20.Size = UDim2.new(0, 2, 0, 2)
G.Frame_20.ZIndex = 1000
G.Frame_20.Parent = G.Folder

-- UICorner_20 (UICorner)
G.UICorner_20 = Instance.new("UICorner")
G.UICorner_20.CornerRadius = UDim.new(1, 0)
G.UICorner_20.Parent = G.Frame_20

-- Frame_21 (Frame)
G.Frame_21 = Instance.new("Frame")
G.Frame_21.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_21.BackgroundTransparency = 0.56000000238418579
G.Frame_21.BorderSizePixel = 0
G.Frame_21.Position = UDim2.new(0.54712289571762085, 0, 0.53208076953887939, 0)
G.Frame_21.Size = UDim2.new(0, 3, 0, 3)
G.Frame_21.ZIndex = 1000
G.Frame_21.Parent = G.Folder

-- UICorner_21 (UICorner)
G.UICorner_21 = Instance.new("UICorner")
G.UICorner_21.CornerRadius = UDim.new(1, 0)
G.UICorner_21.Parent = G.Frame_21

-- Frame_22 (Frame)
G.Frame_22 = Instance.new("Frame")
G.Frame_22.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_22.BackgroundTransparency = 0.76999998092651367
G.Frame_22.BorderSizePixel = 0
G.Frame_22.Position = UDim2.new(0.5495445728302002, 0, 0.62346518039703369, 0)
G.Frame_22.Size = UDim2.new(0, 2, 0, 2)
G.Frame_22.ZIndex = 1000
G.Frame_22.Parent = G.Folder

-- UICorner_22 (UICorner)
G.UICorner_22 = Instance.new("UICorner")
G.UICorner_22.CornerRadius = UDim.new(1, 0)
G.UICorner_22.Parent = G.Frame_22

-- Frame_23 (Frame)
G.Frame_23 = Instance.new("Frame")
G.Frame_23.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_23.BackgroundTransparency = 0.70999997854232788
G.Frame_23.BorderSizePixel = 0
G.Frame_23.Position = UDim2.new(0.49713259935379028, 0, 0.42682433128356934, 0)
G.Frame_23.Size = UDim2.new(0, 2, 0, 2)
G.Frame_23.ZIndex = 1000
G.Frame_23.Parent = G.Folder

-- UICorner_23 (UICorner)
G.UICorner_23 = Instance.new("UICorner")
G.UICorner_23.CornerRadius = UDim.new(1, 0)
G.UICorner_23.Parent = G.Frame_23

-- Frame_24 (Frame)
G.Frame_24 = Instance.new("Frame")
G.Frame_24.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_24.BackgroundTransparency = 0.8399999737739563
G.Frame_24.BorderSizePixel = 0
G.Frame_24.Position = UDim2.new(0.52028274536132812, 0, 0.44293686747550964, 0)
G.Frame_24.Size = UDim2.new(0, 2, 0, 2)
G.Frame_24.ZIndex = 1000
G.Frame_24.Parent = G.Folder

-- UICorner_24 (UICorner)
G.UICorner_24 = Instance.new("UICorner")
G.UICorner_24.CornerRadius = UDim.new(1, 0)
G.UICorner_24.Parent = G.Frame_24

-- Frame_25 (Frame)
G.Frame_25 = Instance.new("Frame")
G.Frame_25.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_25.BackgroundTransparency = 0.50999999046325684
G.Frame_25.BorderSizePixel = 0
G.Frame_25.Position = UDim2.new(0.37204658985137939, 0, 0.59645593166351318, 0)
G.Frame_25.Size = UDim2.new(0, 2, 0, 2)
G.Frame_25.ZIndex = 1000
G.Frame_25.Parent = G.Folder

-- UICorner_25 (UICorner)
G.UICorner_25 = Instance.new("UICorner")
G.UICorner_25.CornerRadius = UDim.new(1, 0)
G.UICorner_25.Parent = G.Frame_25

-- Frame_26 (Frame)
G.Frame_26 = Instance.new("Frame")
G.Frame_26.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_26.BackgroundTransparency = 0.54000002145767212
G.Frame_26.BorderSizePixel = 0
G.Frame_26.Position = UDim2.new(0.2013431191444397, 0, 0.70256716012954712, 0)
G.Frame_26.Size = UDim2.new(0, 3, 0, 3)
G.Frame_26.ZIndex = 1000
G.Frame_26.Parent = G.Folder

-- UICorner_26 (UICorner)
G.UICorner_26 = Instance.new("UICorner")
G.UICorner_26.CornerRadius = UDim.new(1, 0)
G.UICorner_26.Parent = G.Frame_26

-- Frame_27 (Frame)
G.Frame_27 = Instance.new("Frame")
G.Frame_27.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_27.BackgroundTransparency = 0.69999998807907104
G.Frame_27.BorderSizePixel = 0
G.Frame_27.Position = UDim2.new(0.38999998569488525, 0, 0.5346987247467041, 0)
G.Frame_27.Size = UDim2.new(0, 3, 0, 3)
G.Frame_27.ZIndex = 1000
G.Frame_27.Parent = G.Folder

-- UICorner_27 (UICorner)
G.UICorner_27 = Instance.new("UICorner")
G.UICorner_27.CornerRadius = UDim.new(1, 0)
G.UICorner_27.Parent = G.Frame_27

-- Frame_28 (Frame)
G.Frame_28 = Instance.new("Frame")
G.Frame_28.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_28.BackgroundTransparency = 0.62000000476837158
G.Frame_28.BorderSizePixel = 0
G.Frame_28.Position = UDim2.new(0.40260154008865356, 0, 0.69785135984420776, 0)
G.Frame_28.Size = UDim2.new(0, 2, 0, 2)
G.Frame_28.ZIndex = 1000
G.Frame_28.Parent = G.Folder

-- UICorner_28 (UICorner)
G.UICorner_28 = Instance.new("UICorner")
G.UICorner_28.CornerRadius = UDim.new(1, 0)
G.UICorner_28.Parent = G.Frame_28

-- Frame_29 (Frame)
G.Frame_29 = Instance.new("Frame")
G.Frame_29.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_29.BackgroundTransparency = 0.82999998331069946
G.Frame_29.BorderSizePixel = 0
G.Frame_29.Position = UDim2.new(0.70247095823287964, 0, 0.40040117502212524, 0)
G.Frame_29.Size = UDim2.new(0, 3, 0, 3)
G.Frame_29.ZIndex = 1000
G.Frame_29.Parent = G.Folder

-- UICorner_29 (UICorner)
G.UICorner_29 = Instance.new("UICorner")
G.UICorner_29.CornerRadius = UDim.new(1, 0)
G.UICorner_29.Parent = G.Frame_29

-- Frame_30 (Frame)
G.Frame_30 = Instance.new("Frame")
G.Frame_30.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_30.BackgroundTransparency = 0.60000002384185791
G.Frame_30.BorderSizePixel = 0
G.Frame_30.Position = UDim2.new(0.49000000953674316, 0, 0.34000000357627869, 0)
G.Frame_30.Size = UDim2.new(0, 3, 0, 3)
G.Frame_30.ZIndex = 1000
G.Frame_30.Parent = G.Folder

-- UICorner_30 (UICorner)
G.UICorner_30 = Instance.new("UICorner")
G.UICorner_30.CornerRadius = UDim.new(1, 0)
G.UICorner_30.Parent = G.Frame_30

-- Frame_31 (Frame)
G.Frame_31 = Instance.new("Frame")
G.Frame_31.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_31.BackgroundTransparency = 0.64999997615814209
G.Frame_31.BorderSizePixel = 0
G.Frame_31.Position = UDim2.new(0.31700959801673889, 0, 0.27613925933837891, 0)
G.Frame_31.Size = UDim2.new(0, 3, 0, 3)
G.Frame_31.ZIndex = 1000
G.Frame_31.Parent = G.Folder

-- UICorner_31 (UICorner)
G.UICorner_31 = Instance.new("UICorner")
G.UICorner_31.CornerRadius = UDim.new(1, 0)
G.UICorner_31.Parent = G.Frame_31

-- Frame_32 (Frame)
G.Frame_32 = Instance.new("Frame")
G.Frame_32.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_32.BackgroundTransparency = 0.5899999737739563
G.Frame_32.BorderSizePixel = 0
G.Frame_32.Position = UDim2.new(0.74885571002960205, 0, 0.23568473756313324, 0)
G.Frame_32.Size = UDim2.new(0, 3, 0, 3)
G.Frame_32.ZIndex = 1000
G.Frame_32.Parent = G.Folder

-- UICorner_32 (UICorner)
G.UICorner_32 = Instance.new("UICorner")
G.UICorner_32.CornerRadius = UDim.new(1, 0)
G.UICorner_32.Parent = G.Frame_32

-- Frame_33 (Frame)
G.Frame_33 = Instance.new("Frame")
G.Frame_33.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_33.BackgroundTransparency = 0.47999998927116394
G.Frame_33.BorderSizePixel = 0
G.Frame_33.Position = UDim2.new(0.3491935133934021, 0, 0.61357569694519043, 0)
G.Frame_33.Size = UDim2.new(0, 3, 0, 3)
G.Frame_33.ZIndex = 1000
G.Frame_33.Parent = G.Folder

-- UICorner_33 (UICorner)
G.UICorner_33 = Instance.new("UICorner")
G.UICorner_33.CornerRadius = UDim.new(1, 0)
G.UICorner_33.Parent = G.Frame_33

-- Frame_34 (Frame)
G.Frame_34 = Instance.new("Frame")
G.Frame_34.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_34.BackgroundTransparency = 0.54000002145767212
G.Frame_34.BorderSizePixel = 0
G.Frame_34.Position = UDim2.new(0.51954782009124756, 0, 0.74961245059967041, 0)
G.Frame_34.Size = UDim2.new(0, 2, 0, 2)
G.Frame_34.ZIndex = 1000
G.Frame_34.Parent = G.Folder

-- UICorner_34 (UICorner)
G.UICorner_34 = Instance.new("UICorner")
G.UICorner_34.CornerRadius = UDim.new(1, 0)
G.UICorner_34.Parent = G.Frame_34

-- Frame_35 (Frame)
G.Frame_35 = Instance.new("Frame")
G.Frame_35.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_35.BackgroundTransparency = 0.72000002861022949
G.Frame_35.BorderSizePixel = 0
G.Frame_35.Position = UDim2.new(0.74465763568878174, 0, 0.39240404963493347, 0)
G.Frame_35.Size = UDim2.new(0, 1, 0, 1)
G.Frame_35.ZIndex = 1000
G.Frame_35.Parent = G.Folder

-- UICorner_35 (UICorner)
G.UICorner_35 = Instance.new("UICorner")
G.UICorner_35.CornerRadius = UDim.new(1, 0)
G.UICorner_35.Parent = G.Frame_35

-- Frame_36 (Frame)
G.Frame_36 = Instance.new("Frame")
G.Frame_36.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_36.BackgroundTransparency = 0.81000000238418579
G.Frame_36.BorderSizePixel = 0
G.Frame_36.Position = UDim2.new(0.62843608856201172, 0, 0.72061735391616821, 0)
G.Frame_36.Size = UDim2.new(0, 3, 0, 3)
G.Frame_36.ZIndex = 1000
G.Frame_36.Parent = G.Folder

-- UICorner_36 (UICorner)
G.UICorner_36 = Instance.new("UICorner")
G.UICorner_36.CornerRadius = UDim.new(1, 0)
G.UICorner_36.Parent = G.Frame_36

-- Frame_37 (Frame)
G.Frame_37 = Instance.new("Frame")
G.Frame_37.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_37.BackgroundTransparency = 0.63999998569488525
G.Frame_37.BorderSizePixel = 0
G.Frame_37.Position = UDim2.new(0.44230219721794128, 0, 0.59908533096313477, 0)
G.Frame_37.Size = UDim2.new(0, 2, 0, 2)
G.Frame_37.ZIndex = 1000
G.Frame_37.Parent = G.Folder

-- UICorner_37 (UICorner)
G.UICorner_37 = Instance.new("UICorner")
G.UICorner_37.CornerRadius = UDim.new(1, 0)
G.UICorner_37.Parent = G.Frame_37

-- Frame_38 (Frame)
G.Frame_38 = Instance.new("Frame")
G.Frame_38.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_38.BackgroundTransparency = 0.57999998331069946
G.Frame_38.BorderSizePixel = 0
G.Frame_38.Position = UDim2.new(0.45491808652877808, 0, 0.86618852615356445, 0)
G.Frame_38.Size = UDim2.new(0, 1, 0, 1)
G.Frame_38.ZIndex = 1000
G.Frame_38.Parent = G.Folder

-- UICorner_38 (UICorner)
G.UICorner_38 = Instance.new("UICorner")
G.UICorner_38.CornerRadius = UDim.new(1, 0)
G.UICorner_38.Parent = G.Frame_38

-- Frame_39 (Frame)
G.Frame_39 = Instance.new("Frame")
G.Frame_39.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_39.BackgroundTransparency = 0.60000002384185791
G.Frame_39.BorderSizePixel = 0
G.Frame_39.Position = UDim2.new(0.69749981164932251, 0, 0.70785719156265259, 0)
G.Frame_39.Size = UDim2.new(0, 3, 0, 3)
G.Frame_39.ZIndex = 1000
G.Frame_39.Parent = G.Folder

-- UICorner_39 (UICorner)
G.UICorner_39 = Instance.new("UICorner")
G.UICorner_39.CornerRadius = UDim.new(1, 0)
G.UICorner_39.Parent = G.Frame_39

-- Frame_40 (Frame)
G.Frame_40 = Instance.new("Frame")
G.Frame_40.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_40.BackgroundTransparency = 0.6600000262260437
G.Frame_40.BorderSizePixel = 0
G.Frame_40.Position = UDim2.new(0.41209977865219116, 0, 0.73066520690917969, 0)
G.Frame_40.Size = UDim2.new(0, 2, 0, 2)
G.Frame_40.ZIndex = 1000
G.Frame_40.Parent = G.Folder

-- UICorner_40 (UICorner)
G.UICorner_40 = Instance.new("UICorner")
G.UICorner_40.CornerRadius = UDim.new(1, 0)
G.UICorner_40.Parent = G.Frame_40

-- Frame_41 (Frame)
G.Frame_41 = Instance.new("Frame")
G.Frame_41.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_41.BackgroundTransparency = 0.72000002861022949
G.Frame_41.BorderSizePixel = 0
G.Frame_41.Position = UDim2.new(0.76926934719085693, 0, 0.1702229231595993, 0)
G.Frame_41.Size = UDim2.new(0, 1, 0, 1)
G.Frame_41.ZIndex = 1000
G.Frame_41.Parent = G.Folder

-- UICorner_41 (UICorner)
G.UICorner_41 = Instance.new("UICorner")
G.UICorner_41.CornerRadius = UDim.new(1, 0)
G.UICorner_41.Parent = G.Frame_41

-- Frame_42 (Frame)
G.Frame_42 = Instance.new("Frame")
G.Frame_42.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_42.BackgroundTransparency = 0.68999999761581421
G.Frame_42.BorderSizePixel = 0
G.Frame_42.Position = UDim2.new(0.67295968532562256, 0, 0.46122586727142334, 0)
G.Frame_42.Size = UDim2.new(0, 3, 0, 3)
G.Frame_42.ZIndex = 1000
G.Frame_42.Parent = G.Folder

-- UICorner_42 (UICorner)
G.UICorner_42 = Instance.new("UICorner")
G.UICorner_42.CornerRadius = UDim.new(1, 0)
G.UICorner_42.Parent = G.Frame_42

-- Frame_43 (Frame)
G.Frame_43 = Instance.new("Frame")
G.Frame_43.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_43.BackgroundTransparency = 0.80000001192092896
G.Frame_43.BorderSizePixel = 0
G.Frame_43.Position = UDim2.new(0.26960465312004089, 0, 0.62874919176101685, 0)
G.Frame_43.Size = UDim2.new(0, 1, 0, 1)
G.Frame_43.ZIndex = 1000
G.Frame_43.Parent = G.Folder

-- UICorner_43 (UICorner)
G.UICorner_43 = Instance.new("UICorner")
G.UICorner_43.CornerRadius = UDim.new(1, 0)
G.UICorner_43.Parent = G.Frame_43

-- Frame_44 (Frame)
G.Frame_44 = Instance.new("Frame")
G.Frame_44.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_44.BackgroundTransparency = 0.50999999046325684
G.Frame_44.BorderSizePixel = 0
G.Frame_44.Position = UDim2.new(0.79671704769134521, 0, 0.30202218890190125, 0)
G.Frame_44.Size = UDim2.new(0, 2, 0, 2)
G.Frame_44.ZIndex = 1000
G.Frame_44.Parent = G.Folder

-- UICorner_44 (UICorner)
G.UICorner_44 = Instance.new("UICorner")
G.UICorner_44.CornerRadius = UDim.new(1, 0)
G.UICorner_44.Parent = G.Frame_44

-- Frame_45 (Frame)
G.Frame_45 = Instance.new("Frame")
G.Frame_45.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_45.BackgroundTransparency = 0.68999999761581421
G.Frame_45.BorderSizePixel = 0
G.Frame_45.Position = UDim2.new(0.71116888523101807, 0, 0.38670960068702698, 0)
G.Frame_45.Size = UDim2.new(0, 2, 0, 2)
G.Frame_45.ZIndex = 1000
G.Frame_45.Parent = G.Folder

-- UICorner_45 (UICorner)
G.UICorner_45 = Instance.new("UICorner")
G.UICorner_45.CornerRadius = UDim.new(1, 0)
G.UICorner_45.Parent = G.Frame_45

-- Frame_46 (Frame)
G.Frame_46 = Instance.new("Frame")
G.Frame_46.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_46.BackgroundTransparency = 0.4699999988079071
G.Frame_46.BorderSizePixel = 0
G.Frame_46.Position = UDim2.new(0.75008392333984375, 0, 0.32266250252723694, 0)
G.Frame_46.Size = UDim2.new(0, 1, 0, 1)
G.Frame_46.ZIndex = 1000
G.Frame_46.Parent = G.Folder

-- UICorner_46 (UICorner)
G.UICorner_46 = Instance.new("UICorner")
G.UICorner_46.CornerRadius = UDim.new(1, 0)
G.UICorner_46.Parent = G.Frame_46

-- Frame_47 (Frame)
G.Frame_47 = Instance.new("Frame")
G.Frame_47.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_47.BackgroundTransparency = 0.75999999046325684
G.Frame_47.BorderSizePixel = 0
G.Frame_47.Position = UDim2.new(0.91054117679595947, 0, 0.14889806509017944, 0)
G.Frame_47.Size = UDim2.new(0, 3, 0, 3)
G.Frame_47.ZIndex = 1000
G.Frame_47.Parent = G.Folder

-- UICorner_47 (UICorner)
G.UICorner_47 = Instance.new("UICorner")
G.UICorner_47.CornerRadius = UDim.new(1, 0)
G.UICorner_47.Parent = G.Frame_47

-- Frame_48 (Frame)
G.Frame_48 = Instance.new("Frame")
G.Frame_48.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_48.BackgroundTransparency = 0.69999998807907104
G.Frame_48.BorderSizePixel = 0
G.Frame_48.Position = UDim2.new(0.22670468688011169, 0, 0.39965245127677917, 0)
G.Frame_48.Size = UDim2.new(0, 3, 0, 3)
G.Frame_48.ZIndex = 1000
G.Frame_48.Parent = G.Folder

-- UICorner_48 (UICorner)
G.UICorner_48 = Instance.new("UICorner")
G.UICorner_48.CornerRadius = UDim.new(1, 0)
G.UICorner_48.Parent = G.Frame_48

-- Frame_49 (Frame)
G.Frame_49 = Instance.new("Frame")
G.Frame_49.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_49.BackgroundTransparency = 0.57999998331069946
G.Frame_49.BorderSizePixel = 0
G.Frame_49.Position = UDim2.new(0.27082943916320801, 0, 0.74518930912017822, 0)
G.Frame_49.Size = UDim2.new(0, 1, 0, 1)
G.Frame_49.ZIndex = 1000
G.Frame_49.Parent = G.Folder

-- UICorner_49 (UICorner)
G.UICorner_49 = Instance.new("UICorner")
G.UICorner_49.CornerRadius = UDim.new(1, 0)
G.UICorner_49.Parent = G.Frame_49

-- Frame_50 (Frame)
G.Frame_50 = Instance.new("Frame")
G.Frame_50.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_50.BackgroundTransparency = 0.81999999284744263
G.Frame_50.BorderSizePixel = 0
G.Frame_50.Position = UDim2.new(0.31000000238418579, 0, 0.81000000238418579, 0)
G.Frame_50.Size = UDim2.new(0, 2, 0, 2)
G.Frame_50.ZIndex = 1000
G.Frame_50.Parent = G.Folder

-- UICorner_50 (UICorner)
G.UICorner_50 = Instance.new("UICorner")
G.UICorner_50.CornerRadius = UDim.new(1, 0)
G.UICorner_50.Parent = G.Frame_50

-- Frame_51 (Frame)
G.Frame_51 = Instance.new("Frame")
G.Frame_51.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_51.BackgroundTransparency = 0.70999997854232788
G.Frame_51.BorderSizePixel = 0
G.Frame_51.Position = UDim2.new(0.80091941356658936, 0, 0.29708829522132874, 0)
G.Frame_51.Size = UDim2.new(0, 3, 0, 3)
G.Frame_51.ZIndex = 1000
G.Frame_51.Parent = G.Folder

-- UICorner_51 (UICorner)
G.UICorner_51 = Instance.new("UICorner")
G.UICorner_51.CornerRadius = UDim.new(1, 0)
G.UICorner_51.Parent = G.Frame_51

-- Frame_52 (Frame)
G.Frame_52 = Instance.new("Frame")
G.Frame_52.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_52.BackgroundTransparency = 0.52999997138977051
G.Frame_52.BorderSizePixel = 0
G.Frame_52.Position = UDim2.new(0.81550121307373047, 0, 0.33699271082878113, 0)
G.Frame_52.Size = UDim2.new(0, 2, 0, 2)
G.Frame_52.ZIndex = 1000
G.Frame_52.Parent = G.Folder

-- UICorner_52 (UICorner)
G.UICorner_52 = Instance.new("UICorner")
G.UICorner_52.CornerRadius = UDim.new(1, 0)
G.UICorner_52.Parent = G.Frame_52

-- Frame_53 (Frame)
G.Frame_53 = Instance.new("Frame")
G.Frame_53.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_53.BackgroundTransparency = 0.81999999284744263
G.Frame_53.BorderSizePixel = 0
G.Frame_53.Position = UDim2.new(0.44772392511367798, 0, 0.76363193988800049, 0)
G.Frame_53.Size = UDim2.new(0, 3, 0, 3)
G.Frame_53.ZIndex = 1000
G.Frame_53.Parent = G.Folder

-- UICorner_53 (UICorner)
G.UICorner_53 = Instance.new("UICorner")
G.UICorner_53.CornerRadius = UDim.new(1, 0)
G.UICorner_53.Parent = G.Frame_53

-- Frame_54 (Frame)
G.Frame_54 = Instance.new("Frame")
G.Frame_54.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_54.BackgroundTransparency = 0.68999999761581421
G.Frame_54.BorderSizePixel = 0
G.Frame_54.Position = UDim2.new(0.64021289348602295, 0, 0.303404301404953, 0)
G.Frame_54.Size = UDim2.new(0, 1, 0, 1)
G.Frame_54.ZIndex = 1000
G.Frame_54.Parent = G.Folder

-- UICorner_54 (UICorner)
G.UICorner_54 = Instance.new("UICorner")
G.UICorner_54.CornerRadius = UDim.new(1, 0)
G.UICorner_54.Parent = G.Frame_54

-- Frame_55 (Frame)
G.Frame_55 = Instance.new("Frame")
G.Frame_55.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_55.BackgroundTransparency = 0.68999999761581421
G.Frame_55.BorderSizePixel = 0
G.Frame_55.Position = UDim2.new(0.42757970094680786, 0, 0.86538791656494141, 0)
G.Frame_55.Size = UDim2.new(0, 2, 0, 2)
G.Frame_55.ZIndex = 1000
G.Frame_55.Parent = G.Folder

-- UICorner_55 (UICorner)
G.UICorner_55 = Instance.new("UICorner")
G.UICorner_55.CornerRadius = UDim.new(1, 0)
G.UICorner_55.Parent = G.Frame_55

-- ImageLabel (ImageLabel)
G.ImageLabel = Instance.new("ImageLabel")
G.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
G.ImageLabel.BackgroundTransparency = 1
G.ImageLabel.Position = UDim2.new(0.5, 0, 0.41999998688697815, 0)
G.ImageLabel.Size = UDim2.new(0, 105, 0, 105)
G.ImageLabel.ZIndex = 1001
G.ImageLabel.Image = "rbxassetid://76026241322125"
G.ImageLabel.ScaleType = Enum.ScaleType.Fit
G.ImageLabel.Parent = G.KHAY_CINEMATIC_INTRO

-- UIStroke (UIStroke)
G.UIStroke = Instance.new("UIStroke")
G.UIStroke.Color = Color3.fromRGB(140, 80, 255)
G.UIStroke.Thickness = 2
G.UIStroke.Parent = G.ImageLabel

-- UIGradient (UIGradient)
G.UIGradient = Instance.new("UIGradient")
G.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 210, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 80, 255))})
G.UIGradient.Parent = G.UIStroke

-- TextLabel (TextLabel)
G.TextLabel = Instance.new("TextLabel")
G.TextLabel.AnchorPoint = Vector2.new(0.5, 0)
G.TextLabel.BackgroundTransparency = 1
G.TextLabel.Position = UDim2.new(0.5, 0, 0.56000000238418579, 115)
G.TextLabel.Size = UDim2.new(0, 400, 0, 45)
G.TextLabel.ZIndex = 1005
G.TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel.Text = "KHAY"
G.TextLabel.TextColor3 = Color3.fromRGB(235, 230, 255)
G.TextLabel.TextSize = 30
G.TextLabel.Parent = G.KHAY_CINEMATIC_INTRO

-- UIGradient_2 (UIGradient)
G.UIGradient_2 = Instance.new("UIGradient")
G.UIGradient_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 230, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 210, 255))})
G.UIGradient_2.Parent = G.TextLabel

-- TextLabel_2 (TextLabel)
G.TextLabel_2 = Instance.new("TextLabel")
G.TextLabel_2.AnchorPoint = Vector2.new(0.5, 0)
G.TextLabel_2.BackgroundTransparency = 1
G.TextLabel_2.Position = UDim2.new(0.5, 0, 0, 0)
G.TextLabel_2.Size = UDim2.new(0, 350, 0, 25)
G.TextLabel_2.ZIndex = 1005
G.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G.TextLabel_2.Text = "[ KHAY HUB • ULTRA EDITION ]"
G.TextLabel_2.TextColor3 = Color3.fromRGB(150, 140, 180)
G.TextLabel_2.TextSize = 11
G.TextLabel_2.TextTransparency = 1
G.TextLabel_2.Parent = G.KHAY_CINEMATIC_INTRO

-- Frame_56 (Frame)
G.Frame_56 = Instance.new("Frame")
G.Frame_56.AnchorPoint = Vector2.new(0.5, 0)
G.Frame_56.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_56.BackgroundTransparency = 1
G.Frame_56.BorderSizePixel = 0
G.Frame_56.Position = UDim2.new(0.5, 0, 0.68999999761581421, 0)
G.Frame_56.Size = UDim2.new(0, 0, 0, 2)
G.Frame_56.ZIndex = 1005
G.Frame_56.Parent = G.KHAY_CINEMATIC_INTRO

-- UIGradient_3 (UIGradient)
G.UIGradient_3 = Instance.new("UIGradient")
G.UIGradient_3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 210, 255))})
G.UIGradient_3.Parent = G.Frame_56

-- Frame_57 (Frame)
G.Frame_57 = Instance.new("Frame")
G.Frame_57.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_57.BackgroundTransparency = 0.64999997615814209
G.Frame_57.BorderSizePixel = 0
G.Frame_57.Position = UDim2.new(0, 0, 0.27448102831840515, 0)
G.Frame_57.Size = UDim2.new(1, 0, 0, 2)
G.Frame_57.ZIndex = 1003
G.Frame_57.Parent = G.KHAY_CINEMATIC_INTRO

-- KHAY_FLOAT (ImageButton)
G.KHAY_FLOAT = Instance.new("ImageButton")
G.KHAY_FLOAT.Name = "KHAY_FLOAT"
G.KHAY_FLOAT.BackgroundColor3 = Color3.fromRGB(16, 12, 28)
G.KHAY_FLOAT.BorderSizePixel = 0
G.KHAY_FLOAT.Position = UDim2.new(1, -195, 0, 14)
G.KHAY_FLOAT.Size = UDim2.new(0, 54, 0, 54)
G.KHAY_FLOAT.ZIndex = 1001
G.KHAY_FLOAT.Image = "rbxassetid://76026241322125"
G.KHAY_FLOAT.ScaleType = Enum.ScaleType.Crop
G.KHAY_FLOAT.Parent = G.KHAY_HUB

-- UICorner_56 (UICorner)
G.UICorner_56 = Instance.new("UICorner")
G.UICorner_56.CornerRadius = UDim.new(1, 0)
G.UICorner_56.Parent = G.KHAY_FLOAT

-- UIStroke_2 (UIStroke)
G.UIStroke_2 = Instance.new("UIStroke")
G.UIStroke_2.Color = Color3.fromRGB(140, 80, 255)
G.UIStroke_2.Thickness = 4
G.UIStroke_2.Transparency = 0.0052589448168873787
G.UIStroke_2.Parent = G.KHAY_FLOAT

-- UIGradient_4 (UIGradient)
G.UIGradient_4 = Instance.new("UIGradient")
G.UIGradient_4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 210, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 80, 255))})
G.UIGradient_4.Offset = Vector2.new(0.43370330333709717, 0)
G.UIGradient_4.Parent = G.UIStroke_2

-- KHAY_PANEL (Frame)
G.KHAY_PANEL = Instance.new("Frame")
G.KHAY_PANEL.Name = "KHAY_PANEL"
G.KHAY_PANEL.BackgroundColor3 = Color3.fromRGB(16, 12, 28)
G.KHAY_PANEL.BorderSizePixel = 0
G.KHAY_PANEL.ClipsDescendants = true
G.KHAY_PANEL.Position = UDim2.new(1, -327, 0, 81)
G.KHAY_PANEL.Size = UDim2.new(0, 255, 0, 175)
G.KHAY_PANEL.ZIndex = 14
G.KHAY_PANEL.Parent = G.KHAY_HUB

-- UICorner_57 (UICorner)
G.UICorner_57 = Instance.new("UICorner")
G.UICorner_57.CornerRadius = UDim.new(0, 18)
G.UICorner_57.Parent = G.KHAY_PANEL

-- UIStroke_3 (UIStroke)
G.UIStroke_3 = Instance.new("UIStroke")
G.UIStroke_3.Color = Color3.fromRGB(140, 80, 255)
G.UIStroke_3.Thickness = 4
G.UIStroke_3.Transparency = 0.00031489133834838867
G.UIStroke_3.Parent = G.KHAY_PANEL

-- UIGradient_5 (UIGradient)
G.UIGradient_5 = Instance.new("UIGradient")
G.UIGradient_5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 210, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 80, 255))})
G.UIGradient_5.Offset = Vector2.new(0.82640409469604492, 0)
G.UIGradient_5.Parent = G.UIStroke_3

-- Frame_58 (Frame)
G.Frame_58 = Instance.new("Frame")
G.Frame_58.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_58.BackgroundTransparency = 0.93000000715255737
G.Frame_58.BorderSizePixel = 0
G.Frame_58.Position = UDim2.new(0, 0, 0.090909093618392944, 0)
G.Frame_58.Size = UDim2.new(1, 0, 0, 1)
G.Frame_58.ZIndex = 15
G.Frame_58.Parent = G.KHAY_PANEL

-- Frame_59 (Frame)
G.Frame_59 = Instance.new("Frame")
G.Frame_59.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_59.BackgroundTransparency = 0.93000000715255737
G.Frame_59.BorderSizePixel = 0
G.Frame_59.Position = UDim2.new(0, 0, 0.18181818723678589, 0)
G.Frame_59.Size = UDim2.new(1, 0, 0, 1)
G.Frame_59.ZIndex = 15
G.Frame_59.Parent = G.KHAY_PANEL

-- Frame_60 (Frame)
G.Frame_60 = Instance.new("Frame")
G.Frame_60.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_60.BackgroundTransparency = 0.93000000715255737
G.Frame_60.BorderSizePixel = 0
G.Frame_60.Position = UDim2.new(0, 0, 0.27272728085517883, 0)
G.Frame_60.Size = UDim2.new(1, 0, 0, 1)
G.Frame_60.ZIndex = 15
G.Frame_60.Parent = G.KHAY_PANEL

-- Frame_61 (Frame)
G.Frame_61 = Instance.new("Frame")
G.Frame_61.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_61.BackgroundTransparency = 0.93000000715255737
G.Frame_61.BorderSizePixel = 0
G.Frame_61.Position = UDim2.new(0, 0, 0.36363637447357178, 0)
G.Frame_61.Size = UDim2.new(1, 0, 0, 1)
G.Frame_61.ZIndex = 15
G.Frame_61.Parent = G.KHAY_PANEL

-- Frame_62 (Frame)
G.Frame_62 = Instance.new("Frame")
G.Frame_62.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_62.BackgroundTransparency = 0.93000000715255737
G.Frame_62.BorderSizePixel = 0
G.Frame_62.Position = UDim2.new(0, 0, 0.45454546809196472, 0)
G.Frame_62.Size = UDim2.new(1, 0, 0, 1)
G.Frame_62.ZIndex = 15
G.Frame_62.Parent = G.KHAY_PANEL

-- Frame_63 (Frame)
G.Frame_63 = Instance.new("Frame")
G.Frame_63.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_63.BackgroundTransparency = 0.93000000715255737
G.Frame_63.BorderSizePixel = 0
G.Frame_63.Position = UDim2.new(0, 0, 0.54545456171035767, 0)
G.Frame_63.Size = UDim2.new(1, 0, 0, 1)
G.Frame_63.ZIndex = 15
G.Frame_63.Parent = G.KHAY_PANEL

-- Frame_64 (Frame)
G.Frame_64 = Instance.new("Frame")
G.Frame_64.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_64.BackgroundTransparency = 0.93000000715255737
G.Frame_64.BorderSizePixel = 0
G.Frame_64.Position = UDim2.new(0, 0, 0.63636362552642822, 0)
G.Frame_64.Size = UDim2.new(1, 0, 0, 1)
G.Frame_64.ZIndex = 15
G.Frame_64.Parent = G.KHAY_PANEL

-- Frame_65 (Frame)
G.Frame_65 = Instance.new("Frame")
G.Frame_65.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_65.BackgroundTransparency = 0.93000000715255737
G.Frame_65.BorderSizePixel = 0
G.Frame_65.Position = UDim2.new(0, 0, 0.72727274894714355, 0)
G.Frame_65.Size = UDim2.new(1, 0, 0, 1)
G.Frame_65.ZIndex = 15
G.Frame_65.Parent = G.KHAY_PANEL

-- Frame_66 (Frame)
G.Frame_66 = Instance.new("Frame")
G.Frame_66.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_66.BackgroundTransparency = 0.93000000715255737
G.Frame_66.BorderSizePixel = 0
G.Frame_66.Position = UDim2.new(0, 0, 0.81818181276321411, 0)
G.Frame_66.Size = UDim2.new(1, 0, 0, 1)
G.Frame_66.ZIndex = 15
G.Frame_66.Parent = G.KHAY_PANEL

-- Frame_67 (Frame)
G.Frame_67 = Instance.new("Frame")
G.Frame_67.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_67.BackgroundTransparency = 0.93000000715255737
G.Frame_67.BorderSizePixel = 0
G.Frame_67.Position = UDim2.new(0, 0, 0.90909093618392944, 0)
G.Frame_67.Size = UDim2.new(1, 0, 0, 1)
G.Frame_67.ZIndex = 15
G.Frame_67.Parent = G.KHAY_PANEL

-- Folder_2 (Folder)
G.Folder_2 = Instance.new("Folder")
G.Folder_2.Parent = G.KHAY_PANEL

-- Frame_68 (Frame)
G.Frame_68 = Instance.new("Frame")
G.Frame_68.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_68.BackgroundTransparency = 0.62999999523162842
G.Frame_68.BorderSizePixel = 0
G.Frame_68.Position = UDim2.new(0.51620018482208252, 0, 0.53949552774429321, 0)
G.Frame_68.Size = UDim2.new(0, 3, 0, 3)
G.Frame_68.ZIndex = 16
G.Frame_68.Parent = G.Folder_2

-- UICorner_58 (UICorner)
G.UICorner_58 = Instance.new("UICorner")
G.UICorner_58.CornerRadius = UDim.new(1, 0)
G.UICorner_58.Parent = G.Frame_68

-- Frame_69 (Frame)
G.Frame_69 = Instance.new("Frame")
G.Frame_69.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_69.BackgroundTransparency = 0.73000001907348633
G.Frame_69.BorderSizePixel = 0
G.Frame_69.Position = UDim2.new(0.06524968147277832, 0, 0.884735107421875, 0)
G.Frame_69.Size = UDim2.new(0, 2, 0, 2)
G.Frame_69.ZIndex = 16
G.Frame_69.Parent = G.Folder_2

-- UICorner_59 (UICorner)
G.UICorner_59 = Instance.new("UICorner")
G.UICorner_59.CornerRadius = UDim.new(1, 0)
G.UICorner_59.Parent = G.Frame_69

-- Frame_70 (Frame)
G.Frame_70 = Instance.new("Frame")
G.Frame_70.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_70.BackgroundTransparency = 0.75999999046325684
G.Frame_70.BorderSizePixel = 0
G.Frame_70.Position = UDim2.new(0.47732201218605042, 0, 0.3387640118598938, 0)
G.Frame_70.Size = UDim2.new(0, 3, 0, 3)
G.Frame_70.ZIndex = 16
G.Frame_70.Parent = G.Folder_2

-- UICorner_60 (UICorner)
G.UICorner_60 = Instance.new("UICorner")
G.UICorner_60.CornerRadius = UDim.new(1, 0)
G.UICorner_60.Parent = G.Frame_70

-- Frame_71 (Frame)
G.Frame_71 = Instance.new("Frame")
G.Frame_71.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_71.BackgroundTransparency = 0.77999997138977051
G.Frame_71.BorderSizePixel = 0
G.Frame_71.Position = UDim2.new(0.10728614777326584, 0, 0.10163498669862747, 0)
G.Frame_71.Size = UDim2.new(0, 4, 0, 4)
G.Frame_71.ZIndex = 16
G.Frame_71.Parent = G.Folder_2

-- UICorner_61 (UICorner)
G.UICorner_61 = Instance.new("UICorner")
G.UICorner_61.CornerRadius = UDim.new(1, 0)
G.UICorner_61.Parent = G.Frame_71

-- Frame_72 (Frame)
G.Frame_72 = Instance.new("Frame")
G.Frame_72.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_72.BackgroundTransparency = 0.75
G.Frame_72.BorderSizePixel = 0
G.Frame_72.Position = UDim2.new(0.29072904586791992, 0, 0.30559468269348145, 0)
G.Frame_72.Size = UDim2.new(0, 3, 0, 3)
G.Frame_72.ZIndex = 16
G.Frame_72.Parent = G.Folder_2

-- UICorner_62 (UICorner)
G.UICorner_62 = Instance.new("UICorner")
G.UICorner_62.CornerRadius = UDim.new(1, 0)
G.UICorner_62.Parent = G.Frame_72

-- Frame_73 (Frame)
G.Frame_73 = Instance.new("Frame")
G.Frame_73.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_73.BackgroundTransparency = 0.74000000953674316
G.Frame_73.BorderSizePixel = 0
G.Frame_73.Position = UDim2.new(0.63862669467926025, 0, 0.53896999359130859, 0)
G.Frame_73.Size = UDim2.new(0, 2, 0, 2)
G.Frame_73.ZIndex = 16
G.Frame_73.Parent = G.Folder_2

-- UICorner_63 (UICorner)
G.UICorner_63 = Instance.new("UICorner")
G.UICorner_63.CornerRadius = UDim.new(1, 0)
G.UICorner_63.Parent = G.Frame_73

-- Frame_74 (Frame)
G.Frame_74 = Instance.new("Frame")
G.Frame_74.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_74.BackgroundTransparency = 0.77999997138977051
G.Frame_74.BorderSizePixel = 0
G.Frame_74.Position = UDim2.new(0.20296123623847961, 0, 0.56870758533477783, 0)
G.Frame_74.Size = UDim2.new(0, 2, 0, 2)
G.Frame_74.ZIndex = 16
G.Frame_74.Parent = G.Folder_2

-- UICorner_64 (UICorner)
G.UICorner_64 = Instance.new("UICorner")
G.UICorner_64.CornerRadius = UDim.new(1, 0)
G.UICorner_64.Parent = G.Frame_74

-- Frame_75 (Frame)
G.Frame_75 = Instance.new("Frame")
G.Frame_75.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_75.BackgroundTransparency = 0.49000000953674316
G.Frame_75.BorderSizePixel = 0
G.Frame_75.Position = UDim2.new(0.18049430847167969, 0, 0.13181653618812561, 0)
G.Frame_75.Size = UDim2.new(0, 4, 0, 4)
G.Frame_75.ZIndex = 16
G.Frame_75.Parent = G.Folder_2

-- UICorner_65 (UICorner)
G.UICorner_65 = Instance.new("UICorner")
G.UICorner_65.CornerRadius = UDim.new(1, 0)
G.UICorner_65.Parent = G.Frame_75

-- Frame_76 (Frame)
G.Frame_76 = Instance.new("Frame")
G.Frame_76.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_76.BackgroundTransparency = 0.52999997138977051
G.Frame_76.BorderSizePixel = 0
G.Frame_76.Position = UDim2.new(0.7372596263885498, 0, 0.64168870449066162, 0)
G.Frame_76.Size = UDim2.new(0, 2, 0, 2)
G.Frame_76.ZIndex = 16
G.Frame_76.Parent = G.Folder_2

-- UICorner_66 (UICorner)
G.UICorner_66 = Instance.new("UICorner")
G.UICorner_66.CornerRadius = UDim.new(1, 0)
G.UICorner_66.Parent = G.Frame_76

-- Frame_77 (Frame)
G.Frame_77 = Instance.new("Frame")
G.Frame_77.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_77.BackgroundTransparency = 0.68000000715255737
G.Frame_77.BorderSizePixel = 0
G.Frame_77.Position = UDim2.new(0.14667414128780365, 0, 0.69221937656402588, 0)
G.Frame_77.Size = UDim2.new(0, 4, 0, 4)
G.Frame_77.ZIndex = 16
G.Frame_77.Parent = G.Folder_2

-- UICorner_67 (UICorner)
G.UICorner_67 = Instance.new("UICorner")
G.UICorner_67.CornerRadius = UDim.new(1, 0)
G.UICorner_67.Parent = G.Frame_77

-- Frame_78 (Frame)
G.Frame_78 = Instance.new("Frame")
G.Frame_78.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_78.BackgroundTransparency = 0.56999999284744263
G.Frame_78.BorderSizePixel = 0
G.Frame_78.Position = UDim2.new(0.47716948390007019, 0, 0.081226393580436707, 0)
G.Frame_78.Size = UDim2.new(0, 4, 0, 4)
G.Frame_78.ZIndex = 16
G.Frame_78.Parent = G.Folder_2

-- UICorner_68 (UICorner)
G.UICorner_68 = Instance.new("UICorner")
G.UICorner_68.CornerRadius = UDim.new(1, 0)
G.UICorner_68.Parent = G.Frame_78

-- Frame_79 (Frame)
G.Frame_79 = Instance.new("Frame")
G.Frame_79.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_79.BackgroundTransparency = 0.51999998092651367
G.Frame_79.BorderSizePixel = 0
G.Frame_79.Position = UDim2.new(0.060012727975845337, 0, 0.25001019239425659, 0)
G.Frame_79.Size = UDim2.new(0, 4, 0, 4)
G.Frame_79.ZIndex = 16
G.Frame_79.Parent = G.Folder_2

-- UICorner_69 (UICorner)
G.UICorner_69 = Instance.new("UICorner")
G.UICorner_69.CornerRadius = UDim.new(1, 0)
G.UICorner_69.Parent = G.Frame_79

-- Frame_80 (Frame)
G.Frame_80 = Instance.new("Frame")
G.Frame_80.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_80.BackgroundTransparency = 0.75999999046325684
G.Frame_80.BorderSizePixel = 0
G.Frame_80.Position = UDim2.new(0.19790172576904297, 0, 0.21881571412086487, 0)
G.Frame_80.Size = UDim2.new(0, 4, 0, 4)
G.Frame_80.ZIndex = 16
G.Frame_80.Parent = G.Folder_2

-- UICorner_70 (UICorner)
G.UICorner_70 = Instance.new("UICorner")
G.UICorner_70.CornerRadius = UDim.new(1, 0)
G.UICorner_70.Parent = G.Frame_80

-- Frame_81 (Frame)
G.Frame_81 = Instance.new("Frame")
G.Frame_81.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_81.BackgroundTransparency = 0.76999998092651367
G.Frame_81.BorderSizePixel = 0
G.Frame_81.Position = UDim2.new(0.090912647545337677, 0, 0.57988286018371582, 0)
G.Frame_81.Size = UDim2.new(0, 2, 0, 2)
G.Frame_81.ZIndex = 16
G.Frame_81.Parent = G.Folder_2

-- UICorner_71 (UICorner)
G.UICorner_71 = Instance.new("UICorner")
G.UICorner_71.CornerRadius = UDim.new(1, 0)
G.UICorner_71.Parent = G.Frame_81

-- Frame_82 (Frame)
G.Frame_82 = Instance.new("Frame")
G.Frame_82.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_82.BackgroundTransparency = 0.5
G.Frame_82.BorderSizePixel = 0
G.Frame_82.Position = UDim2.new(0.26520723104476929, 0, 0.40999999642372131, 0)
G.Frame_82.Size = UDim2.new(0, 2, 0, 2)
G.Frame_82.ZIndex = 16
G.Frame_82.Parent = G.Folder_2

-- UICorner_72 (UICorner)
G.UICorner_72 = Instance.new("UICorner")
G.UICorner_72.CornerRadius = UDim.new(1, 0)
G.UICorner_72.Parent = G.Frame_82

-- Frame_83 (Frame)
G.Frame_83 = Instance.new("Frame")
G.Frame_83.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_83.BackgroundTransparency = 0.69999998807907104
G.Frame_83.BorderSizePixel = 0
G.Frame_83.Position = UDim2.new(0.15050390362739563, 0, 0.8106001615524292, 0)
G.Frame_83.Size = UDim2.new(0, 3, 0, 3)
G.Frame_83.ZIndex = 16
G.Frame_83.Parent = G.Folder_2

-- UICorner_73 (UICorner)
G.UICorner_73 = Instance.new("UICorner")
G.UICorner_73.CornerRadius = UDim.new(1, 0)
G.UICorner_73.Parent = G.Frame_83

-- Frame_84 (Frame)
G.Frame_84 = Instance.new("Frame")
G.Frame_84.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_84.BackgroundTransparency = 0.55000001192092896
G.Frame_84.BorderSizePixel = 0
G.Frame_84.Position = UDim2.new(0.42854905128479004, 0, 0.71962654590606689, 0)
G.Frame_84.Size = UDim2.new(0, 4, 0, 4)
G.Frame_84.ZIndex = 16
G.Frame_84.Parent = G.Folder_2

-- UICorner_74 (UICorner)
G.UICorner_74 = Instance.new("UICorner")
G.UICorner_74.CornerRadius = UDim.new(1, 0)
G.UICorner_74.Parent = G.Frame_84

-- Frame_85 (Frame)
G.Frame_85 = Instance.new("Frame")
G.Frame_85.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_85.BackgroundTransparency = 0.75
G.Frame_85.BorderSizePixel = 0
G.Frame_85.Position = UDim2.new(0.38510125875473022, 0, 0.69060754776000977, 0)
G.Frame_85.Size = UDim2.new(0, 3, 0, 3)
G.Frame_85.ZIndex = 16
G.Frame_85.Parent = G.Folder_2

-- UICorner_75 (UICorner)
G.UICorner_75 = Instance.new("UICorner")
G.UICorner_75.CornerRadius = UDim.new(1, 0)
G.UICorner_75.Parent = G.Frame_85

-- Frame_86 (Frame)
G.Frame_86 = Instance.new("Frame")
G.Frame_86.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_86.BackgroundTransparency = 0.49000000953674316
G.Frame_86.BorderSizePixel = 0
G.Frame_86.Position = UDim2.new(0.63443571329116821, 0, 0.88038098812103271, 0)
G.Frame_86.Size = UDim2.new(0, 3, 0, 3)
G.Frame_86.ZIndex = 16
G.Frame_86.Parent = G.Folder_2

-- UICorner_76 (UICorner)
G.UICorner_76 = Instance.new("UICorner")
G.UICorner_76.CornerRadius = UDim.new(1, 0)
G.UICorner_76.Parent = G.Frame_86

-- Frame_87 (Frame)
G.Frame_87 = Instance.new("Frame")
G.Frame_87.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_87.BackgroundTransparency = 0.63999998569488525
G.Frame_87.BorderSizePixel = 0
G.Frame_87.Position = UDim2.new(0.76493102312088013, 0, 0.48980012536048889, 0)
G.Frame_87.Size = UDim2.new(0, 3, 0, 3)
G.Frame_87.ZIndex = 16
G.Frame_87.Parent = G.Folder_2

-- UICorner_77 (UICorner)
G.UICorner_77 = Instance.new("UICorner")
G.UICorner_77.CornerRadius = UDim.new(1, 0)
G.UICorner_77.Parent = G.Frame_87

-- Frame_88 (Frame)
G.Frame_88 = Instance.new("Frame")
G.Frame_88.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_88.BackgroundTransparency = 0.80000001192092896
G.Frame_88.BorderSizePixel = 0
G.Frame_88.Position = UDim2.new(0.23981380462646484, 0, 0.40148529410362244, 0)
G.Frame_88.Size = UDim2.new(0, 4, 0, 4)
G.Frame_88.ZIndex = 16
G.Frame_88.Parent = G.Folder_2

-- UICorner_78 (UICorner)
G.UICorner_78 = Instance.new("UICorner")
G.UICorner_78.CornerRadius = UDim.new(1, 0)
G.UICorner_78.Parent = G.Frame_88

-- Frame_89 (Frame)
G.Frame_89 = Instance.new("Frame")
G.Frame_89.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_89.BackgroundTransparency = 0.64999997615814209
G.Frame_89.BorderSizePixel = 0
G.Frame_89.Position = UDim2.new(0.18410515785217285, 0, 0.79817390441894531, 0)
G.Frame_89.Size = UDim2.new(0, 2, 0, 2)
G.Frame_89.ZIndex = 16
G.Frame_89.Parent = G.Folder_2

-- UICorner_79 (UICorner)
G.UICorner_79 = Instance.new("UICorner")
G.UICorner_79.CornerRadius = UDim.new(1, 0)
G.UICorner_79.Parent = G.Frame_89

-- Frame_90 (Frame)
G.Frame_90 = Instance.new("Frame")
G.Frame_90.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_90.BackgroundTransparency = 0.57999998331069946
G.Frame_90.BorderSizePixel = 0
G.Frame_90.Position = UDim2.new(0.21225666999816895, 0, 0.71621882915496826, 0)
G.Frame_90.Size = UDim2.new(0, 2, 0, 2)
G.Frame_90.ZIndex = 16
G.Frame_90.Parent = G.Folder_2

-- UICorner_80 (UICorner)
G.UICorner_80 = Instance.new("UICorner")
G.UICorner_80.CornerRadius = UDim.new(1, 0)
G.UICorner_80.Parent = G.Frame_90

-- Frame_91 (Frame)
G.Frame_91 = Instance.new("Frame")
G.Frame_91.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_91.BackgroundTransparency = 0.49000000953674316
G.Frame_91.BorderSizePixel = 0
G.Frame_91.Position = UDim2.new(0.64506411552429199, 0, 0.82130563259124756, 0)
G.Frame_91.Size = UDim2.new(0, 2, 0, 2)
G.Frame_91.ZIndex = 16
G.Frame_91.Parent = G.Folder_2

-- UICorner_81 (UICorner)
G.UICorner_81 = Instance.new("UICorner")
G.UICorner_81.CornerRadius = UDim.new(1, 0)
G.UICorner_81.Parent = G.Frame_91

-- Frame_92 (Frame)
G.Frame_92 = Instance.new("Frame")
G.Frame_92.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_92.BackgroundTransparency = 0.49000000953674316
G.Frame_92.BorderSizePixel = 0
G.Frame_92.Position = UDim2.new(0.64796769618988037, 0, 0.80426263809204102, 0)
G.Frame_92.Size = UDim2.new(0, 4, 0, 4)
G.Frame_92.ZIndex = 16
G.Frame_92.Parent = G.Folder_2

-- UICorner_82 (UICorner)
G.UICorner_82 = Instance.new("UICorner")
G.UICorner_82.CornerRadius = UDim.new(1, 0)
G.UICorner_82.Parent = G.Frame_92

-- Frame_93 (Frame)
G.Frame_93 = Instance.new("Frame")
G.Frame_93.BackgroundColor3 = Color3.fromRGB(0, 210, 255)
G.Frame_93.BackgroundTransparency = 0.64999997615814209
G.Frame_93.BorderSizePixel = 0
G.Frame_93.Position = UDim2.new(0, 0, 0.80647695064544678, 0)
G.Frame_93.Size = UDim2.new(1, 0, 0, 1)
G.Frame_93.ZIndex = 20
G.Frame_93.Parent = G.KHAY_PANEL

-- ImageLabel_2 (ImageLabel)
G.ImageLabel_2 = Instance.new("ImageLabel")
G.ImageLabel_2.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
G.ImageLabel_2.BorderSizePixel = 0
G.ImageLabel_2.Position = UDim2.new(0, 10, 0, 10)
G.ImageLabel_2.Size = UDim2.new(0, 48, 0, 48)
G.ImageLabel_2.ZIndex = 50
G.ImageLabel_2.Image = "rbxassetid://76026241322125"
G.ImageLabel_2.ScaleType = Enum.ScaleType.Crop
G.ImageLabel_2.Parent = G.KHAY_PANEL

-- UICorner_83 (UICorner)
G.UICorner_83 = Instance.new("UICorner")
G.UICorner_83.CornerRadius = UDim.new(1, 0)
G.UICorner_83.Parent = G.ImageLabel_2

-- UIStroke_4 (UIStroke)
G.UIStroke_4 = Instance.new("UIStroke")
G.UIStroke_4.Color = Color3.fromRGB(140, 80, 255)
G.UIStroke_4.Thickness = 1.5
G.UIStroke_4.Parent = G.ImageLabel_2

-- TextLabel_3 (TextLabel)
G.TextLabel_3 = Instance.new("TextLabel")
G.TextLabel_3.BackgroundTransparency = 1
G.TextLabel_3.Position = UDim2.new(0, 68, 0, 10)
G.TextLabel_3.Size = UDim2.new(1, -80, 0, 25)
G.TextLabel_3.ZIndex = 50
G.TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_3.Text = "KHAY"
G.TextLabel_3.TextColor3 = Color3.fromRGB(235, 230, 255)
G.TextLabel_3.TextSize = 18
G.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_3.Parent = G.KHAY_PANEL

-- UIGradient_6 (UIGradient)
G.UIGradient_6 = Instance.new("UIGradient")
G.UIGradient_6.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 80, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 230, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 210, 255))})
G.UIGradient_6.Parent = G.TextLabel_3

-- TextLabel_4 (TextLabel)
G.TextLabel_4 = Instance.new("TextLabel")
G.TextLabel_4.BackgroundTransparency = 1
G.TextLabel_4.Position = UDim2.new(0, 68, 0, 32)
G.TextLabel_4.Size = UDim2.new(1, -80, 0, 11)
G.TextLabel_4.ZIndex = 50
G.TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G.TextLabel_4.Text = "[ ULTRA TELEPORT ]"
G.TextLabel_4.TextColor3 = Color3.fromRGB(150, 140, 180)
G.TextLabel_4.TextSize = 9
G.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_4.Parent = G.KHAY_PANEL

-- Frame_94 (Frame)
G.Frame_94 = Instance.new("Frame")
G.Frame_94.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
G.Frame_94.BackgroundTransparency = 0.44999998807907104
G.Frame_94.BorderSizePixel = 0
G.Frame_94.Position = UDim2.new(0, 10, 0, 64)
G.Frame_94.Size = UDim2.new(1, -20, 0, 1)
G.Frame_94.ZIndex = 50
G.Frame_94.Parent = G.KHAY_PANEL

-- TextLabel_5 (TextLabel)
G.TextLabel_5 = Instance.new("TextLabel")
G.TextLabel_5.BackgroundColor3 = Color3.fromRGB(24, 18, 40)
G.TextLabel_5.BorderSizePixel = 0
G.TextLabel_5.Position = UDim2.new(0, 10, 0, 72)
G.TextLabel_5.Size = UDim2.new(1, -20, 0, 27)
G.TextLabel_5.ZIndex = 50
G.TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_5.Text = "   ●  SYSTEM READY"
G.TextLabel_5.TextColor3 = Color3.fromRGB(0, 210, 255)
G.TextLabel_5.TextSize = 11
G.TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_5.Parent = G.KHAY_PANEL

-- UICorner_84 (UICorner)
G.UICorner_84 = Instance.new("UICorner")
G.UICorner_84.Parent = G.TextLabel_5

-- ULTRA_TP (TextButton)
G.ULTRA_TP = Instance.new("TextButton")
G.ULTRA_TP.Name = "ULTRA_TP"
G.ULTRA_TP.BackgroundColor3 = Color3.fromRGB(26, 20, 44)
G.ULTRA_TP.BorderSizePixel = 0
G.ULTRA_TP.Position = UDim2.new(0, 10, 0, 110)
G.ULTRA_TP.Size = UDim2.new(1, -20, 0, 45)
G.ULTRA_TP.ZIndex = 80
G.ULTRA_TP.AutoButtonColor = false
G.ULTRA_TP.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.ULTRA_TP.RichText = true
G.ULTRA_TP.Text = "<font color=\"rgb(160,150,190)\">[+] ULTRA TP • </font><font color=\"rgb(0,210,255)\">ON</font>"
G.ULTRA_TP.TextColor3 = Color3.fromRGB(255, 255, 255)
G.ULTRA_TP.TextSize = 13
G.ULTRA_TP.Parent = G.KHAY_PANEL

-- UICorner_85 (UICorner)
G.UICorner_85 = Instance.new("UICorner")
G.UICorner_85.CornerRadius = UDim.new(0, 10)
G.UICorner_85.Parent = G.ULTRA_TP

-- UIStroke_5 (UIStroke)
G.UIStroke_5 = Instance.new("UIStroke")
G.UIStroke_5.Color = Color3.fromRGB(140, 80, 255)
G.UIStroke_5.Parent = G.ULTRA_TP

-- ===================== ANTI HIT LOGIC (from file 2) =====================
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local AntiHitEnabled = false
local IsTeleporting = false

local TeleportPoints = {
	Vector3.new(500.62, 241.28, -366.64),
	Vector3.new(504.45, 155.80, -366.35),
	Vector3.new(508.30, 70.28, -366.03),
	Vector3.new(513.86, 70.28, -366.25),
	Vector3.new(519.43, 70.28, -366.47),
	Vector3.new(524.32, 70.28, -366.59),
	Vector3.new(529.22, 70.28, -366.71),
	Vector3.new(538.01, 70.28, -365.55),
	Vector3.new(546.80, 70.28, -364.40)
}

-- mount (remove old copy first, avoid duplicates)
local targetParent = (gethui and gethui()) or PlayerGui
local old = targetParent:FindFirstChild("KHAY_HUB")
if old then old:Destroy() end
G.KHAY_HUB.Parent = targetParent

-- Button state (ULTRA_TP = Anti-Hit toggle)
local function refreshButton()
	if AntiHitEnabled then
		G.ULTRA_TP.Text = '<font color="rgb(160,150,190)">[+] ANTI HIT • </font><font color="rgb(0,210,255)">ON</font>'
		G.TextLabel_5.Text = "   ●  ANTI HIT ACTIVE"
	else
		G.ULTRA_TP.Text = '<font color="rgb(160,150,190)">[+] ANTI HIT • </font><font color="rgb(255,90,110)">OFF</font>'
		G.TextLabel_5.Text = "   ●  SYSTEM READY"
	end
end
refreshButton()

G.ULTRA_TP.MouseButton1Click:Connect(function()
	AntiHitEnabled = not AntiHitEnabled
	refreshButton()
end)

-- Floating logo opens/closes the panel
G.KHAY_FLOAT.MouseButton1Click:Connect(function()
	G.KHAY_PANEL.Visible = not G.KHAY_PANEL.Visible
end)

-- Loading overlay (reuses the KHAY intro frame; Frame_56 = progress bar)
local overlay = G.KHAY_CINEMATIC_INTRO
local bar = G.Frame_56

local function TeleportRoute(Character)
	if not AntiHitEnabled then return end
	if not Character or not Character.Parent then return end

	overlay.Visible = true
	overlay.BackgroundTransparency = 0
	bar.Size = UDim2.new(0, 0, 0, 2)
	G.TextLabel_2.Text = "anti hit almost loaded"

	local total = #TeleportPoints
	for Index, Position in ipairs(TeleportPoints) do
		if not AntiHitEnabled then
			overlay.Visible = false
			return
		end

		TweenService:Create(bar, TweenInfo.new(0.12), {Size = UDim2.new(0, 220 * (Index / total), 0, 2)}):Play()
		if Index == total then
			G.TextLabel_2.Text = "anti hit loaded!"
		end

		Character:PivotTo(CFrame.new(Position))
		if Index < total then
			RunService.Heartbeat:Wait()
		end
	end

	task.wait(0.25)
	local fade = TweenService:Create(overlay, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
	fade:Play()
	fade.Completed:Wait()
	overlay.Visible = false
	G.TextLabel_2.Text = "[ KHAY HUB • ULTRA EDITION ]"
end

ProximityPromptService.PromptTriggered:Connect(function(Prompt, TriggeredPlayer)
	if TriggeredPlayer ~= LocalPlayer then return end
	if not AntiHitEnabled or IsTeleporting then return end
	local Character = LocalPlayer.Character
	if not Character then return end
	IsTeleporting = true
	TeleportRoute(Character)
	IsTeleporting = false
end)

return G.KHAY_HUB
