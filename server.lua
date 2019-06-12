local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")   
vRPclient = Tunnel.getInterface("vRP","vrpjob")


RegisterServerEvent('drug')
AddEventHandler('drug', function()
	local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	vRP.addUserGroup({user_id,"Drug Dealer"})
	vRPclient.notifyPicture(user_id,{"CHAR_ALL_PLAYERS_CONF",1, "JOBS", false,"You are now a ~g~Drug Delear!",})
end)


