from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    default,
    normal,
)


class EnvTheme(ColorScheme):

    def use(self, context):
        fg = default
        bg = default

        dir_color = 9
        exe_color = 0
        link_color = 5

        attr = normal


        if context.directory:
            fg = dir_color
        elif context.executable:
            fg = exe_color
        if context.link:
            fg = link_color

        if context.selected:
            bg = fg if fg != default else 8
            fg = 232

        return fg, bg, attr
