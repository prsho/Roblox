datastore = game:GetService("DataStoreService"):GetDataStore("Sbvariable")
--_G["datastore"] = game:GetService("DataStoreService"):GetDataStore("Sbvariable")
--datastore:SetAsync("library",{})

--table.foreach(_G.datastore:GetAsync("library"),print)
--print(_G.datastore:GetAsync("library")[1])



function chatevent(player)
player.Chatted:connect(function(message)
local message = message:lower()
if string.find(message,"http") or string.find(message,"https") or string.find(message,"runl") or string.find(message,"x")  or string.find(message,"www") or string.find(message,".lua")  then
local oldtab = datastore:GetAsync("library") or {}
oldtab[#oldtab + 1] = player.Name.."; "..message
datastore:SetAsync("library",oldtab)
--print(table.concat(oldtab,"\n"))
end 
end)	
end



for k,v in pairs(game.Players:GetPlayers()) do
chatevent(v)	
end



game.Players.PlayerAdded:connect(function(player)
chatevent(player)
end)



print("Current version is 1.0")
-- Created by AnimeWiki
