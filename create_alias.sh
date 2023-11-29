#!/bin/bash

# Script to create aliases for projects with autocompletion

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <configuration_file>"
    exit 1
fi

# Extract the argument
configuration_file=$1

# Check if the configuration file exists
if [ ! -f "$configuration_file" ]; then
    echo "Error: The configuration file does not exist."
    exit 1
fi

# Array to store project names and their corresponding paths
projects=()

# Function to add a project to the array
add_project() {
    read -p "Project name: " project_name

    # Autocomplete project path
    read -e -p "Project path: " project_path

    # Check if the project path is valid
    if [ ! -d "$project_path" ]; then
        echo "Error: The project path is not valid."
        return 1
    fi

    # Add the project to the array
    projects+=("$project_name" "$project_path")

    echo "Project '$project_name' added successfully."
}

# Function to create aliases and update the shell configuration file
create_aliases() {
    for ((i = 0; i < ${#projects[@]}; i += 2)); do
        project_name="${projects[$i]}"
        project_path="${projects[$i + 1]}"

        # Create an alias in the shell configuration file
        echo "alias $project_name='cd $project_path'" >>"$configuration_file"
        echo "Alias created successfully for the project '$project_name'."
    done

    # Update the shell configuration file
    source "$configuration_file"
}

# Main menu
while true; do
    echo "1. Add project"
    echo "2. Create aliases and exit"
    read -p "Choose an option: " option

    case $option in
    1)
        add_project
        ;;
    2)
        create_aliases
        exit 0
        ;;
    *)
        echo "Invalid option. Please try again."
        ;;
    esac
done
