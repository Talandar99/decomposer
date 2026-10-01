function salt_preservation_recipe(item_name, icon_path)
	local source_item = data.raw.item[item_name]
		or data.raw.capsule[item_name]
		or data.raw.ammo[item_name]
		or data.raw.tool[item_name]

	local target_icon = icon_path or source_item.icon

	local source_item_locale = source_item.localised_name
		or (source_item.place_as_equipment_result and {
			"equipment-name." .. source_item.name,
		})
		or {
			"item-name." .. source_item.name,
		}

	local salted_item_name = "salted-" .. item_name
	local salted_item = table.deepcopy(source_item)
	salted_item.name = salted_item_name
	salted_item.icon = target_icon
	salted_item.icons = nil
	salted_item.localised_name = { "item-name.salted-item", source_item_locale }

	if source_item.spoil_ticks and source_item.spoil_ticks > 0 then
		salted_item.spoil_ticks = math.floor(source_item.spoil_ticks * 2)
	end

	local salting_recipe_name = "salted-" .. item_name
	local salting_recipe = {
		type = "recipe",
		name = salting_recipe_name,
		categories = { "crafting" },
		subgroup = source_item.subgroup,
		order = source_item.order,
		localised_name = { "recipe-name.salting-item", source_item_locale },
		enabled = false,
		allow_productivity = false,
		allow_quality = false,
		auto_recycle = false,
		energy_required = 1,
		ingredients = {
			{ type = "item", name = item_name, amount = 1 },
			{ type = "item", name = "salt", amount = 10 },
		},
		results = {
			{ type = "item", name = salted_item_name, amount = 1 },
		},
	}

	local washing_recipe_name = "wash-" .. salted_item_name
	local washing_recipe = {
		type = "recipe",
		name = washing_recipe_name,
		categories = { "crafting-with-fluid" },
		subgroup = source_item.subgroup,
		order = source_item.order,
		localised_name = { "recipe-name.washing-item", source_item_locale },
		enabled = false,
		allow_productivity = false,
		allow_quality = false,
		auto_recycle = false,
		energy_required = 1,
		icons = {
			{
				icon = target_icon,
			},
			{
				icon = (data.raw.fluid["water"] and data.raw.fluid["water"].icon)
					or "__base__/graphics/icons/fluid/water.png",
				scale = 0.35,
				shift = { 8, 8 },
			},
		},
		ingredients = {
			{ type = "item", name = salted_item_name, amount = 1 },
			{ type = "fluid", name = "water", amount = 100 },
		},
		results = {
			{ type = "item", name = item_name, amount = 1 },
			{ type = "fluid", name = "salt-water", amount = 100 },
		},
	}

	data:extend({ salted_item, salting_recipe, washing_recipe })

	local target_tech = data.raw.technology["salt-preservation"]
	if target_tech then
		target_tech.effects = target_tech.effects or {}
		table.insert(target_tech.effects, { type = "unlock-recipe", recipe = salting_recipe_name })
		table.insert(target_tech.effects, { type = "unlock-recipe", recipe = washing_recipe_name })
	end
end
