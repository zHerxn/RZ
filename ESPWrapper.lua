local ESPWrapper = {}

function ESPWrapper:Init()
    Sense.teamSettings.enemy.enabled = true
    Sense.teamSettings.enemy.name = true
    Sense.teamSettings.enemy.box = true
    Sense.teamSettings.enemy.boxColor = Color3.fromRGB(255,0,0)
    Sense.Load()
end

function ESPWrapper:SetEnabled(flag)
    Sense.teamSettings.enemy.enabled = flag
    if flag then Sense.Load() else Sense.Unload() end
end

function ESPWrapper:SetColor(color)
    Sense.teamSettings.enemy.boxColor = color
end

function ESPWrapper:SetMaxDistance(distance)
    if Sense then
        Sense.settings.maxDistance = distance
    end
end

function ESPWrapper:Reload()
    Sense.Unload()
    Sense.Load()
end

return ESPWrapper
