function make_ore_degradation_recipe(ore_item, tech_name)
	local qualities = { "uncommon", "rare", "epic", "legendary" }

	local item_proto = data.raw.item[ore_item]
	local icon_path = (item_proto and item_proto.icons and item_proto.icons[1] and item_proto.icons[1].icon)
		or (item_proto and item_proto.icon)

	for i, q in ipairs(qualities) do
		local recipe_name = ore_item .. "-" .. q .. "-quality-downgrade"

		data:extend({
			{
				type = "recipe",
				name = recipe_name,
				categories = { "decomposition" },
				subgroup = "ore-degradation",
				order = "b[agriculture]-zab[ore-bio-decomposition]-[" .. ore_item .. "]-[" .. i .. "-" .. q .. "]",
				localised_name = {
					"recipe-name.ore-quality-degradation",
					{ "item-name." .. ore_item },
					{ "quality-name." .. q },
				},
				icons = {
					--{ icon = "__decomposer__/graphics/lithic-bacteria.png", icon_size = 64 },
					{ icon = icon_path, icon_size = 64 },
					--{
					--	icon = "__decomposer__/graphics/lithic-bacteria.png",
					--	icon_size = 64,
					--	scale = 0.2,
					--	shift = { -8, 8 },
					--},
					{
						icon = "__base__/graphics/icons/arrows/down-arrow.png",
						icon_size = 64,
						scale = 0.3,
						shift = { 8, 8 },
					},
					{
						icon = "__quality__/graphics/icons/quality-" .. q .. ".png",
						icon_size = 64,
						scale = 0.25,
						shift = { 8, -8 },
					},
				},
				enabled = false,
				auto_recycle = false,
				energy_required = 5,
				ingredients = {
					{
						type = "item",
						name = ore_item,
						amount = 1,
						quality_min = q,
					},
					{
						type = "item",
						name = "lithic-bacteria",
						amount = 1,
						quality_max = "normal",
					},
				},
				results = {
					{
						type = "item",
						name = ore_item,
						amount = 2,
						quality_change = -1,
					},
				},
				allow_productivity = false,
			},
		})

		if tech_name then
			local tech = data.raw.technology[tech_name]
			if tech then
				tech.effects = tech.effects or {}
				table.insert(tech.effects, { type = "unlock-recipe", recipe = recipe_name })
			end
		end
	end
end
