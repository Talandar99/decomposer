local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local function decomposer_pipes()
	return {
		north = {
			filename = "__decomposer__/graphics/decomposer/decomposer_pipes_N.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		east = {
			filename = "__decomposer__/graphics/decomposer/decomposer_pipes_E.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(-32, 0),
			scale = 0.5,
		},
		south = {
			filename = "__decomposer__/graphics/decomposer/decomposer_pipes_S.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, -32),
			scale = 0.5,
		},
		west = {
			filename = "__decomposer__/graphics/decomposer/decomposer_pipes_W.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
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
		icon = "__decomposer__/graphics/decomposer/decomposer_icon.png",
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
		icon = "__decomposer__/graphics/decomposer/decomposer_icon.png",
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
						filename = "__decomposer__/graphics/decomposer/decomposer.png",
						priority = "high",
						width = 224,
						height = 224,
						frame_count = 1,
						line_length = 1,
						repeat_count = 1,
						scale = 0.5,
						shift = { 0, 0.0 },
					},
					{
						filename = "__decomposer__/graphics/decomposer/decomposer_shadow.png",
						priority = "high",
						width = 320,
						height = 320,
						frame_count = 1,
						line_length = 1,
						repeat_count = 1,
						scale = 0.5,
						draw_as_shadow = true,
						shift = { 0.0, 0.0 },
					},
				},
			},
			working_visualisations = {
				-- Jeśli masz też pod spodem pełną warstwę kolorową/bazową, możesz ją tu zostawić:
				{
					animation = {
						filename = "__decomposer__/graphics/decomposer/decomposer-animation-color.png",
						priority = "high",
						width = 159,
						height = 159,
						frame_count = 240,
						line_length = 16,
						scale = 0.5,
						shift = { 0, 0.0 },
					},
				},

				-- 1. Tint Primary (warstwa A)
				{
					apply_recipe_tint = "primary",
					animation = {
						filename = "__decomposer__/graphics/decomposer/decomposer-animation-colorless-A.png",
						priority = "high",
						width = 159,
						height = 159,
						frame_count = 240,
						line_length = 16,
						scale = 0.5,
						shift = { 0, 0.0 },
					},
				},
				-- 2. Tint Secondary (warstwa B)
				{
					apply_recipe_tint = "secondary",
					animation = {
						filename = "__decomposer__/graphics/decomposer/decomposer-animation-colorless-B.png",
						priority = "high",
						width = 159,
						height = 159,
						frame_count = 240,
						line_length = 16,
						scale = 0.5,
						shift = { 0, 0.0 },
					},
				},
			},
		},

		crafting_speed = 2,
		crafting_categories = { "decomposition", "organic" },
		energy_source = {
			type = "burner",
			fuel_categories = { "nutrients" },
			effectivity = 2,
			burner_usage = "nutrients",
			fuel_inventory_size = 1,
			emissions_per_minute = { pollution = -2 },
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
				pipe_picture = decomposer_pipes(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = decomposer_pipes(),
				pipe_covers = pipecoverspictures(),
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
