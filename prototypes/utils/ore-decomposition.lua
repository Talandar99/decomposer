function make_ore_decomposition_recipe(ingredient_item, result_item, tech_name)
	local recipe_name = ingredient_item .. "-decomposition"

	local item_proto = data.raw.item[ingredient_item]
	local icon_path = (item_proto and item_proto.icons and item_proto.icons[1] and item_proto.icons[1].icon)
		or (item_proto and item_proto.icon)

	data:extend({
		{
			type = "recipe",
			name = recipe_name,
			categories = { "decomposition" },
			subgroup = "ore-bio-decomposition",
			order = "b[agriculture]-o[ore-bio-decomposition]-[" .. ingredient_item .. "]",
			localised_name = {
				"recipe-name.ore-bio-decomposition",
				{ "item-name." .. ingredient_item },
			},
			icons = {
				{ icon = "__decomposer__/graphics/lithic-bacteria.png", icon_size = 64 },
				{ icon = icon_path, icon_size = 64, scale = 0.3, shift = { 8, 8 } },
			},
			enabled = false,
			auto_recycle = false,
			energy_required = 5,
			ingredients = {
				{ type = "item", name = ingredient_item, amount = 5 },
				{ type = "item", name = "lithic-bacteria", amount = 1 },
				{ type = "fluid", name = "water", amount = 10 },
			},
			results = {
				{ type = "item", name = result_item, amount = 5 },
			},
			allow_productivity = true,
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
