-- Settings --
local prefix = "#"
local isIncognito = true
local isIncognitoJS = false -- Are you using the incognito js script? https://github.com/TypicalOperator/issmodified/tree/main --

-- Incognito --
if isIncognto == true then
    if isIncognitoJS == false then
        local Source = game:HttpGet("https://raw.githubusercontent.com/KadeTheExploiter/IncognitoScripts/main/ScriptSupport.lua")
        loadstring(Source)()
    elseif isIncognitoJS == true then
        local Source = game:HttpGet("https://raw.githubusercontent.com/TypicalOperator/issmodified/main/script.lua")
        loadstring(Source)()
    end
end

-- Variables --
local lp = game.Players.LocalPlayer
local char = lp.Character
local hum = char.Humanoid
local hrp = char.HumanoidRootPart
local bp = lp.Backpack
local players = game.Players

-- Functions --
local function getPlr(str)
    for i,v in pairs(players:GetPlayers()) do
        if v.Name:lower():match(str) or v.DisplayName:lower():match(str) then
            return v
        end
    end
end

local nc = false
local ncLoop
ncLoop = game:GetService("RunService").Stepped:Connect(function()
    if nc and char ~= nil then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
    end
end)

-- Script --
local cc;cc = lp.Chatted:Connect(function(msg)
    local lp = game.Players.LocalPlayer
local char = lp.Character
local hum = char.Humanoid
local hrp = char.HumanoidRootPart
local bp = lp.Backpack
local players = game.Players
    local args = msg:split(" ")
    if args[1] == prefix.."kill" then
        local cpos = hrp.CFrame
        local tool = bp.Stroller
        local tc = getPlr(tostring(args[2]):lower()).Character
        hum:EquipTool(tool)
        repeat hrp.CFrame = tc.HumanoidRootPart.CFrame wait(0.1) until tc.Humanoid.Sit == true
        hrp.CFrame = CFrame.new(0,-40,0)
        wait(1.5)
        hum:UnequipTools()
        hrp.CFrame = cpos
    elseif args[1] == prefix.."bring" then
        local cpos = hrp.CFrame
        local tool = bp.Stroller
        local tc = getPlr(tostring(args[2]):lower()).Character
        hum:EquipTool(tool)
        repeat hrp.CFrame = tc.HumanoidRootPart.CFrame wait(0.1) until tc.Humanoid.Sit == true
        hrp.CFrame = cpos
        wait(3)
        hum:UnequipTools()
    elseif args[1] == prefix.."view" then
        target = getPlr(args[2])
        workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
    elseif args[1] == prefix.."unview" then
        workspace.CurrentCamera.CameraSubject = hum
    elseif args[1] == prefix.."servercrash" then
        --Poop Script | Life in Paradise FE Script - Slightly updated
--Uses the Morph GUI to lag games
--by replacemente

--SETTINGS
blockparts = true --if true then the parts will be blocks
antilagtest = false --(currently broken) if set to true, other people can see the parts but not you 
--renderlocally may teleport you due to a glitch so using fly is recommended
countblocks = true --counts the amt of blocks
testthing = false
--testthign is a weird thing that happened when i was testing, but im 50% sure it can crash a server if done right or something lol
--this works for everyone else btw, even tho it shows the blocks going into one pile
loadpos = Vector3.new(-474, 54, 55)


seteventmanually = false 
--set the event manually if u wanna use this in a diff game
local avatareditorevent --set here, or dont
local magicmorphevent
local WearItemArgs
local TurkeyArgs
--if ur setting the events manually i recommend using rspy

if not seteventmanually then
    morphmagicevent = workspace.Events.Morph.Player
    avatareditorevent = game:GetService("ReplicatedStorage").WearItem
    WearItemArgs = {
        [1] = {
            [1] = "Wear",
            [2] = "130213380",
            [3] = "Faces"
        }
    }
    TurkeyArgs = {
        [1] = "Turkey"
    }
end

local Torso = game.Players.LocalPlayer.Character:WaitForChild("Torso")
if antilagtest then testthing = false end

avatareditorevent:FireServer(unpack(WearItemArgs))
wait(.3)
coroutine.resume(coroutine.create(function()
while task.wait() do
    morphmagicevent:FireServer(unpack(TurkeyArgs))
        for i,v in pairs(Torso:GetChildren()) do
            if blockparts then
                v:ClearAllChildren()
            end
            if v:isA("Weld") then
                v:Destroy()
            end
        end
    end
end))
coroutine.resume(coroutine.create(function()
while wait() do
    for i,v in pairs(Torso:GetChildren()) do
        if v:isA("BasePart") then
            if testthing then
                v.CanCollide = false
                v.Anchored = true
                v.Position = loadpos
            end
            if antilagtest then
                v.CanCollide = false
                v.Position = Vector3.new(0, 999999999, 0)
            end
        end
    end
end
end))

if countblocks == true then
    gui = Instance.new("ScreenGui")
    frame = Instance.new("Frame")
    txt = Instance.new("TextLabel")
    txt.Parent = frame
    frame.Parent = gui
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    frame.Position = UDim2.new(0.5, 0, 0.5, 200)
    gui.Name = "replacemente"
    count = -2
   Torso.ChildAdded:Connect(function()
        count = count+1
        txt.Text = tostring(count)
   end)
  Torso.ChildRemoved:Connect(function()
        count = count-1
        txt.Text = tostring(count)
   end)
end
--replacemente
    elseif args[1] == prefix.."accessory" then
        local accessory = args[2]
        avatareditorevent = game:GetService("ReplicatedStorage").WearItem
        WearItemArgs = {
            [1] = {
                [1] = "Wear",
                [2] = accessory,
                [3] = "Hats"
            }
        }
        avatareditorevent:FireServer(unpack(WearItemArgs))
    elseif args[1] == prefix.."fling" then
        local tc = getPlr(tostring(args[2]):lower()).Character
        angvel = Instance.new("BodyAngularVelocity")
        angvel.Parent = hrp
        angvel.MaxTorque = Vector3.new(0,inf,0)
        nc = true
        while angvel do
            angvel.AngularVelocity = Vector3.new(0,9999,0)
            wait(0.5)
            angvel.AngularVelocity = Vector3.new(0,0,0)
        end
        repeat hrp.CFrame = tc.HumanoidRootPart.CFrame wait(0.1) until not tc:FindFirstChild("Head")
    elseif args[1] == prefix.."cmds" then
        print([[C:\Users\]]..lp.Name..[[\\LIPadmin\Commands.txt
Reading file Commands.txt:
kill [user]
bring [user]
view [user]
unview
servercrash
stop
accessory [id]
fling [user] (not working)
        ]])
    elseif args[1] == prefix.."stop" then
        cc:Disconnect()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Life in Paradise Admin",
            Text = "Disconnected",
            Duration = 3,
        })
        print("Disconnected")
    end
end)

-- Loaded --
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Life in Paradise Admin",
    Text = "Loaded",
    Duration = 3,
})
print("Life in Paradise Admin")
print("---- Made by Typx ----")
