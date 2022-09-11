-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/roozbeh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/roozbeh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/roozbeh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/roozbeh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/roozbeh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Dockerfile.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/Dockerfile.vim",
    url = "https://github.com/ekalinin/Dockerfile.vim"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ale = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["awesome-vim-colorschemes"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/awesome-vim-colorschemes",
    url = "https://github.com/rafi/awesome-vim-colorschemes"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["html5.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/html5.vim",
    url = "https://github.com/othree/html5.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["java-syntax.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/java-syntax.vim",
    url = "https://github.com/uiiaoo/java-syntax.vim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-colorizer.lua"] = {
    config = { "        require('colorizer').setup()\n        " },
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-treesitter"] = {
    config = { "                require'nvim-treesitter.configs'.setup {\n              ensure_installed = { \"c\", \"lua\", \"rust\", \"java\", \"cpp\" },\n\n              -- Install parsers synchronously (only applied to `ensure_installed`)\n              sync_install = false,\n\n\n              highlight = {\n                enable = true,\n\n                -- disable = { \"c\", \"rust\" },\n\n                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.\n                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).\n                -- Using this option may slow down your editor, and you may see some duplicate highlights.\n                -- Instead of true it can also be a list of languages\n                additional_vim_regex_highlighting = false,\n              },\n            }\n        " },
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "            require'treesitter-context'.setup{\n\n            }\n        " },
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  semshi = {
    config = { "vim.cmd [[UpdateRemotePlugins]]" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/opt/semshi",
    url = "https://github.com/numirias/semshi"
  },
  ultisnips = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://github.com/Chiel92/vim-autoformat"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight",
    url = "https://github.com/octol/vim-cpp-enhanced-highlight"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-javascript",
    url = "https://github.com/pangloss/vim-javascript"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty",
    url = "https://github.com/maxmellon/vim-jsx-pretty"
  },
  ["vim-nerdtree-tabs"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-nerdtree-tabs",
    url = "https://github.com/jistr/vim-nerdtree-tabs"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-syntax-extra"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-syntax-extra",
    url = "https://github.com/justinmk/vim-syntax-extra"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["yaml-vim"] = {
    loaded = true,
    path = "/home/roozbeh/.local/share/nvim/site/pack/packer/start/yaml-vim",
    url = "https://github.com/mrk21/yaml-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
                require'nvim-treesitter.configs'.setup {
              ensure_installed = { "c", "lua", "rust", "java", "cpp" },

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,


              highlight = {
                enable = true,

                -- disable = { "c", "rust" },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },
            }
        
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
        require('colorizer').setup()
        
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
            require'treesitter-context'.setup{

            }
        
time([[Config for nvim-treesitter-context]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'semshi'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
