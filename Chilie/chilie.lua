local minlight = 7
local maxlight = default.LIGHT_MAX

-- chilie
minetest.register_craftitem("better_farming:chilie", {
	description = "Chilie",
	inventory_image = "better_farming_chilie.png",
	groups = {seed = 2, food_chilie = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "better_farming:chilie_1")
	end,
	on_use = minetest.item_eat(2.5)
})

-- chilie definition
local def = {
	drawtype = "plantlike",
	tiles = {"better_farming_chilie_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -8 / 8, -6 / 16, 6 / 16, 1 / 55, 6 / 16},
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("better_farming:chilie_1", table.copy(def))


-- stage 2
def.tiles = {"better_farming_chilie_2.png"}
minetest.register_node("better_farming:chilie_2", table.copy(def))


-- stage 3
def.tiles = {"better_farming_chilie_3.png"}
minetest.register_node("better_farming:chilie_3", table.copy(def))


-- stage 4
def.tiles = {"better_farming_chilie_4.png"}
minetest.register_node("better_farming:chilie_4", table.copy(def))


-- stage 4
def.tiles = {"better_farming_chilie_4.png"}
def.drop = {
	items = {
		{items = {"better_farming:chilie"}, rarity = 1},
		{items = {"better_farming:chilie 2"}, rarity = 3}
	}
}
minetest.register_node("better_farming:chilie_4", table.copy(def))


-- stage 5
def.tiles = {"better_farming_chilie_5.png"}
def.drop = {
	items = {
		{items = {"better_farming:chilie"}, rarity = 1},
		{items = {"better_farming:chilie 2"}, rarity = 3}
	}
}
minetest.register_node("better_farming:chilie_5", table.copy(def))


-- add to registered_plants
farming.registered_plants["better_farming:chilie"] = {
	crop = "better_farming:chilie",
	seed = "better_farming:chilie",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}

-- needed
minetest.override_item("better_farming:chilie", {
	description = minetest.colorize("Yellow","Chilie (Seed)"),
	on_use = minetest.item_eat(2),
	inventory_image = "better_farming_chilie.png",
	groups = {food_tomato = 1, flammable = 3}
})

minetest.register_decoration({
	name = "better_farming:chilie_5",
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 3398,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"desert"},
	y_max = 31000,
	y_min = 1,
	decoration = "better_farming:chilie_5",
	param2 = 3,
})

minetest.register_craftitem("better_farming:chilie_powder", {
	description = minetest.colorize("Red","Chilie Powder"),
	on_use = minetest.item_eat(-1),
	inventory_image = "chilie_powder.png",
})

minetest.register_craft({
	output = "better_farming:chilie_powder",
	recipe = {
		{"better_farming:chilie"},
	}
})
