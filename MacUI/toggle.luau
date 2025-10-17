local function createGui(parent)
    local screenGui = Instance.new("ScreenGui",parent)
    screenGui["Name"] = "Ajomok UI"
    screenGui["ResetOnSpawn"] = false
    screenGui["DisplayOrder"] = 0
    screenGui["IgnoreGuiInset"] = true

	--Frame1--
    local UserInputService = game:GetService("UserInputService")

    -- Create Frame
    local Frame1 = Instance.new("Frame", screenGui)
    Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame1.Name = "main"
    Frame1.Position = UDim2.new(0.5, 0, 0.1984694, 0)
    Frame1.Size = UDim2.new(0, 55, 0, 55)
    Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame1.BorderSizePixel = 0
    Frame1.Active = true
    Frame1.Draggable = false
    
    -- ✅ Dragging System (Fixed)
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        Frame1.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
    
    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
            input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Frame1.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end
    
    Frame1.InputBegan:Connect(startDrag)
    
    Frame1.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)    
    

	----Frame1----
	--UIGradient2--
	local UIGradient2 = Instance.new("UIGradient",Frame1)
	UIGradient2["Rotation"] = 50
	UIGradient2["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.new(0.643137,0.615686,1)),
		ColorSequenceKeypoint.new(0.515913,Color3.new(0.117647,0.105882,0.14902)),
		ColorSequenceKeypoint.new(1,Color3.new(0.643137,0.615686,1))
	}
	----UIGradient2----
	--UICorner3--
	local UICorner3 = Instance.new("UICorner",Frame1)
	UICorner3["CornerRadius"] = UDim.new(0, 15)
	----UICorner3----
	--UIStroke4--
	local UIStroke4 = Instance.new("UIStroke",Frame1)
	UIStroke4["Color"] = Color3.new(1, 1, 1)
	UIStroke4["Thickness"] = 2
	----UIStroke4----
	--UIGradient5--
	local UIGradient5 = Instance.new("UIGradient",UIStroke4)
	UIGradient5["Rotation"] = 90
	UIGradient5["Color"] = ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.new(0.286275,0.415686,1)),
		ColorSequenceKeypoint.new(1,Color3.new(0.137255,0.137255,0.137255))
	}
	----UIGradient5----
	--ImageLabel6--
	local ImageLabel6 = Instance.new("ImageLabel",Frame1)
	ImageLabel6["Size"] = UDim2.new(0, 35, 0, 35)
	ImageLabel6["Image"] = "rbxassetid://104695336294005"
	ImageLabel6["BackgroundTransparency"] = 1
	ImageLabel6["Position"] = UDim2.new(0.181818187, 0, 0.181818187, 0)
	ImageLabel6["BorderColor3"] = Color3.new(0, 0, 0)
	ImageLabel6["Name"] = "imege"
	ImageLabel6["BorderSizePixel"] = 0
	ImageLabel6["BackgroundColor3"] = Color3.new(1, 1, 1)
	----ImageLabel6----
	--TextButton7--
	local TextButton7 = Instance.new("TextButton", Frame1)
    TextButton7.TextColor3 = Color3.new(0, 0, 0)
    TextButton7.BorderColor3 = Color3.new(0, 0, 0)
    TextButton7.TextTransparency = 1
    TextButton7.Font = Enum.Font.SourceSans
    TextButton7.Name = "togl"
    TextButton7.TextSize = 14
    TextButton7.Size = UDim2.new(0, 55, 0, 50)
    TextButton7.BackgroundTransparency = 1
    TextButton7.BorderSizePixel = 0
    TextButton7.BackgroundColor3 = Color3.new(1, 1, 1)
    TextButton7.ZIndex = 9999999
    
    -- Enable dragging from button too
    TextButton7.InputBegan:Connect(startDrag)
    
    return screenGui
end
local interface = {}
function interface:is_already_executed()
    if game.CoreGui:FindFirstChild("Ajomok UI") then
        game.CoreGui:FindFirstChild("Ajomok UI"):Destroy()
    end
end

function interface:toggle_position()
    local edan = game.CoreGui:FindFirstChild("Ajomok UI")
    return edan
end

function interface:initial_interface(callback)
    local ui = createGui(game.CoreGui)
    if callback then
        ui.main.togl.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
    end
end

return interface    
