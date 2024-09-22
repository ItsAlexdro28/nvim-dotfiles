# Neovim config files

this is my personal configuration from scratch
all taken from reddit suggestions, yt videos and more

## Dependencies

- node.js
- ripgrep
- fd
- A Nerd Font
- cmake
- git

## Keybindings

### Custom 

| Keybinding         | Mode  | Description                  |
| ------------------ | ----- | ---------------------------- |
| `:Nt`                | Normal| Show NeoTree in the right       |

### LSP Keybindings

| Keybinding         | Mode  | Description                  |
| ------------------ | ----- | ---------------------------- |
| `K`                | Normal| Show hover information       |
| `gd`               | Normal| Go to definition             |
| `gD`               | Normal| Go to declaration            |
| `gi`               | Normal| Go to implementation         |
| `go`               | Normal| Go to type definition        |
| `gr`               | Normal| Show references              |
| `gs`               | Normal| Show signature help          |
| `<F2>`             | Normal| Rename symbol                |
| `<F3>`             | Normal/Visual| Format code                  |
| `<F4>`             | Normal| Show code actions            |

---

### Telescope Keybindings

| Keybinding         | Mode  | Description              |
| ------------------ | ----- | ------------------------ |
| `<leader>ff`       | Normal| Find files               |
| `<leader>fg`       | Normal| Live grep search         |
| `<leader>fb`       | Normal| List buffers             |
| `<leader>fh`       | Normal| Find help tags           |

---

### Snippy Keybindings

| Keybinding         | Mode      | Description                      |
| ------------------ | --------- | -------------------------------- |
| `<Tab>`            | Insert    | Expand or advance snippet        |
| `<S-Tab>`          | Insert    | Jump to previous snippet section |
| `<Tab>`            | Select/Insert| Jump to next snippet section     |
| `<S-Tab>`          | Select/Insert| Jump to previous snippet section |
| `<Tab>`            | Visual    | Cut text for snippet             |

---

### CMP (Completion) Keybindings

| Keybinding         | Mode   | Description                                 |
| ------------------ | ------ | ------------------------------------------- |
| `<C-b>`            | Insert | Scroll up documentation                     |
| `<C-f>`            | Insert | Scroll down documentation                   |
| `<C-n>`            | Insert | Select next completion item                 |
| `<C-p>`            | Insert | Select previous completion item             |
| `<C-Space>`        | Insert | Trigger completion                          |
| `<C-e>`            | Insert | Abort completion                            |
| `<CR>`             | Insert | Confirm selection (with selection enabled)  |