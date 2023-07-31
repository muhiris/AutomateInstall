
### Automate Installing Apps

A Python GTK-3 based application that automates the installation of multiple applications on your system. The script provides a user-friendly GTK interface to select and install various applications without the need for manual installation commands.

#### Requirements

 ```bash
   sudo apt install python3
   ```

#### Installation

###### Using Debian Package (DEB)

1. Download the DEB package from the releases page [here](https://github.com/muhiris/AutomateInstall/releases/download/v1.0/v0.1.0-automate-install.deb).
2. Install the DEB package using the following command:

   ```bash
   sudo dpkg -i AutomateInstall.deb
   ```

## Running the Application

After the installation, you can run the application from the command line using the following command:

```bash
python3 /usr/bin/code.py
```

The application will display a GTK graphical interface where you can select the applications you want to install. Simply click on the application buttons, and the installation process will start in a new terminal.

### Applications Available for Installation

The following applications are available for installation through the Automate Installing Apps application:

- Microsoft Edge
- Visual Studio Code
- Google Chrome
- qBittorrent
- VLC
- Vim
- Alacritty
- Starship
- Nerd Fonts
- Qtile

#### Customization

You can customize the list of applications available for installation by modifying the `applications` list in the `code.py` script. Each entry in the list represents an application with its name and the corresponding installation function.

#### Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/muhiris/AutomateInstall).
