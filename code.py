#!/usr/bin/env python3

import gi
import subprocess

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk

# List of applications to install
applications = [
    ("Edge", "install_edge"),
    ("VS-Code", "install_vscode"),
    ("Chrome", "install_chrome"),
    ("qBittorrent", "install_qbittorrent"),
    ("VLC", "install_vlc"),
    ("Vim", "install_vim"),
    ("Alacritty", "install_alacritty"),
    ("Starship", "install_starship"),
    ("Nerd-Fonts", "install_nerd_fonts"),
    ("Qtile", "install_qtile"),
    ("Start Downloading", "All"),
]

# Function to execute the installation commands
def run_installation(_, app_name, install_function):
    try:
        subprocess.run(
            ["gnome-terminal", "--", "bash", "-c", f"sudo ./automate.sh {install_function}; bash"],
            check=True,
        )
    except Exception as e:
        Gtk.MessageDialog(
            transient_for=window,
            modal=True,
            message_type=Gtk.MessageType.ERROR,
            buttons=Gtk.ButtonsType.OK,
            text=f"Error: {str(e)}",
        ).run()

# Function to create and set up the GUI
def setup_gui():
    grid = Gtk.Grid(column_spacing=10, row_spacing=10)

    for i, (app_name, install_function) in enumerate(applications):
        button = Gtk.Button(label=app_name)

        # Apply a better design to the buttons
        context = button.get_style_context()
        context.add_class(Gtk.STYLE_CLASS_BUTTON)
        context.add_class("better-button")
        context.add_provider(
            Gtk.CssProvider(),
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
        )

        button.connect("clicked", run_installation, app_name, install_function)
        if i % 2 == 0:
            # Place two buttons in one line
            box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
            box.pack_start(button, True, True, 0)
            grid.attach(box, 0, i // 2, 1, 1)
        else:
            box.pack_end(button, True, True, 0)

    scrolled_window = Gtk.ScrolledWindow()
    scrolled_window.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
    scrolled_window.add(grid)

    window = Gtk.Window(title="Application Installer")
    window.set_border_width(20)
    window.set_default_size(400, 400)  # Adjust the size of the window (width, height)
    window.set_position(Gtk.WindowPosition.CENTER)
    window.connect("delete-event", Gtk.main_quit)
    window.add(scrolled_window)
    window.show_all()

    return window


if __name__ == "__main__":
    # Load CSS styling
    css_provider = Gtk.CssProvider()
    css_provider.load_from_data(b"""
        .better-button {
            margin:3px 50px;
            min-width: 150px;
            min-height: 25px;
        }
        .better-button:hover {
            background-color: #2980b9;
        }
    """)

    # Get the default display and add the CSS provider
    display = Gdk.Display.get_default()
    screen = display.get_default_screen()
    Gtk.StyleContext.add_provider_for_screen(
        screen,
        css_provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
    )

    window = setup_gui()
    Gtk.main()
