for i=1,5000 do
local args = {
    [1] = "ClickStat",
    [2] = 1000000000
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Client"):InvokeServer(unpack(args))
end

for i=1,5000 do
local args = {
    [1] = "Wins"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Client"):InvokeServer(unpack(args))
end
