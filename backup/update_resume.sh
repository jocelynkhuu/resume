#!/bin/bash

resume_location="$HOME/node_modules/resumed/dist"
resumed_cli_location="$HOME/node_modules/.bin/resumed"

# Check if the resume directory exists
if [[ -d "$resume_location" ]]; then
    cd "$resume_location" || exit 1
else
    echo "Directory $resume_location does not exist."
    exit 1
fi

# Check if 'resumed' command is available and run it
if [[ -f "$resumed_cli_location" ]]; then
    resumed render -t jsonresume-theme-macchiato
else
    echo "Command 'resumed' not found at $resumed_cli_location."
    exit 1
fi

# Copy files if they exist
if [[ -f "$resume_location/resume.json" ]]; then
    cp "$resume_location/resume.html" "$HOME/github/resume/index.html"
    cp "$resume_location/resume.json" "$HOME/github/resume/resume.json"
    echo "Resume files copied successfully."
else
    echo "Resume files not found in $resume_location."
    exit 1
fi

exit 0