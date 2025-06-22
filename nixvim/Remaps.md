# NixVim Custom Remaps

Auto-generated from [remaps.json](/nixvim/config/keys/remaps.json)
by [gen-nixvim-mapping-md.sh](/nixvim/config/keys/gen-nixvim-mapping-md)

Note that the contents of the "action" field are only 
what is passed to the respective nix config module, and 
are not necessarily what is triggerd within neovim.

## Debugging

How to control the debugger

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;b  | Sets a breakpoint | n |  :lua require&#x27;dap&#x27;.toggle_breakpoint() &lt;CR&gt;  |
|  &lt;F4&gt;  | Continues/runs debug session | n |  :lua require&#x27;dap&#x27;.continue() &lt;CR&gt;  |
|  &lt;leader&gt;dd  | Continues/runs debug session | n |  :lua require&#x27;dapui&#x27;.toggle() &lt;CR&gt;  |
|  &lt;F10&gt;  | Steps over the current debug line | n |  :lua require&#x27;dap&#x27;.step_over() &lt;CR&gt;  |
|  &lt;F11&gt;  | Steps into the current debug line | n |  :lua require&#x27;dap&#x27;.step_into() &lt;CR&gt;  |
|  &lt;F12&gt;  | Steps out of the current debug line | n |  :lua require&#x27;dap&#x27;.step_out() &lt;CR&gt;  |
|  &lt;leader&gt;dg  | Starts the debugger on the nearest Golang test | n |  :lua require(&#x27;dap-go&#x27;).debug_test() &lt;CR&gt;  |
|  &lt;leader&gt;dlg  | Starts the debugger on the Golang test last debugged | n |  :lua require(&#x27;dap-go&#x27;).debug_last_test() &lt;CR&gt;  |


## Modals

Commands that open windows/views that have their own internal key bindings

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;n  | Opens the Neotree sidebar | n |  :Neotree &lt;CR&gt;  |
|  &lt;leader&gt;N  | Opens the Neotree sidebar | n |  :Neotree toggle &lt;CR&gt;  |
|  &lt;leader&gt;o  | Opens the Oil file view | n |  :Oil --float &lt;CR&gt;  |
|  gb  | Opens the snipe menu (goto snipe) | n |  :lua require(&quot;snipe&quot;).open_buffer_menu() &lt;CR&gt;  |
|  &lt;leader&gt;u  | Opens Undo Tree | n |  :UndotreeToggle &lt;CR&gt;  |
|  gnt  | Opens a new terminal in the current buffer | n |  :terminal  |
|  &lt;leader&gt;gt  | Opens a new terminal in a window below the current one | n |  :belowright split | :terminal  |


## Terminal

Commands useful in neovim terminals

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;Esc&gt;  | Exit terminal mode (goes to normal mode in the buffer) | t |  &lt;C-\&gt;&lt;C-n&gt;  |


## Prose Editing

Keymaps for making nvim better at editing prose

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  j  | Makes it so that moving up and down works normally for soft wraps | n |  gj  |
|  k  | Makes it so that moving up and down works normally for soft wraps | n |  gk  |
|  j  | Makes it so that moving up and down works normally for soft wraps | v |  gj  |
|  k  | Makes it so that moving up and down works normally for soft wraps | v |  gk  |
|  &lt;leader&gt;sc  | Enable spell check in the buffer. See [the wiki article](https://neovim.io/doc/user/spell.html) | n |  :setlocal spell spelllang=en_us&lt;CR&gt;  |
|  &lt;leader&gt;rm  | Enable spell check in the buffer. See [the wiki article](https://neovim.io/doc/user/spell.html) | n |  :RenderMarkdown toggle&lt;CR&gt;  |


## Splits

Movement relating to vim window splits

Config module: 
keymaps

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


## Harpoon

Keymaps for Harpooning around nVim

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;a  | Adds a file to harpoon | n |  :lua require&#x27;harpoon&#x27;:list():add() &lt;cr&gt;  |
|  &lt;leader&gt;h  | Go to the Harpoon quick menu | n |  :lua require&#x27;harpoon&#x27;.ui:toggle_quick_menu(require&#x27;harpoon&#x27;:list()) &lt;cr&gt;  |


## Harpoon files

Keymaps for switching between Harpoon marks

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;1  | Go to File 1 | n |  :lua require&#x27;harpoon&#x27;:list():select(1) &lt;cr&gt;  |
|  &lt;leader&gt;2  | Go to File 2 | n |  :lua require&#x27;harpoon&#x27;:list():select(2) &lt;cr&gt;  |
|  &lt;leader&gt;3  | Go to File 3 | n |  :lua require&#x27;harpoon&#x27;:list():select(5) &lt;cr&gt;  |
|  &lt;leader&gt;4  | Go to File 4 | n |  :lua require&#x27;harpoon&#x27;:list():select(4) &lt;cr&gt;  |
|  &lt;leader&gt;5  | Go to File 5 | n |  :lua require&#x27;harpoon&#x27;:list():select(5) &lt;cr&gt;  |


## Git

Bindings for Fugitive

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;gs  | Open the Fugitive Git view | n |  :Git&lt;cr&gt;  |
|  &lt;leader&gt;gp  | Git: Push to the remote | n |  :Git push&lt;cr&gt;  |
|  &lt;leader&gt;gc  | Git: Add everything and commit | n |  :Git add -A | :Git commit&lt;cr&gt;  |


## Telescope

Bindings for Telescope

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;pf  | Fuzzy Find | n |  :Telescope find_files&lt;cr&gt;  |
|  &lt;leader&gt;pg  | Fuzzy Find within git | n |  :Telescope git_files&lt;cr&gt;  |
|  &lt;leader&gt;ps  | Fuzzy Find with Grep | n |  :Telescope live_grep&lt;cr&gt;  |


## Misc

Misc functionality

Config module: 
keymaps

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;godot  | Starts listening for open-file messages from a properly configured Godot | n |  :echo serverstart(&#x27;/tmp/godot.pipe&#x27;)  |
|  &lt;leader&gt;rt  | Replace text matches under cursor | n |  [[:%s/\&lt;&lt;C-r&gt;&lt;C-w&gt;\&gt;/&lt;C-r&gt;&lt;C-w&gt;/gI&lt;Left&gt;&lt;Left&gt;&lt;Left&gt;]]  |


## LSP Actions

Mappings that get applied when the LSP connects

Config module: 
plugins.lsp.keymaps.extra

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;leader&gt;rn  | Rename-refactors symbol in project (make sure to :wa afterword) | n |  :lua vim.lsp.buf.rename()&lt;CR&gt;  |
|  gd  | Jump to definition | n |  :lua vim.lsp.buf.definition()&lt;cr&gt;  |
|  gh  | Displays hover info about the symbol under cursor | n |  :lua vim.lsp.buf.hover()&lt;cr&gt;  |
|  &lt;leader&gt;vws  | Lists all symbols in the current workspace in the quickfix window | n |  :lua vim.lsp.buf.workspace_symbol()&lt;cr&gt;  |
|  &lt;leader&gt;vd  | Opens float | n |  :lua vim.lsp.buf.open_float()&lt;cr&gt;  |
|  [d  | Go to the next instance of this symbol | n |  :lua vim.lsp.buf.goto_next()&lt;cr&gt;  |
|  ]d  | Go to the previous instance of this symbol | n |  :lua vim.lsp.buf.goto_prev()&lt;cr&gt;  |
|  &lt;leader&gt;vca  | Selects a code action available at the current cursor position | n |  :lua vim.lsp.buf.code_action()&lt;cr&gt;  |
|  &lt;leader&gt;vrr  | Lists all the references to the symbol under the cursor in the quickfix window | n |  :lua vim.lsp.buf.references()&lt;cr&gt;  |
|  &lt;C-h&gt;  | Displays signature information about the symbol under the cursor in a floating window | n |  :lua vim.lsp.buf.signature_help()&lt;cr&gt;  |
|  &lt;leader&gt;f  | Formats a buffer using the attached (and optionally filtered) language server clients. | n |  :lua vim.lsp.buf.format()&lt;cr&gt;  |


## NeoTree

Mappings used when the cursor is inside a NeoTree window

Config module: 
plugins.neo-tree.window.mappings

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  l  | Toggles the folder under the cursor in tree view | n |  toggle_node  |


## Autocomplete

Navigate autocompletion

Config module: 
plugins.cmp.settings.mapping

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  &lt;Down&gt;  | Highlight the next autocomplete item |  |  cmp.mapping.select_next_item()  |
|  &lt;Tab&gt;  | Highlight the next autocomplete item |  |  cmp.mapping.select_next_item()  |
|  &lt;Up&gt;  | Highlight the previous autocomplete item |  |  cmp.mapping.select_prev_item()  |
|  &lt;S-Tab&gt;  | Highlight the previous autocomplete item |  |  cmp.mapping.select_prev_item()  |
|  &lt;CR&gt;  | Select the highlighted autocomplete item |  |  cmp.mapping.confirm({ select = true })  |
|  &lt;C-d&gt;  | Scroll down a page of autocomplete options |  |  cmp.mapping.scroll_docs(-4)  |
|  &lt;C-f&gt;  | Scroll down a page of autocomplete options |  |  cmp.mapping.scroll_docs(4)  |
|  &lt;C-Space&gt;  | Complete the autocomplete |  |  cmp.mapping.complete()  |
|  &lt;S-Esc&gt;  | Close the autocomplete menu |  |  cmp.mapping.close()  |


## Snipe

Mappings for inside the Snipe window

Config module: 
plugins.snipe.navigation.keys

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  J  | Go to the next page (when list is long) |  |  next_page  |
|  K  | Go to the previous page (when list is long) |  |  next_page  |
|  &lt;cr&gt;  | Key that selects the item under the cursor |  |  under_cursor  |
|  &lt;esc&gt;  | Cancels snipe navigation |  |  cancel_snipe  |
|  q  | Closes the buffer under the cursor |  |  close_buffer  |


## User Commands

Ex commands for entering by the user

Config module: 
userCommands

| Keys | Description | Mode | Action |
| --- | --- | --- | --- |
|  Table  | Opens the Neotree sidebar | v |  :&#x27;&lt;,&#x27;&gt; ! tr -s &quot; &quot; |column -t -s &quot;|&quot; -o &quot;|&quot;  |




