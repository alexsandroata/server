local bankBlip = createBlip()

function carregarSistema()
    for _, v in ipairs(Config["Blips"]) do
        local criarBlip = createBlip(v.x, v.y, v.z, v.blip, 4, 255, 255, 255, 255)
    end
end

addEventHandler("onResourceStart", resourceRoot, carregarSistema)