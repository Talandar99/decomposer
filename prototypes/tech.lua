data:extend({
	{
		type = "technology",
		name = "decomposer",
		icon = "__decomposer__/graphics/decomposer/decomposer256.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "decomposer" },
			{ type = "unlock-recipe", recipe = "decomposition-bacteria" },
			{ type = "unlock-recipe", recipe = "decomposition-bacteria-cultivation" },
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
		name = "organic-decomposition",
		icon = "__decomposer__/graphics/organic-decomposition.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "decomposition-bacteria-cultivation-fermented-fish" },
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
			{ type = "unlock-recipe", recipe = "stone-erosion" },
			{ type = "unlock-recipe", recipe = "decomposer-sandfill" },
			{ type = "unlock-recipe", recipe = "iron-ore-decomposition" },
			{ type = "unlock-recipe", recipe = "iron-plate-from-dust" },
			{ type = "unlock-recipe", recipe = "copper-ore-decomposition" },
			{ type = "unlock-recipe", recipe = "copper-plate-from-dust" },
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
			{ type = "unlock-recipe", recipe = "molten-iron-from-dust" },
			{ type = "unlock-recipe", recipe = "molten-copper-from-dust" },
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
