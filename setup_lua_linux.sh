#!/bin/bash

# Check if running on Linux
if [[ "$(uname)" != "Linux" ]]; then
    echo "This script only runs on Linux systems. Exiting..."
    exit 0
fi

# Function to handle errors
handle_error() {
    echo "Error occurred during $1. Cleaning up and exiting..."
    # Clean up downloaded files if they exist
    if [[ -f "luarocks-3.11.1.tar.gz" ]]; then
        rm -f luarocks-3.11.1.tar.gz
    fi

    # Clean up extracted directory if it exists
    if [[ -d "luarocks-3.11.1" ]]; then
        rm -rf luarocks-3.11.1
    fi

    exit 1
}

echo "Installing Lua 5.1 and LuaRocks on Linux..."

# Install Lua packages
echo "Updating package lists..."
sudo apt-get update || handle_error "apt-get update"

echo "Installing Lua 5.1 and development libraries..."
sudo apt-get install -y lua5.1 liblua5.1-dev || handle_error "Lua installation"

# Download LuaRocks
echo "Downloading LuaRocks 3.11.1..."
wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz || handle_error "LuaRocks download"

# Extract archive
echo "Extracting LuaRocks..."
tar zxpf luarocks-3.11.1.tar.gz || handle_error "LuaRocks extraction"

# Build and install LuaRocks
echo "Building and installing LuaRocks..."
cd luarocks-3.11.1 || handle_error "changing to LuaRocks directory"
./configure || handle_error "LuaRocks configure"
make || handle_error "LuaRocks make"
sudo make install || handle_error "LuaRocks installation"

# Return to original directory
cd ..

# Clean up
echo "Cleaning up..."
rm -f luarocks-3.11.1.tar.gz
rm -rf luarocks-3.11.1

echo "Installation completed successfully!"
echo "Lua 5.1 and LuaRocks 3.11.1 have been installed."
