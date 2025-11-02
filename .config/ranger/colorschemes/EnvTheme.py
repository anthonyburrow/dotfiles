# ~/.config/ranger/colorschemes/envtheme.py
import os
from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import bold, normal, default_colors


class EnvTheme(ColorScheme):

    COLOR_BACKGROUND = os.environ.get("COLOR_BACKGROUND", "#202020")
    COLOR_FOREGROUND = os.environ.get("COLOR_FOREGROUND", "#d9d9d9")

    COLOR_ACCENT0    = os.environ.get("COLOR_ACCENT0", "#b48ead")
    COLOR_ACCENT1    = os.environ.get("COLOR_ACCENT1", "#88c0d0")
    COLOR_ACCENT2    = os.environ.get("COLOR_ACCENT2", "#88D0BC")
    COLOR_ACCENT3    = os.environ.get("COLOR_ACCENT3", "#889CD0")
    COLOR_ACCENT4    = os.environ.get("COLOR_ACCENT4", "#D98084")
    COLOR_ACCENT5    = os.environ.get("COLOR_ACCENT5", "#D9A880")
    COLOR_ACCENT6    = os.environ.get("COLOR_ACCENT6", "#D9D580")
    COLOR_ACCENT7    = os.environ.get("COLOR_ACCENT7", "#b48ead")
    COLOR_ACCENT8    = os.environ.get("COLOR_ACCENT8", "#b48ead")
    COLOR_ACCENT9    = os.environ.get("COLOR_ACCENT9", "#b48ead")

    def hex_to_rgb(self, hexstr):
        """Convert #rrggbb → (r,g,b) integers 0–255"""
        hexstr = hexstr.lstrip("#")
        try:
            return tuple(int(hexstr[i:i+2], 16) for i in (0, 2, 4))
        except Exception:
            return (255, 255, 255)  # fallback to white

    def rgb_to_safe(self, r, g, b):
        """
        Convert RGB 0–255 → nearest xterm 256-color index.
        Uses grayscale if r≈g≈b and dark.
        """
        # If gray-ish
        if abs(r-g)<10 and abs(g-b)<10:
            gray_index = int((r/255)*23) + 232
            return max(0, min(gray_index, 255))
        # Otherwise use 6x6x6 cube
        r_idx = int((r / 255) * 5)
        g_idx = int((g / 255) * 5)
        b_idx = int((b / 255) * 5)
        val = 16 + 36*r_idx + 6*g_idx + b_idx
        return max(0, min(val, 255))

    def use(self, context):
        """
        Return (fg, bg, attr) tuple depending on context.
        Always safe, never crashes.
        """
        fg = default_colors[0]
        bg = default_colors[1]
        attr = normal

        if context.in_titlebar:
            fg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_ACCENT0))
        if context.in_statusbar:
            fg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_ACCENT1))
        if context.in_browser:
            if context.executable:
                fg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_ACCENT1))
            if getattr(context, "tag_marker", False):
                fg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_ACCENT1))
        if context.selected:
            fg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_BACKGROUND))
            bg = self.rgb_to_safe(*self.hex_to_rgb(self.COLOR_ACCENT0))
            attr |= bold

        return fg, bg, attr
