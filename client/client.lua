local tPreviewCar = nil
local tModelCar = nil
local buy = false

RegisterNetEvent('zixos:spawnlocation')
AddEventHandler('zixos:spawnlocation', function(model, spawn, heading)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
    veh = CreateVehicle(GetHashKey(model), spawn, heading, true, false)
    SetVehicleNumberPlateText(veh, "LOCATION")
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
end)

function openlocationcar(name)
    local menu = RageUI.CreateMenu('Location', "Chosir votre voiture de location")

    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()

            for k, v in pairs(ZonesListe) do
                for a, b in pairs(v.Vehicule) do
                    if v.name == name then 
                        RageUI.Button("> "..b.name, nil, {}, true, {
                            onActive = function()
                                GoPreview(b.model, vector3(v.PositionVehicule), vector3(v.PositionCamera), v.VehiculeHeading, v.CamFov)
                            end,
                            onSelected = function() 
                                if buy == false then 
                                    TriggerServerEvent('zixos:achat', b.model, b.price, v.PositionVehicule, v.VehiculeHeading)
                                    buy = true
                                    menu = RMenu:DeleteType('menu', true)
                                else 
                                    esx.ShowNotification("Vous avez déjà un véhicules")
                                end
                            end
                        })
                    end
                end
            end

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            DeletePreview()
            FreezeEntityPosition(GetPlayerPed(-1), false)
        end
    end
end

function GoPreview(model, coords, coordscam, carheading, camfov)
    
	gocam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamActive(gocam, true)
	RenderScriptCams(1, 0, 0, 1, 1)
	SetCamFov(gocam, camfov)
	SetCamCoord(gocam, coordscam)
	PointCamAtCoord(gocam, coords)
	
    if model == tModelCar then
        return
    else
        if PreviewCar ~= nil then
            DeleteEntity(PreviewCar)
            PreviewCar = nil
        end
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
        tModelCar = model
        PreviewCar = CreateVehicle(GetHashKey(model), coords, carheading, 0, 0)
        FreezeEntityPosition(PreviewCar, true)
        SetEntityAlpha(PreviewCar, 180, 180)
    end
end
function DeletePreview()
    DestroyAllCams(false)
    RenderScriptCams(false, true, 1500, false, false)
    DeleteEntity(PreviewCar)
    PreviewCar = nil
    tModelCar = nil
end