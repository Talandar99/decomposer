local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
require("__decomposer__.prototypes.utils.item-dust")

make_dust_item("iron-dust")
make_dust_item("copper-dust")
make_dust_item("holmium-dust")
make_dust_item("tungsten-dust")
make_dust_item("lithium-dust")

data:extend({
	{
		type = "item",
		name = "lithic-bacteria",
		icon = "__decomposer__/graphics/lithic-bacteria.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-eba[lithic-bacteria]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_categories = { "chemical" },
		stack_size = 20,
		--default_import_location = "pelagos",
		weight = 1 * kg,
		spoil_ticks = 5 * minute,
		--spoil_ticks = 3 * minute,
		spoil_result = "salt",
	},
	{
		type = "item",
		name = "fermentation-bacteria",
		icon = "__decomposer__/graphics/fermentation-bacteria.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-eaa[fermentation-bacteria]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_categories = { "chemical" },
		fuel_value = "25kJ",
		stack_size = 20,
		--default_import_location = "pelagos",
		weight = 1 * kg,
		spoil_ticks = 3 * minute,
		--spoil_ticks = 3 * minute,
		spoil_result = "spoilage",
	},
})
data:extend({
	{
		type = "item",
		name = "fermented-fish",
		icon = "__decomposer__/graphics/fermented-fish.png",
		subgroup = "agriculture-products",
		order = "a[organic-processing]-b[bioflux]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_categories = { "food" },
		fuel_value = "3MJ",
		stack_size = 20,
		--default_import_location = "pelagos",
		spoil_ticks = 4 * hour,
		spoil_result = "spoilage",
		weight = 5 * kg,
		--capsule_action = item_effects.bioflux_speed_and_regen,
	},
})

data:extend({
	{
		type = "item",
		name = "sand",
		icon = "__decomposer__/graphics/sand.png",
		subgroup = "raw-material",
		order = "zb[dust]-[sand]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "salt",
		icon = "__decomposer__/graphics/salt.png",
		subgroup = "raw-material",
		order = "zb[dust]-[salt]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
	},
})

-- sandfill
data:extend({
	{
		type = "item",
		name = "decomposer-sandfill",
		icon = "__decomposer__/graphics/sandfill.png",
		subgroup = "terrain",
		order = "c[sandfill]-a[dirt]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		weight = 20 * kg,
		place_as_tile = {
			result = "decomposer-sandfill",
			condition_size = 1,
			condition = { layers = { ground_tile = true } },
			tile_condition = {},
		},
		random_tint_color = item_tints.organic_green,
	},
})
data:extend({
	{
		type = "module",
		name = "degradation-module",
		localised_description = { "item-description.degradation-module" },
		icon = "__decomposer__/graphics/degradation-module/degradation-module-1.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 1,
		--default_import_location = "pelagos",
		order = "d[degradation]-a[degradation-module]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		quality_quality_multiplier = 1,
		effect = { quality = -0.10, speed = 0.05, consumption = -0.01 },
	},
	{
		type = "module",
		name = "degradation-module-2",
		localised_description = { "item-description.degradation-module" },
		icon = "__decomposer__/graphics/degradation-module/degradation-module-2.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 2,
		--default_import_location = "pelagos",
		order = "d[degradation]-b[degradation-module-2]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		quality_quality_multiplier = 1,
		effect = { quality = -0.20, speed = 0.08, consumption = -0.02 },
	},
	{
		type = "module",
		name = "degradation-module-3",
		localised_description = { "item-description.degradation-module" },
		icon = "__decomposer__/graphics/degradation-module/degradation-module-3.png",
		subgroup = "module",
		color_hint = { text = "Q" },
		category = "quality",
		tier = 3,
		--default_import_location = "pelagos",
		order = "d[degradation]-c[degradation-module-3]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
		quality_quality_multiplier = 1,
		effect = { quality = -0.40, speed = 0.15, consumption = -0.05 },
	},
})
