local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local decomposerpipecoverspictures = function()
	return {
		north = {
			layers = {
				{
					filename = "__decomposer__/graphics/pipe_covers/long/pipe-N.png",
					priority = "extra-high",
					width = 71,
					height = 38,
					shift = util.by_pixel(2.25, 13.5),
					scale = 0.5,
				},
				--	{
				--		filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
				--		priority = "extra-high",
				--		width = 128,
				--		height = 128,
				--		scale = 0.5,
				--		draw_as_shadow = true,
				--	},
			},
		},
		east = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
		south = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
		west = {
			layers = {
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
				},
				{
					filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5,
					draw_as_shadow = true,
				},
			},
		},
	}
end
local function decomposerpipepictures()
	return {
		north = {
			filename = "__decomposer__/graphics/pipe_covers/calciner/pipe-N.png",
			priority = "low",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__decomposer__/graphics/pipe_covers/calciner/pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__decomposer__/graphics/pipe_covers/calciner/pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__decomposer__/graphics/pipe_covers/calciner/pipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

data:extend({
	{
		type = "recipe-category",
		name = "decomposition",
	},
})

data:extend({
	{
		type = "item",
		name = "decomposer",
		icon = "__decomposer__/graphics/decomposer/decomposer64.png",
		subgroup = "agriculture",
		order = "b[decomposer]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "decomposer",
		stack_size = 20,
		--default_import_location = "pelagos",
	},
	{
		type = "assembling-machine",
		name = "decomposer",
		icon = "__decomposer__/graphics/decomposer/decomposer64.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "decomposer" },
		fast_replaceable_group = "decomposer",
		max_health = 300,
		corpse = "biochamber-remnants",
		dying_explosion = "biochamber-explosion",

		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),

		module_slots = 4,
		allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
		effect_receiver = { base_effect = { productivity = 0.5 } },
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__decomposer__/graphics/decomposer/decomposer256.png",
						priority = "high",
						width = 256,
						height = 256,
						frame_count = 1,
						line_length = 1,
						repeat_count = 1,
						scale = 0.45,
						shift = { 0, -0.1 },
					},
					{
						filename = "__decomposer__/graphics/decomposer/decomposer-shadow.png",
						priority = "high",
						width = 384,
						height = 256,
						frame_count = 1,
						line_length = 1,
						repeat_count = 1,
						scale = 0.4,
						draw_as_shadow = true,
						shift = { 0.7, 0.1 },
					},
				},
			},
		},

		crafting_speed = 2,
		crafting_categories = { "decomposition" },
		energy_source = {
			type = "burner",
			fuel_categories = { "nutrients" },
			effectivity = 2,
			burner_usage = "nutrients",
			fuel_inventory_size = 1,
			emissions_per_minute = { pollution = -1 },
			light_flicker = require("__space-age__.prototypes.entity.biochamber-pictures").light_flicker,
		},
		energy_usage = "500kW",
		heating_energy = "100kW",
		open_sound = { filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55 },
		close_sound = { filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54 },
		working_sound = {
			sound = { filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4 },
			max_sounds_per_prototype = 3,
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = decomposerpipepictures(),
				pipe_covers = decomposerpipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = decomposerpipepictures(),
				pipe_covers = decomposerpipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
		},
		impact_category = "metal-large",
	},
})
