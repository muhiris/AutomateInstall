
### Automate Installing Apps

A Python GTK-3 based application that automates the installation of multiple applications on your system. The script provides a user-friendly GTK interface to select and install various applications without the need for manual installation commands.

#### Requirements


   ```bash
   sudo apt install python3
   ```

#### Installation

###### Using Debian Package (DEB)

1. Download the DEB package from the releases page.
2. Install the DEB package using the following command:

   ```bash
   sudo dpkg -i automate-install.deb
   ```

#### Running the Application

After the installation, you can run the application from the command line using the following command:

```bash
python3 /usr/bin/code.py
```

The application will display a GTK graphical interface where you can select the applications you want to install. Simply click on the application buttons, and the installation process will start in a new terminal.

## Customization

You can customize the list of applications available for installation by modifying the `applications` list in the `code.py` script. Each entry in the list represents an application with its name and the corresponding installation function.
