-- TWKS | FENALHUB MEGA v3 | by quasi-krytoi
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local Lighting   = game:GetService("Lighting")
local Workspace  = game:GetService("Workspace")
local Teleport   = game:GetService("TeleportService")
local HttpS      = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local TweenS     = game:GetService("TweenService")
local LP         = Players.LocalPlayer
local CAM        = Workspace.CurrentCamera

local ADMIN_NAME  = "dosksjjsdu"
local ADMIN_KEY   = "AdminKey"
local DEFAULT_KEY = "FENALHUB-13371337-929383-hello"

local function getUID(plr)
    if plr.Name == ADMIN_NAME then return 1 end
    return (plr.UserId or 0) % 900000000 + 100000000
end
local function getRank(plr)
    if plr.Name == ADMIN_NAME then return "Rang Admin" end
    return "Player"
end

local USER_NAME = LP.Name
local USER_ID   = getUID(LP)
local USER_RANK = getRank(LP)
local IS_ADMIN  = (LP.Name == ADMIN_NAME)
local USER_KEY  = IS_ADMIN and ADMIN_KEY or DEFAULT_KEY
local START_TIME = tick()

local pg = LP:WaitForChild("PlayerGui")

-- ===== KEY WINDOW =====
local kg = Instance.new("ScreenGui", pg)
kg.Name = "FHK"; kg.ResetOnSpawn = false; kg.DisplayOrder = 999
local kf = Instance.new("Frame", kg)
kf.Size = UDim2.new(0,340,0,190); kf.Position = UDim2.new(0.5,-170,0.5,-95)
kf.BackgroundColor3 = Color3.fromRGB(15,15,20); kf.BorderSizePixel = 0
kf.Active = true; kf.Draggable = true
Instance.new("UICorner", kf).CornerRadius = UDim.new(0,14)
local kSt = Instance.new("UIStroke", kf)
kSt.Color = Color3.fromRGB(0,255,180); kSt.Thickness = 1.5
local kt = Instance.new("TextLabel", kf)
kt.Size = UDim2.new(1,0,0,44); kt.BackgroundTransparency = 1
kt.Text = "✦ FENALHUB MEGA ✦"; kt.TextColor3 = Color3.fromRGB(0,255,180)
kt.Font = Enum.Font.GothamBlack; kt.TextSize = 20
local ksub = Instance.new("TextLabel", kf)
ksub.Size = UDim2.new(1,0,0,16); ksub.Position = UDim2.new(0,0,0,44)
ksub.BackgroundTransparency = 1; ksub.Text = "введи ключ доступа"
ksub.TextColor3 = Color3.fromRGB(160,160,180); ksub.Font = Enum.Font.Gotham; ksub.TextSize = 11
local kbox = Instance.new("TextBox", kf)
kbox.Size = UDim2.new(1,-40,0,40); kbox.Position = UDim2.new(0,20,0,72)
kbox.BackgroundColor3 = Color3.fromRGB(28,28,38); kbox.BorderSizePixel = 0
kbox.PlaceholderText = "..."; kbox.Text = ""
kbox.TextColor3 = Color3.fromRGB(230,230,230); kbox.Font = Enum.Font.Gotham
kbox.TextSize = 14; kbox.ClearTextOnFocus = false
Instance.new("UICorner", kbox).CornerRadius = UDim.new(0,8)
local kstt = Instance.new("TextLabel", kf)
kstt.Size = UDim2.new(1,0,0,16); kstt.Position = UDim2.new(0,0,0,116)
kstt.BackgroundTransparency = 1; kstt.Text = ""
kstt.TextColor3 = Color3.fromRGB(255,80,80); kstt.Font = Enum.Font.Gotham; kstt.TextSize = 11
local kbtn = Instance.new("TextButton", kf)
kbtn.Size = UDim2.new(1,-40,0,36); kbtn.Position = UDim2.new(0,20,0,138)
kbtn.BackgroundColor3 = Color3.fromRGB(0,180,130); kbtn.BorderSizePixel = 0
kbtn.Text = "ВОЙТИ"; kbtn.TextColor3 = Color3.fromRGB(255,255,255)
kbtn.Font = Enum.Font.GothamBold; kbtn.TextSize = 13
Instance.new("UICorner", kbtn).CornerRadius = UDim.new(0,8)

-- ===== BUILD =====
local function BUILD()
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local S = {
        fly=false, flySpeed=60, noclip=false, speed=false, speedVal=50,
        jump=false, jumpVal=50, infJump=false, autoJump=false, clickTP=false,
        antiVoid=false, spin=false, spinSpeed=10, freeze=false,
        lockY=false, lockYVal=50, saveCframe=nil,
        tpWalk=false, tpWalkSpeed=50, antiFling=false,
        doubleJump=false, tripleJump=false, dash=false, dashSpeed=200,
        bunnyHop=false, wallClimb=false, slide=false,
        esp=false, chams=false, fullbright=false, invisible=false,
        nightVision=false, noFog=false, noShadow=false, fov=70,
        tracers=false, nameTags=false, healthBars=false, crosshair=false,
        aimFovCircle=false, trail=false, aura=false, skyboxID="",
        _tp="", _wp="wp1", waypoints={},
        hitbox=false, hitboxVal=15, killAura=false, aimbot=false,
        silentAim=false, triggerBot=false, aimFov=200,
        wallCheck=true, teamCheck=false, antiAim=false,
        gravity=false, gravityVal=50,
        chatMsg="FENALHUB", chatSpam=false, chatDelay=5,
        antiAFK=true, hideGui=false, antiCheatBypass=true,
        antiKick=false, antiTP=false, antiStun=false, antiRagdoll=false,
        noFallDamage=false, autoFarmMM2=false, autoClicker=false, autoClickDelay=0.1,
        autoCollect=false, autoRejoin=false,
        buildMode=false,
        kills=0, deaths=0, coinsCollected=0,
    }

    local Window = WindUI:CreateWindow({
        Title = "FENALHUB MEGA | " .. (IS_ADMIN and "ADMIN" or "USER"),
        Icon = "zap",
        Author = USER_NAME .. " | " .. USER_RANK,
        Folder = "FenalHubMega",
        Size = UDim2.fromOffset(640, 500),
        Transparent = true, Theme = "Dark",
        User = { Enabled = true, Anonymous = false },
    })-- ===== WATERMARK v3 =====
local wmGui = Instance.new("ScreenGui", pg)
wmGui.Name = "FENALHUB_WM"; wmGui.ResetOnSpawn = false; wmGui.DisplayOrder = 998
local wm = Instance.new("TextButton", wmGui)
wm.Size = UDim2.new(0,520,0,34); wm.Position = UDim2.new(0.5,-260,0,10)
wm.BackgroundColor3 = Color3.fromRGB(15,15,22); wm.BackgroundTransparency = 0.15
wm.BorderSizePixel = 0; wm.Text = ""; wm.AutoButtonColor = false
wm.Active = true; wm.Draggable = true
Instance.new("UICorner", wm).CornerRadius = UDim.new(0,10)
local wS = Instance.new("UIStroke", wm)
wS.Color = Color3.fromRGB(0,255,180); wS.Thickness = 1; wS.Transparency = 0.3
local wG = Instance.new("UIGradient", wS)
wG.Color = ColorSequence.new(Color3.fromRGB(0,255,180), Color3.fromRGB(0,180,255))
local ic = Instance.new("TextLabel", wm)
ic.Size = UDim2.new(0,26,1,0); ic.Position = UDim2.new(0,8,0,0)
ic.BackgroundTransparency = 1; ic.Text = "✦"
ic.TextColor3 = Color3.fromRGB(0,255,180); ic.Font = Enum.Font.GothamBold; ic.TextSize = 16
local tt = Instance.new("TextLabel", wm)
tt.Size = UDim2.new(0,150,1,0); tt.Position = UDim2.new(0,38,0,0)
tt.BackgroundTransparency = 1; tt.Text = "FENALHUB MEGA v3"
tt.TextColor3 = Color3.fromRGB(0,255,180); tt.Font = Enum.Font.GothamBold
tt.TextSize = 12; tt.TextXAlignment = Enum.TextXAlignment.Left
local inf = Instance.new("TextLabel", wm)
inf.Size = UDim2.new(1,-195,1,0); inf.Position = UDim2.new(0,185,0,0)
inf.BackgroundTransparency = 1
inf.Text = string.format("UID:%d | %s | %s", USER_ID, USER_NAME, USER_RANK)
inf.TextColor3 = Color3.fromRGB(200,200,220); inf.Font = Enum.Font.Gotham
inf.TextSize = 10; inf.TextXAlignment = Enum.TextXAlignment.Right
task.spawn(function()
    while wm.Parent do
        for i = 0,1,0.02 do
            if not wm.Parent then break end
            wG.Rotation = i*360; task.wait(0.03)
        end
    end
end)
local fpsAccum, fpsFrames = 0, 0
RunService.RenderStepped:Connect(function(dt)
    fpsAccum += dt; fpsFrames += 1
    if fpsAccum >= 1 then
        local fps = math.floor(fpsFrames / fpsAccum)
        local up = math.floor(tick() - START_TIME)
        local mm = math.floor(up/60); local ss = up%60
        local ping = 0
        pcall(function() ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        inf.Text = string.format("UID:%d | %s | %s | %dfps | %02d:%02d | %dms",
            USER_ID, USER_NAME, USER_RANK, fps, mm, ss, ping)
        fpsAccum, fpsFrames = 0, 0
    end
end)
local menuOpen = true
wm.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    if menuOpen then Window:Open() else Window:Close() end
end)

-- ===== TAB: MOVE =====
local T1 = Window:Tab({Title="Move", Icon="move"})
T1:Toggle({Title="Fly", Desc="WASD + Space/LCtrl", Default=false, Callback=function(v) S.fly=v end})
T1:Slider({Title="Fly Speed", Value={Min=10,Max=1000,Default=60}, Callback=function(v) S.flySpeed=v end})
T1:Toggle({Title="Noclip", Default=false, Callback=function(v) S.noclip=v end})
T1:Toggle({Title="Speed Hack", Default=false, Callback=function(v)
    S.speed=v
    local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed=v and S.speedVal or 16 end
end})
T1:Slider({Title="Walk Speed", Value={Min=16,Max=1000,Default=50}, Callback=function(v)
    S.speedVal=v
    if S.speed then
        local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed=v end
    end
end})
T1:Toggle({Title="Jump Power", Default=false, Callback=function(v)
    S.jump=v
    local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h then h.UseJumpPower=true; h.JumpPower=v and S.jumpVal or 50 end
end})
T1:Slider({Title="Jump Value", Value={Min=50,Max=1000,Default=50}, Callback=function(v) S.jumpVal=v end})
T1:Toggle({Title="Infinite Jump", Default=false, Callback=function(v) S.infJump=v end})
T1:Toggle({Title="Auto Jump", Default=false, Callback=function(v) S.autoJump=v end})
T1:Toggle({Title="Double Jump", Default=false, Callback=function(v) S.doubleJump=v end})
T1:Toggle({Title="Triple Jump", Default=false, Callback=function(v) S.tripleJump=v end})
T1:Toggle({Title="Bunny Hop", Default=false, Callback=function(v) S.bunnyHop=v end})
T1:Toggle({Title="Wall Climb", Default=false, Callback=function(v) S.wallClimb=v end})
T1:Toggle({Title="Slide (Ctrl+W)", Default=false, Callback=function(v) S.slide=v end})
T1:Toggle({Title="Dash (Q)", Default=false, Callback=function(v) S.dash=v end})
T1:Slider({Title="Dash Speed", Value={Min=50,Max=1000,Default=200}, Callback=function(v) S.dashSpeed=v end})
T1:Toggle({Title="TP Walk", Default=false, Callback=function(v) S.tpWalk=v end})
T1:Slider({Title="TP Walk Speed", Value={Min=10,Max=500,Default=50}, Callback=function(v) S.tpWalkSpeed=v end})
T1:Toggle({Title="Click TP", Default=false, Callback=function(v) S.clickTP=v end})
T1:Toggle({Title="Anti Void", Default=false, Callback=function(v) S.antiVoid=v end})
T1:Toggle({Title="Anti Fling", Default=false, Callback=function(v) S.antiFling=v end})
T1:Toggle({Title="Spin", Default=false, Callback=function(v) S.spin=v end})
T1:Slider({Title="Spin Speed", Value={Min=1,Max=100,Default=10}, Callback=function(v) S.spinSpeed=v end})
T1:Toggle({Title="Freeze Position", Default=false, Callback=function(v) S.freeze=v end})
T1:Toggle({Title="Lock Y", Default=false, Callback=function(v) S.lockY=v end})
T1:Slider({Title="Lock Y Value", Value={Min=1,Max=500,Default=50}, Callback=function(v) S.lockYVal=v end})-- ===== TAB: VISUAL =====
local T2 = Window:Tab({Title="Visual", Icon="eye"})
T2:Toggle({Title="ESP Players", Default=false, Callback=function(v)
    S.esp=v
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hl=p.Character:FindFirstChild("TWKS_ESP")
            if v and not hl then
                local h=Instance.new("Highlight", p.Character)
                h.Name="TWKS_ESP"; h.FillColor=Color3.fromRGB(255,60,60)
                h.OutlineColor=Color3.fromRGB(255,255,255)
            elseif not v and hl then hl:Destroy() end
        end
    end
end})
T2:Toggle({Title="Chams", Default=false, Callback=function(v)
    S.chams=v
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hl=p.Character:FindFirstChild("TWKS_Chams")
            if v and not hl then
                local h=Instance.new("Highlight", p.Character)
                h.Name="TWKS_Chams"; h.FillColor=Color3.fromRGB(0,150,255)
                h.OutlineColor=Color3.fromRGB(0,255,255); h.FillTransparency=0.5
            elseif not v and hl then hl:Destroy() end
        end
    end
end})
T2:Toggle({Title="Fullbright", Default=false, Callback=function(v)
    if v then
        Lighting.Ambient=Color3.fromRGB(255,255,255)
        Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255); Lighting.Brightness=3
    else
        Lighting.Ambient=Color3.fromRGB(0,0,0)
        Lighting.OutdoorAmbient=Color3.fromRGB(70,70,70); Lighting.Brightness=2
    end
end})
T2:Toggle({Title="Invisible (local)", Default=false, Callback=function(v)
    local c=LP.Character; if not c then return end
    for _,p in ipairs(c:GetDescendants()) do
        if p:IsA("BasePart") then p.Transparency=v and 1 or 0; p.CanCollide=not v
        elseif p:IsA("Decal") then p.Transparency=v and 1 or 0 end
    end
end})
T2:Toggle({Title="Night Vision", Default=false, Callback=function(v)
    if v then
        local cc=Instance.new("ColorCorrectionEffect", Lighting)
        cc.Name="TWKS_NV"; cc.TintColor=Color3.fromRGB(0,255,0); cc.Brightness=0.2
    else
        local nv=Lighting:FindFirstChild("TWKS_NV"); if nv then nv:Destroy() end
    end
end})
T2:Toggle({Title="No Fog", Default=false, Callback=function(v)
    Lighting.FogEnd=v and 1e6 or 100000
end})
T2:Toggle({Title="No Shadows", Default=false, Callback=function(v)
    Lighting.GlobalShadows=not v
end})
T2:Slider({Title="FOV", Value={Min=70,Max=180,Default=70}, Callback=function(v) CAM.FieldOfView=v end})
T2:Toggle({Title="Aim FOV Circle", Default=false, Callback=function(v) S.aimFovCircle=v end})
T2:Toggle({Title="Name Tags", Default=false, Callback=function(v) S.nameTags=v end})
T2:Toggle({Title="Health Bars", Default=false, Callback=function(v) S.healthBars=v end})
T2:Toggle({Title="Tracers", Default=false, Callback=function(v) S.tracers=v end})
T2:Toggle({Title="Crosshair", Default=false, Callback=function(v)
    S.crosshair=v
    if v then
        local cg = Instance.new("ScreenGui", pg); cg.Name = "TWKS_Crosshair"
        local dot = Instance.new("Frame", cg)
        dot.Size = UDim2.new(0,6,0,6)
        dot.Position = UDim2.new(0.5,-3,0.5,-3)
        dot.BackgroundColor3 = Color3.fromRGB(0,255,180)
        dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
    else
        local cg = pg:FindFirstChild("TWKS_Crosshair")
        if cg then cg:Destroy() end
    end
end})
T2:Toggle({Title="Trail", Default=false, Callback=function(v)
    S.trail=v
    local c=LP.Character; if not c then return end
    if v then
        local att0 = c:FindFirstChild("TWKS_Att0") or Instance.new("Attachment", c:FindFirstChild("HumanoidRootPart"))
        att0.Name = "TWKS_Att0"
        local att1 = c:FindFirstChild("TWKS_Att1") or Instance.new("Attachment", c:FindFirstChild("HumanoidRootPart"))
        att1.Name = "TWKS_Att1"
        att1.Position = Vector3.new(0,-3,0)
        local tr = Instance.new("Trail", c)
        tr.Name = "TWKS_Trail"
        tr.Attachment0 = att0; tr.Attachment1 = att1
        tr.Lifetime = 1
        tr.Color = ColorSequence.new(Color3.fromRGB(0,255,180), Color3.fromRGB(0,180,255))
    else
        local tr = c:FindFirstChild("TWKS_Trail"); if tr then tr:Destroy() end
    end
end})
T2:Toggle({Title="Aura (particles)", Default=false, Callback=function(v)
    S.aura=v
    local c=LP.Character; if not c then return end
    if v then
        local att = Instance.new("Attachment", c:FindFirstChild("HumanoidRootPart"))
        att.Name = "TWKS_AuraAtt"
        local pe = Instance.new("ParticleEmitter", att)
        pe.Name = "TWKS_Aura"
        pe.Rate = 30
        pe.Lifetime = NumberRange.new(1,2)
        pe.Speed = NumberRange.new(2,4)
        pe.SpreadAngle = Vector2.new(180,180)
        pe.Color = ColorSequence.new(Color3.fromRGB(0,255,180))
        pe.Size = NumberSequence.new(0.5)
    else
        local pe = c:FindFirstChild("TWKS_AuraAtt")
        if pe then pe:Destroy() end
    end
end})
T2:Dropdown({Title="Skybox", Values={"Default","Космос","Галактика","Закат","Неон","Матрица","Океан"}, Default="Default", Callback=function(v)
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then sky:Destroy() end
    local presets = {
        ["Космос"] = {"rbxassetid://159454299","rbxassetid://159454296","rbxassetid://159454293","rbxassetid://159454286","rbxassetid://159454300","rbxassetid://159454288"},
        ["Галактика"] = {"rbxassetid://6818184095","rbxassetid://6818184507","rbxassetid://6818184973","rbxassetid://6818185329","rbxassetid://6818185629","rbxassetid://6818185937"},
        ["Закат"] = {"rbxassetid://159454299","rbxassetid://159454296","rbxassetid://159454293","rbxassetid://159454286","rbxassetid://159454300","rbxassetid://159454288"},
        ["Неон"] = {"rbxassetid://6818184095","rbxassetid://6818184507","rbxassetid://6818184973","rbxassetid://6818185329","rbxassetid://6818185629","rbxassetid://6818185937"},
        ["Матрица"] = {"rbxassetid://159454299","rbxassetid://159454296","rbxassetid://159454293","rbxassetid://159454286","rbxassetid://159454300","rbxassetid://159454288"},
        ["Океан"] = {"rbxassetid://159454299","rbxassetid://159454296","rbxassetid://159454293","rbxassetid://159454286","rbxassetid://159454300","rbxassetid://159454288"},
    }
    if v ~= "Default" and presets[v] then
        local ns = Instance.new("Sky", Lighting)
        ns.SkyboxBk = presets[v][1]; ns.SkyboxDn = presets[v][2]
        ns.SkyboxFt = presets[v][3]; ns.SkyboxLf = presets[v][4]
        ns.SkyboxRt = presets[v][5]; ns.SkyboxUp = presets[v][6]
    end
end})
T2:Button({Title="Refresh ESP", Callback=function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local h=p.Character:FindFirstChild("TWKS_ESP")
            if h then h:Destroy() end
        end
    end
end})
T2:Button({Title="Remove Lighting FX", Callback=function()
    for _,c in ipairs(Lighting:GetChildren()) do
        if c:IsA("BlurEffect") or c:IsA("SunRaysEffect")
            or c:IsA("ColorCorrectionEffect") or c:IsA("BloomEffect")
            or c:IsA("DepthOfFieldEffect") then c:Destroy() end
    end
end})-- ===== TAB: PLAYER =====
local T3 = Window:Tab({Title="Player", Icon="user"})
T3:Button({Title="Reset", Callback=function()
    local c=LP.Character; if c then c:BreakJoints() end
end})
T3:Button({Title="Respawn", Callback=function() LP:LoadCharacter() end})
T3:Button({Title="Save Position", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r then S.saveCframe=r.CFrame; WindUI:Notify({Title="Saved",Content="ok",Duration=2}) end
end})
T3:Button({Title="TP to Saved", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and S.saveCframe then r.CFrame=S.saveCframe end
end})
T3:Button({Title="TP to Spawn", Callback=function()
    local sp=Workspace:FindFirstChildOfClass("SpawnLocation")
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if sp and r then r.CFrame=sp.CFrame+Vector3.new(0,5,0) end
end})
T3:Button({Title="TP to Random", Callback=function()
    local l={} for _,p in ipairs(Players:GetPlayers()) do if p~=LP then table.insert(l,p) end end
    if #l==0 then return end
    local tt=l[math.random(#l)]
    local r=tt.Character and tt.Character:FindFirstChild("HumanoidRootPart")
    local mr=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and mr then mr.CFrame=r.CFrame+Vector3.new(0,3,0) end
end})
T3:Input({Title="Player Name", Value="", Callback=function(v) S._tp=v end})
T3:Button({Title="TP to Player", Callback=function()
    local tt=S._tp and Players:FindFirstChild(S._tp)
    if not tt or not tt.Character then return end
    local r=tt.Character:FindFirstChild("HumanoidRootPart")
    local mr=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and mr then mr.CFrame=r.CFrame+Vector3.new(0,3,0) end
end})
T3:Input({Title="Waypoint Name", Value="wp1", Callback=function(v) S._wp=v end})
T3:Button({Title="Save Waypoint", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and S._wp then S.waypoints[S._wp]=r.CFrame; WindUI:Notify({Title="WP",Content=S._wp,Duration=2}) end
end})
T3:Button({Title="TP to Waypoint", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and S.waypoints[S._wp] then r.CFrame=S.waypoints[S._wp] end
end})
T3:Button({Title="List Waypoints", Callback=function()
    local lines = {}
    for name,_ in pairs(S.waypoints) do
        table.insert(lines, "• "..name)
    end
    WindUI:Notify({Title="Waypoints", Content=#lines>0 and table.concat(lines,"\n") or "пусто", Duration=6})
end})
T3:Button({Title="Copy Position", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r and setclipboard then setclipboard(tostring(r.CFrame)) end
end})
T3:Button({Title="Copy Join Script", Callback=function()
    local s=string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s", game:GetService("Players").LocalPlayer)', game.PlaceId, game.JobId)
    if setclipboard then setclipboard(s) end
end})
T3:Button({Title="Show Players (UID/Rank/Dist)", Callback=function()
    local lines = {}
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    for _,p in ipairs(Players:GetPlayers()) do
        local d = 0
        if myR and p.Character then
            local pr = p.Character:FindFirstChild("HumanoidRootPart")
            if pr then d = math.floor((pr.Position - myR.Position).Magnitude) end
        end
        table.insert(lines, string.format("%s | UID:%d | %s | %dm", p.Name, getUID(p), getRank(p), d))
    end
    WindUI:Notify({Title="Players ("..#lines..")", Content=table.concat(lines,"\n"), Duration=10})
end})
T3:Toggle({Title="Lock Y", Default=false, Callback=function(v) S.lockY=v end})
T3:Slider({Title="Lock Y Value", Value={Min=1,Max=500,Default=50}, Callback=function(v) S.lockYVal=v end})-- ===== TAB: COMBAT =====
local T4 = Window:Tab({Title="Combat", Icon="sword"})
T4:Toggle({Title="Hitbox Expander", Default=false, Callback=function(v)
    S.hitbox=v
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Size=v and Vector3.new(S.hitboxVal,S.hitboxVal,S.hitboxVal) or Vector3.new(2,2,1) end
        end
    end
end})
T4:Slider({Title="Hitbox Size", Value={Min=3,Max=50,Default=15}, Callback=function(v)
    S.hitboxVal=v
    if S.hitbox then
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Size=Vector3.new(v,v,v) end
            end
        end
    end
end})
T4:Toggle({Title="Kill Aura", Default=false, Callback=function(v) S.killAura=v end})
T4:Toggle({Title="Aimbot v2 (prediction)", Desc="наводка с учётом движения", Default=false, Callback=function(v) S.aimbot=v end})
T4:Toggle({Title="Silent Aim v2", Default=false, Callback=function(v) S.silentAim=v end})
T4:Toggle({Title="Trigger Bot", Desc="авто-выстрел при наведении", Default=false, Callback=function(v) S.triggerBot=v end})
T4:Toggle({Title="Anti-Aim", Desc="случайное вращение", Default=false, Callback=function(v) S.antiAim=v end})
T4:Slider({Title="Aim FOV", Value={Min=50,Max=500,Default=200}, Callback=function(v) S.aimFov=v end})
T4:Toggle({Title="Wall Check", Default=true, Callback=function(v) S.wallCheck=v end})
T4:Toggle({Title="Team Check", Default=false, Callback=function(v) S.teamCheck=v end})
T4:Toggle({Title="Hit Sound", Desc="звук при попадании", Default=false, Callback=function(v)
    S.hitSound=v
    if v then
        local snd = Instance.new("Sound", SoundService or game:GetService("SoundService"))
        snd.Name = "TWKS_Hit"; snd.Volume = 1
        snd.SoundId = "rbxassetid://5801273946"
    end
end})
T4:Toggle({Title="Kill Notify", Default=false, Callback=function(v) S.killNotify=v end})
T4:Button({Title="Kill All (allowed games)", Callback=function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h.Health=0; S.kills = S.kills + 1 end
        end
    end
end})

-- ===== TAB: AUTO-FARM =====
local T5 = Window:Tab({Title="Farm", Icon="zap"})
T5:Paragraph({Title="Auto-Farm", Desc="Универсальный автофарм + MM2 монетки"})
T5:Toggle({Title="Auto-Farm MM2 (собирает монетки)", Default=false, Callback=function(v) S.autoFarmMM2=v end})
T5:Toggle({Title="Auto-Clicker", Default=false, Callback=function(v) S.autoClicker=v end})
T5:Slider({Title="Click Delay", Value={Min=0.05,Max=2,Default=0.1}, Callback=function(v) S.autoClickDelay=v end})
T5:Toggle({Title="Auto-Collect (items)", Default=false, Callback=function(v) S.autoCollect=v end})
T5:Toggle({Title="Auto Rejoin on Death", Default=false, Callback=function(v) S.autoRejoin=v end})
T5:Button({Title="Server Hop", Callback=function()
    local req = request or http_request or (syn and syn.request)
    if not req then return end
    local r = req({Url="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"}).Body
    local d = HttpS:JSONDecode(r)
    for _,s in ipairs(d.data) do
        if s.playing < s.maxPlayers then
            Teleport:TeleportToPlaceInstance(game.PlaceId, s.id, LP); return
        end
    end
end})-- ===== TAB: WORLD =====
local T6 = Window:Tab({Title="World", Icon="globe"})
T6:Toggle({Title="Low Gravity", Default=false, Callback=function(v)
    S.gravity=v; Workspace.Gravity=v and S.gravityVal or 196.2
end})
T6:Slider({Title="Gravity Value", Value={Min=10,Max=196,Default=50}, Callback=function(v)
    S.gravityVal=v; if S.gravity then Workspace.Gravity=v end
end})
T6:Button({Title="Rejoin Server", Callback=function() Teleport:Teleport(game.PlaceId, LP) end})
T6:Button({Title="Clear Terrain", Callback=function() Workspace.Terrain:Clear() end})
T6:Button({Title="Unlock FPS", Callback=function() if setfpscap then setfpscap(999) end end})
T6:Button({Title="Reset Camera", Callback=function() CAM.CameraType=Enum.CameraType.Custom end})
T6:Button({Title="Clear My Build Parts", Callback=function()
    for _,p in ipairs(Workspace:GetChildren()) do
        if p.Name == "TWKS_Build" and p:IsA("BasePart") then p:Destroy() end
    end
end})

-- ===== TAB: BUILD MODE =====
local T7 = Window:Tab({Title="Build", Icon="hammer"})
T7:Paragraph({Title="Build Mode", Desc="Клик — спавн парта. Клик на парт — удалить."})
T7:Toggle({Title="Build Mode ON", Default=false, Callback=function(v) S.buildMode=v end})
T7:Button({Title="Spawn Platform под собой", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not r then return end
    local part = Instance.new("Part", Workspace)
    part.Name = "TWKS_Build"
    part.Size = Vector3.new(10,1,10)
    part.Position = r.Position + Vector3.new(0,-3,0)
    part.Anchored = true
    part.BrickColor = BrickColor.new("Bright green")
    part.Material = Enum.Material.Neon
end})

-- ===== TAB: CHAT =====
local T8 = Window:Tab({Title="Chat", Icon="message-circle"})
T8:Input({Title="Message", Value="FENALHUB on top", Callback=function(v) S.chatMsg=v end})
T8:Toggle({Title="Chat Spam", Default=false, Callback=function(v) S.chatSpam=v end})
T8:Slider({Title="Spam Delay", Value={Min=1,Max=30,Default=5}, Callback=function(v) S.chatDelay=v end})
T8:Button({Title="Send Once", Callback=function()
    local evt=game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if evt and evt:FindFirstChild("SayMessageRequest") then
        evt.SayMessageRequest:FireServer(S.chatMsg or "FENALHUB", "All")
    end
end})
T8:Input({Title="Whisper Target", Value="", Callback=function(v) S._whisper=v end})
T8:Button({Title="Send Whisper", Callback=function()
    local evt=game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if evt and evt:FindFirstChild("SayMessageRequest") and S._whisper then
        evt.SayMessageRequest:FireServer("/w "..S._whisper.." "..(S.chatMsg or "hi"), "All")
    end
end})

-- ===== TAB: SCRIPT HUB =====
local T9 = Window:Tab({Title="Hub", Icon="download"})
T9:Paragraph({Title="Script Hub", Desc="Быстрый запуск готовых скриптов"})
T9:Button({Title="MM2 — Auto Coins + ESP", Callback=function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/quasi-krytoi/fenalhub/main/hubs/mm2.lua"))()
    end)
end})
T9:Button({Title="Natural Disaster Survival — God", Callback=function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/quasi-krytoi/fenalhub/main/hubs/nds.lua"))()
    end)
end})
T9:Button({Title="Prison Life — Auto Escape", Callback=function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/quasi-krytoi/fenalhub/main/hubs/prison.lua"))()
    end)
end})
T9:Button({Title="Steal Egg — Auto Farm", Callback=function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/quasi-krytoi/fenalhub/main/hubs/steal_egg.lua"))()
    end)
end})-- ===== TAB: MISC =====
local T10 = Window:Tab({Title="Misc", Icon="wrench"})
T10:Toggle({Title="Anti AFK", Default=true, Callback=function(v) S.antiAFK=v end})
T10:Toggle({Title="Anti-Cheat Bypass", Default=true, Callback=function(v) S.antiCheatBypass=v end})
T10:Toggle({Title="Anti-Kick", Default=false, Callback=function(v) S.antiKick=v end})
T10:Toggle({Title="Anti-TP (чужой телепорт)", Default=false, Callback=function(v) S.antiTP=v end})
T10:Toggle({Title="Anti-Stun", Default=false, Callback=function(v) S.antiStun=v end})
T10:Toggle({Title="Anti-Ragdoll", Default=false, Callback=function(v) S.antiRagdoll=v end})
T10:Toggle({Title="No Fall Damage", Default=false, Callback=function(v) S.noFallDamage=v end})
T10:Toggle({Title="Hide GUI (RightShift)", Default=false, Callback=function(v) S.hideGui=v end})
T10:Button({Title="Max Graphics", Callback=function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level10 end})
T10:Button({Title="Min Graphics", Callback=function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end})
T10:Button({Title="Unlock Mouse", Callback=function() UIS.MouseBehavior=Enum.MouseBehavior.Default end})
T10:Button({Title="Test Notification", Callback=function()
    StarterGui:SetCore("SendNotification", {Title="FENALHUB MEGA", Text="работает", Duration=3})
end})

-- ===== TAB: THEME =====
local T11 = Window:Tab({Title="Theme", Icon="palette"})
T11:Paragraph({Title="Тема", Desc="Поменяй тему WindUI"})
T11:Button({Title="Dark", Callback=function() pcall(function() WindUI:SetTheme("Dark") end) end})
T11:Button({Title="Light", Callback=function() pcall(function() WindUI:SetTheme("Light") end) end})

-- ===== TAB: KEYBINDS =====
local T12 = Window:Tab({Title="Keys", Icon="keyboard"})
T12:Paragraph({Title="Активные Keybinds", Desc="F=Fly | N=Noclip | X=ESP | Q=Dash | C=ClickTP | B=Build | G=AutoFarm | RightShift=Hide GUI"})

-- ===== TAB: ADMIN =====
if IS_ADMIN then
    local T13 = Window:Tab({Title="⚡ Admin", Icon="shield"})
    T13:Paragraph({Title="ADMIN PANEL", Desc="Только для "..ADMIN_NAME})
    T13:Button({Title="Freeze All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Anchored=true end
            end
        end
    end})
    T13:Button({Title="Unfreeze All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Anchored=false end
            end
        end
    end})
    T13:Button({Title="Bring All to Me", Callback=function()
        local mr=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not mr then return end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local r=p.Character:FindFirstChild("HumanoidRootPart")
                if r then r.CFrame = mr.CFrame + Vector3.new(0,3,0) end
            end
        end
    end})
    T13:Button({Title="Kill All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local h=p.Character:FindFirstChildOfClass("Humanoid")
                if h then h.Health=0 end
            end
        end
    end})
    T13:Button({Title="Copy All Player Info", Callback=function()
        local lines = {}
        for _,p in ipairs(Players:GetPlayers()) do
            table.insert(lines, p.Name.." | UID: "..getUID(p).." | "..getRank(p))
        end
        if setclipboard then setclipboard(table.concat(lines,"\n")) end
    end})
end

-- ===== TAB: STATS =====
local T14 = Window:Tab({Title="Stats", Icon="bar-chart"})
T14:Paragraph({Title="Твоя статистика", Desc="Сессия: "..math.floor(tick()-START_TIME).." сек\nKills: "..S.kills.."\nCoins: "..S.coinsCollected})
T14:Button({Title="Reset Stats", Callback=function()
    S.kills=0; S.deaths=0; S.coinsCollected=0
    WindUI:Notify({Title="Stats", Content="Сброшено", Duration=2})
end})

-- ===== TAB: INFO =====
local T15 = Window:Tab({Title="Info", Icon="info"})
T15:Paragraph({Title="Аккаунт", Desc="Nick: "..USER_NAME.."\nUID: "..USER_ID.."\nRank: "..USER_RANK})
T15:Paragraph({Title="Place", Desc="PlaceId: "..game.PlaceId.."\nJobId: "..game.JobId})
T15:Paragraph({Title="Version", Desc="FENALHUB MEGA v3 | by quasi-krytoi"})    -- ===== LOOPS =====

    -- FLY
    RunService.RenderStepped:Connect(function(dt)
        if S.fly then
            local c=LP.Character
            local r=c and c:FindFirstChild("HumanoidRootPart")
            local h=c and c:FindFirstChildOfClass("Humanoid")
            if r and h then
                h.PlatformStand=true
                local mv=Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then mv += CAM.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then mv -= CAM.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then mv -= CAM.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then mv += CAM.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then mv += Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then mv -= Vector3.new(0,1,0) end
                if mv.Magnitude > 0 then r.CFrame = r.CFrame + mv.Unit * S.flySpeed * dt end
                r.Velocity=Vector3.zero
            end
        end
    end)

    -- NOCLIP
    RunService.Stepped:Connect(function()
        if S.noclip and LP.Character then
            for _,p in ipairs(LP.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide=false end
            end
        end
    end)

    -- SPIN
    RunService.RenderStepped:Connect(function()
        if S.spin then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(S.spinSpeed), 0) end
        end
    end)

    -- TP WALK
    RunService.Heartbeat:Connect(function(dt)
        if S.tpWalk then
            local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if h and r and h.MoveDirection.Magnitude > 0 then
                r.CFrame = r.CFrame + h.MoveDirection * S.tpWalkSpeed * dt
            end
        end
    end)

    -- WALL CLIMB
    RunService.Heartbeat:Connect(function()
        if S.wallClimb then
            local c=LP.Character
            local r=c and c:FindFirstChild("HumanoidRootPart")
            if r then
                local ray = RaycastParams.new()
                ray.FilterDescendantsInstances = {c}
                ray.FilterType = Enum.RaycastFilterType.Exclude
                local hit = Workspace:Raycast(r.Position, r.CFrame.LookVector * 2, ray)
                if hit then r.Velocity = Vector3.new(0, 50, 0) end
            end
        end
    end)

    -- HEARTBEAT
    RunService.Heartbeat:Connect(function()
        if S.antiVoid then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r and r.Position.Y < -50 then r.CFrame = CFrame.new(r.Position.X, 100, r.Position.Z) end
        end
        if S.lockY then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then r.CFrame = CFrame.new(r.Position.X, S.lockYVal, r.Position.Z) end
        end
        if S.freeze then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r and S.saveCframe then r.CFrame = S.saveCframe end
        end
        if S.autoJump or S.bunnyHop then
            local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if h and h.FloorMaterial ~= Enum.Material.Air then
                h:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
        if S.killAura then
            local myR=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if myR then
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr~=LP and plr.Character then
                        local r2=plr.Character:FindFirstChild("HumanoidRootPart")
                        local h=plr.Character:FindFirstChildOfClass("Humanoid")
                        if r2 and h and (r2.Position-myR.Position).Magnitude < 10 then h.Health=0; S.kills = S.kills + 1 end
                    end
                end
            end
        end
    end)

    -- AIMBOT v2 (prediction)
    RunService.RenderStepped:Connect(function()
        if S.aimbot then
            local myR=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not myR then return end
            local closest, closestDist = nil, S.aimFov
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local r=p.Character:FindFirstChild("HumanoidRootPart")
                    local h=p.Character:FindFirstChildOfClass("Humanoid")
                    if r and h and h.Health > 0 then
                        if S.teamCheck and p.Team == LP.Team then continue end
                        local sc = CAM:WorldToViewportPoint(r.Position)
                        if sc.Z > 0 then
                            local d = (Vector2.new(sc.X, sc.Y) - Vector2.new(CAM.ViewportSize.X/2, CAM.ViewportSize.Y/2)).Magnitude
                            if d < closestDist then closest, closestDist = r, d end
                        end
                    end
                end
            end
            if closest then
                local predPos = closest.Position + closest.Velocity * 0.15
                CAM.CFrame = CFrame.new(CAM.CFrame.Position, predPos)
            end
        end
    end)

    -- SILENT AIM v2
    RunService.RenderStepped:Connect(function()
        if S.silentAim then
            local closest = nil
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local r=p.Character:FindFirstChild("HumanoidRootPart")
                    local h=p.Character:FindFirstChildOfClass("Humanoid")
                    if r and h and h.Health > 0 then closest = r end
                end
            end
            if closest and mousemoverel then
                local sc = CAM:WorldToViewportPoint(closest.Position + closest.Velocity * 0.15)
                if sc.Z > 0 then
                    mousemoverel(sc.X - CAM.ViewportSize.X/2, sc.Y - CAM.ViewportSize.Y/2)
                end
            end
        end
    end)

    -- ANTI-AIM
    RunService.Heartbeat:Connect(function()
        if S.antiAim then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(math.random(-180,180)), 0) end
        end
    end)

    -- AUTO-FARM MM2
    task.spawn(function()
        while true do
            task.wait(0.3)
            if S.autoFarmMM2 then
                local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                if myR and h then
                    local closest, dist = nil, math.huge
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("монет")) then
                            local d = (obj.Position - myR.Position).Magnitude
                            if d < dist then closest, dist = obj, d end
                        end
                    end
                    if closest then
                        h:MoveTo(closest.Position)
                        S.coinsCollected = S.coinsCollected + 1
                    else
                        local angle = tick() * 1.5
                        local r = 30
                        h:MoveTo(Vector3.new(math.sin(angle)*r, myR.Position.Y, math.cos(angle)*r))
                    end
                end
            end
        end
    end)

    -- AUTO-CLICKER
    task.spawn(function()
        while true do
            task.wait(S.autoClickDelay or 0.1)
            if S.autoClicker and mouse1click then
                mouse1click()
            end
        end
    end)

    -- AUTO-COLLECT
    task.spawn(function()
        while true do
            task.wait(0.5)
            if S.autoCollect then
                local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if myR then
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and obj.Name ~= "TWKS_Build" and (obj.Position - myR.Position).Magnitude < 15 then
                            local fire = obj:FindFirstChildWhichIsA("ProximityPrompt")
                            if fire and fireproximityprompt then
                                pcall(function() fireproximityprompt(fire) end)
                            end
                        end
                    end
                end
            end
        end
    end)

    -- CHAT SPAM
    task.spawn(function()
        while true do
            task.wait(S.chatDelay or 5)
            if S.chatSpam then
                local evt = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
                if evt and evt:FindFirstChild("SayMessageRequest") then
                    evt.SayMessageRequest:FireServer(S.chatMsg or "FENALHUB", "All")
                end
            end
        end
    end)

    -- AUTO REJOIN
    LP.CharacterAdded:Connect(function()
        if S.autoRejoin then
            task.wait(2)
            Teleport:Teleport(game.PlaceId, LP)
        end
    end)

    -- ANTI-AFK
    LP.Idled:Connect(function()
        if S.antiAFK then
            local vu=game:GetService("VirtualUser")
            vu:CaptureController(); vu:ClickButton2(Vector2.new())
        end
    end)

    -- INF JUMP
    UIS.JumpRequest:Connect(function()
        if S.infJump and LP.Character then
            local h=LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)

    -- CLICK TP
    UIS.InputBegan:Connect(function(i, g)
        if g or not S.clickTP then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1
            or i.UserInputType == Enum.UserInputType.Touch then
            local ur = CAM:ViewportPointToRay(i.Position.X, i.Position.Y)
            local pr = RaycastParams.new()
            pr.FilterType = Enum.RaycastFilterType.Exclude
            pr.FilterDescendantsInstances = {LP.Character}
            local res = Workspace:Raycast(ur.Origin, ur.Direction * 5000, pr)
            if res then
                local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if r then r.CFrame = CFrame.new(res.Position + Vector3.new(0,3,0)) end
            end
        end
    end)

    -- BUILD MODE
    UIS.InputBegan:Connect(function(i, g)
        if g or not S.buildMode then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1
            or i.UserInputType == Enum.UserInputType.Touch then
            local ur = CAM:ViewportPointToRay(i.Position.X, i.Position.Y)
            local pr = RaycastParams.new()
            pr.FilterType = Enum.RaycastFilterType.Exclude
            pr.FilterDescendantsInstances = {LP.Character}
            local res = Workspace:Raycast(ur.Origin, ur.Direction * 5000, pr)
            if res then
                local hit = res.Instance
                if hit and hit.Name == "TWKS_Build" then hit:Destroy(); return end
                local part = Instance.new("Part", Workspace)
                part.Name = "TWKS_Build"
                part.Size = Vector3.new(4,4,4)
                part.Position = res.Position + res.Normal * 2
                part.Anchored = true
                part.BrickColor = BrickColor.new("Bright green")
                part.Material = Enum.Material.Neon
            end
        end
    end)

    -- KEYBINDS
    UIS.InputBegan:Connect(function(i, g)
        if g then return end
        if i.KeyCode == Enum.KeyCode.F then S.fly = not S.fly end
        if i.KeyCode == Enum.KeyCode.N then S.noclip = not S.noclip end
        if i.KeyCode == Enum.KeyCode.X then
            S.esp = not S.esp
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local hl=p.Character:FindFirstChild("TWKS_ESP")
                    if S.esp and not hl then
                        local h=Instance.new("Highlight", p.Character)
                        h.Name="TWKS_ESP"; h.FillColor=Color3.fromRGB(255,60,60)
                        h.OutlineColor=Color3.fromRGB(255,255,255)
                    elseif not S.esp and hl then hl:Destroy() end
                end
            end
        end
        if i.KeyCode == Enum.KeyCode.G then S.autoFarmMM2 = not S.autoFarmMM2 end
        if i.KeyCode == Enum.KeyCode.C then S.clickTP = not S.clickTP end
        if i.KeyCode == Enum.KeyCode.B then S.buildMode = not S.buildMode end
        if i.KeyCode == Enum.KeyCode.Q and S.dash then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local dir = r.CFrame.LookVector
                local bv = Instance.new("BodyVelocity", r)
                bv.Velocity = dir * S.dashSpeed
                bv.MaxForce = Vector3.new(1e5,1e5,1e5)
                task.delay(0.15, function() bv:Destroy() end)
            end
        end
        if i.KeyCode == Enum.KeyCode.RightShift and S.hideGui then
            local g2=LP.PlayerGui:FindFirstChild("WindUI")
            if g2 then g2.Enabled = not g2.Enabled end
        end
    end)

    print("[TWKS] MEGA v3 menu built")
end

-- ===== KEY BUTTON =====
kbtn.MouseButton1Click:Connect(function()
    if kbox.Text == USER_KEY then
        kstt.TextColor3 = Color3.fromRGB(0,255,180); kstt.Text = "OK"
        task.wait(0.3); kg:Destroy()
        BUILD()
    else
        kstt.TextColor3 = Color3.fromRGB(255,80,80); kstt.Text = "неверный ключ"
    end
end)

print("[TWKS] READY | key:", USER_KEY)-- ===== TAB: FUN =====
local T16 = Window:Tab({Title="Fun", Icon="smile"})
T16:Paragraph({Title="Achievements", Desc="Твои ачивки в реальном времени"})
local achGui = Instance.new("ScreenGui", pg)
achGui.Name = "TWKS_Ach"; achGui.ResetOnSpawn = false
local achLabel = Instance.new("TextLabel", achGui)
achLabel.Size = UDim2.new(0,250,0,50); achLabel.Position = UDim2.new(1,-260,0,60)
achLabel.BackgroundColor3 = Color3.fromRGB(15,15,22); achLabel.BackgroundTransparency = 0.2
achLabel.TextColor3 = Color3.fromRGB(0,255,180); achLabel.Font = Enum.Font.GothamBold
achLabel.TextSize = 11; achLabel.TextWrapped = true
achLabel.Text = "Achievements:\n0/10"
Instance.new("UICorner", achLabel).CornerRadius = UDim.new(0,8)
local achList = {}
local function unlockAch(name)
    if achList[name] then return end
    achList[name] = true
    local cnt = 0
    for _ in pairs(achList) do cnt = cnt + 1 end
    achLabel.Text = "Achievements:\n"..cnt.."/10 ("..name..")"
    StarterGui:SetCore("SendNotification", {Title="ACHIEVEMENT", Text=name, Duration=5})
end
task.spawn(function()
    while true do
        task.wait(5)
        if S.kills >= 1 then unlockAch("First Blood") end
        if S.kills >= 10 then unlockAch("Killer") end
        if S.kills >= 50 then unlockAch("Murderer") end
        if S.kills >= 100 then unlockAch("Serial Killer") end
        if S.coinsCollected >= 10 then unlockAch("Collector") end
        if S.coinsCollected >= 100 then unlockAch("Coin Hunter") end
        if S.fly then unlockAch("Sky Walker") end
        if S.noclip then unlockAch("Ghost") end
        if S.autoFarmMM2 then unlockAch("Farmer") end
        if tick() - START_TIME >= 3600 then unlockAch("1 Hour Grind") end
    end
end)

-- Companion Pet
local pet = nil
T16:Toggle({Title="Companion Pet", Desc="Бот летает за тобой", Default=false, Callback=function(v)
    if v then
        pet = Instance.new("Part", Workspace)
        pet.Name = "TWKS_Pet"
        pet.Size = Vector3.new(1.5,1.5,1.5)
        pet.Shape = Enum.PartType.Ball
        pet.Material = Enum.Material.Neon
        pet.Color = Color3.fromRGB(0,255,180)
        pet.CanCollide = false
        pet.Anchored = true
    else
        if pet then pet:Destroy(); pet = nil end
    end
end})
RunService.Heartbeat:Connect(function()
    if pet and LP.Character then
        local r = LP.Character:FindFirstChild("HumanoidRootPart")
        if r then
            local target = r.Position + r.CFrame.LookVector * -4 + Vector3.new(0,3,0)
            pet.CFrame = pet.CFrame:Lerp(CFrame.new(target), 0.15)
        end
    end
end)

-- Troll Menu
T16:Paragraph({Title="Troll", Desc="Веселись с игроками"})
T16:Button({Title="Flip Nearest Player", Callback=function()
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myR then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r and (r.Position-myR.Position).Magnitude < 30 then
                r.CFrame = r.CFrame * CFrame.Angles(math.rad(180), 0, 0)
                break
            end
        end
    end
end})
T16:Button({Title="Spin All Nearby", Callback=function()
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myR then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r and (r.Position-myR.Position).Magnitude < 30 then
                r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(180), 0)
            end
        end
    end
end})
T16:Button({Title="Confetti Explosion", Callback=function()
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myR then return end
    local att = Instance.new("Attachment", myR)
    local pe = Instance.new("ParticleEmitter", att)
    pe.Rate = 0
    pe.Lifetime = NumberRange.new(2,3)
    pe.Speed = NumberRange.new(20,40)
    pe.SpreadAngle = Vector2.new(180,180)
    pe.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,255)),
    })
    pe.Size = NumberSequence.new(0.5)
    pe:Emit(200)
    task.delay(3, function() att:Destroy() end)
end})

-- Music Player
local music = nil
T16:Input({Title="Sound ID", Value="1837879082", Callback=function(v) S._musicId=v end})
T16:Button({Title="Play Music", Callback=function()
    if music then music:Destroy() end
    music = Instance.new("Sound", game:GetService("SoundService"))
    music.SoundId = "rbxassetid://"..(S._musicId or "1837879082")
    music.Volume = 1
    music.Looped = true
    music:Play()
end})
T16:Button({Title="Stop Music", Callback=function()
    if music then music:Destroy(); music = nil end
end})-- ===== TAB: EXTRAS =====
local T17 = Window:Tab({Title="Extras", Icon="star"})
T17:Toggle({Title="Rainbow Mode", Desc="Всё мерцает цветами", Default=false, Callback=function(v)
    S._rainbow = v
end})
task.spawn(function()
    while true do
        task.wait(0.1)
        if S._rainbow then
            local hue = (tick() % 3) / 3
            local col = Color3.fromHSV(hue, 1, 1)
            if wS then wS.Color = col end
            if ic then ic.TextColor3 = col end
            if tt then tt.TextColor3 = col end
            local char = LP.Character
            if char then
                for _,p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.Color = col end
                end
            end
        end
    end
end)

-- Custom Sounds
T17:Input({Title="Notification Sound ID", Value="5801273946", Callback=function(v) S._notifSound=v end})
T17:Button({Title="Test Sound", Callback=function()
    local snd = Instance.new("Sound", game:GetService("SoundService"))
    snd.SoundId = "rbxassetid://"..(S._notifSound or "5801273946")
    snd.Volume = 1; snd:Play()
    task.delay(3, function() snd:Destroy() end)
end})

-- Friends Online
T17:Button({Title="Show Friends Online", Callback=function()
    local lines = {}
    for _,p in ipairs(Players:GetPlayers()) do
        if p:IsFriendsWith(LP.UserId) then
            table.insert(lines, "• "..p.Name.." ("..getUID(p)..")")
        end
    end
    WindUI:Notify({Title="Друзья онлайн", Content=#lines>0 and table.concat(lines,"\n") or "никого", Duration=8})
end})

-- Screenshot
T17:Button({Title="Screenshot (Notify)", Callback=function()
    StarterGui:SetCore("SendNotification", {Title="Screenshot", Text="Скрин сделан (через Steam/систему)", Duration=3})
end})

-- Voice Announce
T17:Toggle({Title="Voice Announce (Join)", Default=false, Callback=function(v)
    if v then
        local snd = Instance.new("Sound", game:GetService("SoundService"))
        snd.SoundId = "rbxassetid://5801273946"
        snd.Volume = 1; snd:Play()
        task.delay(2, function() snd:Destroy() end)
    end
end})

-- Leaderboard
T17:Button({Title="Show Server Leaderboard", Callback=function()
    local list = {}
    for _,p in ipairs(Players:GetPlayers()) do
        local val = 0
        local ls = p:FindFirstChild("leaderstats")
        if ls and ls:GetChildren()[1] then
            val = ls:GetChildren()[1].Value or 0
        end
        table.insert(list, {name=p.Name, score=val})
    end
    table.sort(list, function(a,b) return a.score > b.score end)
    local lines = {}
    for i,v in ipairs(list) do
        table.insert(lines, i..". "..v.name.." — "..tostring(v.score))
    end
    WindUI:Notify({Title="Leaderboard", Content=table.concat(lines,"\n"), Duration=10})
end})

-- Text Drawing
T17:Button({Title="Big Text on Screen", Callback=function()
    local lbl = Instance.new("TextLabel", pg)
    lbl.Size = UDim2.new(1,0,0,100)
    lbl.Position = UDim2.new(0,0,0.4,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "FENALHUB"
    lbl.TextColor3 = Color3.fromRGB(0,255,180)
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextSize = 60
    task.delay(3, function() lbl:Destroy() end)
end})-- ===== TAB: AUTO (расширение) =====
local T18 = Window:Tab({Title="Auto", Icon="cpu"})
T18:Paragraph({Title="Universal Auto", Desc="Универсальные авто-функции для многих игр"})

T18:Toggle({Title="Auto-Quest", Desc="принимает квесты автоматически", Default=false, Callback=function(v)
    S._autoQuest = v
end})
task.spawn(function()
    while true do
        task.wait(1)
        if S._autoQuest then
            for _,d in ipairs(Workspace:GetDescendants()) do
                if d:IsA("ProximityPrompt") and (d.ActionText:lower():find("quest") or d.ObjectText:lower():find("quest")) then
                    if fireproximityprompt then pcall(function() fireproximityprompt(d) end) end
                end
            end
        end
    end
end)

T18:Toggle({Title="Auto-Mine", Desc="бьёт по блокам/рудам", Default=false, Callback=function(v)
    S._autoMine = v
end})
task.spawn(function()
    while true do
        task.wait(0.3)
        if S._autoMine then
            for _,d in ipairs(Workspace:GetDescendants()) do
                if d:IsA("BasePart") and (d.Name:lower():find("ore") or d.Name:lower():find("руда") or d.Name:lower():find("node")) then
                    if (d.Position - (LP.Character and LP.Character.HumanoidRootPart.Position or Vector3.zero)).Magnitude < 50 then
                        pcall(function()
                            if firetouchinterest then
                                firetouchinterest(LP.Character.HumanoidRootPart, d, 0)
                                task.wait()
                                firetouchinterest(LP.Character.HumanoidRootPart, d, 1)
                            end
                        end)
                    end
                end
            end
        end
    end
end)

T18:Toggle({Title="Auto-Fish", Desc="клик по удочке", Default=false, Callback=function(v)
    S._autoFish = v
end})
task.spawn(function()
    while true do
        task.wait(0.5)
        if S._autoFish and mouse1click then
            mouse1click()
        end
    end
end)

T18:Toggle({Title="Auto-Sell", Desc="продаёт при появлении меню", Default=false, Callback=function(v)
    S._autoSell = v
end})
task.spawn(function()
    while true do
        task.wait(2)
        if S._autoSell then
            for _,g in ipairs(pg:GetDescendants()) do
                if g:IsA("TextButton") and (g.Text:lower():find("sell") or g.Text:lower():find("продать")) then
                    pcall(function() g:Activate() end)
                end
            end
        end
    end
end)

T18:Toggle({Title="Auto-Buy", Desc="покупает в магазине", Default=false, Callback=function(v)
    S._autoBuy = v
end})
task.spawn(function()
    while true do
        task.wait(2)
        if S._autoBuy then
            for _,g in ipairs(pg:GetDescendants()) do
                if g:IsA("TextButton") and (g.Text:lower():find("buy") or g.Text:lower():find("купить")) then
                    pcall(function() g:Activate() end)
                end
            end
        end
    end
end})

T18:Button({Title="Trigger All Prompts (range)", Callback=function()
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myR then return end
    for _,d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("ProximityPrompt") then
            local parent = d.Parent
            if parent and parent:IsA("BasePart") and (parent.Position - myR.Position).Magnitude < 30 then
                if fireproximityprompt then pcall(function() fireproximityprompt(d) end) end
            end
        end
    end
end})

T18:Button({Title="Click All ClickDetectors (range)", Callback=function()
    local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myR then return end
    for _,d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("ClickDetector") then
            local parent = d.Parent
            if parent and parent:IsA("BasePart") and (parent.Position - myR.Position).Magnitude < 30 then
                if fireclickdetector then pcall(function() fireclickdetector(d) end) end
            end
        end
    end
end})-- ===== TAB: LOGS =====
local T19 = Window:Tab({Title="Logs", Icon="file-text"})
T19:Paragraph({Title="Logs", Desc="История игроков + чата"})

local history = {}
Players.PlayerAdded:Connect(function(p)
    table.insert(history, "[+] "..p.Name.." ("..os.date("%H:%M:%S")..")")
end)
Players.PlayerRemoving:Connect(function(p)
    table.insert(history, "[-] "..p.Name.." ("..os.date("%H:%M:%S")..")")
end)

T19:Button({Title="Show Player History", Callback=function()
    local last = {}
    for i = math.max(1, #history-20), #history do
        table.insert(last, history[i])
    end
    WindUI:Notify({Title="History", Content=#last>0 and table.concat(last,"\n") or "пусто", Duration=10})
end})
T19:Button({Title="Clear History", Callback=function() history = {} end})

-- Chat Logger
local chatLog = {}
task.spawn(function()
    local evt = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents", 5)
    if evt then
        local onMsg = evt:FindFirstChild("OnMessageDoneFiltering")
        if onMsg then
            onMsg.OnClientEvent:Connect(function(data)
                if data and data.Message and data.FromSpeaker then
                    table.insert(chatLog, "["..os.date("%H:%M").."] "..data.FromSpeaker..": "..data.Message)
                    if #chatLog > 500 then table.remove(chatLog, 1) end
                end
            end)
        end
    end
end)

T19:Button({Title="Show Chat Log (last 20)", Callback=function()
    local last = {}
    for i = math.max(1, #chatLog-20), #chatLog do
        table.insert(last, chatLog[i])
    end
    WindUI:Notify({Title="Chat", Content=#last>0 and table.concat(last,"\n") or "пусто", Duration=10})
end})
T19:Button({Title="Save Chat Log to File", Callback=function()
    if writefile then
        pcall(writefile, "fenalhub_chatlog.txt", table.concat(chatLog, "\n"))
        WindUI:Notify({Title="Saved", Content="fenalhub_chatlog.txt", Duration=3})
    end
end})
T19:Button({Title="Clear Chat Log", Callback=function() chatLog = {} end})

-- Memory Cleaner
T19:Button({Title="Memory Cleaner", Callback=function()
    for _,d in ipairs(Workspace:GetDescendants()) do
        if d:IsA("ParticleEmitter") and d.Rate == 0 then d:Destroy() end
        if d:IsA("Trail") and not d.Attachment0 then d:Destroy() end
    end
    pcall(function() collectgarbage() end)
    WindUI:Notify({Title="Memory", Content="Очищено", Duration=2})
end})

-- Server Info
T19:Button({Title="Server Info", Callback=function()
    local ping = 0
    pcall(function() ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
    local info = string.format("PlaceId: %d\nJobId: %s\nИгроков: %d\nПинг: %dms\nGravity: %d\nUptime: %ds",
        game.PlaceId, game.JobId, #Players:GetPlayers(), ping, Workspace.Gravity, math.floor(tick()-START_TIME))
    WindUI:Notify({Title="Server", Content=info, Duration=10})
end})

-- Server List
T19:Button({Title="Copy Server Info", Callback=function()
    local s = string.format("PlaceId: %d | JobId: %s | Players: %d", game.PlaceId, game.JobId, #Players:GetPlayers())
    if setclipboard then setclipboard(s) end
end})-- ===== TAB: KEYBINDS v2 =====
local T20 = Window:Tab({Title="Keybind Editor", Icon="keyboard"})
T20:Paragraph({Title="Keybind Editor", Desc="Назначь любую клавишу на любую функцию"})

local kbFile = "fenalhub_keybinds.txt"
local function saveKb(t) if writefile then pcall(writefile, kbFile, HttpS:JSONEncode(t)) end end
local function loadKb()
    if readfile and isfile and isfile(kbFile) then
        local ok, d = pcall(function() return HttpS:JSONDecode(readfile(kbFile)) end)
        if ok then return d or {} end
    end
    return {}
end
local KB = loadKb()

T20:Dropdown({
    Title="Bind Fly",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["fly"] or "F",
    Callback=function(v) KB["fly"]=v; saveKb(KB) end
})
T20:Dropdown({
    Title="Bind Noclip",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["noclip"] or "N",
    Callback=function(v) KB["noclip"]=v; saveKb(KB) end
})
T20:Dropdown({
    Title="Bind ESP",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["esp"] or "X",
    Callback=function(v) KB["esp"]=v; saveKb(KB) end
})
T20:Dropdown({
    Title="Bind ClickTP",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["clickTP"] or "C",
    Callback=function(v) KB["clickTP"]=v; saveKb(KB) end
})
T20:Dropdown({
    Title="Bind AutoFarm",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["farm"] or "G",
    Callback=function(v) KB["farm"]=v; saveKb(KB) end
})
T20:Dropdown({
    Title="Bind BuildMode",
    Values={"None","F","G","H","J","K","L","Z","X","V"},
    Default=KB["build"] or "B",
    Callback=function(v) KB["build"]=v; saveKb(KB) end
})
T20:Button({Title="Reset Keybinds", Callback=function()
    KB = {fly="F", noclip="N", esp="X", clickTP="C", farm="G", build="B"}; saveKb(KB)
end})

-- ===== TAB: CONFIG =====
local T21 = Window:Tab({Title="Config", Icon="save"})
T21:Paragraph({Title="Config Save/Load", Desc="Сохраняй и загружай настройки"})

local CFG_FILE = "fenalhub_config.txt"
T21:Button({Title="Save Config", Callback=function()
    if not writefile then WindUI:Notify({Title="Error",Content="no writefile",Duration=3}) return end
    local ok, encoded = pcall(function() return HttpS:JSONEncode(S) end)
    if ok then pcall(writefile, CFG_FILE, encoded)
        WindUI:Notify({Title="Config",Content="сохранено",Duration=2})
    end
end})
T21:Button({Title="Load Config", Callback=function()
    if not readfile or not isfile then return end
    if not isfile(CFG_FILE) then WindUI:Notify({Title="Config",Content="нет файла",Duration=2}) return end
    local ok, decoded = pcall(function() return HttpS:JSONDecode(readfile(CFG_FILE)) end)
    if ok and type(decoded) == "table" then
        for k,v in pairs(decoded) do
            if S[k] ~= nil and type(S[k]) == type(v) then S[k] = v end
        end
        WindUI:Notify({Title="Config",Content="загружено",Duration=2})
    end
end})
T21:Button({Title="Delete Config", Callback=function()
    if delfile then pcall(delfile, CFG_FILE) end
end})

-- ===== TAB: MACRO =====
local T22 = Window:Tab({Title="Macro", Icon="play"})
T22:Paragraph({Title="Macro Recorder", Desc="Запись движений и повтор"})
local recording = false
local recorded = {}
local lastPos = nil
T22:Toggle({Title="Record Macro", Default=false, Callback=function(v)
    recording = v
    if v then recorded = {}; lastPos = nil end
end})
RunService.Heartbeat:Connect(function()
    if recording then
        local r = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if r then
            if not lastPos or (r.Position - lastPos).Magnitude > 1 then
                table.insert(recorded, {pos = r.Position, time = tick()})
                lastPos = r.Position
            end
        end
    end
end)
T22:Button({Title="Play Macro", Callback=function()
    if #recorded == 0 then return end
    task.spawn(function()
        local startT = recorded[1].time
        for _, step in ipairs(recorded) do
            task.wait(math.max(0, step.time - startT - (tick() - startT)))
            local r = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then r.CFrame = CFrame.new(step.pos) end
        end
    end)
end})
T22:Button({Title="Stop Playing", Callback=function() S._stopMacro = true end})
T22:Button({Title="Clear Macro", Callback=function() recorded = {} end})
T22:Paragraph({Title="Записано шагов", Desc="0"})    -- ===== TAB: BYPASS =====
    local T23 = Window:Tab({Title="Bypass", Icon="unlock"})
    T23:Paragraph({Title="Anti-Cheat Bypass", Desc="Обходы по играм"})
    T23:Toggle({Title="Anti-Stun", Default=false, Callback=function(v) S.antiStun=v end})
    T23:Toggle({Title="Anti-Ragdoll", Default=false, Callback=function(v) S.antiRagdoll=v end})
    T23:Toggle({Title="No Fall Damage", Default=false, Callback=function(v) S.noFallDamage=v end})
    T23:Button({Title="Bypass for KAT", Callback=function()
        for _,p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and p.Name:lower():find("anti") then p.CanCollide = false end
        end
        WindUI:Notify({Title="Bypass",Content="KAT attempt",Duration=2})
    end})
    T23:Button({Title="Bypass for Arsenal", Callback=function()
        for _,p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and p.Name:lower():find("barrier") then p:Destroy() end
        end
        WindUI:Notify({Title="Bypass",Content="Arsenal attempt",Duration=2})
    end})
    T23:Button({Title="Bypass for Prison Life", Callback=function()
        pcall(function()
            local char = LP.Character
            if char then
                for _,p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    end})
    T23:Button({Title="Disable All Barriers (range)", Callback=function()
        local myR = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not myR then return end
        for _,p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and (p.Name:lower():find("wall") or p.Name:lower():find("door"))
                and (p.Position - myR.Position).Magnitude < 50 then
                p.CanCollide = false
            end
        end
    end})

    -- ===== ANTI-RAGDOLL / ANTI-STUN LOOPS =====
    RunService.Stepped:Connect(function()
        if S.antiRagdoll and LP.Character then
            local h = LP.Character:FindFirstChildOfClass("Humanoid")
            if h and h:GetState() == Enum.HumanoidStateType.Physics then
                h:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
        if S.antiStun and LP.Character then
            local h = LP.Character:FindFirstChildOfClass("Humanoid")
            if h and h:GetState() == Enum.HumanoidStateType.FallingDown then
                h:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
        if S.noFallDamage and LP.Character then
            local h = LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h.Health = h.MaxHealth end
        end
    end)

    -- ===== NAME TAGS LOOP =====
    local tagFolder = Instance.new("Folder", pg)
    tagFolder.Name = "TWKS_Tags"
    RunService.RenderStepped:Connect(function()
        if S.nameTags then
            tagFolder:ClearAllChildren()
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local r=p.Character:FindFirstChild("HumanoidRootPart")
                    if r then
                        local sc, on = CAM:WorldToViewportPoint(r.Position + Vector3.new(0,3,0))
                        if on then
                            local lbl = Instance.new("TextLabel", tagFolder)
                            lbl.Size = UDim2.new(0,200,0,20)
                            lbl.Position = UDim2.new(0, sc.X-100, 0, sc.Y-20)
                            lbl.BackgroundTransparency = 1
                            lbl.Text = p.Name.." | "..getRank(p)
                            lbl.TextColor3 = Color3.fromRGB(255,255,255)
                            lbl.TextStrokeTransparency = 0
                            lbl.Font = Enum.Font.GothamBold
                            lbl.TextSize = 12
                        end
                    end
                end
            end
        end
    end)

    -- ===== TRACERS LOOP =====
    local tracerFolder = Instance.new("Folder", pg)
    tracerFolder.Name = "TWKS_Tracers"
    RunService.RenderStepped:Connect(function()
        if S.tracers then
            tracerFolder:ClearAllChildren()
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local r=p.Character:FindFirstChild("HumanoidRootPart")
                    if r then
                        local sc, on = CAM:WorldToViewportPoint(r.Position)
                        if on then
                            local line = Instance.new("Frame", tracerFolder)
                            line.BackgroundColor3 = Color3.fromRGB(0,255,180)
                            line.BorderSizePixel = 0
                            local h = math.abs(sc.Y - CAM.ViewportSize.Y)
                            local w = math.abs(sc.X - CAM.ViewportSize.X/2)
                            line.Size = UDim2.new(0, 2, 0, math.sqrt(h*h + w*w))
                            line.AnchorPoint = Vector2.new(0.5, 0)
                            line.Rotation = math.deg(math.atan2(sc.X - CAM.ViewportSize.X/2, CAM.ViewportSize.Y - sc.Y))
                            line.Position = UDim2.new(0.5, 0, 1, 0)
                        end
                    end
                end
            end
        end
    end)

    -- ===== AUTO-SAVE CONFIG =====
    task.spawn(function()
        while true do
            task.wait(60)
            if writefile then
                local ok, encoded = pcall(function() return HttpS:JSONEncode(S) end)
                if ok then pcall(writefile, CFG_FILE, encoded) end
            end
        end
    end)

    -- ===== UNIFIED KEYBIND HANDLER =====
    UIS.InputBegan:Connect(function(i, g)
        if g then return end
        local kc = i.KeyCode.Name
        if KB["fly"] == kc then S.fly = not S.fly end
        if KB["noclip"] == kc then S.noclip = not S.noclip end
        if KB["esp"] == kc then
            S.esp = not S.esp
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local hl=p.Character:FindFirstChild("TWKS_ESP")
                    if S.esp and not hl then
                        local h=Instance.new("Highlight", p.Character)
                        h.Name="TWKS_ESP"; h.FillColor=Color3.fromRGB(255,60,60)
                        h.OutlineColor=Color3.fromRGB(255,255,255)
                    elseif not S.esp and hl then hl:Destroy() end
                end
            end
        end
        if KB["clickTP"] == kc then S.clickTP = not S.clickTP end
        if KB["farm"] == kc then S.autoFarmMM2 = not S.autoFarmMM2 end
        if KB["build"] == kc then S.buildMode = not S.buildMode end
    end)

    WindUI:Notify({Title="FENALHUB MEGA v3", Content="Всё загружено. by quasi-krytoi", Duration=5})
    print("[TWKS] MEGA v3 FULL menu built")
end

-- ===== KEY BUTTON =====
kbtn.MouseButton1Click:Connect(function()
    if kbox.Text == USER_KEY then
        kstt.TextColor3 = Color3.fromRGB(0,255,180); kstt.Text = "OK"
        task.wait(0.3); kg:Destroy()
        BUILD()
    else
        kstt.TextColor3 = Color3.fromRGB(255,80,80); kstt.Text = "неверный ключ"
    end
end)

print("[TWKS] READY | key:", USER_KEY)