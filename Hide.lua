_G.HideAll = true
while _G.HideAll and  task.wait() do

for i,v in pairs(game.Players:GetPlayers()) do
if v.Name ~= game.Players.LocalPlayer.Name and v.Character then
v.Character:Destroy()
end
end
end
