local AimbotWrapper = {}

function AimbotWrapper:Init()
    -- Configuración y comandos del núcleo
    if not _G.AimbotInited then
        _G.AimbotInited = true
        getgenv().Aimbot = Aimbot
        Aimbot.Settings.FOVRadius = 100
        Aimbot.Settings.ThirdPerson = false
        Aimbot.Settings.TeamCheck = true
        Aimbot.Load()
    end
end

function AimbotWrapper:SetEnabled(flag)
    if flag then
        Aimbot.Load()
    else
        Aimbot.Exit()
    end
end

function AimbotWrapper:SetFOV(fov)
    Aimbot.Settings.FOVRadius = fov
end

function AimbotWrapper:SetSmooth(value)
    if Aimbot.Settings.Smoothness then 
        Aimbot.Settings.Smoothness = value
    end
end

function AimbotWrapper:TogglePrediction(enable)
    if Aimbot.Settings.Prediction then
        Aimbot.Settings.Prediction = enable
    end
end

function AimbotWrapper:GetClosestPlayer()
    return Aimbot.GetClosestPlayer()
end

function AimbotWrapper:Blacklist(name)
    Aimbot.Blacklist(name)
end

function AimbotWrapper:Whitelist(name)
    Aimbot.Whitelist(name)
end

function AimbotWrapper:Exit()
    Aimbot.Exit()
end

return AimbotWrapper
