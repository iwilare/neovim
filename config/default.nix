{ pkgs, inputs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./agda.nix
    {
      plugins.lualine.enable = true;
      plugins.neo-tree = {
        enable = true;
        window.width = 30;
        openFilesInLastWindow = false;
        sources = [ "filesystem" "buffers" "git_status" ];
      };
      plugins.which-key.enable = true;
      plugins.markdown-preview.enable = true;
      plugins.auto-session.enable = true;
      plugins.trouble.enable = true; # inline warnings
      plugins.floaterm = {
        enable = true;
        wintype = "split";
        height = 0.15;
      };
      plugins.multicursors.enable = true;
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
        fillchars = { eob = " "; }; # disable `~` on nonexistent lines
        cmdheight = 0; # hide command line unless needed
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
        { key = ";"; action = ":"; }
        { mode = "n"; key = "<leader>m"; options.silent = true; action = "<cmd>!make<CR>"; }
      ];
    }
  ];
}
