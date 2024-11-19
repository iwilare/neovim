{ pkgs, inputs, helpers, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./agda.nix
    {
      #extraPlugins = [
      #  pkgs.vimPlugins.nvchad-ui
      #  pkgs.vimPlugins.base46
      #];
      #extraConfigLua = '' 
      #   require "nvchad"
      #   require "base46"
      #'';
      plugins.lualine.enable = true;
        
      ###################################################
      #globals.base46_cache.__raw = ''vim.fn.stdpath "data" .. "/base46/"'';
      #extraConfigLuaPost = ''
      #  dofile(vim.g.base46_cache .. "defaults")
      #  dofile(vim.g.base46_cache .. "statusline")
      #'';
      ###################################################
      plugins.which-key.enable = true;
      plugins.markdown-preview.enable = true;
      plugins.auto-session.enable = true;
      plugins.trouble.enable = true; # inline warnings
      plugins.lazygit.enable = true;
      colorschemes.vscode.enable = true;
      plugins.nvim-ufo.enable = true;
      plugins.neo-tree = {
        enable = true;  
        window.width = 27;
        retainHiddenRootIndent = true;
        closeIfLastWindow = true;
        autoCleanAfterSessionRestore = true;
        filesystem.filteredItems.showHiddenCount = false;
        filesystem.groupEmptyDirs = false;
        defaultComponentConfigs.indent.withExpanders = true;
        hideRootNode = true;
      };
      plugins.telescope = {
        enable = true;
      };
      plugins.gitsigns.enable = true;
      plugins.bufferline = {
        enable = true;
      };  
      plugins.cmp = {
        enable = true;
        autoEnableSources = true;
      };
      plugins.lsp = {
        enable = true;
        servers = {
          jsonls.enable = true;
          nil_ls = {
            enable = true;
            settings.formatting.command = ["${pkgs.alejandra}/bin/alejandra"];
          };
        };
      };
      plugins.treesitter = {
        enable = true;
        settings.indent.enable = true;
        settings.highlight.enable = true;
      };
      plugins.toggleterm = {
        enable = true;
        settings.direction = "horizontal";
      };  
      plugins.web-devicons = {
        enable = true;
      };
      plugins.multicursors.enable = true;
      plugins.notify = {
        enable = true;
        backgroundColour = "#000000";
        fps = 60;
        render = "default";
        timeout = 2000;
        topDown = true;
      };
      #plugins.persistence = {
      #  enable = true;
      #};
      plugins.indent-blankline = {
        enable = true;
      };
      plugins.barbecue = {
        enable = true;
      };
      plugins.alpha = {
        enable = false;
        theme = null;
        layout =
          let
            padding = val: {
              type = "padding";
              inherit val;
            };
          in
          [
            (padding 4)
            {
              opts = {
                hl = "AlphaHeader";
                position = "center";
              };
              type = "text";
              val = [
                "   ███▄    █ ▓█████ ██▒   █▓▓█████   "
                "   ██ ▀█   █ ▓█   ▀▓██░   █▒▓█   ▀   "
                "  ▓██  ▀█ ██▒▒███   ▓██  █▒░▒███     "
                "  ▓██▒  ▐▌██▒▒▓█  ▄  ▒██ █░░▒▓█  ▄   "
                "  ▒██░   ▓██░░▒████▒  ▒▀█░  ░▒████▒  "
                "  ░ ▒░   ▒ ▒ ░░ ▒░ ░  ░ ▐░  ░░ ▒░ ░  "
                "  ░ ░░   ░ ▒░ ░ ░  ░  ░ ░░   ░ ░  ░  "
                "     ░   ░ ░    ░       ░░     ░     "
                "           ░    ░  ░     ░     ░  ░  "
                "                        ░            "
                "                                     "
                "      git@github.com:redyf/neve      "
              ];
            }
            (padding 2)
            { type = "button"; val = "  Find File"; on_press = { __raw = "function() require('telescope.builtin').find_files() end"; };
              opts = {
                # hl = "comment";
                keymap = [ "n" "f" ":Telescope find_files <CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "f";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            { type = "button"; val = "  New File"; on_press = { __raw = "function() vim.cmd[[ene]] end"; };
              opts = {
                # hl = "comment";
                keymap = [ "n" "n" ":ene <BAR> startinsert <CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "n";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            { type = "button"; val = "󰈚  Recent Files"; on_press = { __raw = "function() require('telescope.builtin').oldfiles() end"; };
              opts = { 
                # hl = "comment"; keymap = [ "n" "r" ":Telescope oldfiles <CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "r";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            { type = "button"; val = "󰈭  Find Word"; on_press = { __raw = "function() require('telescope.builtin').live_grep() end"; };
              opts = {
                # hl = "comment";
                keymap = [ "n" "g" ":Telescope live_grep <CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "g";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            { type = "button"; val = "  Restore Session"; on_press = { __raw = "function() require('persistence').load() end"; };
              opts = {
                # hl = "comment";
                keymap = [ "n" "s" ":lua require('persistence').load()<cr>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "s";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            { type = "button"; val = "  Quit Neovim"; on_press = { __raw = "function() vim.cmd[[qa]] end"; };
              opts = {
                # hl = "comment";
                keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "q";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
      };
      plugins.statuscol = { # https://github.com/niksingh710/nvix/blob/068c9bf38e89138758cb1cc35fc88ff8fcea98d2/config/base/ufo.nix#L20
        enable = true;
        settings = {
          relculright = true;
          ft_ignore = [ "dashboard" "neo-tree" ];
          segments = [
            { click = "v:lua.ScFa"; text = [ (helpers.mkRaw "require('statuscol.builtin').foldfunc") ]; }
            { click = "v:lua.ScSa"; text = [ " %s" ]; }
            { click = "v:lua.ScLa"; text = [ (helpers.mkRaw "require('statuscol.builtin').lnumfunc") " " ]; }
          ];
        };
      };
    }
    {
      globals.mapleader = " ";
      globals.maplocalleader = ",";
      opts = {
        # Indentation
        shiftwidth = 0; # number of space inserted for indentation; when zero the 'tabstop' value will be used
        tabstop = 2; # number of space in a tab
        showtabline = 2; # always display tabline
        expandtab = true; # enable the use of space in tab
        copyindent = true; # copy the previous indentation on autoindenting
        preserveindent = true; # preserve indent structure as much as possible
        breakindent = true; # wrap indent to match  line start
        # Wrapping
        linebreak = true; # wrap lines at 'breakat'
        wrap = false; # disable wrapping of lines longer than the width of window
        # Undo files
        updatetime = 300; # length of time to wait before triggering the plugin
        undofile = true; # enable persistent undo
        writebackup = false; # disable making a backup before overwriting a file
        # Fold
        foldlevelstart = 99; # start with all code unfolded
        foldlevel = 99; # set high foldlevel for nvim-ufo
        foldenable = true; # enable fold for nvim-ufo
        foldcolumn = "1"; # show foldcolumn
        # UI
        fillchars = { eob = " "; fold = " "; foldopen = ""; foldsep = " "; foldclose = ""; };
        cmdheight = 1; # hide command line unless needed
        laststatus = 3; # global statusline
        shortmess = "Is"; # disable startup message and search wrap
        # Searching
        smartcase = true; # case sensitive searching
        ignorecase = true; # case insensitive searching
        infercase = true; # infer cases in keyword completion
        # Completion
        completeopt = [ "menu" "menuone" "noselect" ];
        # Line numbers
        number = true; # show numberline
        relativenumber = false; # show relative numberline
        # Cursor
        virtualedit = "block"; # allow going past end of line in visual block mode
        # Backspace
        backspace = [ "nostop" "eol" ]; # allow backspacing over everything in insert mode
        # ---------------
        timeoutlen = 500; # shorten key timeout length a little bit for which-key
        splitright = true; # splitting a new window at the right of the current one
        splitbelow = true; # splitting a new window below the current one
        showmode = false; # disable showing modes in command line
        signcolumn = "yes"; # always show the sign column
        termguicolors = true; # enable 24-bit RGB color in the TUI
        pumheight = 30; # height of the pop up menu
        mouse = "a"; # enable mouse support
        cursorline = true; # highlight the text line of the cursor
        confirm = true; # raise a dialog asking if you wish to save the current file(s)
        clipboard = "unnamedplus"; # connection to the system clipboard
        viewoptions = [ "cursor" "folds" "curdir" ];
      };
      keymaps = [
      ];
    }
  ];
}
