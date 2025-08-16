local util = require("util")
require("__core__/lualib/circuit-connector-generated-definitions")

do
  local base_ent = data.raw.pump and data.raw.pump["pump"]
  if base_ent then
    local e = util.table.deepcopy(base_ent)
    e.name = "flippable-pump"
    e.placeable_by = {
      item = "flippable-pump",
      count = 1
    }
    e.next_upgrade = nil
    data:extend { e }
  end

  local base_item = (data.raw.item and data.raw.item["pump"])
      or (data.raw["item-with-entity-data"] and data.raw["item-with-entity-data"]["pump"])
  if base_item then
    local item = {
      type = "item",
      name = "flippable-pump",
      order = (base_item.order or "") .. "-[flippable]",
      icon = base_item.icon,
      icons = base_item.icons,
      icon_size = base_item.icon_size or 64,
      icon_mipmaps = base_item.icon_mipmaps or 4,
      place_result = "flippable-pump",
      stack_size = base_item.stack_size or 50
    }
    if mods["space-age"] then
      item.auto_recycle = true
    end
    data:extend { item }
  end

  local base_recipe = data.raw.recipe and data.raw.recipe["pump"]
  if base_recipe then
    local recipe = {
      type = "recipe",
      name = "flippable-pump",
      enabled = false,
      ingredients = {
        {
          type = "item",
          name = "pump",
          amount = 1
        },
        {
          type = "item",
          name = "electronic-circuit",
          amount = 10
        },
        {
          type = "item",
          name = "engine-unit",
          amount = 2
        }
      },
      results = {
        {
          type = "item",
          name = "flippable-pump",
          amount = 1
        }
      },
      main_product = "flippable-pump"
    }
    if mods["space-age"] then
      recipe.auto_recycle = true
      recipe.category = base_recipe.category or "crafting"
    end
    data:extend { recipe }
  end

  local base_tech = data.raw.technology and data.raw.technology["fluid-handling"]
  if base_tech then
    local tech = util.table.deepcopy(base_tech)
    tech.name = "flippable-pump-tech"
    tech.effects = {
      {
        type = "unlock-recipe",
        recipe = "flippable-pump"
      }
    }
    tech.prerequisites = {
      "fluid-handling",
      "circuit-network"
    }
    data:extend { tech }
  end
end

do
  local base_ent = data.raw.pump and data.raw.pump["bob-pump-2"]
  if base_ent then
    local e = util.table.deepcopy(base_ent)
    e.name = "flippable-bob-pump-2"
    e.placeable_by = {
      item = "flippable-bob-pump-2",
      count = 1
    }
    e.next_upgrade = nil
    data:extend { e }
  end

  local base_item = (data.raw.item and data.raw.item["bob-pump-2"])
      or (data.raw["item-with-entity-data"] and data.raw["item-with-entity-data"]["bob-pump-2"])
  if base_item then
    local item = {
      type = "item",
      name = "flippable-bob-pump-2",
      order = (base_item.order or "") .. "-[flippable]",
      icon = base_item.icon,
      icons = base_item.icons,
      icon_size = base_item.icon_size or 64,
      icon_mipmaps = base_item.icon_mipmaps or 4,
      place_result = "flippable-bob-pump-2",
      stack_size = base_item.stack_size or 50
    }
    if mods["space-age"] then
      item.auto_recycle = true
    end
    data:extend { item }
  end

  local base_recipe = data.raw.recipe and data.raw.recipe["bob-pump-2"]
  if base_recipe then
    local recipe = {
      type = "recipe",
      name = "flippable-bob-pump-2",
      enabled = false,
      ingredients = {
        {
          type = "item",
          name = "bob-pump-2",
          amount = 1
        },
        {
          type = "item",
          name = "advanced-circuit",
          amount = 10
        },
        {
          type = "item",
          name = "engine-unit",
          amount = 4
        }
      },
      results = {
        {
          type = "item",
          name = "flippable-bob-pump-2",
          amount = 1
        }
      },
      main_product = "flippable-bob-pump-2"
    }
    if mods["space-age"] then
      recipe.auto_recycle = true
      recipe.category = base_recipe.category or "crafting"
    end
    data:extend { recipe }
  end

  local base_tech = data.raw.technology and data.raw.technology["bob-fluid-handling-2"]
  if base_tech then
    local tech = util.table.deepcopy(base_tech)
    tech.name = "flippable-bob-pump-2-tech"
    tech.effects = {
      {
        type = "unlock-recipe",
        recipe = "flippable-bob-pump-2"
      }
    }
    tech.prerequisites = {
      "flippable-pump-tech",
      "bob-fluid-handling-2",
      "circuit-network"
    }
    data:extend { tech }
  end
end

do
  local base_ent = data.raw.pump and data.raw.pump["bob-pump-3"]
  if base_ent then
    local e = util.table.deepcopy(base_ent)
    e.name = "flippable-bob-pump-3"
    e.placeable_by = {
      item = "flippable-bob-pump-3",
      count = 1
    }
    e.next_upgrade = nil
    data:extend { e }
  end

  local base_item = (data.raw.item and data.raw.item["bob-pump-3"])
      or (data.raw["item-with-entity-data"] and data.raw["item-with-entity-data"]["bob-pump-3"])
  if base_item then
    local item = {
      type = "item",
      name = "flippable-bob-pump-3",
      order = (base_item.order or "") .. "-[flippable]",
      icon = base_item.icon,
      icons = base_item.icons,
      icon_size = base_item.icon_size or 64,
      icon_mipmaps = base_item.icon_mipmaps or 4,
      place_result = "flippable-bob-pump-3",
      stack_size = base_item.stack_size or 50
    }
    if mods["space-age"] then
      item.auto_recycle = true
    end
    data:extend { item }
  end

  local base_recipe = data.raw.recipe and data.raw.recipe["bob-pump-3"]
  if base_recipe then
    local recipe = {
      type = "recipe",
      name = "flippable-bob-pump-3",
      enabled = false,
      ingredients = {
        {
          type = "item",
          name = "bob-pump-3",
          amount = 1
        },
        {
          type = "item",
          name = "processing-unit",
          amount = 8
        },
        {

          type = "item",
          name = "electric-engine-unit",
          amount = 4
        }
      },
      results = {
        {
          type = "item",
          name = "flippable-bob-pump-3",
          amount = 1
        }
      },
      main_product = "flippable-bob-pump-3"
    }
    if mods["space-age"] then
      recipe.auto_recycle = true
      recipe.category = base_recipe.category or "crafting"
    end
    data:extend { recipe }
  end

  local base_tech = data.raw.technology and data.raw.technology["bob-fluid-handling-3"]
  if base_tech then
    local tech = util.table.deepcopy(base_tech)
    tech.name = "flippable-bob-pump-3-tech"
    tech.effects = {
      {
        type = "unlock-recipe",
        recipe = "flippable-bob-pump-3"
      }
    }
    tech.prerequisites = {
      "flippable-bob-pump-2-tech",
      "bob-fluid-handling-3",
      "circuit-network"
    }
    data:extend { tech }
  end
end

do
  local base_ent = data.raw.pump and data.raw.pump["bob-pump-4"]
  if base_ent then
    local e = util.table.deepcopy(base_ent)
    e.name = "flippable-bob-pump-4"
    e.placeable_by = {
      item = "flippable-bob-pump-4",
      count = 1
    }
    e.next_upgrade = nil
    data:extend { e }
  end

  local base_item = (data.raw.item and data.raw.item["bob-pump-4"])
      or (data.raw["item-with-entity-data"] and data.raw["item-with-entity-data"]["bob-pump-4"])
  if base_item then
    local item = {
      type = "item",
      name = "flippable-bob-pump-4",
      order = (base_item.order or "") .. "-[flippable]",
      icon = base_item.icon,
      icons = base_item.icons,
      icon_size = base_item.icon_size or 64,
      icon_mipmaps = base_item.icon_mipmaps or 4,
      place_result = "flippable-bob-pump-4",
      stack_size = base_item.stack_size or 50
    }
    if mods["space-age"] then
      item.auto_recycle = true
    end
    data:extend { item }
  end

  local base_recipe = data.raw.recipe and data.raw.recipe["bob-pump-4"]
  if base_recipe then
    local recipe = {
      type = "recipe",
      name = "flippable-bob-pump-4",
      enabled = false,
      ingredients = {
        {
          type = "item",
          name = "bob-pump-4",
          amount = 1
        },
        {
          type = "item",
          name = "processing-unit",
          amount = 12
        },
        {
          type = "item",
          name = "electric-engine-unit",
          amount = 8
        }
      },
      results = {
        {
          type = "item",
          name = "flippable-bob-pump-4",
          amount = 1
        }
      },
      main_product = "flippable-bob-pump-4"
    }
    if mods["space-age"] then
      recipe.auto_recycle = true
      recipe.category = base_recipe.category or "crafting"
    end
    data:extend { recipe }
  end

  local base_tech = data.raw.technology and data.raw.technology["bob-fluid-handling-4"]
  if base_tech then
    local tech = util.table.deepcopy(base_tech)
    tech.name = "flippable-bob-pump-4-tech"
    tech.effects = {
      {
        type = "unlock-recipe",
        recipe = "flippable-bob-pump-4"
      }
    }
    tech.prerequisites = {
      "flippable-bob-pump-3-tech",
      "bob-fluid-handling-4",
      "circuit-network"
    }
    data:extend { tech }
  end
end
