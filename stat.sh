#!/bin/bash

# Function to display load statistics
display_load_stats() {
    echo -e "\e[1;34mLoad Statistics:\e[0m"
    uptime
    echo -e "\n\e[1;34mCPU Usage:\e[0m"
    top -bn1 | grep "Cpu(s)"
    echo -e "\n\e[1;34mMemory Usage:\e[0m"
    free -h
}

# Function to display network information
display_network_info() {
    echo -e "\n\e[1;34mNetwork Information:\e[0m"
    ifconfig | grep -E "inet|ether"
}

# Main function
main() {
    echo -e "\e[1mWelcome to Load Statistics Script\e[0m"

    # Select option for phone or computer
    PS3="Select option: "
    options=("Phone" "Computer" "Quit")
    select opt in "${options[@]}"; do
        case $opt in
            "Phone")
                echo -e "\n\e[1mYou selected to display load statistics for a phone\e[0m"
                display_load_stats
                display_network_info
                break
                ;;
            "Computer")
                echo -e "\n\e[1mYou selected to display load statistics for a computer\e[0m"
                display_load_stats
                display_network_info
                break
                ;;
            "Quit")
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option. Please select again."
                ;;
        esac
    done
}

# Call the main function
main
