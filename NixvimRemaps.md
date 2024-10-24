# NixVim Custom Remaps

Auto-generated ./nixvim/config/remaps.json

## Splits

Movement relating to vim window splits

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;ww  | Open a new vertical split | n |  &lt;C-w&gt;v  |
|  &lt;leader&gt;we  | Open a new horizontal split | n |  &lt;C-w&gt;n  |
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
|  &lt;leader&gt;gp  | Push to the remote | n |  :Git push&lt;cr&gt;  |
|  &lt;leader&gt;gc  | Add everything and commit | n |  :Git add -A | :Git commit&lt;cr&gt;  |


## Telescope

Bindings for Telescope

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;pf  | Fuzzy Find | n |  :Telescope find_files&lt;cr&gt;  |
|  &lt;C-p&gt;  | Fuzzy Find within git | n |  :Telescope git_files&lt;cr&gt;  |
|  &lt;leader&gt;ps  | Fuzzy Find with Grep | n |  :Telescope live_grep&lt;cr&gt;  |


## Misc

Misc functionality

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;rn  | Rename-refactors symbol in project (make sure to :wa afterword) | n |  &lt;cmd&gt;lua vim.lsp.buf.rename()&lt;CR&gt;  |
|  &lt;leader&gt;s  | Replace text matches under cursor | n |  [[:%s/\&lt;&lt;C-r&gt;&lt;C-w&gt;\&gt;/&lt;C-r&gt;&lt;C-w&gt;/gI&lt;Left&gt;&lt;Left&gt;&lt;Left&gt;]]  |


## LSP Actions

Mappings that get applied when the LSP connections, that call vim.lsp.buf.&lt;action&gt;

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  gd  | Jump to definition | n |  definition  |
|  gh  | Displays hover info about the symbol under cursor | n |  hover  |
|  &lt;leader&gt;vws  | Lists all symbols in the current workspace in the quickfix window | n |  workspace_symbol  |
|  &lt;leader&gt;vd  | Opens float | n |  open_float  |
|  [d  | Go to the next instance of this symbol | n |  goto_next  |
|  ]d  | Go to the previous instance of this symbol | n |  goto_prev  |
|  &lt;leader&gt;vca  | Selects a code action available at the current cursor position | n |  code_action  |
|  &lt;leader&gt;vrr  | Lists all the references to the symbol under the cursor in the quickfix window | n |  references  |
|  &lt;leader&gt;vrn  | Rename the symbol in the project. | n |  rename  |
|  &lt;C-h&gt;  | Displays signature information about the symbol under the cursor in a floating window | n |  signature_help  |
|  &lt;leader&gt;f  | Formats a buffer using the attached (and optionally filtered) language server clients. | n |  format  |


## NeoTree

Mappings used when the cursor is inside a NeoTree window

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  l  | Toggles the folder under the cursor in tree view |  |  toggle_node  |




