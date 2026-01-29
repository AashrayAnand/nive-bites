#!/bin/bash

# Create a new post with current date in a folder
# Usage: ./create_post.sh "Post Title" "slug"
# Example: ./create_post.sh "Beef Pad Kra Pow" "beef-pad-kra-pow"

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"Post Title\" slug"
    echo "Example: $0 \"Beef Pad Kra Pow\" beef-pad-kra-pow"
    exit 1
fi

TITLE="$1"
SLUG="$2"
CURRENT_DATE=$(date +%Y-%m-%d)
DATE_PREFIX=$(date +%m-%d-%y)

# Create folder name: MM-DD-YY-slug
FOLDER_NAME="${DATE_PREFIX}-${SLUG}"
FOLDER_PATH="content/posts/${FOLDER_NAME}"

# Create the folder
mkdir -p "$FOLDER_PATH"

# Create the post content
cat > "${FOLDER_PATH}/index.md" << EOF
+++
title = "$TITLE"
date = $CURRENT_DATE
description = ""
+++

# $TITLE

Your content here...

EOF

echo "Created post: ${FOLDER_PATH}/index.md"
echo "Date set to: $CURRENT_DATE" 