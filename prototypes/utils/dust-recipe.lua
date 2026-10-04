function make_dust_recipe(item_name, dust_name, recipe_name, tech_name)
	local new_recipe = table.deepcopy(data.raw.recipe[recipe_name])

	new_recipe.name = recipe_name .. "-from-dust"
	new_recipe.enabled = false

	local base_recipe = data.raw.recipe[recipe_name]
	local recipe_local_name = base_recipe.localised_name
		or (data.raw.item[recipe_name] and { "item-name." .. recipe_name })
		or (data.raw.fluid[recipe_name] and { "fluid-name." .. recipe_name })
		or { "recipe-name." .. recipe_name }

	new_recipe.localised_name = {
		"recipe-name.dust-recipe-format",
		recipe_local_name,
		{ "item-name." .. dust_name },
	}

	if new_recipe.ingredients then
		for _, ingredient in ipairs(new_recipe.ingredients) do
			local ing_name = ingredient.name or ingredient[1]
			if ing_name == item_name then
				if ingredient.name then
					ingredient.name = dust_name
				else
					ingredient[1] = dust_name
				end
			end
		end
	end

	local base_item = data.raw.item[recipe_name] or data.raw.fluid[recipe_name]
	local overlay_icon = (new_recipe.icons and new_recipe.icons[1] and new_recipe.icons[1].icon)
		or new_recipe.icon
		or (base_item and base_item.icons and base_item.icons[1] and base_item.icons[1].icon)
		or (base_item and base_item.icon)

	new_recipe.icons = {
		{ icon = "__decomposer__/graphics/" .. dust_name .. ".png", icon_size = 64 },
		{
			icon = overlay_icon,
			icon_size = 64,
			scale = 0.3,
			shift = { 8, 8 },
		},
	}
	new_recipe.icon = new_recipe.icons[1].icon
	new_recipe.icon_size = 64

	data:extend({ new_recipe })

	if tech_name then
		local tech = data.raw.technology[tech_name]
		if tech then
			tech.effects = tech.effects or {}
			table.insert(tech.effects, { type = "unlock-recipe", recipe = new_recipe.name })
		end
	end
end
