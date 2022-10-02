fx_version "adamant"

game "gta5"

client_scripts {
    -- RAGEUI
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",
    -- LOCATION
    "init/client/cl_initesx.lua",
    "client/*.lua",
    "shared/*.lua",
}

server_scripts {
    "@async/async.lua",
    "@mysql-async/lib/MySQL.lua",
    "init/server/sv_initesx.lua",
    "server/*.lua",
    "shared/*.lua",
}
