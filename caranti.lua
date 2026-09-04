--working right now nigga
local carContainer = workspace:FindFirstChild("CarContainer")

if not carContainer then
    warn("CarContainer not found")
    return
end

-- function to check and delete any matching vehicle (direct child or nested please dont fuck with this
local function cumshot()
    for _, descendant in ipairs(carContainer:GetDescendants()) do
        if descendant:IsA("Model") or descendant:IsA("Folder") then
            if descendant.Name == "Sedan" or descendant.Name == "Squad" then
                descendant:Destroy()
                print("Deleted vehicle:", descendant.Name)
            end
        end
    end
end

-- Function to instantly delete a direct child when added
local function penis(child)
    if child.Name == "Sedan" or child.Name == "Squad" then
        child:Destroy()
        print("Deleted vehicle (ChildAdded):", child.Name)
    end
end

-- delete any existing cars
cumshot()

-- diddle direct ChildAdded for instant deletion
carContainer.ChildAdded:Connect(penis)

-- continouesly loop to catch respawned or reparented vehicles
while true do
    task.wait(0.1)
    cumshot()
end
