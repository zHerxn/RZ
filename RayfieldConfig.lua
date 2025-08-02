local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Core = require(script.Parent.Parent.core.init)
local AimbotWrapper, ESPWrapper = Core.AimbotWrapper, Core.ESPWrapper

local Window = Rayfield:CreateWindow({
    Name = "Universal Aimbot & ESP",
    LoadingTitle = "Cargando...",
    LoadingSubtitle = "Un momento",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UniversalAimbot",
        FileName = "userconfig"
    }
})

local Combate = Window:CreateTab("Combate")
local Visuales = Window:CreateTab("Visuales")

-- Combate: Controles de Aimbot
Combate:CreateToggle({
    Name = "Activar Aimbot",
    CurrentValue = true,
    Flag = "AimbotON",
    Callback = function(val)  AimbotWrapper:SetEnabled(val) end,
})
Combate:CreateDropdown({
    Name = "Parte objetivo",
    Options = {"Head", "HumanoidRootPart"},
    CurrentOption = {"Head"},
    Flag = "AimPart",
    Callback = function(opt) 
        Aimbot.Settings.AimPart = opt[1] 
    end,
})
Combate:CreateKeybind({
    Name = "Tecla Aimbot",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "AimbotKey",
    Callback = function(key) Aimbot.Settings.AimbotKey = key end,
})
Combate:CreateSlider({
    Name = "Radio FOV",
    Range = {15, 350},
    Increment = 1,
    Suffix = " px",
    CurrentValue = 100,
    Flag = "FOVSlider",
    Callback = function(val) AimbotWrapper:SetFOV(val) end,
})
Combate:CreateSlider({
    Name = "Suavizado",
    Range = {1, 30},
    Increment = 1,
    Suffix = " smooth",
    CurrentValue = 5,
    Flag = "SmoothSlider",
    Callback = function(val) AimbotWrapper:SetSmooth(val) end,
})
Combate:CreateToggle({
    Name = "Predicción ON/OFF",
    CurrentValue = false,
    Flag = "Prediction",
    Callback = function(val) AimbotWrapper:TogglePrediction(val) end,
})
Combate:CreateInput({
    Name = "Blacklist (nombre)",
    PlaceholderText = "Introduce nombre",
    Flag = "BlacklistInput",
    Callback = function(text) if text then AimbotWrapper:Blacklist(text) end end,
})

-- Visuales ESP
Visuales:CreateToggle({
    Name = "Activar ESP",
    CurrentValue = true,
    Flag = "ESPON",
    Callback = function(val) ESPWrapper:SetEnabled(val) end,
})
Visuales:CreateColorPicker({
    Name = "Color cajas enemigo",
    Color = Color3.fromRGB(255,0,0),
    Flag = "BoxColor",
    Callback = function(color) ESPWrapper:SetColor(color) end,
})
Visuales:CreateSlider({
    Name = "Distancia máxima",
    Range = {50, 1000},
    Increment = 50,
    Suffix = " studs",
    CurrentValue = 500,
    Flag = "MaxDistance",
    Callback = function(val) ESPWrapper:SetMaxDistance(val) end,
})
Visuales:CreateButton({
    Name = "Recargar ESP",
    Callback = function() ESPWrapper:Reload() end,
})

-- Notificación de inicio correcto
Rayfield:Notify({
    Title = "Listo",
    Content = "Aimbot & ESP inicializados",
    Duration = 3
})

return {}
