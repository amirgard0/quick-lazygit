local M = {}

function M.setup(opts)
  opts = opts or {}

  if not opts.keymap then
    vim.notify('keymap configuration is required', vim.log.levels.ERROR)
    return
  end

  if opts.keymap.lazygit then
    -- vim.keymap.set('n', opts.keymap.lazygit, [[:!start cmd /c "cd /d "%:p:h" && lazygit"<CR>]], { silent = true }) v.1
    -- vim.keymap.set('n', opts.keymap.lazygit, [[:!start /max cmd /c "cd /d "%:p:h" && lazygit"<CR>]], { silent = true }) v.2
    -- vim.keymap.set('n', opts.keymap.lazygit, [[:!wt --fullscreen new-tab --title "Lazygit" cmd /c "cd /d "%:p:h" && lazygit"<CR>]], { silent = true }) v.3
    --
    -- NOTE: this is for windows and mostly stable
    -- vim.keymap.set(
    --   'n',
    --   opts.keymap.lazygit,
    --   [[:noautocmd silent !wt --fullscreen new-tab --title "Lazygit" cmd /c "cd /d "%:p:h" && lazygit"<CR>]],
    --   { silent = true })

    local function open_lazygit_cross_platform()
      local current_dir = vim.fn.expand '%:p:h'

      if vim.fn.has 'win32' == 1 then
        -- Windows
        vim.fn.system(string.format('wt --fullscreen new-tab --title "Lazygit" cmd /c "cd /d "%s" && lazygit"', current_dir))
      elseif vim.fn.has 'unix' == 1 then
        if vim.fn.has 'mac' == 1 then
          -- macOS
          vim.fn.system(string.format('osascript -e \'tell application "Terminal" to do script "cd \\"%s\\" && lazygit"\'', current_dir))
        else
          -- Linux - try different terminals
          local cmd = string.format('cd "%s" && lazygit', current_dir)
          local terminals = {
            ['gnome-terminal'] = 'gnome-terminal --full-screen -- bash -c "' .. cmd .. '; exec bash"',
            ['konsole'] = 'konsole --fullscreen -e bash -c "' .. cmd .. '; exec bash"',
            ['xfce4-terminal'] = 'xfce4-terminal --fullscreen --command="bash -c \\"' .. cmd .. '; exec bash\\""',
            ['alacritty'] = 'alacritty --command bash -c "' .. cmd .. '; exec bash"',
            ['xterm'] = 'xterm -fullscreen -e bash -c "' .. cmd .. '; exec bash"',
          }

          for term, term_cmd in pairs(terminals) do
            if vim.fn.executable(term) == 1 then
              vim.fn.system(term_cmd)
              break
            end
          end
        end
      end
    end

    vim.keymap.set('n', opts.keymap.lazygit, open_lazygit_cross_platform, { silent = true })
  end
end

return M
