function adv_accumulator_picture(tier,tint, repeat_count)
  return
  {
    layers =
    {
      {
        filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/advanced-accumulator.png",
        priority = "extra-high",
        width = 66,
        height = 94,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -10),
        tint = tint,
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/hr-advanced-accumulator.png",
          priority = "extra-high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = tint,
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "extra-high",
        width = 120,
        height = 54,
        repeat_count = repeat_count,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
          priority = "extra-high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
end

function adv_accumulator_charge(tier)
  return
  {
    layers =
    {
      adv_accumulator_picture(tier,{ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/advanced-accumulator-charge.png",
        width = 90,
        height = 100,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(0, -22),
        hr_version =
        {
          filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/hr-advanced-accumulator-charge.png",
          width = 178,
          height = 206,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(0, -22),
          scale = 0.5
        }
      }
    }
  }
end

function adv_accumulator_discharge(tier)
  return
  {
    layers =
    {
      adv_accumulator_picture(tier,{ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/advanced-accumulator-discharge.png",
        width = 88,
        height = 104,
        line_length = 6,
        frame_count = 24,
        blend_mode = "additive",
        shift = util.by_pixel(-2, -22),
        hr_version =
        {
          filename = "__"..mod_name.."__/graphics/entity/accumulator/"..tier.."/hr-advanced-accumulator-discharge.png",
          width = 170,
          height = 210,
          line_length = 6,
          frame_count = 24,
          blend_mode = "additive",
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }
  }
end