#!/bin/bash
# Interactive installation script for a software package on Ubuntu

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to display a formatted message
display_message() {
  echo -e "\n\e[1;36m$1\e[0m\n"  # Display in cyan color
}

# Welcome message
echo -e "\n\e[1;34mWelcome to the Interactive Installation Script\e[0m"

# Ask user for the package name
read -p "Enter the name of the software package to install: " package_name

# Check if the package is already installed
if command_exists "$package_name"; then
  display_message "$package_name is already installed. Exiting."
  exit 0
fi

# Update package lists and install the specified package
display_message "Updating package lists..."
sudo apt update
display_message "Installing $package_name..."
sudo apt install -y "$package_name"

# Check if installation was successful
if ! command_exists "$package_name"; then
  display_message "Error: $package_name installation failed. Exiting."
  exit 1
fi

# Display success message
display_message "$package_name has been successfully installed."
