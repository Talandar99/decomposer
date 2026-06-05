data:extend({
	{
		type = "item-subgroup",
		name = "decomposition-products",
		group = "intermediate-products",
		order = "mb",
	},
})
-- bacteria
data:extend({
	{
		type = "recipe",
		name = "decomposition-bacteria",
		category = "decomposition",
		additional_categories = { "organic" },
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-a[decomposition-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {
			{ type = "item", name = "raw-fish", amount = 20 },
			{ type = "item", name = "spoilage", amount = 30 },
			{ type = "fluid", name = "water", amount = 100 },
		},
		results = {
			{ type = "item", name = "decomposition-bacteria", amount = 1, probability = 0.1 },
			{ type = "item", name = "spoilage", amount = 5 },
		},
		main_product = "decomposition-bacteria",
		crafting_machine_tint = {
			primary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			secondary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
			tertiary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			quaternary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "decomposition-bacteria-cultivation",
		icons = {
			{ icon = "__decomposer__/graphics/decomposition-bacteria-cultivation.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/fish.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		category = "decomposition",
		additional_categories = { "organic" },
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-b[decomposition-bacteria-cultivation]",
		enabled = false,
		allow_productivity = true,
		reset_freshness_on_craft = true,
		energy_required = 4,
		ingredients = {
			{ type = "item", name = "decomposition-bacteria", amount = 1 },
			{ type = "item", name = "raw-fish", amount = 1 },
		},
		results = {
			{ type = "item", name = "decomposition-bacteria", amount = 12 },
		},
		crafting_machine_tint = {
			primary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			secondary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
			tertiary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			quaternary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
		},
		show_amount_in_title = false,
	},
	{
		type = "recipe",
		name = "decomposition-bacteria-cultivation-fermented-fish",
		icons = {
			{ icon = "__decomposer__/graphics/decomposition-bacteria-cultivation.png", icon_size = 64 },
			{ icon = "__decomposer__/graphics/fermented-fish.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		category = "decomposition",
		surface_conditions = {},
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-b[decomposition-bacteria-cultivation]",
		enabled = false,
		allow_productivity = true,
		reset_freshness_on_craft = true,
		energy_required = 4,
		ingredients = {
			{ type = "item", name = "decomposition-bacteria", amount = 1 },
			{ type = "item", name = "fermented-fish", amount = 1 },
		},
		results = {
			{ type = "item", name = "decomposition-bacteria", amount = 12 },
		},
		crafting_machine_tint = {
			primary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			secondary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
			tertiary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			quaternary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
		},
		show_amount_in_title = false,
	},
	{
		type = "recipe",
		name = "fermented-fish",
		category = "decomposition",
		subgroup = "decomposition-products",
		order = "a[seeds]-c[wood-spoiling]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients = {
			{ type = "item", name = "raw-fish", amount = 10 },
			{ type = "item", name = "decomposition-bacteria", amount = 5 },
		},
		results = {
			{ type = "item", name = "fermented-fish", amount = 10 },
		},
		crafting_machine_tint = {
			primary = { r = 0.6, g = 0.77, b = 0.82, a = 1.000 },
			secondary = { r = 0.78, g = 0.82, b = 0.35, a = 1.000 },
			tertiary = { r = 0.6, g = 0.77, b = 0.82, a = 1.000 },
			quaternary = { r = 0.78, g = 0.82, b = 0.35, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "nutrients-spoiling",
		icons = {
			{ icon = "__decomposer__/graphics/nutrients-spoiling.png", icon_size = 64 },
		},
		category = "decomposition",
		subgroup = "decomposition-products",
		order = "c[nutrients]-a[zspoilage]",
		enabled = false,
		allow_productivity = false,
		energy_required = 0.1,
		ingredients = {
			{ type = "item", name = "nutrients", amount = 10 },
		},
		results = { { type = "item", name = "spoilage", amount = 20 } },
		crafting_machine_tint = {
			primary = { r = 0.0, g = 0.1, b = 0, a = 1.000 },
			secondary = { r = 0.0, g = 0.1, b = 0.0, a = 1.000 },
		},
	},
	--	{
	--		type = "recipe",
	--		name = "nutrients-from-spoilage-methane",
	--		icons = {
	--			{ icon = "__pelagos__/graphics/methane.png", icon_size = 64 },
	--			{ icon = "__space-age__/graphics/icons/nutrients-from-spoilage.png", icon_size = 64 },
	--		},
	--		category = "decomposition",
	--		subgroup = "decomposition-products",
	--		order = "c[nutrients]-c[nutrients-from-spoilage-methane]",
	--		enabled = false,
	--		allow_productivity = true,
	--		energy_required = 2,
	--		ingredients = {
	--			{ type = "item", name = "spoilage", amount = 10 },
	--			{ type = "fluid", name = "methane", amount = 5 },
	--		},
	--		results = { { type = "item", name = "nutrients", amount = 2, percent_spoiled = 0.6 } },
	--		crafting_machine_tint = {
	--			primary = { r = 0.8, g = 0.9, b = 1, a = 1.000 },
	--			secondary = { r = 0.5, g = 0.5, b = 0.8, a = 1.000 },
	--		},
	--	},
	--	{
	--		type = "recipe",
	--		name = "pelagos-science-pack",
	--		category = "decomposition",
	--		subgroup = "science-pack",
	--		surface_conditions = {
	--			{
	--				property = "pressure",
	--				min = 1809,
	--				max = 1809,
	--			},
	--		},
	--		enabled = false,
	--		ingredients = {
	--			{ type = "item", name = "coconut-sealant", amount = 2 },
	--			{ type = "item", name = "engine-unit", amount = 1 },
	--			{ type = "item", name = "decomposition-bacteria", amount = 3 },
	--			{ type = "item", name = "activated-carbon", amount = 1 },
	--			{ type = "item", name = "titanium-dust", amount = 1 },
	--		},
	--		energy_required = 8,
	--		results = { { type = "item", name = "pelagos-science-pack", amount = 2 } },
	--		allow_productivity = true,
	--		crafting_machine_tint = {
	--			primary = { r = 0.39, g = 0.48, b = 0.26, a = 1.000 },
	--			secondary = { r = 0.49, g = 0.58, b = 0.36, a = 1.000 },
	--			tertiary = { r = 0.39, g = 0.48, b = 0.26, a = 1.000 },
	--			quaternary = { r = 0.49, g = 0.58, b = 0.36, a = 1.000 },
	--		},
	--	},
	{
		type = "recipe",
		name = "stone-erosion",
		category = "decomposition",
		icons = {
			{ icon = "__base__/graphics/icons/stone.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/fluid/water.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		auto_recycle = false,
		energy_required = 5.0,
		ingredients = {
			{ type = "fluid", name = "water", amount = 10 },
			{ type = "item", name = "stone", amount = 5 },
		},
		main_product = "sand",
		results = {
			{ type = "item", name = "sand", amount = 10 },
			{ type = "fluid", name = "water", amount = 2, ignored_by_stats = 2, ignored_by_productivity = 2 },
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "decomposer",
		additional_categories = { "organic-or-assembling" },
		category = "decomposition",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-a[decomposition-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {
			{ type = "item", name = "raw-fish", amount = 5 },
			{ type = "item", name = "spoilage", amount = 50 },
			{ type = "item", name = "wood", amount = 50 },
			{ type = "item", name = "iron-plate", amount = 20 },
		},
		results = {
			{ type = "item", name = "decomposer", amount = 1 },
		},
		crafting_machine_tint = {
			primary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			secondary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
			tertiary = { r = 0.57, g = 0.72, b = 0.41, a = 1.000 },
			quaternary = { r = 0.67, g = 0.82, b = 0.51, a = 1.000 },
		},
	},
})
-- decomposing stuff into dust
data:extend({
	{
		type = "recipe",
		name = "stone-erosion",
		category = "decomposition",
		icons = {
			{ icon = "__decomposer__/graphics/decomposition-bacteria.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/stone.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		auto_recycle = false,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "stone", amount = 5 },
			{ type = "item", name = "decomposition-bacteria", amount = 1 },
			{ type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{ type = "item", name = "sand", amount = 10 },
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "iron-ore-decomposition",
		category = "decomposition",
		icons = {
			{ icon = "__decomposer__/graphics/decomposition-bacteria.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/iron-ore.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		auto_recycle = false,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "iron-ore", amount = 5 },
			{ type = "item", name = "decomposition-bacteria", amount = 1 },
			{ type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{ type = "item", name = "iron-dust", amount = 10 },
		},
		allow_productivity = true,
	},
	{
		type = "recipe",
		name = "copper-ore-decomposition",
		category = "decomposition",
		icons = {
			{ icon = "__decomposer__/graphics/decomposition-bacteria.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/copper-ore.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		auto_recycle = false,
		energy_required = 5,
		ingredients = {
			{ type = "item", name = "copper-ore", amount = 5 },
			{ type = "item", name = "decomposition-bacteria", amount = 1 },
			{ type = "fluid", name = "water", amount = 10 },
		},
		results = {
			{ type = "item", name = "copper-dust", amount = 10 },
		},
		allow_productivity = true,
	},
})
data:extend({
	{
		type = "recipe",
		name = "iron-plate-from-dust",
		icons = {
			{ icon = "__decomposer__/graphics/iron-dust.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/iron-plate.png", icon_size = 64, scale = 0.5, shift = { 8, 8 } },
		},
		auto_recycle = false,
		category = "smelting",
		enabled = false,
		energy_required = 4,
		ingredients = { { type = "item", name = "iron-dust", amount = 1 } },
		results = { { type = "item", name = "iron-plate", amount = 1 } },
		allow_productivity = true,
		crafting_machine_tint = {
			primary = { r = 0.5, g = 0.5, b = 0.5, a = 1.000 },
			secondary = { r = 0.7, g = 0.7, b = 0.7, a = 1.000 },
		},
	},
	{
		type = "recipe",
		name = "copper-plate-from-dust",
		icons = {
			{ icon = "__decomposer__/graphics/copper-dust.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/copper-plate.png", icon_size = 64, scale = 0.5, shift = { 8, 8 } },
		},
		auto_recycle = false,
		category = "smelting",
		enabled = false,
		energy_required = 4,
		ingredients = { { type = "item", name = "copper-dust", amount = 1 } },
		results = { { type = "item", name = "copper-plate", amount = 1 } },
		allow_productivity = true,
		crafting_machine_tint = {
			primary = { r = 0.8, g = 0.4, b = 0.2, a = 1.000 },
			secondary = { r = 0.9, g = 0.5, b = 0.3, a = 1.000 },
		},
	},
})
data:extend({
	{
		type = "recipe",
		name = "organic-sludge-from-spoilage",
		category = "decomposition",
		icons = {
			{ icon = "__decomposer__/graphics/organic-sludge.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/spoilage.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		enabled = false,
		energy_required = 2,
		ingredients = {
			{ type = "fluid", name = "water", amount = 25 },
			{ type = "item", name = "spoilage", amount = 50 },
		},
		results = {
			{ type = "fluid", name = "organic-sludge", amount = 50 },
		},
		main_product = "organic-sludge",

		allow_productivity = false,
		maximum_productivity = 0,
		allow_quality = false,
		auto_recycle = false,
	},

	{
		type = "recipe",
		name = "spoilage-from-organic-sludge",
		category = "decomposition",
		subgroup = "decomposition-products",
		additional_categories = { "organic" },
		icons = {
			{ icon = "__space-age__/graphics/icons/spoilage.png", icon_size = 64 },
			{
				icon = "__decomposer__/graphics/organic-sludge.png",
				icon_size = 64,
				scale = 0.3,
				shift = { 8, 8 },
			},
		},
		enabled = false,
		energy_required = 2,
		ingredients = {
			{ type = "fluid", name = "organic-sludge", amount = 50 },
		},
		results = {
			{ type = "item", name = "spoilage", amount = 50 },
		},
		main_product = "spoilage",
		allow_productivity = false,
		maximum_productivity = 0,
		allow_quality = false,
		auto_recycle = false,
	},
})
data:extend({
	{
		type = "recipe",
		name = "molten-iron-from-dust",
		icons = {
			{ icon = "__decomposer__/graphics/iron-dust.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/calcite.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "a[melting]-b[molten-iron-dust]",
		auto_recycle = false,
		show_amount_in_title = false,
		always_show_products = true,
		enabled = false,
		ingredients = {
			{ type = "item", name = "iron-dust", amount = 50 },
			{ type = "item", name = "calcite", amount = 1 },
		},
		energy_required = 32,
		results = {
			{ type = "fluid", name = "molten-iron", amount = 500 },
		},
		allow_productivity = true,
		hide_from_signal_gui = false,
		main_product = "molten-iron",
	},
	{
		type = "recipe",
		name = "molten-copper-from-dust",
		icons = {
			{ icon = "__decomposer__/graphics/copper-dust.png", icon_size = 64 },
			{ icon = "__space-age__/graphics/icons/calcite.png", icon_size = 64, scale = 0.3, shift = { 8, 8 } },
		},
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "a[melting]-c[molten-copper-dust]",
		auto_recycle = false,
		show_amount_in_title = false,
		always_show_products = true,
		enabled = false,
		ingredients = {
			{ type = "item", name = "copper-dust", amount = 50 },
			{ type = "item", name = "calcite", amount = 1 },
		},
		energy_required = 32,
		results = {
			{ type = "fluid", name = "molten-copper", amount = 500 },
		},
		allow_productivity = true,
		hide_from_signal_gui = false,
		main_product = "molten-copper",
	},
})
data:extend({
	{
		type = "recipe",
		name = "decomposer-sandfill",
		energy_required = 0.5,
		enabled = false,
		auto_recycle = false,
		category = "organic",
		ingredients = {
			{ type = "item", name = "sand", amount = 45 },
		},
		results = { { type = "item", name = "decomposer-sandfill", amount = 1 } },
	},
})
