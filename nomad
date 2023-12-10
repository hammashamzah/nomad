#!/bin/bash

function select_option {
    echo "Select an option:"
    select option in "setup" "start" "restore" "backup" "ssh"; do
        if [ -z "$option" ]; then
            echo "Invalid option. Try another one."
        else
            break
        fi
    done
}

function execute {
    case $1 in  # Changed 'option' to '$1'
        setup)
            ./scripts/setup
            ;;
        start)
            ./scripts/start
            ;;
        restore)
            ./scripts/restore
            ;;
        backup)
            ./scripts/backup
            ;;
        ssh)
            ./scripts/sync_and_ssh
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
}

source .env

# Check if argument is provided
if [ -z "$1" ]; then
    select_option
    execute $option  # Call execute with the selected option
else
    option=$1  # Set option based on command line argument
    # validate provided argument
    if [[ $option != "setup" && $option != "start" && $option != "restore" && $option != "backup" && $option != "ssh" ]]; then
        echo "Invalid option: $option"
        select_option
        execute $option  # Call execute with the selected option
        exit 1
    fi
    execute $option  # Call execute with the command line argument
fi
