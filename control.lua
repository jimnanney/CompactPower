script.on_init(function()
	global.last_scale = settings.startup["compactpower2-scale"].value
end)

script.on_configuration_changed(function()
	if global.last_scale ~= settings.startup["compactpower2-scale"].value then
		global.last_scale = settings.startup["compactpower2-scale"].value
		if remote.interfaces["own-market"] and remote.interfaces["own-market"].recalculate_prices then
			remote.call("own-market", "recalculate_prices")
		end
	end
end)