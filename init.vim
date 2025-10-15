set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
tnoremap <Esc> <C-\><C-n>
set termguicolors
set mouse=a
let g:python3_host_prog = "/Users/jamesjzhou/.pyenv/shims/python"

" Plugin manager
call plug#begin(stdpath('data') . '/plugged')

Plug 'NeogitOrg/neogit'
Plug 'sindrets/diffview.nvim'

Plug 'greggh/claude-code.nvim'
Plug 'rmagatti/auto-session'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/vim-easy-align'
Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'github/copilot.vim'
" 依赖项
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" 可选依赖项
" Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "或 Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
" Plug 'zbirenbaum/copilot.lua'

" Yay，如果您想从源代码构建，请传递 source=true
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': { -> avante#build('source=true') } }

call plug#end()
lua << EOF
require('illuminate').configure({
  delay = 100,
  filetypes_allowlist = {
    'lua', 'python', 'javascript', 'typescript', 'go', 'rust', 'c', 'cpp', 'vimscript', 'markdown', 'html', 'css', 'yaml', 'bash', 'sh', 'dockerfile',
  },
})

require('neogit').setup()

require('claude-code').setup()

require('auto-session').setup({
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

    cwd_change_handling = true,

    pre_cwd_changed_cmds = {
        "tabdo NERDTreeClose" -- Close NERDTree before saving session
    },

    post_cwd_changed_cmds = {
        function()
        require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
        end
    },

})
-- render-markdown.nvim 配置
require('render-markdown').setup({
  file_types = { "markdown", "Avante" },
})

-- avante.nvim 配置
require('avante').setup({
  provider = "copilot",
  -- auto_suggestions_provider = "copilot",
  providers = {
    -- copilot = {
    --     model = "claude-3.5-sonnet",
    --     timeout = 45000, -- Timeout in milliseconds, increase this for reasoning models
    --     extra_request_body = {
    --         temperature = 0.75,
    --         max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
    --     },
    -- },
    deepseek = {
      __inherited_from = "openai",
      api_key_name = "OPENROUTER_API_KEY",
      endpoint = "https://openrouter.ai/api/v1",
      model = "deepseek/deepseek-chat-v3-0324",
    },
  },
})
EOF


" Plugins Settings
" Avante.nvim
nnoremap <leader>ap <cmd>AvanteToggle<cr>

" Copilot 
nnoremap <leader>cp <cmd>Copilot panel<cr>
" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
