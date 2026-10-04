local item_sounds = require("__base__.prototypes.item_sounds")
--oddzielić item dust name od nazwy item dust'a
function make_dust_item(item_name)
	data:extend({
		{
			type = "item",
			name = item_name,
			icon = "__decomposer__/graphics/" .. item_name .. ".png",
			subgroup = "raw-material",
			order = "za[dust]-[" .. item_name .. "]",
			inventory_move_sound = item_sounds.metal_small_inventory_move,
			pick_sound = item_sounds.metal_small_inventory_pickup,
			drop_sound = item_sounds.metal_small_inventory_move,
			stack_size = 50,
			weight = 5 * kg,
		},
	})
end
