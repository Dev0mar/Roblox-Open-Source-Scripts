--[[
Checks if there is a water cell (roblox terrain water) at the given Vector3 position
]]

function FindWaterCells(pos) 
    local region = Region3.new(pos - Vector3.new(2,2,0),pos - Vector3.new(-2,2,0),pos - Vector3.new(2,-2,0))
    region = region:ExpandToGrid(4)
    local material = pcall(function() game.Workspace.Terrain:ReadVoxels(region,4) end)
    if material then
        material = game.Workspace.Terrain:ReadVoxels(region,4)
        local size = material.Size
        for x = 1, size.X do
            for y = 1, size.Y do
                for z = 1, size.Z do
                    if (material[x][y][z]) == Enum.Material.Water then
                        return true
                    end
                end
            end
        end
    end
    return false
end
