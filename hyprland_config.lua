-- ==================== Hyprland Main Configuration ====================

-- Load variables and keybinds
require("variables")
require("binds")

-- ---------------------------------------------------------------------
-- Monitor setup

-- Monitor setup
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1
})


-- ---------------------------------------------------------------------
-- Appearance & Variables
hl.config({
    general = {
        gaps_in = 8,
        gaps_out = 12,
        border_size = 3,
        layout = "dwindle",
        -- Themed Borders (matched with Noctalia)
        ["col.active_border"] = "rgba(31aee9aa)",
        ["col.inactive_border"] = "rgba(515af144)"
    },

    decoration = {
        rounding = 16,

        -- --- Window Opacity (Transparency) ---
        active_opacity = 0.78,       -- Focused windows
        inactive_opacity = 0.55,     -- Unfocused windows
        fullscreen_opacity = 1.0,    -- Fullscreen windows stay fully opaque

        -- Optional: Slight dimming of inactive windows
        dim_inactive = true,
        dim_strength = 0.22,         -- 0.1 = subtle, 0.25 = stronger

        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            vibrancy = 0.30
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        }
    },

    -- ---------------------------------------------------------------------
    -- Input
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            ["tap-to-click"] = false
        }
    }
})

-- ---------------------------------------------------------------------
-- Layer Rules for Noctalia
hl.layer_rule({
    match = { namespace = "noctalia.*" },
    blur = true,
    ignore_alpha = 0.3
})

hl.layer_rule({
    match = { namespace = "noctalia-background-.*" }
})

-- Animations
hl.config({
    animations = {
        enabled = true,
        animation = {
            { "windows", true, 4, "default" },
            { "windowsOut", true, 4, "default", "popin 80%" },
            { "border", true, 5, "default" },
            { "fade", true, 3, "default" },
            { "workspaces", true, 3, "default" }
        }
    }
})

-- Window Rules & Floating rules for note apps
hl.window_rule({
    match = { initial_title = "^(Volume Control|Steam Guard|Authentication)$" },
    float = true
})

hl.window_rule({
    match = { title = "^(Steam|File Properties)$" },
    float = true,
    size = "800 600"
})

hl.window_rule({
    match = { class = "xournalpp" },
    float = true,
    center = true,
    size = "1200 800"
})


-- ---------------------------------------------------------------------
-- Environment Variables
hl.env("XCURSOR_SIZE", "48")
hl.env("XCURSOR_THEME", "catppuccin-frappe-blue-cursors")

-- ---------------------------------------------------------------------
-- Autostart Apps
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)

-- -- 4. hyprsunset for warm yellow night light
-- -- Note: Your systemd user configuration is excellent!
-- -- It is still recommended to manage it via your shell instead of here:
-- -- Run 'systemctl --user enable --now hyprsunset.service' directly in your terminal.


-- -- Tablet & Note-Taking Setup
hl.device({
    name = "wacom-intuos-pt-s-2-pen",
    output = "eDP-1",
    region_size = { 1920, 1200 }
})
