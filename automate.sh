#!/bin/bash

# Function to download and install Microsoft Edge
install_edge() {
    echo "Installing Microsoft Edge..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list
    sudo apt update
    sudo apt install microsoft-edge-dev
}

# Function to download and install Visual Studio Code
install_vscode() {
    echo "Installing Visual Studio Code..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install code
}

# Function to download and install Google Chrome
install_chrome() {
    echo "Installing Google Chrome..."
    wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > google.gpg
    sudo mv google.gpg /etc/apt/trusted.gpg.d/google.gpg
    echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install google-chrome-stable
}

# Function to download and install qBittorrent
install_qbittorrent() {
    echo "Installing qBittorrent..."
    sudo apt install qbittorrent
}

# Function to download and install VLC
install_vlc() {
    echo "Installing VLC..."
    sudo apt install vlc
}

# Function to download and install Vim
install_vim() {
    echo "Installing Vim..."
    sudo apt install vim
}

# Function to install required packages
install_packages() {
    echo "Installing required packages..."
    sudo apt update
    sudo apt install -y build-essential git cmake pkg-config libfreetype6-dev libfontconfig1-dev \
        libxcb-xfixes0-dev libxkbcommon-dev python3 cargo
}

# Function to install Alacritty
install_alacritty() {
    echo "Installing Alacritty..."
    git clone https://github.com/alacritty/alacritty.git
    cd alacritty
    rustup override set stable
    rustup update stable
    sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    cargo build --release
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
}

# Function to install Starship
install_starship() {
    echo "Installing Starship..."
    curl -fsSL https://starship.rs/install.sh | sh
}

# Function to install Nerd Fonts
install_nerd_fonts() {
    echo "Installing Nerd Fonts..."
    mkdir -p ~/.local/share/fonts
    mv "CascadiaCode_Nerd Font" ~/.local/share/fonts
    sudo fc-cache -fv
}

# Function to install Qtile
install_qtile() {
    echo "Installing Qtile..."
    pip install xcffib qtile
    sudo mkdir -p /usr/share/xsessions
    sudo tee /usr/share/xsessions/qtile.desktop <<EOF
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling
EOF
}

# Main script
echo "Starting installation..."
echo "Select the applications you want to install:"

# Options for the user to choose from
select app in "Microsoft Edge" "Visual Studio Code" "Google Chrome" "qBittorrent" "VLC" "Vim" "Alacritty" "Starship" "Nerd Fonts" "Qtile" "All" "Quit"; do
    case $app in
        "Microsoft Edge") install_edge ;;
        "Visual Studio Code") install_vscode ;;
        "Google Chrome") install_chrome ;;
        "qBittorrent") install_qbittorrent ;;
        "VLC") install_vlc ;;
        "Vim") install_vim ;;
        "Alacritty") install_alacritty ;;
        "Starship") install_starship ;;
        "Nerd Fonts") install_nerd_fonts ;;
        "Qtile") install_qtile ;;
        "All") # Install all applications
            install_edge
            install_vscode
            install_chrome
            install_qbittorrent
            install_vlc
            install_vim
            install_alacritty
            install_starship
            install_nerd_fonts
            install_qtile
            ;;
        "Quit") break ;;
        *) echo "Invalid option. Please select again." ;;
    esac
done

echo "Installation completed successfully!"

