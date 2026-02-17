# Neovim Configuration Documentation

This repository contains my personal Neovim configuration, optimized for development in Go, Rust, Python (Odoo), and NixOS.

## 🗺️ Keymaps

Here are the configured keyboard shortcuts. The leader key (`<leader>`) is configured as `Space`.

### General
| Keymap | Mode | Action |
| :--- | :--- | :--- |
| `Ctrl + s` | Normal, Insert | Save file (`:w`) |
| `Esc` | Normal | Clear search highlight (`:nohlsearch`) |
| `space + w + v` | Normal | Split window vertically |
| `space + w + h` | Normal | Split window horizontally |
| `Ctrl + h`, `Ctrl + j`, `Ctrl + k`, `Ctrl + l` | Normal | Navigate between windows (Left, Down, Up, Right) |
| `Tab` | Normal | Next buffer |
| `Shift + Tab` | Normal | Previous buffer |
| `space + b + d` | Normal | Close current buffer |
| `space + a + s` | Normal | Find Symbols (Aerial) |

### Plugins
#### Aerial (Symbols)
- `space + c + s`: Toggle symbols panel.

#### Conform (Formatting)
- `space + f`: Format file.

#### Flash (Fast Navigation)
- `s`: Jump anywhere (Flash jump).
- `S`: Flash Treesitter.
- `Ctrl + s`: Toggle Flash search.

#### Harpoon (File Marks)
- `space + a`: Add file to Harpoon.
- `Ctrl + e`: Harpoon quick menu.
- `space + 1` / `space + 2` / `space + 3`: Go to file 1, 2, or 3.

#### LazyGit
- `space + l + g`: Open LazyGit.

#### LSP (Language Server Protocol)
- `g + d`: Go to definition.
- `g + r`: View references.
- `K`: Show documentation (Hover).
- `space + r + n`: Rename symbol.
- `space + c + a`: Code Actions.
- `space + d`: Show diagnostics in floating window.
- `[ + d`, `] + d`: Go to previous/next diagnostic.

#### Obsidian (Notes)
- `space + o + n`: New note.
- `space + o + o`: Search in notes.
- `space + o + t`: Insert template.
- `space + o + b`: View backlinks.

#### Oil (File Manager)
- `-`: Open Oil (current directory).

#### Persistence (Sessions)
- `space + q + s`: Restore session.
- `space + q + l`: Restore last session.
- `space + q + d`: Stop session saving.

#### Telescope (Finder)
- `space + f + f`: Find files.
- `space + f + g`: Find text (Grep).
- `space + f + b`: Find buffers.
- `space + f + h`: Neovim help.
- `space + f + o`: Recent files.
- `space + f + n`: Notifications.
- `space + f + c`: Neovim configuration.

#### Trouble (Diagnostics)
- `space + x + x`: Toggle project diagnostics.
- `space + x + b`: Current buffer diagnostics.
- `space + c + s`: Project symbols.
- `space + c + l`: LSP definitions/references.

#### Twilight & Zen Mode
- `space + t + w`: Toggle Twilight (dim inactive code).
- `space + z`: Zen Mode (distraction-free).

#### Undotree
- `space + u`: Undo tree.

---

## ⚙️ Neovim Options

These are the main settings established in `lua/config/options.lua`:

- **Appearance**:
  - `termguicolors`: Enables true colors (24-bit).
  - `number` / `relativenumber`: Shows relative line numbers.
  - `signcolumn`: Always shows the sign column (to avoid visual jumps).
  - `wrap`: Disables automatic line wrapping.
  - `scrolloff`: Keeps 8 lines of context when scrolling vertically.
  - `laststatus`: 3 (Global status bar).

- **Behavior**:
  - `clipboard`: `unnamedplus` (Uses the system clipboard).
  - `mouse`: Enabled in all modes.
  - `confirm`: Asks for confirmation when exiting with unsaved changes.
  - `ignorecase` / `smartcase`: Case-insensitive search, unless a capital letter is typed.
  - `undofile`: Saves undo history to disk (persistent).
  - `splitbelow` / `splitright`: New splits appear below and to the right.

- **Indentation**:
  - `tabstop` / `shiftwidth`: 4 spaces.
  - `expandtab`: Uses spaces instead of real tabs.
  - `smartindent`: Smart auto-indentation.

---

## 🧩 Plugins

List of installed plugins and their justification:

| Plugin | Justification |
| :--- | :--- |
| **lazy.nvim** | Modern and fast plugin manager. |
| **aerial.nvim** | Code structure navigation (classes, functions). |
| **nvim-ts-context-commentstring** | Smart comments based on context (useful for Svelte/Astro). |
| **conform.nvim** | Universal code formatter (Go, Python, JS, etc.). |
| **dashboard-nvim** | Custom startup screen with quick shortcuts. |
| **direnv.vim** | Integration with `direnv` for per-directory environments. |
| **dressing.nvim** | Improves Vim's input and select interfaces. |
| **dropbar.nvim** | "Breadcrumbs" bar at the top. |
| **flash.nvim** | Ultra-fast buffer navigation. |
| **fzf-lua** | Fuzzy search using FZF (very fast). |
| **gitsigns.nvim** | Shows Git changes in the sign column. |
| **harpoon** | Quick file marking to switch between them. |
| **incline.nvim** | Floating status lines for each window. |
| **lazygit.nvim** | Integration with the LazyGit terminal UI. |
| **lint.nvim** | Asynchronous linter (eslint_d, pylint, etc.). |
| **nvim-lspconfig** | Base configurations for LSP servers. |
| **nvim-cmp** | Extensible completion engine. |
| **lualine.nvim** | Elegant and configurable status line. |
| **noice.nvim** | Replaces UI for messages, cmdline, and notifications. |
| **nvim-notify** | "Toast" style visual notifications. |
| **obsidian.nvim** | Note and knowledge management (Obsidian). |
| **oil.nvim** | File manager that works like an edit buffer. |
| **persistence.nvim** | Session management and restoration. |
| **rainbow-delimiters.nvim** | Colors parentheses and brackets by pairs. |
| **render-markdown.nvim** | Improved Markdown visualization in the editor. |
| **smear-cursor.nvim** | Visual trail effect on the cursor. |
| **telescope.nvim** | Extensible finder (files, text, buffers, etc.). |
| **tokyonight.nvim** | Main color theme. |
| **nvim-treesitter** | Advanced syntax highlighting and parsing. |
| **nvim-treesitter-context** | Shows the current function context at the top. |
| **trouble.nvim** | Pretty list for diagnostics, references, and errors. |
| **twilight.nvim** | Focus on current code by dimming the rest. |
| **undotree** | Visualizes the undo change tree. |
| **which-key.nvim** | Shows visual help for keybindings. |
| **zen-mode.nvim** | Distraction-free writing mode. |

---

## ✂️ Snippets

Snippets are managed by LuaSnip and loaded from JSON files in `nvim/snippets/`.

### Go (`go.json`)
| Prefix | Description |
| :--- | :--- |
| `echo` | Handler Pattern for Echo Framework |
| `gosafe` | Panic-safe Goroutine |
| `tdt` | Boilerplate for Table Driven Tests |
| `seltime` | Select with Timeout |
| `msi` | Shortcut for `map[string]interface{}` |
| `gmain` | Main function with run pattern |

### Python - Odoo (`python.json`)
These snippets are designed for Odoo module development.

| Prefix | Description |
| :--- | :--- |
| `omodel` | Define a new Odoo Model |
| `oinherit` | Inherit an existing Model |
| `oc` | Char Field |
| `oi` | Integer Field |
| `of` | Float Field |
| `ob` | Boolean Field |
| `om2o` | Many2one Field |
| `oo2m` | One2many Field |
| `om2m` | Many2many Field |
| `osel` | Selection Field |
| `odate` | Date Field |
| `odt` | Datetime Field |
| `ocompute` | Computed field with its method |
| `oonchange` | Onchange Method |
| `ocreate` | Override Create Method |
| `owrite` | Override Write Method |
| `omanifest` | Manifest file structure |

### XML - Odoo (`xml.json`)
Snippets for Odoo views and data in XML.

| Prefix | Description |
| :--- | :--- |
| `orec` | Generic `<record>` block |
| `oform` | Form View Definition |
| `olist` | List (Tree) View Definition |
| `osearch` | Search View Definition with filters |
| `oaction` | Window Action |
| `omenu` | Menu Item |
| `oxpath` | View inheritance with XPath |
