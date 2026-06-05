local function make_decomposition_recipe(technology_name, item_name, spoilage_amount)
	local dark_green_tint = { r = 0.55, g = 0.7, b = 0.55, a = 1.0 }

	local source_item = data.raw.item[item_name]
		or data.raw.capsule[item_name]
		or data.raw.ammo[item_name]
		or data.raw.tool[item_name]

	if not source_item or not source_item.icon then
		log("Error: Item/Capsule " .. item_name .. " not found or lacks a single icon property.")
		return
	end

	local recipe_name = item_name .. "-spoiling"

	data:extend({
		{
			type = "recipe",
			name = recipe_name,

			localised_name = {
				"recipe-name.decomposition-from",
				source_item.localised_name or (source_item.place_as_equipment_result and {
					"equipment-name." .. source_item.name,
				}) or {
					"item-name." .. source_item.name,
				},
			},

			icons = {
				{
					icon = source_item.icon,
					icon_size = source_item.icon_size or 64,
					tint = dark_green_tint,
				},
			},
			category = "decomposition",
			subgroup = "decomposition-products",
			order = "a[seeds]-c[" .. recipe_name .. "]",
			auto_recycle = false,
			enabled = false,
			allow_productivity = true,
			energy_required = 6,
			ingredients = {
				{ type = "item", name = item_name, amount = 5 },
			},
			results = {
				{ type = "item", name = "spoilage", amount = spoilage_amount },
			},
			crafting_machine_tint = {
				primary = { r = 0.27, g = 0.27, b = 0.08, a = 1.000 },
				secondary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
				tertiary = { r = 0.27, g = 0.27, b = 0.08, a = 1.000 },
				quaternary = { r = 0.37, g = 0.37, b = 0.18, a = 1.000 },
			},
		},
	})

	if technology_name then
		local target_tech = data.raw.technology[technology_name]
		if target_tech then
			target_tech.effects = target_tech.effects or {}
			table.insert(target_tech.effects, {
				type = "unlock-recipe",
				recipe = recipe_name,
			})
		end
	end
end

make_decomposition_recipe("decomposer", "wood", 40)
make_decomposition_recipe("organic-decomposition", "yumako-seed", 50)
make_decomposition_recipe("organic-decomposition", "tree-seed", 50)
make_decomposition_recipe("organic-decomposition", "jellynut", 100)
make_decomposition_recipe("organic-decomposition", "yumako", 40)
make_decomposition_recipe("organic-decomposition", "bioflux", 120)
make_decomposition_recipe("organic-decomposition", "fermented-fish", 60)

--make_decomposition_recipe("organic-decomposition", "coconut", 80)
--make_decomposition_recipe("decomposer", "coconut-husk", 20)
--make_decomposition_recipe("decomposer", "coconut-seed", 50)
