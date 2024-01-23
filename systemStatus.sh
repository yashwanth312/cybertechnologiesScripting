#!/bin/bash

# Function to display formatted section headers
function display_section_header {
    echo -e "\n\e[1;34m$1\e[0m"  # Blue text for section headers
}

# Function to display CPU information
function display_cpu_info {
    display_section_header "CPU Information"
    lscpu
    display_section_header "CPU Usage"
    top -b -n 1 | grep '%Cpu'
}

# Function to display memory information
function display_memory_info {
    display_section_header "Memory Information"
    free -m
}

# Function to display disk space information
function display_disk_info {
    display_section_header "Disk Space Information"
    df -h
}

# Function to display network statistics
function display_network_info {
    display_section_header "Network Information"
    ip addr show
}

# Display system information
echo -e "\e[1;31mSystem Information Script\e[0m"  # Red text for script title
echo -e "\e[1;31m------------------------\e[0m"

# Display date and time
display_section_header "Date and Time"
date

# Display hostname and system uptime
display_section_header "Hostname and Uptime"
hostnamectl
uptime

# Call functions to display various system information
display_cpu_info
display_memory_info
display_disk_info
display_network_info

echo -e "\n\e[1;32mScript execution completed.\e[0m"  # Green text for completion message
