#!/bin/bash

# Function to create a user
create_user() {
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " password_confirm
    echo

    # Check if passwords match
    if [ "$password" != "$password_confirm" ]; then
        echo "Passwords do not match. Please try again."
        exit 1
    fi

    # Create user
    sudo useradd -m $username
    echo "$username:$password" | sudo chpasswd
    echo "User $username created."
}

# Main script
create_user

echo "User creation complete."

