-- Cargar Dependencias
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()
local Aimbot = loadstring(game:HttpGet('https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua'))()

-- Inicialización de módulos
local AimbotWrapper = require(script.Parent.AimbotWrapper)
local ESPWrapper = require(script.Parent.ESPWrapper)
local RayfieldConfig = require(script.Parent.Parent.UI.RayfieldConfig)

-- Configuración inicial Sense
Sense.teamSettings.enemy.enabled = true
Sense.teamSettings.enemy.box = true
Sense.teamSettings.enemy.name = true
Sense.teamSettings.enemy.boxColor = Color3.new(1,0,0)
Sense.Load()

Aimbot.Load()

-- Configuración Avanzada (descarga segura en cierre)
game:BindToClose(function()
    Aimbot.Exit()
    Sense.Unload()
end)

return {
    ESPWrapper = ESPWrapper,
    AimbotWrapper = AimbotWrapper
}
