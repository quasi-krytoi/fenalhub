-- TWKS | FENALHUB MEGA | 200+ funcs | key-first | fly fixed
-- EN ids, RU comments | executor only
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local Lighting   = game:GetService("Lighting")
local Workspace  = game:GetService("Workspace")
local Teleport   = game:GetService("TeleportService")
local HttpS      = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Tween      = game:GetService("TweenService")
local Sound      = game:GetService("SoundService")
local LP         = Players.LocalPlayer
local CAM        = Workspace.CurrentCamera

-- ===== ADMIN / UID / RANK / KEY =====
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
kg.Name="FHK"; kg.ResetOnSpawn=false; kg.DisplayOrder=999
local kf = Instance.new("Frame", kg)
kf.Size=UDim2.new(0,340,0,190); kf.Position=UDim2.new(0.5,-170,0.5,-95)
kf.BackgroundColor3=Color3.fromRGB(15,15,20); kf.BorderSizePixel=0
kf.Active=true; kf.Draggable=true
Instance.new("UICorner", kf).CornerRadius=UDim.new(0,14)
local kSt=Instance.new("UIStroke", kf); kSt.Color=Color3.fromRGB(0,255,180); kSt.Thickness=1.5
local kt=Instance.new("TextLabel", kf); kt.Size=UDim2.new(1,0,0,44); kt.BackgroundTransparency=1
kt.Text="✦ FENALHUB ✦"; kt.TextColor3=Color3.fromRGB(0,255,180)
kt.Font=Enum.Font.GothamBlack; kt.TextSize=22
local ksub=Instance.new("TextLabel", kf); ksub.Size=UDim2.new(1,0,0,16); ksub.Position=UDim2.new(0,0,0,44)
ksub.BackgroundTransparency=1; ksub.Text="введи ключ доступа"
ksub.TextColor3=Color3.fromRGB(160,160,180); ksub.Font=Enum.Font.Gotham; ksub.TextSize=11
local kbox=Instance.new("TextBox", kf); kbox.Size=UDim2.new(1,-40,0,40); kbox.Position=UDim2.new(0,20,0,72)
kbox.BackgroundColor3=Color3.fromRGB(28,28,38); kbox.BorderSizePixel=0
kbox.PlaceholderText="..."; kbox.Text=""
kbox.TextColor3=Color3.fromRGB(230,230,230); kbox.Font=Enum.Font.Gotham
kbox.TextSize=14; kbox.ClearTextOnFocus=false
Instance.new("UICorner", kbox).CornerRadius=UDim.new(0,8)
local kstt=Instance.new("TextLabel", kf); kstt.Size=UDim2.new(1,0,0,16); kstt.Position=UDim2.new(0,0,0,116)
kstt.BackgroundTransparency=1; kstt.Text=""; kstt.TextColor3=Color3.fromRGB(255,80,80)
kstt.Font=Enum.Font.Gotham; kstt.TextSize=11
local kbtn=Instance.new("TextButton", kf); kbtn.Size=UDim2.new(1,-40,0,36); kbtn.Position=UDim2.new(0,20,0,138)
kbtn.BackgroundColor3=Color3.fromRGB(0,180,130); kbtn.BorderSizePixel=0
kbtn.Text="ВОЙТИ"; kbtn.TextColor3=Color3.fromRGB(255,255,255)
kbtn.Font=Enum.Font.GothamBold; kbtn.TextSize=13
Instance.new("UICorner", kbtn).CornerRadius=UDim.new(0,8)

-- ===== BUILD =====
local function BUILD()
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local S = {
        -- MOVE
        fly=false, flySpeed=60, flyMode="CFrame",
        noclip=false, speed=false, speedVal=50,
        jump=false, jumpVal=50, infJump=false, autoJump=false,
        clickTP=false, antiVoid=false, antiFling=false,
        spin=false, spinSpeed=10, freeze=false,
        lockY=false, lockYVal=50, saveCframe=nil,
        hbp=false, hbpVal=5, dash=false, dashSpeed=200,
        bunnyhop=false, wallClimb=false, swim=false,
        autoSprint=false, yFly=false, xFly=false, zFly=false,
        antiRagdoll=false, tpWalk=false, tpWalkSpeed=50,
        -- VISUAL
        esp=false, chams=false, fullbright=false, invisible=false,
        nightVision=false, noFog=false, noShadow=false, xray=false,
        fov=70, tracers=false, nameTags=false, healthBars=false,
        glow=false, removeLighting=false, ambient=false,
        -- PLAYER
        autoRejoin=false, noJumpCD=false, instantRespawn=false,
        autoReset=false, lockX=false, lockXVal=0, lockZ=false, lockZVal=0,
        -- COMBAT
        hitbox=false, hitboxVal=15, killAura=false, autoDodge=false,
        aimbot=false, wallCheck=true, teamCheck=false, reach=15,
        antiStun=false, noFallDamage=false, infOxygen=false,
        -- WORLD
        gravity=false, gravityVal=50, noClipWorld=false,
        -- CHAT
        chatMsg="FENALHUB on top", chatSpam=false, chatDelay=5,
        -- MISC
        antiAFK=true, hideGui=false,
        _tp="", _wp="wp1", waypoints={},
    }

    local Window = WindUI:CreateWindow({
        Title = "FENALHUB | MEGA | " .. (IS_ADMIN and "ADMIN" or "USER"),
        Icon = "zap",
        Author = USER_NAME .. " | " .. USER_RANK,
        Folder = "FenalHub",
        Size = UDim2.fromOffset(620, 480),
        Transparent = true, Theme = "Dark",
        User = { Enabled = true, Anonymous = false },
    })

    -- WATERMARK
    local wmGui = Instance.new("ScreenGui", pg)
    wmGui.Name="FENALHUB_WM"; wmGui.ResetOnSpawn=false; wmGui.DisplayOrder=998
    local wm = Instance.new("TextButton", wmGui)
    wm.Size=UDim2.new(0,420,0,34); wm.Position=UDim2.new(0.5,-210,0,10)
    wm.BackgroundColor3=Color3.fromRGB(15,15,22); wm.BackgroundTransparency=0.15
    wm.BorderSizePixel=0; wm.Text=""; wm.AutoButtonColor=false
    wm.Active=true; wm.Draggable=true
    Instance.new("UICorner", wm).CornerRadius=UDim.new(0,10)
    local wS=Instance.new("UIStroke", wm); wS.Color=Color3.fromRGB(0,255,180); wS.Thickness=1; wS.Transparency=0.3
    local wG=Instance.new("UIGradient", wS)
    wG.Color=ColorSequence.new(Color3.fromRGB(0,255,180), Color3.fromRGB(0,180,255))
    local ic=Instance.new("TextLabel", wm); ic.Size=UDim2.new(0,26,1,0); ic.Position=UDim2.new(0,8,0,0)
    ic.BackgroundTransparency=1; ic.Text="✦"
    ic.TextColor3=Color3.fromRGB(0,255,180); ic.Font=Enum.Font.GothamBold; ic.TextSize=16
    local tt=Instance.new("TextLabel", wm); tt.Size=UDim2.new(0,120,1,0); tt.Position=UDim2.new(0,38,0,0)
    tt.BackgroundTransparency=1; tt.Text="FENALHUB"
    tt.TextColor3=Color3.fromRGB(0,255,180); tt.Font=Enum.Font.GothamBold
    tt.TextSize=13; tt.TextXAlignment=Enum.TextXAlignment.Left
    local inf=Instance.new("TextLabel", wm); inf.Size=UDim2.new(1,-175,1,0); inf.Position=UDim2.new(0,160,0,0)
    inf.BackgroundTransparency=1
    inf.Text=string.format("UID: %d | %s | %s", USER_ID, USER_NAME, USER_RANK)
    inf.TextColor3=Color3.fromRGB(200,200,220); inf.Font=Enum.Font.Gotham
    inf.TextSize=11; inf.TextXAlignment=Enum.TextXAlignment.Right
    task.spawn(function()
        while wm.Parent do
            for i=0,1,0.02 do
                if not wm.Parent then break end
                wG.Rotation=i*360; task.wait(0.03)
            end
        end
    end)
    local menuOpen = true
    wm.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        if menuOpen then Window:Open() else Window:Close() end
    end)

    -- ============ TAB 1: MOVE ============
    local T1 = Window:Tab({Title="Move", Icon="move"})
    T1:Toggle({Title="Fly (CFrame)", Desc="WASD + Space/LCtrl", Default=false, Callback=function(v) S.fly=v end})
    T1:Slider({Title="Fly Speed", Value={Min=10,Max=1000,Default=60}, Callback=function(v) S.flySpeed=v end})
    T1:Dropdown({Title="Fly Mode", Values={"CFrame","Velocity","CFrame+Look"}, Default="CFrame", Callback=function(v) S.flyMode=v end})
    T1:Toggle({Title="Noclip", Default=false, Callback=function(v) S.noclip=v end})
    T1:Toggle({Title="Speed", Default=false, Callback=function(v)
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
    T1:Toggle({Title="Click TP", Default=false, Callback=function(v) S.clickTP=v end})
    T1:Toggle({Title="Anti Void", Default=false, Callback=function(v) S.antiVoid=v end})
    T1:Toggle({Title="Anti Fling", Default=false, Callback=function(v) S.antiFling=v end})
    T1:Toggle({Title="Anti Ragdoll", Default=false, Callback=function(v) S.antiRagdoll=v end})
    T1:Toggle({Title="Spin", Default=false, Callback=function(v) S.spin=v end})
    T1:Slider({Title="Spin Speed", Value={Min=1,Max=100,Default=10}, Callback=function(v) S.spinSpeed=v end})
    T1:Toggle({Title="Freeze Position", Default=false, Callback=function(v) S.freeze=v end})
    T1:Toggle({Title="Lock Y", Default=false, Callback=function(v) S.lockY=v end})
    T1:Slider({Title="Lock Y Value", Value={Min=1,Max=1000,Default=50}, Callback=function(v) S.lockYVal=v end})
    T1:Toggle({Title="Hip Height", Default=false, Callback=function(v)
        S.hbp=v
        local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.HipHeight=v and S.hbpVal or 2 end
    end})
    T1:Slider({Title="Hip Value", Value={Min=1,Max=50,Default=5}, Callback=function(v) S.hbpVal=v end})
    T1:Toggle({Title="Dash", Desc="нажми Q", Default=false, Callback=function(v) S.dash=v end})
    T1:Slider({Title="Dash Speed", Value={Min=50,Max=1000,Default=200}, Callback=function(v) S.dashSpeed=v end})
    T1:Toggle({Title="Bunny Hop", Default=false, Callback=function(v) S.bunnyhop=v end})
    T1:Toggle({Title="Wall Climb", Default=false, Callback=function(v) S.wallClimb=v end})
    T1:Toggle({Title="TP Walk", Default=false, Callback=function(v) S.tpWalk=v end})
    T1:Slider({Title="TP Walk Speed", Value={Min=10,Max=500,Default=50}, Callback=function(v) S.tpWalkSpeed=v end})

    -- ============ TAB 2: VISUAL ============
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
        S.fullbright=v
        if v then
            Lighting.Ambient=Color3.fromRGB(255,255,255)
            Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255); Lighting.Brightness=3
        else
            Lighting.Ambient=Color3.fromRGB(0,0,0)
            Lighting.OutdoorAmbient=Color3.fromRGB(70,70,70); Lighting.Brightness=2
        end
    end})
    T2:Toggle({Title="Invisible (local)", Default=false, Callback=function(v)
        S.invisible=v
        local c=LP.Character; if not c then return end
        for _,p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.Transparency=v and 1 or 0; p.CanCollide=not v
            elseif p:IsA("Decal") then p.Transparency=v and 1 or 0 end
        end
    end})
    T2:Toggle({Title="Night Vision", Default=false, Callback=function(v)
        S.nightVision=v
        if v then
            local cc=Instance.new("ColorCorrectionEffect", Lighting)
            cc.Name="TWKS_NV"; cc.TintColor=Color3.fromRGB(0,255,0); cc.Brightness=0.2
        else
            local nv=Lighting:FindFirstChild("TWKS_NV"); if nv then nv:Destroy() end
        end
    end})
    T2:Toggle({Title="No Fog", Default=false, Callback=function(v)
        S.noFog=v; Lighting.FogEnd=v and 1e6 or 100000
    end})
    T2:Toggle({Title="No Shadows", Default=false, Callback=function(v)
        S.noShadow=v; Lighting.GlobalShadows=not v
    end})
    T2:Toggle({Title="X-Ray", Default=false, Callback=function(v)
        S.xray=v
        for _,p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") then p.LocalTransparencyModifier = v and 0.8 or 0 end
        end
    end})
    T2:Slider({Title="FOV", Value={Min=70,Max=140,Default=70}, Callback=function(v) CAM.FieldOfView=v end})
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
    end})

    -- ============ TAB 3: PLAYER ============
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
    T3:Button({Title="TP to Random Player", Callback=function()
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
        if r and S._wp then S.waypoints[S._wp]=r.CFrame; WindUI:Notify({Title="WP Saved",Content=S._wp,Duration=2}) end
    end})
    T3:Button({Title="TP to Waypoint", Callback=function()
        local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if r and S.waypoints[S._wp] then r.CFrame=S.waypoints[S._wp] end
    end})
    T3:Button({Title="Copy Position", Callback=function()
        local r=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if r and setclipboard then setclipboard(tostring(r.CFrame)) end
    end})
    T3:Button({Title="Copy Join Script", Callback=function()
        local s=string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s", game:GetService("Players").LocalPlayer)', game.PlaceId, game.JobId)
        if setclipboard then setclipboard(s) end
    end})
    T3:Button({Title="Show All Players (UID/Rank)", Callback=function()
        local lines = {}
        for _,p in ipairs(Players:GetPlayers()) do
            table.insert(lines, p.Name.." | UID: "..getUID(p).." | "..getRank(p))
        end
        WindUI:Notify({Title="Players", Content=table.concat(lines,"\n"), Duration=8})
    end})
    T3:Toggle({Title="Auto Rejoin on Death", Default=false, Callback=function(v) S.autoRejoin=v end})
    T3:Toggle({Title="No Jump Cooldown", Default=false, Callback=function(v) S.noJumpCD=v end})
    T3:Toggle({Title="Instant Respawn", Default=false, Callback=function(v) S.instantRespawn=v end})

    -- ============ TAB 4: COMBAT ============
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
    T4:Toggle({Title="Auto Dodge", Default=false, Callback=function(v) S.autoDodge=v end})
    T4:Toggle({Title="Aimbot", Default=false, Callback=function(v) S.aimbot=v end})
    T4:Toggle({Title="Wall Check", Default=true, Callback=function(v) S.wallCheck=v end})
    T4:Toggle({Title="Team Check", Default=false, Callback=function(v) S.teamCheck=v end})
    T4:Slider({Title="Reach", Value={Min=5,Max=100,Default=15}, Callback=function(v) S.reach=v end})
    T4:Button({Title="Kill All (allowed games)", Callback=function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                local h=p.Character:FindFirstChildOfClass("Humanoid")
                if h then h.Health=0 end
            end
        end
    end})
    T4:Button({Title="Freeze All", Callback=function()