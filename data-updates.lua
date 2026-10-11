require("__decomposer__.prototypes.productivity-compat")
require("__decomposer__.prototypes.utils.decomposing-into-spoilage")
require("__decomposer__.prototypes.utils.item-dust")
require("__decomposer__.prototypes.utils.forced-selection")

decomposing_into_spoilage_recipe("decomposer", "wood", 40)
decomposing_into_spoilage_recipe("organic-decomposition", "yumako-seed", 50)
decomposing_into_spoilage_recipe("organic-decomposition", "tree-seed", 50)
decomposing_into_spoilage_recipe("organic-decomposition", "jellynut", 100)
decomposing_into_spoilage_recipe("organic-decomposition", "yumako", 40)
decomposing_into_spoilage_recipe("organic-decomposition", "bioflux", 120)
decomposing_into_spoilage_recipe("organic-decomposition", "fermented-fish", 60)

if mods["pelagos"] then
	decomposing_into_spoilage_recipe("organic-decomposition", "coconut", 80)
	decomposing_into_spoilage_recipe("decomposer", "coconut-husk", 20)
	decomposing_into_spoilage_recipe("decomposer", "coconut-seed", 50)
end

if mods["Muria"] then
	make_dust_item("lead-dust")
	make_ore_decomposition_recipe("lead", "lead-dust", "exotic-lithic-decomposition")
	make_dust_recipe("lead", "lead-dust", "muria-lead-plate", "exotic-lithic-decomposition")
	make_dust_recipe("lead", "lead-dust", "molten-lead", "exotic-lithic-decomposition")
end
if mods["planetaris-hyarion"] then
	make_dust_recipe("iron-ore", "iron-dust", "planetaris-polishing-compound", "lithic-decomposition")
end
if mods["Paracelsin"] then
	make_dust_item("zinc-dust")
	make_ore_decomposition_recipe("zinc", "zinc-dust", "exotic-lithic-decomposition")
	make_dust_recipe("zinc", "zinc-dust", "zinc-plate", "exotic-lithic-decomposition")
	make_dust_recipe("zinc", "zinc-dust", "casting-galvanized-steel-plate", "exotic-lithic-decomposition")
end

if mods["skewer_planet_vesta"] then
	make_ore_decomposition_recipe("calcized-copper-plate", "copper-dust", "lithic-decomposition")
	make_ore_decomposition_recipe("calcized-iron-plate", "iron-dust", "lithic-decomposition")
end
if data.raw["item"]["gold-ore"] and data.raw["item"]["gold-plate"] and data.raw["fluid"]["molten-gold"] then
	make_dust_item("gold-dust")
	make_ore_decomposition_recipe("gold-ore", "gold-dust", "lithic-decomposition")
	make_dust_recipe("gold-ore", "gold-dust", "gold-plate", "lithic-decomposition")
	make_dust_recipe("gold-ore", "gold-dust", "molten-gold", "exotic-lithic-decomposition")
end
if mods["planetaris-tellus"] then
	make_accelerated_selection_recipe("planetaris-magnesium-bacteria")
end
if mods["crushing-industry"] then
	-- holmium
	make_dust_recipe("holmium-powder", "holmium-dust", "holmium-solution", "exotic-lithic-decomposition")

	make_dust_recipe("crushed-tungsten-ore", "tungsten-dust", "tungsten-plate", "exotic-lithic-decomposition")
	make_dust_recipe("tungsten-ore", "tungsten-dust", "tungsten-carbide", "exotic-lithic-decomposition")

	if data.raw["item"]["gold-ore"] and data.raw["item"]["gold-plate"] and data.raw["fluid"]["molten-gold"] then
		make_dust_recipe("crushed-gold-ore", "gold-dust", "molten-gold", "exotic-lithic-decomposition")
	end
end
