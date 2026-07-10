-- Input configuration

hl.config({
    input = {
        sensitivity = 0.5,
        accel_profile = "adaptive",
        kb_options = "caps:escape",
	touchpad = {
		natural_scroll = true
	},
	repeat_rate = 30,
	repeat_delay = 250,
	follow_mouse = 0
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
