-- Monitors:
hl.monitor({
    output = "",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})

-- Programs:
local terminal = "kitty"
local google_lens = "quicksnip"
local fileManager = "dolphin"
local menu = "wofi --show drun || killall -9 wofi"

-- Environment Variables:
hl.env("XCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "BibataIce")
hl.env("XCURSOR_THEME", "BibataIce")
hl.env("XCURSOR_SIZE", "19")

-- Permissions:
-- ecosystem {
--   enforce_permissions = 1
-- }
hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

-- Cosmetics & Animations:

hl.curve("smooth", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "smooth",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 7,
    bezier = "smooth",
    style = "popin 90%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "popin 95%",
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 6,
    bezier = "smooth",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    bezier = "smooth",
    style = "fade",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 6,
    bezier = "smooth",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 6,
    bezier = "smooth",
    style = "fade",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 8,
    bezier = "smooth",
})

-- TODO: manual review — malformed windowrule on line 90: immediate 1
hl.window_rule({
    match = {
        class = ".*",
    },
    immediate = true,
})

hl.window_rule({
    match = {
        class = "^(exodus)$",
    },
    float = true,
    stay_focused = true,
    pin = true,
})

hl.window_rule({
    name = "keep_float_size",
    match = {
        float = true,
    },
    persistent_size = true,
})

hl.layer_rule({
    match = { namespace = "match:namespace waybar" },
    -- TODO: manual review — unmapped layer rule: "blur on"
    ignore_alpha = 0,
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/exodusEXE.sh"))
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("~/.config/hypr/screenrecord/toggle-record.sh"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("~/.config/hypr/screenshot/screenshot.sh"))
hl.bind(mainMod .. " + Scroll_Lock", hl.dsp.exec_cmd("lens-shot"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 0,
        col = {
            active_border = { colors = { "rgb(DCDCDC)", "rgb(DCDCDC)" }, angle = 45 },
            inactive_border = "rgb(8D8D8D)",
        },
        resize_on_border = false,
        allow_tearing = true,
        layout = "dwindle",
    },
    decoration = {
        rounding = 8,
        rounding_power = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },

        motion_blur = {
            enabled = true,
            samples = 3    -- Default value is (7) It may take performance.
        },

        dim_special = 0,
    },
    animations = {
        enabled = true,
    },
    -- uncomment all if you wish to use that.
    -- workspace = w[tv1], gapsout:0, gapsin:0
    -- workspace = f[1], gapsout:0, gapsin:0
    -- windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
    -- windowrule = rounding 0, floating:0, onworkspace:w[tv1]
    -- windowrule = bordersize 0, floating:0, onworkspace:f[1]
    -- windowrule = rounding 0, floating:0, onworkspace:f[1]
    dwindle = {
        preserve_split = true, -- You probably want this
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        font_family = "JetBrainsMono Nerd Font",
        vrr = 1,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = true,
    },
    -- Input (Mouse & Keyboards for example):
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        -- accel_profile = flat # This means turn off the mouse acceleration btw so you can freely customize your mouse sensitvity above. :D
        touchpad = {
            natural_scroll = false,
        },
    },
    -- Keybinds: 
    -- Laptop multimedia keys for volume and LCD brightness
    -- Requires playerctl
})

-- Auto-Start
-- NOTE: These are the most important thing for your hyprland to work properly.

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar &")
    hl.exec_cmd("dunst -config <(envsubst < ~/.config/dunst/dunstrc) &")
    hl.exec_cmd("~/.config/hypr/wallpaper.sh \"$(cat ~/.config/hypr/current_wallpaper 2>/dev/null || echo \"$HOME/Pictures/wallpaper/arch1.png\")\"")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 11'")
    hl.exec_cmd("~/.config/hypr/battery.sh &")
end)