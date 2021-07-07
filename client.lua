
function DrawText3D(x,y,z, text) local onScreen,_x,_y=World3dToScreen2d(x,y,z) SetTextScale(0.35, 0.35) SetTextFont(4) SetTextProportional(1) SetTextColour(255, 255, 255, 215) SetTextEntry("STRING") SetTextCentre(1) AddTextComponentString(text) DrawText(_x,_y) local factor = (string.len(text)) / 370 DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68) end


Citizen.CreateThread(function()
    if KVL.NPC == true then
      for k,v in pairs(KVL.PEDS) do
        RequestModel(v.ped)
        while not HasModelLoaded(v.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.ped, v.x, v.y, v.z - 1, v.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.anim, 0, true);
    end
  end
  end)

  Citizen.CreateThread(function()
    while true do
        sleep = 1000
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped, false)
        local nearby = false
        for k in pairs(KVL.PEDS) do
            local distance = #(pedcoords - vector3(KVL.PEDS[k].x, KVL.PEDS[k].y, KVL.PEDS[k].z))
            if KVL.PEDS[k].text then
            if distance <= 5 then
                sleep = 7
                DrawText3D(KVL.PEDS[k].x, KVL.PEDS[k].y, KVL.PEDS[k].z + 1, KVL.PEDS[k].text)
            end
        end
        end
        Citizen.Wait(sleep)
    end
end)
    