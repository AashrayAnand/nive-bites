#!/bin/bash

# Create a new post with current date
# Usage: ./create_post.sh "Post Title" "filename.md"

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"Post Title\" filename.md"
    exit 1
fi

TITLE="$1"
FILENAME="$2"
CURRENT_DATE=$(date +%Y-%m-%d)

# Create the post content
cat > "content/posts/$FILENAME" << EOF
+++
title = "$TITLE"
date = $CURRENT_DATE
description = ""
+++

# $TITLE

Your content here...

EOF

echo "Created post: content/posts/$FILENAME"
echo "Date set to: $CURRENT_DATE" 