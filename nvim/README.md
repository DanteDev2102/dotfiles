# Documentación de Configuración de Neovim

Este repositorio contiene mi configuración personal de Neovim, optimizada para desarrollo en Go, Rust, Python (Odoo) y NixOS.

## 🗺️ Keymaps

Aquí se describen los atajos de teclado configurados. La tecla líder (`<leader>`) está configurada como `Espacio`.

### General
| Keymap | Modo | Acción |
| :--- | :--- | :--- |
| `<C-s>` | Normal, Insert | Guardar archivo (`:w`) |
| `<Esc>` | Normal | Limpiar resaltado de búsqueda (`:nohlsearch`) |
| `<leader>wv` | Normal | Dividir ventana verticalmente |
| `<leader>wh` | Normal | Dividir ventana horizontalmente |
| `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | Normal | Navegar entre ventanas (Izquierda, Abajo, Arriba, Derecha) |
| `<Tab>` | Normal | Siguiente buffer |
| `<S-Tab>` | Normal | Anterior buffer |
| `<leader>bd` | Normal | Cerrar buffer actual |
| `<leader>as` | Normal | Buscar Símbolos (Aerial) |

### Plugins
#### Aerial (Símbolos)
- `<leader>cs`: Alternar panel de símbolos.

#### Conform (Formato)
- `<leader>f`: Formatear archivo.

#### Flash (Navegación Rápida)
- `s`: Saltar a cualquier lugar (Flash jump).
- `S`: Flash Treesitter.
- `<c-s>`: Alternar búsqueda Flash.

#### Harpoon (Marcas de Archivos)
- `<leader>a`: Añadir archivo a Harpoon.
- `<C-e>`: Menú rápido de Harpoon.
- `<leader>1/2/3`: Ir al archivo 1, 2 o 3.

#### LazyGit
- `<leader>lg`: Abrir LazyGit.

#### LSP (Language Server Protocol)
- `gd`: Ir a definición.
- `gr`: Ver referencias.
- `K`: Mostrar documentación (Hover).
- `<leader>rn`: Renombrar símbolo.
- `<leader>ca`: Acciones de código (Code Action).
- `<leader>d`: Mostrar diagnóstico en ventana flotante.
- `[d`, `]d`: Ir al diagnóstico anterior/siguiente.

#### Obsidian (Notas)
- `<leader>on`: Nueva nota.
- `<leader>oo`: Buscar en notas.
- `<leader>ot`: Insertar plantilla.
- `<leader>ob`: Ver backlinks.

#### Oil (Gestor de Archivos)
- `-`: Abrir Oil (directorio actual).

#### Persistence (Sesiones)
- `<leader>qs`: Restaurar sesión.
- `<leader>ql`: Restaurar última sesión.
- `<leader>qd`: Detener guardado de sesión.

#### Telescope (Buscador)
- `<leader>ff`: Buscar archivos.
- `<leader>fg`: Buscar texto (Grep).
- `<leader>fb`: Buscar buffers.
- `<leader>fh`: Ayuda de Neovim.
- `<leader>fo`: Archivos recientes.
- `<leader>fn`: Notificaciones.
- `<leader>fc`: Configuración de Neovim.

#### Trouble (Diagnósticos)
- `<leader>xx`: Alternar diagnósticos del proyecto.
- `<leader>xb`: Diagnósticos del buffer actual.
- `<leader>cs`: Símbolos del proyecto.
- `<leader>cl`: Definiciones/referencias LSP.

#### Twilight & Zen Mode
- `<leader>tw`: Alternar Twilight (atenúa código inactivo).
- `<leader>z`: Modo Zen (sin distracciones).

#### Undotree
- `<leader>u`: Árbol de deshacer.

---

## ⚙️ Opciones de Neovim

Estas son las configuraciones principales establecidas en `lua/config/options.lua`:

- **Apariencia**:
  - `termguicolors`: Habilita colores verdaderos (24-bit).
  - `number` / `relativenumber`: Muestra números de línea relativos.
  - `signcolumn`: Siempre muestra la columna de signos (para evitar saltos visuales).
  - `wrap`: Deshabilita el ajuste de línea automático.
  - `scrolloff`: Mantiene 8 líneas de contexto al hacer scroll vertical.
  - `laststatus`: 3 (Barra de estado global).

- **Comportamiento**:
  - `clipboard`: `unnamedplus` (Usa el portapapeles del sistema).
  - `mouse`: Habilitado en todos los modos.
  - `confirm`: Pide confirmación al salir con cambios sin guardar.
  - `ignorecase` / `smartcase`: Búsqueda insensible a mayúsculas, excepto si se escribe una mayúscula.
  - `undofile`: Guarda el historial de deshacer en disco (persistente).
  - `splitbelow` / `splitright`: Las divisiones nuevas aparecen abajo y a la derecha.

- **Indentación**:
  - `tabstop` / `shiftwidth`: 4 espacios.
  - `expandtab`: Usa espacios en lugar de tabs reales.
  - `smartindent`: Autoindentación inteligente.

---

## 🧩 Plugins

Lista de plugins instalados y su justificación:

| Plugin | Justificación |
| :--- | :--- |
| **lazy.nvim** | Gestor de plugins moderno y rápido. |
| **aerial.nvim** | Navegación por estructura de código (clases, funciones). |
| **nvim-ts-context-commentstring** | Comentarios inteligentes basados en el contexto (útil para React/JSX). |
| **conform.nvim** | Formateador de código universal (Go, Python, JS, etc.). |
| **dashboard-nvim** | Pantalla de inicio personalizada con accesos rápidos. |
| **direnv.vim** | Integración con `direnv` para entornos por directorio. |
| **dressing.nvim** | Mejora la interfaz de inputs y selects de Vim. |
| **dropbar.nvim** | Barra de "migas de pan" (breadcrumbs) en la parte superior. |
| **flash.nvim** | Navegación ultra rápida por el buffer. |
| **fzf-lua** | Búsqueda difusa usando FZF (muy rápido). |
| **gitsigns.nvim** | Muestra cambios de Git en la columna lateral. |
| **harpoon** | Marcado rápido de archivos para alternar entre ellos. |
| **incline.nvim** | Líneas de estado flotantes para cada ventana. |
| **lazygit.nvim** | Integración con la terminal UI de LazyGit. |
| **lint.nvim** | Linter asíncrono (eslint_d, pylint, etc.). |
| **nvim-lspconfig** | Configuraciones base para servidores LSP. |
| **nvim-cmp** | Motor de autocompletado extensible. |
| **lualine.nvim** | Barra de estado inferior elegante y configurable. |
| **noice.nvim** | Reemplaza la UI de mensajes, cmdline y notificaciones. |
| **nvim-notify** | Notificaciones visuales tipo "toast". |
| **obsidian.nvim** | Gestión de notas y conocimientos (Obsidian). |
| **oil.nvim** | Gestor de archivos que funciona como un buffer de edición. |
| **persistence.nvim** | Gestión y restauración de sesiones de trabajo. |
| **rainbow-delimiters.nvim** | Colorea paréntesis y corchetes por pares. |
| **render-markdown.nvim** | Visualización mejorada de Markdown en el editor. |
| **smear-cursor.nvim** | Efecto visual de estela en el cursor. |
| **telescope.nvim** | Buscador extensible (archivos, texto, buffers, etc.). |
| **tokyonight.nvim** | Tema de colores principal. |
| **nvim-treesitter** | Resaltado de sintaxis avanzado y parsing. |
| **nvim-treesitter-context** | Muestra el contexto de la función actual en la parte superior. |
| **trouble.nvim** | Lista bonita para diagnósticos, referencias y errores. |
| **twilight.nvim** | Enfoque en el código actual atenuando el resto. |
| **undotree** | Visualiza el árbol de cambios y deshacer. |
| **which-key.nvim** | Muestra ayudas visuales para los atajos de teclado. |
| **zen-mode.nvim** | Modo de escritura libre de distracciones. |

---

## ✂️ Snippets

Los snippets están gestionados por LuaSnip y se cargan desde archivos JSON en `nvim/snippets/`.

### Go (`go.json`)
| Prefijo | Descripción |
| :--- | :--- |
| `echo` | Patrón de Handler para Echo Framework |
| `gosafe` | Goroutine segura con recuperación de pánico |
| `tdt` | Boilerplate para Table Driven Tests |
| `seltime` | Select con Timeout |
| `msi` | Atajo para `map[string]interface{}` |
| `gmain` | Función main con patrón de ejecución |

### Python - Odoo (`python.json`)
Estos snippets están diseñados para el desarrollo de módulos en Odoo.

| Prefijo | Descripción |
| :--- | :--- |
| `omodel` | Definir un nuevo Modelo de Odoo |
| `oinherit` | Heredar un modelo existente |
| `oc` | Campo Char |
| `oi` | Campo Integer |
| `of` | Campo Float |
| `ob` | Campo Boolean |
| `om2o` | Campo Many2one |
| `oo2m` | Campo One2many |
| `om2m` | Campo Many2many |
| `osel` | Campo Selection |
| `odate` | Campo Date |
| `odt` | Campo Datetime |
| `ocompute` | Campo computado con su método |
| `oonchange` | Método Onchange |
| `ocreate` | Sobreescribir método Create |
| `owrite` | Sobreescribir método Write |
| `omanifest` | Estructura del archivo Manifest |

### XML - Odoo (`xml.json`)
Snippets para vistas y datos de Odoo en XML.

| Prefijo | Descripción |
| :--- | :--- |
| `orec` | Bloque genérico `<record>` |
| `oform` | Definición de Vista Form |
| `olist` | Definición de Vista List (Tree) |
| `osearch` | Definición de Vista Search con filtros |
| `oaction` | Acción de Ventana (Window Action) |
| `omenu` | Elemento de Menú |
| `oxpath` | Herencia de vistas con XPath |
