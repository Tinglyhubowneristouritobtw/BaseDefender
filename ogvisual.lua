queue_on_teleport([[

repeat task.wait() until game:IsLoaded()

local Settings = {
    RarityActive = true,
    ForcedText = "OG",
    NameFilter = "Lucky Block",
    HideMutation = true,
    PriceOverride = "$500B",
    SellPriceOverride = "$250B",
    ObjectTextOverride = "OG Lucky Block"
}

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Gradients = require(Packages:WaitForChild("Gradients"))

local TargetLabel = "Rarity"
local PriceLabel = "Price"
local MutationLabel = "Mutation"

local RarityEffects = {OG = "OG", Secret = "Zebra", ["Brainrot God"] = "Rainbow"}
local CurrentEffect = RarityEffects[Settings.ForcedText] or "OG"

local OriginalRarities = {}
local OriginalMutations = {}
local OriginalPrices = {}
local OriginalPrompts = {}

local function CopyPriceStyle(RarityLabel)
    local Parent = RarityLabel.Parent
    if not Parent then return end
    local Price = Parent:FindFirstChild(PriceLabel)
    if not Price then return end
    RarityLabel.Font = Price.Font
    RarityLabel.TextSize = Price.TextSize
    RarityLabel.TextStrokeTransparency = Price.TextStrokeTransparency
    RarityLabel.TextStrokeColor3 = Price.TextStrokeColor3
    RarityLabel.TextColor3 = Color3.new(1,1,1)
    for _,v in ipairs(RarityLabel:GetChildren()) do v:Destroy() end
    for _,v in ipairs(Price:GetChildren()) do
        if v:IsA("UIStroke") or v:IsA("UIGradient") or v:IsA("UICorner") then
            v:Clone().Parent = RarityLabel
        end
    end
end

local function ShouldApplyToLabel(Label)
    local Parent = Label.Parent
    if not Parent then return false end
    local DisplayName = Parent:FindFirstChild("DisplayName")
    if not DisplayName or not DisplayName:IsA("TextLabel") then return false end
    if Settings.NameFilter == "" then return true end
    return DisplayName.Text:lower() == Settings.NameFilter:lower()
end

local function ApplyRarity(Label)
    if Label.Name ~= TargetLabel or not Label:IsA("TextLabel") then return end
    if not OriginalRarities[Label] then
        OriginalRarities[Label] = {
            Text = Label.Text,
            TextColor3 = Label.TextColor3,
            Font = Label.Font,
            TextSize = Label.TextSize,
            TextStrokeTransparency = Label.TextStrokeTransparency,
            TextStrokeColor3 = Label.TextStrokeColor3,
            Children = {}
        }
        for _,v in ipairs(Label:GetChildren()) do
            if v:IsA("UIStroke") or v:IsA("UIGradient") or v:IsA("UICorner") then
                table.insert(OriginalRarities[Label].Children, v:Clone())
            end
        end
    end
    if Settings.RarityActive and ShouldApplyToLabel(Label) then
        Label.RichText = true
        Label.Text = Settings.ForcedText
        CopyPriceStyle(Label)
        task.spawn(function() pcall(Gradients.apply, Label, CurrentEffect) end)
    else
        local Original = OriginalRarities[Label]
        if Original then
            Label.Text = Original.Text
            Label.TextColor3 = Original.TextColor3
            Label.Font = Original.Font
            Label.TextSize = Original.TextSize
            Label.TextStrokeTransparency = Original.TextStrokeTransparency
            Label.TextStrokeColor3 = Original.TextStrokeColor3
            for _,v in ipairs(Label:GetChildren()) do v:Destroy() end
            for _,v in ipairs(Original.Children) do v:Clone().Parent = Label end
            local Effect = RarityEffects[Original.Text] or "OG"
            task.spawn(function() pcall(Gradients.apply, Label, Effect) end)
        end
    end
end

local function ApplyPrice(Label)
    if Label.Name ~= PriceLabel or not Label:IsA("TextLabel") then return end
    if not OriginalPrices[Label] then OriginalPrices[Label] = Label.Text end
    if ShouldApplyToLabel(Label) then
        Label.Text = (Settings.PriceOverride ~= "" and Settings.PriceOverride) or OriginalPrices[Label]
    else
        Label.Text = OriginalPrices[Label]
    end
end

local function ApplyMutation(Label)
    if Label.Name ~= MutationLabel or not Label:IsA("GuiObject") then return end
    if not OriginalMutations[Label] then
        OriginalMutations[Label] = {Visible = Label.Visible}
        if Label:IsA("TextLabel") or Label:IsA("TextButton") then
            OriginalMutations[Label].Text = Label.Text
        end
    end
    if Settings.HideMutation and ShouldApplyToLabel(Label) then
        Label.Visible = false
    else
        local Original = OriginalMutations[Label]
        if Original then
            Label.Visible = Original.Visible
            if Original.Text and (Label:IsA("TextLabel") or Label:IsA("TextButton")) then
                Label.Text = Original.Text
            end
        end
    end
end

local function UpdateAll()
    for _,v in ipairs(game:GetDescendants()) do
        if v:IsA("TextLabel") and v.Name == TargetLabel then ApplyRarity(v) end
        if v:IsA("TextLabel") and v.Name == PriceLabel then ApplyPrice(v) end
        if v.Name == MutationLabel then ApplyMutation(v) end
    end
end

local function UpdatePrompts()
    local Plots = workspace:FindFirstChild("Plots")
    if not Plots then return end
    for _,v in ipairs(Plots:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            if not OriginalPrompts[v] then
                OriginalPrompts[v] = {ActionText = v.ActionText, ObjectText = v.ObjectText}
            end

            if Settings.SellPriceOverride ~= "" and string.find(v.ActionText, "Sell: ") then
                v.ActionText = "Sell: " .. Settings.SellPriceOverride
            elseif OriginalPrompts[v] and string.find(v.ActionText, "Sell: ") then
                v.ActionText = OriginalPrompts[v].ActionText
            end

            if Settings.ObjectTextOverride ~= "" and (v.ActionText == "Open" or v.ActionText == "Grab") then
                v.ObjectText = Settings.ObjectTextOverride
            elseif OriginalPrompts[v] then
                v.ObjectText = OriginalPrompts[v].ObjectText
            end
        end
    end
end

local Old
Old = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    if not checkcaller() then
        if Index == "Text" then
            if Self:IsA("TextLabel") and Self.Name == TargetLabel and Settings.RarityActive and ShouldApplyToLabel(Self) then
                return Old(Self, Index, Settings.ForcedText)
            elseif (Self:IsA("TextLabel") or Self:IsA("TextButton")) and Self.Name == PriceLabel and ShouldApplyToLabel(Self) then
                return Old(Self, Index, (Settings.PriceOverride ~= "" and Settings.PriceOverride) or OriginalPrices[Self])
            elseif Self.Name == MutationLabel and OriginalMutations[Self] then
                if Self:IsA("TextLabel") or Self:IsA("TextButton") then
                    OriginalMutations[Self].Text = Value
                end
            end
        elseif Index == "Visible" and Self:IsA("GuiObject") and Self.Name == MutationLabel then
            if OriginalMutations[Self] then OriginalMutations[Self].Visible = Value end
            if Settings.HideMutation and ShouldApplyToLabel(Self) then return Old(Self, Index, false) end
        end
    end
    return Old(Self, Index, Value)
end)

UpdateAll()

game.DescendantAdded:Connect(function(v)
    task.wait(0.1)
    if v:IsA("TextLabel") and v.Name == TargetLabel then ApplyRarity(v) end
    if v:IsA("TextLabel") and v.Name == PriceLabel then ApplyPrice(v) end
    if v.Name == MutationLabel then ApplyMutation(v) end
end)

task.spawn(function()
    while true do
        UpdatePrompts()
        task.wait(0.1)
    end
end)

]])
