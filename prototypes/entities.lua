require ("circuit-connector-generated-definitions")
require "prototypes.accu_graphics"
tier_light = {
{r = 1.0, g = 1.0, b = 1.0},
{r = 0.4, g = 1.0, b = 0.4},
{r = 0.4, g = 0.4, b = 1.0},
{r = 1.0, g = 0.4, b = 1.0},
{r = 1.0, g = 0.4, b = 0.4},
}


function accu_corpse(tier)
	return{
    type = "corpse",
    name = "accumulator-remnants-mk"..tier,
    icon = tiered_icon("accumulator", tier),
    icon_size = 32,-- icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__" .. mod_name .. "__/graphics/entity/accumulator/"..tier.."/remnants/accumulator-remnants.png",
      line_length = 1,
      width = 86,
      height = 74,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(2, 4),
      hr_version =
      {
        filename = "__" .. mod_name .. "__/graphics/entity/accumulator/"..tier.."/remnants/hr-accumulator-remnants.png",
        line_length = 1,
        width = 172,
        height = 146,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(2.5, 3.5),
        scale = 0.5,
      },
    })
  }
end
function panel_corpse(tier)
	return{
    type = "corpse",
    name = "solar-panel-remnants-mk"..tier,
    icon = tiered_icon("solar-panel", tier),
    icon_size = 32,-- icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    subgroup = "remnants",
    order="d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/"..tier.."/remnants/solar-panel-remnants.png",
      line_length = 1,
      width = 146,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(4, 0),
      hr_version =
      {
        filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/"..tier.."/remnants/hr-solar-panel-remnants.png",
        line_length = 1,
        width = 290,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3.5, 0),
        scale = 0.5,
      },
    })
  }
end
function cp_solar_panel_entity_factory(tier)
  return   {
    type = "solar-panel",
    name = tiered_name("solar-panel", tier),
    icon = tiered_icon("solar-panel", tier),
    icon_size = 32,
	fast_replaceable_group = "solar-panel",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = tiered_name("solar-panel", tier)},
    max_health = 200 * (tier+1),
	next_upgrade = tier < 5 and tiered_name("solar-panel",tier+1) or nil,
    corpse = "solar-panel-remnants-mk"..tier,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__"..mod_name.."__/graphics/entity/solar-panel/"..tier.."/solar-panel.png",
          priority = "high",
          width = 116,
          height = 112,
          shift = util.by_pixel(-3, 3),
          hr_version = {
            filename = "__"..mod_name.."__/graphics/entity/solar-panel/"..tier.."/hr-solar-panel.png",
            priority = "high",
            width = 230,
            height = 224,
            shift = util.by_pixel(-3, 3.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 112,
          height = 90,
          shift = util.by_pixel(10, 6),
          draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow.png",
            priority = "high",
            width = 220,
            height = 180,
            shift = util.by_pixel(9.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 108,
          height = 90,
          shift = util.by_pixel(11, 6),
          hr_version = {
            filename = "__base__/graphics/entity/solar-panel/hr-solar-panel-shadow-overlay.png",
            priority = "high",
            width = 214,
            height = 180,
            shift = util.by_pixel(10.5, 6),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    production = tier_up_value(60, tier) .. "kW"
  }
end

function cp_accum_entity_factory(tier)
  return {
    type = "accumulator",
    name = tiered_name("accumulator", tier),
    icon = tiered_icon("accumulator", tier),
    icon_size = 32,
	fast_replaceable_group = "accumulator",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = tiered_name("accumulator", tier)},
    max_health = 150 * (tier+1),
	next_upgrade = tier < 5 and tiered_name("accumulator",tier+1) or nil,
    corpse = "accumulator-remnants-mk"..tier,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = tier_up_value(5, tier).."MJ",
      usage_priority = "tertiary",
      input_flow_limit = tier_up_value(300, tier).."kW",
      output_flow_limit = tier_up_value(300, tier).."kW",
    },
    picture = adv_accumulator_picture(tier),
    charge_animation = adv_accumulator_charge(tier),

    universal_base =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04a-base-sequence.png",
      line_length = 8,
      width = 52,
      height = 50,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(0, 1),
    },

    universal_wire =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04c-wire-sequence.png",
      line_length = 8,
      width = 62,
      height = 58,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(0.5, 0),
    },

    universal_red_led =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04i-red-LED-sequence.png",
      line_length = 8,
      width = 48,
      height = 46,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(0, 0),
    },

    universal_green_led =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04h-green-LED-sequence.png",
      line_length = 8,
      width = 48,
      height = 46,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(0, 0),
    },

    universal_blue_led =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04f-blue-LED-off-sequence.png",
      line_length = 8,
      width = 46,
      height = 46,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(0, 0),
    },

    universal_base_shadow =
    {
      filename = "__base__/graphics/entity/__temp/hr-ccm-universal-04b-base-shadow-sequence.png",
      line_length = 8,
      width = 62,
      height = 46,
      frame_count = 32,
      scale = 0.5,
      shift = util.by_pixel(3, 2.5),
    },

    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = tier_light[tier]},
    discharge_animation = adv_accumulator_discharge(tier),
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7, color = tier_light[tier]},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },

    circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
    circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_output_signal = {type = "virtual", name = "signal-A"}
  }
end

data:extend({
  cp_solar_panel_entity_factory(2),
  cp_solar_panel_entity_factory(3),
  cp_solar_panel_entity_factory(4),
  cp_solar_panel_entity_factory(5),
  panel_corpse(2),
  panel_corpse(3),
  panel_corpse(4),
  panel_corpse(5),
  cp_accum_entity_factory(2),
  cp_accum_entity_factory(3),
  cp_accum_entity_factory(4),
  cp_accum_entity_factory(5),
  accu_corpse(2),
  accu_corpse(3),
  accu_corpse(4),
  accu_corpse(5),
})
