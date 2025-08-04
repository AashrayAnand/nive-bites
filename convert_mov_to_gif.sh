#!/bin/bash

# Convert MOV to GIF script
# Usage: ./convert_mov_to_gif.sh input.mov [output.gif]

if [ $# -lt 1 ]; then
    echo "Usage: $0 input.mov [output.gif]"
    echo "If output filename is not provided, it will use input name with .gif extension"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${2:-${INPUT_FILE%.*}.gif}"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found!"
    exit 1
fi

echo "Converting $INPUT_FILE to $OUTPUT_FILE..."

# Convert with optimized settings for GIF
ffmpeg -i "$INPUT_FILE" \
    -vf "fps=10,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully converted to $OUTPUT_FILE"
    echo "File size: $(du -h "$OUTPUT_FILE" | cut -f1)"
else
    echo "Conversion failed!"
    exit 1
fi 