config.load_autoconfig(False)

# Rosé Pine Moon Theme
bg_main, bg_surface, bg_overlay = '#000000', '#232136', '#2d2a45'
fg_main, fg_subtle = '#e0def4', '#908caa'
love, gold, iris, foam, pine, rose, green = '#eb6f92', '#f6c177', '#c4a7e7', '#9ccfd8', '#569fba', '#ea9a97', '#a3be8c'

# Completion
c.completion.shrink, c.completion.use_best_match = True, True
c.completion.open_categories = ['history', 'searchengines', 'bookmarks', 'filesystem']
c.colors.completion.category.bg = c.colors.completion.category.border.bottom = c.colors.completion.category.border.top = bg_main
c.colors.completion.category.fg = iris
c.colors.completion.even.bg, c.colors.completion.odd.bg = bg_main, bg_surface
c.colors.completion.fg, c.colors.completion.match.fg = fg_main, iris
c.colors.completion.item.selected.bg, c.colors.completion.item.selected.fg = bg_overlay, iris
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top = iris
c.colors.completion.scrollbar.bg, c.colors.completion.scrollbar.fg = bg_main, fg_subtle

# Statusbar
c.statusbar.show, c.statusbar.position = 'never', 'top'
c.statusbar.widgets = ['keypress', 'url', 'scroll', 'history', 'tabs', 'progress']
c.colors.statusbar.normal.bg = c.colors.statusbar.command.bg = bg_main
c.colors.statusbar.normal.fg = c.colors.statusbar.command.fg = fg_main
c.colors.statusbar.insert.bg, c.colors.statusbar.insert.fg = pine, bg_main
c.colors.statusbar.caret.bg, c.colors.statusbar.caret.fg = iris, bg_main
c.colors.statusbar.caret.selection.bg, c.colors.statusbar.caret.selection.fg = iris, bg_main
c.colors.statusbar.progress.bg = iris
c.colors.statusbar.url.fg, c.colors.statusbar.url.error.fg = fg_main, love
c.colors.statusbar.url.hover.fg, c.colors.statusbar.url.warn.fg = foam, iris
c.colors.statusbar.url.success.http.fg = c.colors.statusbar.url.success.https.fg = pine

# Tabs
c.tabs.position, c.tabs.width, c.tabs.padding = 'left', '15%', {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}
c.tabs.show, c.tabs.favicons.show, c.tabs.indicator.width = 'never', 'always', 1
c.tabs.title.format = '{index}: {current_title}'
c.colors.tabs.bar.bg = bg_main
c.colors.tabs.even.bg, c.colors.tabs.odd.bg = bg_main, bg_surface
c.colors.tabs.even.fg, c.colors.tabs.odd.fg = fg_subtle, fg_subtle
c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg = bg_overlay
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg = iris
c.colors.tabs.indicator.start, c.colors.tabs.indicator.stop, c.colors.tabs.indicator.error = iris, foam, love

# Messages & Prompts
c.colors.messages.error.bg, c.colors.messages.error.fg = love, bg_main
c.colors.messages.warning.bg, c.colors.messages.warning.fg = iris, bg_main
c.colors.messages.info.bg, c.colors.messages.info.fg = bg_main, fg_main
c.colors.prompts.bg, c.colors.prompts.fg = bg_main, fg_main
c.colors.prompts.border = '1px solid ' + bg_overlay

# Hints
c.hints.chars, c.hints.uppercase = 'asdfghjkl;', True
c.colors.hints.bg, c.colors.hints.fg, c.colors.hints.match.fg = iris, bg_main, bg_main

# Fonts
c.fonts.default_family = 'JetBrainsMono Nerd Font'
c.fonts.default_size = '10pt'
c.fonts.statusbar = c.fonts.tabs.selected = c.fonts.tabs.unselected = '10pt "JetBrainsMono Nerd Font"'

# Security & Optimization
c.auto_save.session = True
c.content.autoplay = False
c.content.blocking.enabled, c.content.blocking.method = True, 'both'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt"
]
c.content.cookies.accept, c.content.headers.do_not_track = 'no-3rdparty', True
c.content.canvas_reading, c.content.webgl = False, False
c.content.geolocation, c.content.notifications.enabled = False, False
c.content.media.audio_capture, c.content.media.video_capture = False, False
c.content.media.audio_video_capture, c.content.desktop_capture = False, False
c.content.mouse_lock, c.content.pdfjs, c.content.dns_prefetch = False, True, True
c.content.javascript.can_open_tabs_automatically = False
c.content.headers.referer = 'same-domain'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = bg_main
c.search.incremental, c.scrolling.smooth = True, True

# Keybindings
config.bind('<Space>f', 'config-cycle statusbar.show always never ;; config-cycle tabs.show always never')
config.bind('<Space>q', 'tab-close')
config.bind('<Space>sf', 'cmd-set-text -s :tab-select')
config.bind('<Space>s.', 'cmd-set-text -s :open ')
config.bind('<Space>sg', 'set completion.open_categories ["history"] ;; cmd-set-text -s :open ')
config.bind('<Space>o', 'set completion.open_categories [] ;; cmd-set-text -s :open -s')
config.bind('<Space>hl', 'set completion.open_categories ["bookmarks"] ;; cmd-set-text -s :open -s -t ')
config.bind('<Space>ha', 'bookmark-add')
config.bind('<Space>hp', 'tab-pin')
config.bind('<Space>j', 'forward')
config.bind('<Space>l', 'back')
config.bind('<Space>T', 'config-cycle tabs.position left top')
config.bind('<Space>i', 'devtools')
config.bind('<Space>gr', 'greasemonkey-reload')
for i in range(1, 10): config.bind(f'<Space>{i}', f'tab-focus {i}')
config.bind('<Space>wv', 'cmd-set-text -s :open -w')
config.bind('<Space>wh', 'cmd-set-text -s :open -t')
config.bind('<Space>nw', 'open -w')
config.bind('<Space>np', 'cmd-set-text -s :open -p')
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
config.bind('H', 'back')
config.bind('L', 'forward')
config.bind('<Space>r', 'reload')
config.bind('<Esc>', 'clear-keychain ;; search ;; mode-leave')

# Menu Navigation
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-j>', 'prompt-item-focus next', mode='prompt')
config.bind('<Ctrl-k>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Return>', 'completion-item-focus next ;; command-accept', mode='command')
config.bind('<Ctrl-a>', 'rl-beginning-of-line', mode='command')
config.bind('<Ctrl-e>', 'rl-end-of-line', mode='command')
config.bind('<Ctrl-u>', 'rl-unix-line-discard', mode='command')
config.bind('<Ctrl-w>', 'rl-rubout', mode='command')
