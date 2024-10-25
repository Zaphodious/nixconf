# NixVim Custom Remaps

Auto-generated ./nixvim/config/remaps.json

## Modals

Commands that open windows/views that have their own internal key bindings

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;t  | Opens the Neotree sidebar | n |  :Neotree &lt;CR&gt;  |
|  gb  | Opens the snipe menu (goto snipe) | n |  :lua require(&quot;snipe&quot;).open_buffer_menu() &lt;CR&gt;  |
|  &lt;leader&gt;u  | Opens Undo Tree | n |  :UndotreeToggle &lt;CR&gt;  |
|  gnt  | Opens a new terminal in the current buffer | n |  :terminal  |
|  &lt;leader&gt;gt  | Opens a new terminal in a window below the current one | n |  :belowright split | :terminal  |


## Terminal

Commands regarding neovim terminals

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;Esc&gt;&lt;Esc&gt;  | Exit terminal mode (goes to normal mode in the buffer) | t |  &lt;C-\&gt;&lt;C-n&gt;  |


## Splits

Movement relating to vim window splits

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;ww  | Open a new vertical split | n |  :belowright vsplit  |
|  &lt;leader&gt;wh  | Open a new horizontal split | n |  :belowright split  |
|  &lt;leader&gt;wq  | Close a split | n |  &lt;C-w&gt;q  |
|  &lt;leader&gt;wr  | Resize the current vertical split to 80 | n |  &lt;C-w&gt;80|  |
|  &lt;leader&gt;w=  | Equalize the width of splits | n |  &lt;C-w&gt;=  |
|  &lt;tab&gt;l  | Move between splits: Left | n |  &lt;C-w&gt;l  |
|  &lt;tab&gt;k  | Move between splits: Up | n |  &lt;C-w&gt;k  |
|  &lt;tab&gt;j  | Move between splits: Down | n |  &lt;C-w&gt;j  |
|  &lt;tab&gt;h  | Move between splits: Right | n |  &lt;C-w&gt;h  |


## Git

Bindings for Fugitive

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;gs  | Open the Fugitive Git view | n |  :Git&lt;cr&gt;  |
|  &lt;leader&gt;gp  | Git: Push to the remote | n |  :Git push&lt;cr&gt;  |
|  &lt;leader&gt;gc  | Git: Add everything and commit | n |  :Git add -A | :Git commit&lt;cr&gt;  |


## Telescope

Bindings for Telescope

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;pf  | Fuzzy Find | n |  :Telescope find_files&lt;cr&gt;  |
|  &lt;leader&gt;pg  | Fuzzy Find within git | n |  :Telescope git_files&lt;cr&gt;  |
|  &lt;leader&gt;ps  | Fuzzy Find with Grep | n |  :Telescope live_grep&lt;cr&gt;  |


## Misc

Misc functionality

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;rn  | Rename-refactors symbol in project (make sure to :wa afterword) | n |  &lt;cmd&gt;lua vim.lsp.buf.rename()&lt;CR&gt;  |
|  &lt;leader&gt;rt  | Replace text matches under cursor | n |  [[:%s/\&lt;&lt;C-r&gt;&lt;C-w&gt;\&gt;/&lt;C-r&gt;&lt;C-w&gt;/gI&lt;Left&gt;&lt;Left&gt;&lt;Left&gt;]]  |


## LSP Actions

Mappings that get applied when the LSP connects

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  gd  | Jump to definition | n |  :lua vim.lsp.buf.definition()&lt;cr&gt;  |
|  gh  | Displays hover info about the symbol under cursor | n |  :lua vim.lsp.buf.hover()&lt;cr&gt;  |
|  &lt;leader&gt;vws  | Lists all symbols in the current workspace in the quickfix window | n |  :lua vim.lsp.buf.workspace_symbol()&lt;cr&gt;  |
|  &lt;leader&gt;vd  | Opens float | n |  :lua vim.lsp.buf.open_float()&lt;cr&gt;  |
|  [d  | Go to the next instance of this symbol | n |  :lua vim.lsp.buf.goto_next()&lt;cr&gt;  |
|  ]d  | Go to the previous instance of this symbol | n |  :lua vim.lsp.buf.goto_prev()&lt;cr&gt;  |
|  &lt;leader&gt;vca  | Selects a code action available at the current cursor position | n |  :lua vim.lsp.buf.code_action()&lt;cr&gt;  |
|  &lt;leader&gt;vrr  | Lists all the references to the symbol under the cursor in the quickfix window | n |  :lua vim.lsp.buf.references()&lt;cr&gt;  |
|  &lt;leader&gt;vrn  | Rename the symbol in the project. | n |  :lua vim.lsp.buf.rename()&lt;cr&gt;  |
|  &lt;C-h&gt;  | Displays signature information about the symbol under the cursor in a floating window | n |  :lua vim.lsp.buf.signature_help()&lt;cr&gt;  |
|  &lt;leader&gt;f  | Formats a buffer using the attached (and optionally filtered) language server clients. | n |  :lua vim.lsp.buf.format()&lt;cr&gt;  |


## NeoTree

Mappings used when the cursor is inside a NeoTree window

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  l  | Toggles the folder under the cursor in tree view | n |  toggle_node  |


## Snipe

Mappings for inside the Snipe window

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  J  | Go to the next page (when list is long) |  |  next_page  |
|  K  | Go to the previous page (when list is long) |  |  next_page  |
|  &lt;cr&gt;  | Key that selects the item under the cursor |  |  under_cursor  |
|  &lt;esc&gt;  | Cancels snipe navigation |  |  cancel_snipe  |
|  q  | Closes the buffer under the cursor |  |  close_buffer  |




