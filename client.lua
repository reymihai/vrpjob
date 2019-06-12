
 drugX, drugY, drugZ = -1065.4376220703,-1162.3707275391,2.1585967540741
  
 Citizen.CreateThread(function()
    drug = 588969535
    RequestModel( drug )
    while ( not HasModelLoaded( drug ) ) do
        Citizen.Wait( 1 )
    end
    thedrug = CreatePed(4, drug, drugX, drugY, drugZ, 90, false, false)
    SetModelAsNoLongerNeeded(drug)
    SetEntityHeading(thedrug, 100.5)
    FreezeEntityPosition(thedrug, true)
    SetEntityInvincible(thedrug, true)
    SetBlockingOfNonTemporaryEvents(thedrug, true)
    TaskStartScenarioAtPosition(thedrug, "WORLD_HUMAN_DRINKING", drugX, drugY, drugZ, GetEntityHeading(thedrug), 0, 0, false)
end)



Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drugX, drugY, drugZ) < 5.5)then
            Draw3DText(drugX, drugY, drugZ-0.80, "Hey man do you want to make real money?", 4, 0.1, 0.1)
            DisplayHelpText("Press [E] if you want to be a drug delear")
        end
        Citizen.Wait(0)
    end
end)       


Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drugX, drugY, drugZ) < 5.5 and IsControlPressed(1, 38)) then
            TriggerServerEvent("drug")
            
        end
        Citizen.Wait(0)
    end
end) 

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end 

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)		-- You can change the text color here
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
end