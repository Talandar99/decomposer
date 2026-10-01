data:extend({
	{
		type = "fluid",
		name = "organic-sludge",
		icon = "__decomposer__/graphics/organic-sludge.png",
		icon_size = 64,
		subgroup = "fluid",
		order = "b[organic-sludge]",
		default_temperature = 25,
		base_color = { r = 0.22, g = 0.27, b = 0.11 },
		flow_color = { r = 0.35, g = 0.42, b = 0.18 },
		gas_temperature = 100,
	},
	{
		type = "fluid",
		name = "salt-water",
		icon = "__decomposer__/graphics/salt-water.png",
		subgroup = "fluid",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "2kJ",
		base_color = { 0.2, 0.54, 0.8 },
		flow_color = { 0.8, 0.8, 0.8 },
		order = "a[fluid]-a[water]-a[water]",
		auto_barrel = true,
		auto_wooden_barrel = true,
	},
})

if mods["skewer_planet_vesta"] then
	if settings.startup["override-vesta-methane-fluid-icon"].value then
		data:extend({
			{
				type = "fluid",
				subgroup = "fluid",
				name = "methane",
				default_temperature = 25,
				base_color = { r = 0.5, g = 0.8, b = 0.1 },
				flow_color = { r = 0.7, g = 1.0, b = 0.3 },
				icon = "__decomposer__/graphics/methane.png",
				icon_size = 64,
				order = "a[fluid]-b[methane]",
				pressure_to_speed_ratio = 0.4,
				flow_to_energy_ratio = 0.59,
				auto_barrel = true,
			},
		})
	end
else
	data:extend({
		{
			type = "fluid",
			subgroup = "fluid",
			name = "methane",
			default_temperature = 25,
			base_color = { r = 0.5, g = 0.8, b = 0.1 },
			flow_color = { r = 0.7, g = 1.0, b = 0.3 },
			icon = "__decomposer__/graphics/methane.png",
			icon_size = 64,
			order = "a[fluid]-b[methane]",
			pressure_to_speed_ratio = 0.4,
			flow_to_energy_ratio = 0.59,
			auto_barrel = true,
		},
	})
end
