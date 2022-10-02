local ShowFloatingHelpNotification = true

ZonesListe = {
    ["Voiture 1"] = {
        Position = vector3(-1034.1868896484,-2733.0307617188,20.169271469116),
        PositionCamera = vector3(-1026.1761474609,-2734.1176757813,23.096025466919),
        CamFov = 40.0,
        PositionVehicule = vector3(-1032.1081542969,-2729.919921875,20.130144119263),
        VehiculeHeading = 236.81237792969,
        name = "loc1",
        Vehicule = {
            { name = 'Panto', model = 'panto', price = 500},
		    { name = 'Blista', model = 'blista', price = 1000},
        },
        Blip = {
            Name = "Location Voiture",
            Sprite = 227,
            Display = 4,
            Scale = 0.75,
            Color = 34
        },
        Action = function()
            FreezeEntityPosition(GetPlayerPed(-1), true)
            name = "loc1"
            openlocationcar(name) 
        end
    },
    ["Helico 1"] = {
        Position = vector3(-1138.3787841797,-2855.2724609375,13.946207046509),
        PositionCamera = vector3(-1136.3845214844,-2849.7861328125,15.964430809021),
        CamFov = 40.0,
        PositionVehicule = vector3(-1145.607421875,-2864.1015625,13.946039199829),
        VehiculeHeading = 147.11184692383,
        name = "helico1",
        Vehicule = {
            { name = 'Frogger', model = 'frogger', price = 5000},
		    { name = 'Havok', model = 'havok', price = 10000},
        },
        Blip = {
            Name = "Location Helico",
            Sprite = 64,
            Display = 4,
            Scale = 0.75,
            Color = 3
        },
        Action = function()
            FreezeEntityPosition(GetPlayerPed(-1), true)
            name = "helico1"
            openlocationcar(name) 
        end
    },
    ["Bateau 1"] = {
        Position = vector3(-806.96746826172,-1497.2216796875,1.595218539238),
        PositionCamera = vector3(-786.94921875,-1497.7707519531,4.4719657897949),
        CamFov = 40.0,
        PositionVehicule = vector3(-801.19659423828,-1502.2885742188,-0.47475832700729),
        VehiculeHeading = 105.8946762085,
        name = "boat1",
        Vehicule = {
            { name = 'Dinghy', model = 'dinghy', price = 5000},
		    { name = 'Seashark', model = 'seashark3', price = 2000},
        },
        Blip = {
            Name = "Location Bateau",
            Sprite = 410,
            Display = 4,
            Scale = 0.75,
            Color = 27
        },
        Action = function()
            FreezeEntityPosition(GetPlayerPed(-1), true)
            name = "boat1"
            openlocationcar(name) 
        end
    },
    ["Bmx 1"] = {
        Position = vector3(211.07885742188,-852.35900878906,30.466079711914),
        PositionCamera = vector3(208.78729248047,-846.12860107422,33.019218444824),
        CamFov = 40.0,
        PositionVehicule = vector3(210.67132568359,-848.59411621094,30.357334136963),
        VehiculeHeading = 261.15307617188,
        name = "bmx1",
        Vehicule = {
            { name = 'BMX', model = 'bmx', price = 10},
        },
        Blip = {
            Name = "Location BMX",
            Sprite = 226,
            Display = 4,
            Scale = 0.75,
            Color = 0
        },
        Action = function()
            FreezeEntityPosition(GetPlayerPed(-1), true)
            name = "bmx1"
            openlocationcar(name) 
        end
    },
    --[[
        ["EXEMPLE"] = {       ------- Nom 
        Position = vector3(211.07885742188,-852.35900878906,30.466079711914),        ------- Pos menu
        PositionCamera = vector3(208.78729248047,-846.12860107422,33.019218444824),    ------- Pos Caméra
        CamFov = 40.0,        ------ FOV cam
        PositionVehicule = vector3(210.67132568359,-848.59411621094,30.357334136963),  ------- Spawn du véhicule
        VehiculeHeading = 261.15307617188,           ------- Orientation du véhicule
        name = "bmx1",       ------ Nom de la catégorie UTILISER UN NOM UNIQUE, IL FAUT LE MEME DANS ACTION
        Vehicule = {
            { name = 'BMX', model = 'bmx', price = 10},  -- Ajouté vos véhicule
            { name = 'BMX', model = 'bmx', price = 10},   
        },
        Blip = {
            Name = "Location BMX",       ----- Blips
            Sprite = 226,
            Display = 4,
            Scale = 0.75,
            Color = 0
        },
        Action = function()
            FreezeEntityPosition(GetPlayerPed(-1), true)
            name = "bmx1"       ------ Comme au dessus
            openlocationcar(name) 
        end
    },
    ]]
}

Citizen.CreateThread(function()
    for _,marker in pairs(ZonesListe) do
        if marker.Blip then
            local blip = AddBlipForCoord(marker.Position)

            SetBlipSprite(blip, marker.Blip.Sprite)
            SetBlipScale(blip, marker.Blip.Scale)
            SetBlipColour(blip, marker.Blip.Color)
            SetBlipDisplay(blip, marker.Blip.Display)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(marker.Blip.Name)
            EndTextCommandSetBlipName(blip)
        end
	end

    while true do
        while not esxLoaded do Wait(1) end
        local isProche = false
        for k,v in pairs(ZonesListe) do
    
            local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), v.Position)

            if dist < 250 then
                isProche = true
                DrawMarker(25, v.Position.x, v.Position.y, v.Position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 104, 247, 130, 71, false, false, 2, false, false, false, false)
            end
            if dist < 10 then
                isProche = true
                esx.ShowHelpNotification('Appuyez sur ~b~E~w~ pour ouvrir le menu')
                if IsControlJustPressed(1,51) then
                    v.Action(v.Position)
                end
            end
            
        end
        
		if isProche then
			Wait(0)
		else
			Wait(750)
		end
	end

end)