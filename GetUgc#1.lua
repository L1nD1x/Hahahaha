-- the code is extremely messy because something in the code editor fucked it up all at once and for some reason removed indents in some parts of the code while kept indents in some other parts of the code LOL
local LOAD_TIME = tick()
local queueonteleport = queue_on_teleport or queueonteleport
local setclipboard = toclipboard or setrbxclipboard or setclipboard
local clonefunction = clonefunc or clonefunction
local hookfunction =
    hookfunc or replacecclosure or detourfunction or replacefunc or replacefunction or replaceclosure or detour_function or
        hookfunction
local setthreadidentity = set_thread_identity or setthreadcaps or setthreadidentity
local firetouchinterests = fire_touch_interests or firetouchinterests
local getnamecallmethod = get_namecall_method or getnamecallmethod
local setnamecallmethod = set_namecall_method or setnamecallmethod
local restorefunction = restorefunction or restoreclosure or restorefunc

-- // cloneref function for exploits that dont support it
local a = Instance.new("Part")
for b, c in pairs(getreg()) do
    if type(c) == "table" and #c then
        if rawget(c, "__mode") == "kvs" then
            for d, e in pairs(c) do
                if e == a then
                    getgenv().InstanceList = c;
                    break
                end
            end
        end
    end
end
local f = {}
function f.invalidate(g)
    if not InstanceList then
        return
    end
    for b, c in pairs(InstanceList) do
        if c == g then
            InstanceList[b] = nil;
            return g
        end
    end
end
if not cloneref then
    getgenv().cloneref = f.invalidate
end

getrenv().Visit = cloneref(game:GetService("Visit"))
getrenv().MarketplaceService = cloneref(game:GetService("MarketplaceService")) -- // theres a reason why thats referenced in the roblox environment
getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
getrenv().HttpService = cloneref(game:GetService("HttpService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local RunService = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local Players = cloneref(game:GetService("Players"))
local NetworkClient = cloneref(game:GetService("NetworkClient"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
local Lighting = cloneref(game:GetService("Lighting"))
local AssetService = cloneref(game:GetService("AssetService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local NetworkSettings = settings().Network
local UserGameSettings = UserSettings():GetService("UserGameSettings")
getrenv().getgenv = clonefunction(getgenv)

local message = Instance.new("Message")
message.Text = "New script by lindix!"
message.Name =
    "ðŸ’‹â€  ð“ð“˜ð“–ð“–ð“â€€! ð“—ð“ð“’ð“š  â€ðŸ’‹"
message.Parent = CoreGui

task.wait(0.25)

getgenv().stealth_call = function(script)
    getrenv()._set = clonefunction(setthreadidentity)
    local old
    old = hookmetamethod(game, "__index", function(a, b)
        task.spawn(function()
            _set(7)
            task.wait(0.1)
            local went, error = pcall(function()
                loadstring(script)()
            end)
            print(went, error)
            if went then
                local check = Instance.new("LocalScript")
                check.Parent = Visit
            end
        end)
        hookmetamethod(game, "__index", old)
        return old(a, b)
    end)
end
    local ugc = serv:Channel("UGC Limiteds")
    ugc:Label("Looking for Remote Bruteforcing? Check out #Remotes!")
    ugc:Seperator()
    ugc:Label(
        "\nThis will auto purchase any limited that gets prompted!\nThis is recommended to use in the rolimons game or wagoogus.\n")
    ugc:Label("With this, you can get #1 serials of web UGC item drops!")
    ugc:Toggle("Auto Purchaser", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local idempotencyKey = t[5]
                            local purchaseAuthToken = t[6]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            local productId = info.ProductId
                            local price = info.PriceInRobux
                            local collectibleItemId = info.CollectibleItemId
                            local collectibleProductId = info.CollectibleProductId
                            print("Double checking if we got the right info...")
                            print("PurchaseAuthToken: " .. purchaseAuthToken)
                            print("IdempotencyKey: " .. idempotencyKey)
                            print("CollectibleItemId: " .. collectibleItemId)
                            print("CollectibleProductId: " .. collectibleProductId)
                            print("ProductId (SHOULD BE 0): " .. productId)
                            print("Price: " .. price)
                            print("-------------------------------------------------------")
                            warn("FIRST PURCHASE ATTEMPT")
                            for i, v in pairs(MarketplaceService:PerformPurchase(Enum.InfoType.Asset, productId, price,
                                tostring(game:GetService("HttpService"):GenerateGUID(false)), true, collectibleItemId,
                                collectibleProductId, idempotencyKey, tostring(purchaseAuthToken))) do
                                print(i, v)
                            end
                            local endTime = tick()
                            local duration = endTime - startTime
                            print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
                            input.press(Enum.KeyCode.F9)
                        end)
                end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)

    ugc:Toggle("Auto Purchaser V2 (BETA)", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            pcall(function()
                                local starttickxd = tick()
                                local data = '{"collectibleItemId":"' .. tostring(info.CollectibleItemId) ..
                                     '","collectibleProductId":"' .. tostring(info.CollectibleProductId) ..
                                     '","expectedCurrency":1,"expectedPrice":' .. tostring(info.PriceInRobux) ..
                                     ',"idempotencyKey":"' ..
                                     tostring(game:GetService("HttpService"):GenerateGUID(false)) ..
                                     '","expectedSellerId":' .. tostring(info.Creator.Id) .. ',"expectedSellerType":"' ..
                                     tostring(info.Creator.CreatorType) ..
                                     '","expectedPurchaserType":"User","expectedPurchaserId":' ..
                                     tostring(game.Players.LocalPlayer.UserId) .. '}'
                                print(data)
                                -- setclipboard(data)
                                _post("https://apis.roblox.com/marketplace-sales/v1/item/" .. tostring(info.CollectibleItemId) .."/purchase-item", data);
                                wait();
                                local endTime = tick()
                                local duration = endTime - startTime
                                print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            end)
                        end)
                    end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)
    ugc:Button("Teleport to Rolimons UGC Game", function()
        TeleportService:Teleport(14056754882, Players.LocalPlayer)
    end)
    ugc:Button("Teleport to Wagoogus UGC Game", function()
        TeleportService:Teleport(975820487, Players.LocalPlayer)
    end)
        message:Destroy()
    end)
end)
