data:extend({
	{
		type = "technology",
		name = "decomposer",
		icon = "__decomposer__/graphics/decomposer/decomposer256.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "decomposer" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria-cultivation" },
			{ type = "unlock-recipe", recipe = "lithic-bacteria" },
			{ type = "unlock-recipe", recipe = "lithic-bacteria-cultivation" },
			{ type = "unlock-recipe", recipe = "nutrients-spoiling" },
		},
		prerequisites = { "agricultural-science-pack", "fish-breeding", "tree-seeding" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},

		order = "[decomposer]",
	},
})

data:extend({
	{
		type = "technology",
		name = "salt-preservation",
		icon = "__decomposer__/graphics/salt-preservation.png",
		icon_size = 192,
		effects = {
			{ type = "unlock-recipe", recipe = "salt-water-decomposition" },
		},
		prerequisites = { "agricultural-science-pack", "fish-breeding", "tree-seeding", "decomposer" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},

		order = "[decomposer]",
	},
})
data:extend({
	{
		type = "technology",
		name = "organic-decomposition",
		icon = "__decomposer__/graphics/organic-decomposition.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "fermented-fish" },
			{ type = "unlock-recipe", recipe = "fermentation-bacteria-cultivation-fermented-fish" },
		},
		prerequisites = { "decomposer" },
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		order = "[decomposer]",
	},
})

data:extend({
	{
		type = "technology",
		name = "lithic-decomposition",
		icon = "__decomposer__/graphics/lithic-decomposition.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "stone-decomposition" },
			{ type = "unlock-recipe", recipe = "decomposer-sandfill" },
			--{ type = "unlock-recipe", recipe = "iron-ore-decomposition" },
			--{ type = "unlock-recipe", recipe = "iron-plate-from-dust" },
			--{ type = "unlock-recipe", recipe = "copper-ore-decomposition" },
			--{ type = "unlock-recipe", recipe = "copper-plate-from-dust" },
		},
		prerequisites = { "decomposer" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		order = "[decomposer]",
	},
})
data:extend({
	{
		type = "technology",
		name = "exotic-lithic-decomposition",
		icon = "__decomposer__/graphics/exotic-lithic-decomposition.png",
		icon_size = 128,
		effects = {
			--{ type = "unlock-recipe", recipe = "tungsten-ore-decomposition" },
			--{ type = "unlock-recipe", recipe = "tungsten-carbide-from-dust" },
			--{ type = "unlock-recipe", recipe = "tungsten-plate-from-dust" },
			--{ type = "unlock-recipe", recipe = "holmium-ore-decomposition" },
			--{ type = "unlock-recipe", recipe = "holmium-solution-from-dust" },
		},
		prerequisites = { "lithic-decomposition", "electromagnetic-science-pack", "metallurgic-science-pack" },
		unit = {
			count = 2500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
				{ "electromagnetic-science-pack", 1 },
				{ "metallurgic-science-pack", 1 },
			},
			time = 60,
		},
		order = "[decomposer]",
	},
})
data:extend({
	{
		type = "technology",
		name = "accelerated-selection",
		icon = "__decomposer__/graphics/accelerated-selection.png",
		icon_size = 200,
		effects = {},
		prerequisites = { "exotic-lithic-decomposition", "organic-decomposition" },
		unit = {
			count = 2500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		order = "[decomposer]",
	},
})
data:extend({
	{
		type = "technology",
		name = "organic-sludge-processing",
		icon = "__decomposer__/graphics/organic-sludge-tech.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "organic-sludge-from-spoilage" },
			{ type = "unlock-recipe", recipe = "spoilage-from-organic-sludge" },
		},
		prerequisites = { "organic-decomposition" },
		unit = {
			count = 300,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		order = "[decomposer]-b[organic-sludge]",
	},
})
data:extend({
	{
		type = "technology",
		name = "lithic-melting-from-dust",
		icon = "__decomposer__/graphics/dust-melting-tech.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "molten-iron-from-dust-salt" },
			{ type = "unlock-recipe", recipe = "molten-copper-from-dust-salt" },
			{ type = "unlock-recipe", recipe = "molten-iron-from-dust-calcite" },
			{ type = "unlock-recipe", recipe = "molten-copper-from-dust-calcite" },
		},
		prerequisites = { "metallurgic-science-pack", "lithic-decomposition" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "metallurgic-science-pack", 1 },
			},
			time = 60,
		},
		order = "g[vulcanus]-b[lithic-melting]",
	},
})

data:extend({
	{
		type = "technology",
		name = "improvised-landfill",
		icon = "__decomposer__/graphics/improvised-landfill-tech.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "improvised-landfill" },
		},
		order = "[decomposer]",
		prerequisites = { "organic-decomposition" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "asteroid-bioprocessing",
		icon = "__decomposer__/graphics/asteroids-bioprocessing.png",
		icon_size = 120,
		effects = {
			{ type = "unlock-recipe", recipe = "oxide-asteroid-melting" },
			{ type = "unlock-recipe", recipe = "metallic-asteroid-methane-crushing" },
			{ type = "unlock-recipe", recipe = "carbonic-asteroid-gasification" },
		},
		prerequisites = { "lithic-decomposition" },
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
	},
})

data:extend({
	{
		type = "technology",
		name = "landfill-productivity",
		icons = util.technology_icon_constant_recipe_productivity("__decomposer__/graphics/landfill-productivity.png"),
		icon_size = 256,
		effects = {
			--{
			--	type = "change-recipe-productivity",
			--	recipe = "wooden-platform",
			--	change = 0.1,
			--},
			{
				type = "change-recipe-productivity",
				recipe = "decomposer-sandfill",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "landfill",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "improvised-landfill",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "ice-platform",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "space-platform-foundation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "foundation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "artificial-yumako-soil",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "overgrowth-yumako-soil",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "artificial-jellynut-soil",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "overgrowth-jellynut-soil",
				change = 0.1,
			},
		},
		prerequisites = { "improvised-landfill", "agricultural-science-pack" },
		unit = {
			count_formula = "1.5^L*2000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
				--{ "pelagos-science-pack", 1 },
			},
			time = 60,
		},
		max_level = "infinite",
		upgrade = true,
	},
})
data:extend({
	{
		type = "technology",
		name = "cultivation-productivity",
		icons = util.technology_icon_constant_recipe_productivity(
			"__decomposer__/graphics/cultivation-productivity.png"
		),
		icon_size = 256,
		effects = {
			{
				type = "change-recipe-productivity",
				recipe = "fermentation-bacteria-cultivation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "fermentation-bacteria-cultivation-fermented-fish",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "lithic-bacteria-cultivation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "iron-bacteria-cultivation",
				change = 0.1,
			},
			{
				type = "change-recipe-productivity",
				recipe = "copper-bacteria-cultivation",
				change = 0.1,
			},
			--{
			--	type = "change-recipe-productivity",
			--	recipe = "fish-breeding",
			--	change = 0.05,
			--},
			{
				type = "change-recipe-productivity",
				recipe = "pentapod-egg",
				change = 0.1,
			},
		},
		prerequisites = { "organic-decomposition", "lithic-decomposition" },
		unit = {
			--count_formula = "1.5^L*1000",
			count_formula = "1.5^L*1000",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				--{ "pelagos-science-pack", 1 },
				{ "agricultural-science-pack", 1 },
			},
			time = 60,
		},
		max_level = "infinite",
		upgrade = true,
	},
})
