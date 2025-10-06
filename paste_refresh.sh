#!/bin/bash
#

SCRATCH_FILE="$HOME/.scratchpad"

# Clean up the scratch file when the script exits (e.g., with Ctrl+C)
trap 'rm -f "$SCRATCH_FILE"' EXIT

# Start an infinite loop to continuously listen for pastes.
while true; do
    # Clear the terminal for a clean slate
    clear

    # Display instructions for the user
    echo "--- SCRATCHPAD (reusable) ---"
    echo "1. Paste text from your local clipboard."
    echo "2. Press Ctrl+D to save to scratchpad."
    echo "---------------------------------"
    echo "Waiting for paste..."

    # 'cat' will read all input until it receives an EOF (Ctrl+D).
    # The output is then written to the scratch file, overwriting it.
    cat > "$SCRATCH_FILE"

    # Confirm to the user that the content was saved.
    echo "" # Add a newline for spacing
    echo "✅ Content saved to scratchpad. Ready for next paste."
    sleep 2 # Pause briefly so the user can see the confirmation
done

