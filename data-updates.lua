require("prototypes.recipe-generation.decomposing-into-spoilage")

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
