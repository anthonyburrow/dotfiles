from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    Color,
    default,
    black,
    magenta,
    bright_red,
    normal,
)


class EnvTheme(ColorScheme):

    def use(self, context):
        fg = default
        bg = default

        dir_color = bright_red
        exe_color = black
        link_color = magenta
        select_color = black

        attr = normal

        if context.directory:
            fg = dir_color
        elif context.executable:
            fg = exe_color
        elif context.link:
            fg = link_color

        if context.selected:
            fg = Color.number(1)
            bg = select_color

        return fg, bg, attr
