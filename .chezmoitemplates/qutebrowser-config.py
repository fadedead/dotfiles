config.load_autoconfig(False)

# Rosé Pine Moon Theme (Black Variant)
base, surface, overlay = "#000000", "#232136", "#2d2a45"
muted, subtle, text = "#6e6a86", "#908caa", "#e0def4"
love, gold, rose, pine, foam, iris = (
    "#eb6f92",
    "#f6c177",
    "#ea9a97",
    "#3e8fb0",
    "#9ccfd8",
    "#c4a7e7",
)

# Completion
c.completion.shrink, c.completion.use_best_match = True, True
c.completion.open_categories = ["history", "searchengines", "bookmarks", "filesystem"]
c.colors.completion.category.bg = base
c.colors.completion.category.fg = iris
c.colors.completion.category.border.top = c.colors.completion.category.border.bottom = (
    base
)
c.colors.completion.even.bg, c.colors.completion.odd.bg = base, surface
c.colors.completion.fg = text
c.colors.completion.match.fg = gold
c.colors.completion.item.selected.bg = overlay
c.colors.completion.item.selected.fg = iris
c.colors.completion.item.selected.match.fg = gold
c.colors.completion.item.selected.border.top = (
    c.colors.completion.item.selected.border.bottom
) = iris
c.colors.completion.scrollbar.bg, c.colors.completion.scrollbar.fg = base, subtle

# Statusbar
c.statusbar.show, c.statusbar.position = "never", "bottom"
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]
c.statusbar.padding = {"top": 4, "bottom": 4, "left": 6, "right": 6}
c.colors.statusbar.normal.bg = c.colors.statusbar.command.bg = base
c.colors.statusbar.normal.fg = c.colors.statusbar.command.fg = text
c.colors.statusbar.insert.bg, c.colors.statusbar.insert.fg = pine, base
c.colors.statusbar.caret.bg, c.colors.statusbar.caret.fg = iris, base
c.colors.statusbar.caret.selection.bg, c.colors.statusbar.caret.selection.fg = (
    iris,
    base,
)
c.colors.statusbar.progress.bg = iris
c.colors.statusbar.url.fg, c.colors.statusbar.url.error.fg = text, love
c.colors.statusbar.url.hover.fg, c.colors.statusbar.url.warn.fg = foam, iris
c.colors.statusbar.url.success.http.fg = c.colors.statusbar.url.success.https.fg = pine

# Tabs
c.tabs.position, c.tabs.width, c.tabs.padding = (
    "left",
    "12%",
    {"top": 6, "bottom": 6, "left": 8, "right": 8},
)
c.tabs.show, c.tabs.favicons.show, c.tabs.indicator.width = "never", "always", 2
c.tabs.title.format = "{index}: {current_title}"
c.tabs.title.format_pinned = "{index}"
c.colors.tabs.bar.bg = base
c.colors.tabs.even.bg, c.colors.tabs.odd.bg = base, surface
c.colors.tabs.even.fg, c.colors.tabs.odd.fg = subtle, subtle
c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg = overlay
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg = iris
(
    c.colors.tabs.indicator.start,
    c.colors.tabs.indicator.stop,
    c.colors.tabs.indicator.error,
) = iris, foam, love

# Messages & Prompts
c.colors.messages.error.bg, c.colors.messages.error.fg = love, base
c.colors.messages.warning.bg, c.colors.messages.warning.fg = iris, base
c.colors.messages.info.bg, c.colors.messages.info.fg = base, text
c.colors.prompts.bg, c.colors.prompts.fg = base, text
c.colors.prompts.border = "1px solid " + overlay

# Hints
c.hints.chars, c.hints.uppercase = "asdfghjkl;", True
c.hints.border = "1px solid " + base
c.hints.padding = {"top": 2, "bottom": 2, "left": 4, "right": 4}
c.hints.radius = 4
c.colors.hints.bg, c.colors.hints.fg = iris, base
c.colors.hints.match.fg = text

# Fonts
font_default = '14pt "JetBrainsMono Nerd Font"'
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.statusbar = c.fonts.tabs.selected = c.fonts.tabs.unselected = c.fonts.hints = (
    font_default
)
c.fonts.completion.entry = c.fonts.completion.category = font_default

# Security & Optimization
c.auto_save.session = True
c.content.autoplay = False
c.content.blocking.enabled, c.content.blocking.method = True, "both"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt",
]
c.content.cookies.accept, c.content.headers.do_not_track = "no-3rdparty", True
c.content.canvas_reading, c.content.webgl = False, False
c.content.mouse_lock, c.content.pdfjs, c.content.dns_prefetch = False, True, True
c.content.javascript.enabled = False
c.content.javascript.can_open_tabs_automatically = False
c.content.headers.referer = "same-domain"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = base
c.search.incremental, c.scrolling.smooth = True, True

# Keybindings
config.bind(
    "<Space>f",
    "config-cycle statusbar.show always never ;; config-cycle tabs.show always never",
)
config.bind("<Space>q", "tab-close")
config.bind("<Space>sf", "cmd-set-text -s :tab-select")
config.bind(
    "<Space>sg",
    'set completion.open_categories ["history"] ;; cmd-set-text -s :open -t',
)
config.bind("<Space>o", "set completion.open_categories [] ;; cmd-set-text -s :open -t")
config.bind(
    "<Space>hl",
    'set completion.open_categories ["bookmarks"] ;; cmd-set-text -s :open -t',
)
config.bind("<Space>ha", "bookmark-add")
config.bind("<Space>hp", "tab-pin")
config.bind("<Space>j", "forward")
config.bind("<Space>k", "back")
config.bind("<Space>i", "devtools")
config.bind("<Space>gr", "greasemonkey-reload")
config.bind("<Space>ej", "set -u {url:host} content.javascript.enabled true ;; reload")
for i in range(1, 10):
    config.bind(f"<Space>{i}", f"tab-focus {i}")
config.bind("<Space>nw", "open -w")
config.bind("<Space>np", "cmd-set-text -s :open -p")
config.bind("<Ctrl-k>", "tab-prev")
config.bind("<Ctrl-j>", "tab-next")
config.bind("<Space>r", "reload")
config.bind("<Esc>", "clear-keychain ;; search ;; mode-leave")

# Menu Navigation (Native Qutebrowser Menu)
config.bind("<Ctrl-j>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-k>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-d>", "completion-item-del", mode="command")
config.bind("<Ctrl-j>", "prompt-item-focus next", mode="prompt")
config.bind("<Ctrl-k>", "prompt-item-focus prev", mode="prompt")
config.bind("<Return>", "completion-item-focus next ;; command-accept", mode="command")
config.bind("<Ctrl-a>", "rl-beginning-of-line", mode="command")
config.bind("<Ctrl-e>", "rl-end-of-line", mode="command")
config.bind("<Ctrl-u>", "rl-unix-line-discard", mode="command")
config.bind("<Ctrl-w>", "rl-rubout", mode="command")
