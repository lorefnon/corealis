#!/usr/bin/env bash

# Download binary from github
echo ">>> Downloading Mailhog"
wget -O ~/mailhog https://github.com/mailhog/MailHog/releases/download/v0.1.8/MailHog_darwin_amd64
echo ">>> Downloaded Mailhog"

# Make it executable
chmod +x ~/mailhog
