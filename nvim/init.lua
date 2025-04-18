-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_scale_factor = 1.0

  -- Configure font
  vim.o.guifont = "JetBrainsMonoNL Nerd Font:h18"

  -- Function to change font size
  local function change_font_size(delta)
    local font = vim.o.guifont
    local name, size = font:match("^(.*):h(%d+)")
    if name and size then
      local new_size = tonumber(size) + delta
      if new_size > 6 then -- minimum readable size
        vim.o.guifont = string.format("%s:h%d", name, new_size)
      end
    end
  end

  -- Keymaps to increase/decrease font size
  vim.keymap.set("n", "<C-=>", function()
    change_font_size(1)
  end) -- Ctrl+= to increase
  vim.keymap.set("n", "<C-->", function()
    change_font_size(-1)
  end) -- Ctrl+- to decrease
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.transparency = 0
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_theme = "auto"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_length = 10
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_speed = 20.0
  vim.g.neovide_cursor_vfx_particle_density = 10.0

  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_in_normal_mode = true
  vim.g.neovide_cursor_animate_in_visual_mode = true
  vim.g.neovide_cursor_animate_in_replace_mode = true
  vim.g.neovide_cursor_animate_in_command_mode = true
  vim.g.neovide_cursor_animate_in_term_mode = true
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
