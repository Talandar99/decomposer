local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
	{
		type = "item",
		name = "decomposition-bacteria",
		icon = "__decomposer__/graphics/decomposition-bacteria.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-d[bacteria]-a[decomposition-bacteria]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_category = "chemical",
		fuel_value = "25kJ",
		stack_size = 20,
		--default_import_location = "pelagos",
		weight = 1 * kg,
		spoil_ticks = 5 * minute,
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
		fuel_category = "food",
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
		name = "iron-dust",
		icon = "__decomposer__/graphics/iron-dust.png",
		--subgroup = "pelagos-processes",
		subgroup = "raw-material",
		order = "b[iron]-c[iron-dust]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 50,
		--default_import_location = "pelagos",
		weight = 5 * kg,
	},
	{
		type = "item",
		name = "copper-dust",
		icon = "__decomposer__/graphics/copper-dust.png",
		--subgroup = "pelagos-processes",
		subgroup = "raw-material",
		order = "b[iron]-c[iron-dust]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 50,
		--default_import_location = "pelagos",
		weight = 5 * kg,
	},
})

-- sandfill
data:extend({
	{
		type = "item",
		name = "sand",
		icon = "__decomposer__/graphics/sand.png",
		subgroup = "raw-resource",
		order = "d[sand]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
	},
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
