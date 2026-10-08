function make_accelerated_selection_recipe(ingredient_item)
	local item_proto = data.raw.item[ingredient_item]
	local icon_path = (item_proto and item_proto.icons and item_proto.icons[1] and item_proto.icons[1].icon)
		or (item_proto and item_proto.icon)

	data:extend({
		{
			type = "recipe",
			name = "forced-selection-" .. ingredient_item,
			categories = { "decomposition" },
			subgroup = "forced-bacteria-selection",
			order = "b[agriculture]-n[forced-selection]-[" .. ingredient_item .. "]",
			localised_name = {
				"recipe-name.forced-selection",
				{ "item-name." .. ingredient_item },
			},
			icons = {
				--{
				--	icon = icon_path,
				--	icon_size = 64,
				--	scale = 0.25,
				--	shift = { -7, -8 },
				--	draw_background = true,
				--},
				--{
				--	icon = icon_path,
				--	icon_size = 64,
				--	scale = 0.25,
				--	shift = { 1, -7 },
				--	draw_background = true,
				--},
				{
					icon = icon_path,
					icon_size = 64,
					scale = 0.4,
					shift = { -8, -8 },
					draw_background = true,
				},
				{
					icon = "__decomposer__/graphics/lithic-bacteria.png",
					icon_size = 64,
					scale = 0.4,
					shift = { 8, 8 },
					draw_background = true,
				},
			},
			enabled = false,
			auto_recycle = false,
			energy_required = 5,
			ingredients = {
				{ type = "item", name = ingredient_item, amount = 4 },
				{ type = "item", name = "lithic-bacteria", amount = 1 },
			},
			results = {
				{
					type = "item",
					name = ingredient_item,
					amount = 1,
					shared_probability = { min = 0, max = 1 },
					independent_probability = 0.5,
					quality_change = 1,
				},
			},
			allow_productivity = true,
			main_product = ingredient_item,
		},
	})

	if data.raw.technology["forced-selection"] then
		data.raw.technology["forced-selection"].effects = data.raw.technology["forced-selection"].effects or {}
		table.insert(data.raw.technology["forced-selection"].effects, {
			type = "unlock-recipe",
			recipe = "forced-selection-" .. ingredient_item,
		})
	end
end
