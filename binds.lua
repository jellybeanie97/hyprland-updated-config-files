-- ==================== Keybinds ====================

local mainMod = "SUPER"

-- Applications (from your initial variables)
local terminal = "alacritty"
local browser = "opera-gx"
local fileManager = "thunar"

-- ======= Updates to B I N D S config. ====================
-- Old Rofi Lines being replaced with Noctalia Launcher
-- hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun -show-icons"))
-- hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("rofi -show run"))
-- =========================================================

-- --- System ---
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- --- Launchers ---
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Noctalia Launcher (replaces Rofi)
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

-- Developer Shell (Zsh)
-- hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("alacritty -e zsh"))

-- --- Workspaces ---
-- Automatically map keys 1-9 and 0 to workspaces 1-10
for i = 1, 10 do
    local key = tostring(i % 10) -- Maps index 10 to key "0"
    
    -- Focus workspace
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
    
    -- Move window to workspace
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- --- Movement ---
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Swap focused window with another in the given direction
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))

-- --- Mouse binds ---
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.move(), { flag = "m" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { flag = "m" })

-- --- Volume and Brightness ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { flag = "e" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { flag = "e" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"), { flag = "e" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { flag = "e" })

-- --- Screenshots ---
-- Full screen
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output"))
-- Active window
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window"))
-- Select area
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m region"))

-- --- Night Shift (Yellow Tint Color) ---
-- Make it warmer (more yellow)
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.exec_cmd("hyprsunset --temperature -300"))
-- Less warm / back toward normal
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.exec_cmd("hyprsunset --temperature +300"))
-- Instant cozy night mode
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("hyprsunset --temperature 4500"))
-- Full day / disable
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("hyprsunset identity"))

-- ====================== Notes Scratchpad ======================
-- Toggle quick notes from anywhere
hl.bind(mainMod .. " + comma", hl.dsp.workspace.toggle_special("notes"))
-- Move current window to notes (commented out per original file)
-- hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.workspace.move_window("special:notes"))
-- Quick append from clipboard
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.exec_cmd("echo -e \"\\n--- $(date '+%Y-%m-%d %H:%M') ---\\n$(wl-paste)\" >> ~/notes/things-to-add.md"))
