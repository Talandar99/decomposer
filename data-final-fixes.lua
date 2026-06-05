-- sandfill
local sandfill = table.deepcopy(data.raw.tile["sand-1"])
sandfill.name = "decomposer-sandfill"
sandfill.minable = { mining_time = 0.2, result = "decomposer-sandfill" }
sandfill.localised_name = { "tile-name.decomposer-sandfill" }
sandfill.absorptions_per_second = nil
sandfill.tile_order = "a[artificial]-d[utility]-a[sandfill]"
data:extend({ sandfill })
data.raw["item"]["decomposer-sandfill"].place_as_tile.tile_condition =
	table.deepcopy(data.raw["item"]["landfill"].place_as_tile.tile_condition)
-- sandfill
