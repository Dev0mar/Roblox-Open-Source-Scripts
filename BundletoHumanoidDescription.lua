--[[
please note that this does not cover everything that roblox bundles may have and only imports the bodyparts/hats

Last Edit: 4/5/2019
]]

function LoadBundle(id)
	local bundleDetails = game:GetService("AssetService"):GetBundleDetailsAsync(id)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	HumanoidDescription.Name = bundleDetails.Name
	for _, bPartList in pairs(bundleDetails.Items) do
		local specialChar = (string.find(bPartList.Name, "_") ~= nil and string.find(bPartList.Name, "_")) or ((string.find(bPartList.Name, "-") ~= nil and string.find(bPartList.Name, "-")) or nil)
		if specialChar then
			local BodyPartName = string.sub(bPartList.Name, specialChar+1)
			BodyPartName = string.gsub(BodyPartName, "%s", "")
			local filter = {
				["Hat"] = "HatAccessory",
				["Hair"] = "HairAccessory",
				["Helmet"] = "HatAccessory",
			}
			if filter[BodyPartName] then
				HumanoidDescription[filter[BodyPartName]] = bPartList.Id
			else
				if HumanoidDescription[BodyPartName] ~= nil then
					HumanoidDescription[BodyPartName] = bPartList.Id
				end
			end
		end
	end
	HumanoidDescription.Parent = workspace
end
