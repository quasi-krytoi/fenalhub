-- TWKS | FENALHUB | part 1/3
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local Lighting   = game:GetService("Lighting")
local Workspace  = game:GetService("Workspace")
local Teleport   = game:GetService("TeleportService")
local HttpS      = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
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
kt.Text = "✦ FENALHUB ✦"; kt.TextColor3 = Color3.fromRGB(0,255,180)
kt.Font = Enum.Font.GothamBlack; kt.TextSize = 22
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

local function BUILD()
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local S = {
        fly=false, flySpeed=60, noclip=false, speed=false, speedVal=50,
        jump=false, jumpVal=50, infJump=false, autoJump=false, clickTP=false,
        antiVoid=false, spin=false, spinSpeed=10, freeze=false,
        lockY=false, lockYVal=50, saveCframe=nil,
        esp=false, chams=false, fullbright=false, invisible=false,
        nightVision=false, noFog=false, noShadow=false, fov=70,
        gravity=false, gravityVal=50, hitbox=false, hitboxVal=15, killAura=false,
        chatMsg="FENALHUB", chatSpam=false, chatDelay=5,
        _tp="", _wp="wp1", waypoints={},
    }

    local Window = WindUI:CreateWindow({
        Title = "FENALHUB | " .. (IS_ADMIN and "ADMIN" or "USER"),
        Icon = "snowflake",
        Author = USER_NAME .. " | " .. USER_RANK,
        Folder = "FenalHub",
        Size = UDim2.fromOffset(580, 460),
        Transparent = true, Theme = "Dark",
        User = { Enabled = true, Anonymous = false },
    })-- ===== WATERMARK =====
local wmGui = Instance.new("ScreenGui", pg)
wmGui.Name = "FENALHUB_WM"; wmGui.ResetOnSpawn = false; wmGui.DisplayOrder = 998
local wm = Instance.new("TextButton", wmGui)
wm.Size = UDim2.new(0,420,0,34); wm.Position = UDim2.new(0.5,-210,0,10)
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
tt.Size = UDim2.new(0,120,1,0); tt.Position = UDim2.new(0,38,0,0)
tt.BackgroundTransparency = 1; tt.Text = "FENALHUB"
tt.TextColor3 = Color3.fromRGB(0,255,180); tt.Font = Enum.Font.GothamBold
tt.TextSize = 13; tt.TextXAlignment = Enum.TextXAlignment.Left
local inf = Instance.new("TextLabel", wm)
inf.Size = UDim2.new(1,-175,1,0); inf.Position = UDim2.new(0,160,0,0)
inf.BackgroundTransparency = 1
inf.Text = string.format("UID: %d | %s | %s", USER_ID, USER_NAME, USER_RANK)
inf.TextColor3 = Color3.fromRGB(200,200,220); inf.Font = Enum.Font.Gotham
inf.TextSize = 11; inf.TextXAlignment = Enum.TextXAlignment.Right
task.spawn(function()
    while wm.Parent do
        for i = 0,1,0.02 do
            if not wm.Parent then break end
            wG.Rotation = i*360; task.wait(0.03)
        end
    end
end)
local menuOpen = true
wm.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    if menuOpen then Window:Open() else Window:Close() end
end)

-- ===== MOVE =====
local T1 = Window:Tab({Title="Move", Icon="move"})
T1:Toggle({Title="Fly", Desc="WASD + Space/LCtrl", Default=false, Callback=function(v) S.fly=v end})
T1:Slider({Title="Fly Speed", Value={Min=10,Max=500,Default=60}, Callback=function(v) S.flySpeed=v end})
T1:Toggle({Title="Noclip", Default=false, Callback=function(v) S.noclip=v end})
T1:Toggle({Title="Speed", Default=false, Callback=function(v)
    S.speed=v
    local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed=v and S.speedVal or 16 end
end})
T1:Slider({Title="Walk Speed", Value={Min=16,Max=500,Default=50}, Callback=function(v)
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
T1:Slider({Title="Jump Value", Value={Min=50,Max=500,Default=50}, Callback=function(v) S.jumpVal=v end})
T1:Toggle({Title="Infinite Jump", Default=false, Callback=function(v) S.infJump=v end})
T1:Toggle({Title="Auto Jump", Default=false, Callback=function(v) S.autoJump=v end})
T1:Toggle({Title="Click TP", Default=false, Callback=function(v) S.clickTP=v end})
T1:Toggle({Title="Anti Void", Default=false, Callback=function(v) S.antiVoid=v end})
T1:Toggle({Title="Spin", Default=false, Callback=function(v) S.spin=v end})
T1:Slider({Title="Spin Speed", Value={Min=1,Max=50,Default=10}, Callback=function(v) S.spinSpeed=v end})
T1:Toggle({Title="Freeze Position", Default=false, Callback=function(v) S.freeze=v end})
T1:Toggle({Title="Lock Y", Default=false, Callback=function(v) S.lockY=v end})
T1:Slider({Title="Lock Y Value", Value={Min=1,Max=500,Default=50}, Callback=function(v) S.lockYVal=v end})

-- ===== VISUAL =====
local T2 = Window:Tab({Title="Visual", Icon="eye"})
T2:Toggle({Title="ESP", Default=false, Callback=function(v)
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
T2:Toggle({Title="Invisible", Default=false, Callback=function(v)
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
T2:Slider({Title="FOV", Value={Min=70,Max=140,Default=70}, Callback=function(v) CAM.FieldOfView=v end})

-- ===== PLAYER =====
local T3 = Window:Tab({Title="Player", Icon="user"})
T3:Button({Title="Reset", Callback=function()
    local c=LP.Character; if c then c:BreakJoints() end
end})
T3:Button({Title="Respawn", Callback=function() LP:LoadCharacter() end})
T3:Button({Title="Save Position", Callback=function()
    local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if r then S.saveCframe=r.CFrame end
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
T3:Button({Title="Show Players", Callback=function()
    local lines = {}
    for _,p in ipairs(Players:GetPlayers()) do
        table.insert(lines, p.Name.." | UID: "..getUID(p).." | "..getRank(p))
    end
    WindUI:Notify({Title="Players", Content=table.concat(lines,"\n"), Duration=8})
end})

-- ===== COMBAT =====
local T4 = Window:Tab({Title="Combat", Icon="sword"})
T4:Toggle({Title="Hitbox Expander", Default=false, Callback=function(v)
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Size=v and Vector3.new(15,15,15) or Vector3.new(2,2,1) end
        end
    end
end})
T4:Toggle({Title="Kill Aura", Default=false, Callback=function(v) S.killAura=v end})
T4:Button({Title="Kill All", Callback=function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then h.Health=0 end
        end
    end
end})

-- ===== WORLD =====
local T5 = Window:Tab({Title="World", Icon="globe"})
T5:Toggle({Title="Low Gravity", Default=false, Callback=function(v)
    S.gravity=v; Workspace.Gravity=v and S.gravityVal or 196.2
end})
T5:Slider({Title="Gravity", Value={Min=10,Max=196,Default=50}, Callback=function(v)
    S.gravityVal=v; if S.gravity then Workspace.Gravity=v end
end})
T5:Button({Title="Rejoin", Callback=function() Teleport:Teleport(game.PlaceId, LP) end})
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
end})
T5:Button({Title="Unlock FPS", Callback=function() if setfpscap then setfpscap(999) end end})
T5:Button({Title="Reset Camera", Callback=function() CAM.CameraType=Enum.CameraType.Custom end})

-- ===== CHAT =====
local T6 = Window:Tab({Title="Chat", Icon="message-circle"})
T6:Input({Title="Message", Value="FENALHUB on top", Callback=function(v) S.chatMsg=v end})
T6:Toggle({Title="Chat Spam", Default=false, Callback=function(v) S.chatSpam=v end})
T6:Slider({Title="Delay", Value={Min=1,Max=30,Default=5}, Callback=function(v) S.chatDelay=v end})
T6:Button({Title="Send Once", Callback=function()
    local evt=game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if evt and evt:FindFirstChild("SayMessageRequest") then
        evt.SayMessageRequest:FireServer(S.chatMsg or "FENALHUB", "All")
    end
end})

-- ===== MISC =====
local T7 = Window:Tab({Title="Misc", Icon="wrench"})
T7:Toggle({Title="Anti AFK", Default=true, Callback=function(v) S.antiAFK=v end})
T7:Button({Title="Max Graphics", Callback=function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level10 end})
T7:Button({Title="Min Graphics", Callback=function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end})
T7:Button({Title="Unlock Mouse", Callback=function() UIS.MouseBehavior=Enum.MouseBehavior.Default end})

-- ===== ADMIN =====
if IS_ADMIN then
    local T8 = Window:Tab({Title="⚡ Admin", Icon="shield"})
    T8:Paragraph({Title="ADMIN PANEL", Desc="Только для "..ADMIN_NAME})
    T8:Button({Title="Freeze All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Anchored=true end
            end
        end
    end})
    T8:Button({Title="Unfreeze All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Anchored=false end
            end
        end
    end})
    T8:Button({Title="Kill All", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local h=p.Character:FindFirstChildOfClass("Humanoid")
                if h then h.Health=0 end
            end
        end
    end})
end

-- ===== INFO =====
local T9 = Window:Tab({Title="Info", Icon="info"})
T9:Paragraph({Title="Аккаунт", Desc="Nick: "..USER_NAME.."\nUID: "..USER_ID.."\nRank: "..USER_RANK})
T9:Paragraph({Title="Place", Desc="PlaceId: "..game.PlaceId.."\nJobId: "..game.JobId})    -- ===== LOOPS =====
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

    RunService.Stepped:Connect(function()
        if S.noclip and LP.Character then
            for _,p in ipairs(LP.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide=false end
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        if S.spin then
            local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if r then r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(S.spinSpeed), 0) end
        end
    end)

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
        if S.autoJump then
            local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
        if S.killAura then
            local myR=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if myR then
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr~=LP and plr.Character then
                        local r2=plr.Character:FindFirstChild("HumanoidRootPart")
                        local h=plr.Character:FindFirstChildOfClass("Humanoid")
                        if r2 and h and (r2.Position-myR.Position).Magnitude < 10 then h.Health=0 end
                    end
                end
            end
        end
    end)

    UIS.JumpRequest:Connect(function()
        if S.infJump and LP.Character then
            local h=LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)

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

    LP.Idled:Connect(function()
        if S.antiAFK then
            local vu=game:GetService("VirtualUser")
            vu:CaptureController(); vu:ClickButton2(Vector2.new())
        end
    end)

    print("[TWKS] menu built")
end

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