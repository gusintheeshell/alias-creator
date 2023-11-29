#!/bin/bash

if command -v dialog &> /dev/null; then
    DIALOG=dialog
elif command -v whiptail &> /dev/null; then
    DIALOG=whiptail
else
    echo "Error: dialog or whiptail is not installed. Please install one of them before running this script."
    exit 1
fi

tempfile=$(mktemp /tmp/create_alias_cli.XXXXXX)

add_project() {
    $DIALOG --inputbox "Enter project name:" 8 40 2> "$tempfile"
    project_name=$(cat "$tempfile")

    $DIALOG --inputbox "Enter project path:" 8 40 2> "$tempfile"
    project_path=$(cat "$tempfile")

    # Check if the project path is valid
    if [ ! -d "$project_path" ]; then
        $DIALOG --msgbox "Error: The project path is not valid." 8 40
        return 1
    fi

    echo "$project_name" >> "$tempfile"
    echo "$project_path" >> "$tempfile"

    $DIALOG --msgbox "Project '$project_name' added successfully." 8 40
}

create_aliases() {
    while read -r project_name && read -r project_path; do
        echo "alias $project_name='cd $project_path'" >>"$configuration_file"
    done < "$tempfile"

    source "$configuration_file"

    $DIALOG --msgbox "Aliases created successfully." 8 40
}

while true; do
    $DIALOG --menu "Create Alias CLI" 12 40 5 1 "Add Project" 2 "Create Aliases and Exit" 3 "Exit" 2> "$tempfile"
    option=$(cat "$tempfile")

    case $option in
    1)
        add_project
        ;;
    2)
        create_aliases
        rm -f "$tempfile"
        exit 0
        ;;
    3)
        rm -f "$tempfile"
        exit 0
        ;;
    *)
        rm -f "$tempfile"
        $DIALOG --msgbox "Invalid option. Please try again." 8 40
        exit 1
        ;;
    esac
done
