#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File not found"
    exit 1
fi

total_records=$(wc -l < "$1")

unique_files=$(awk '{print $3}' "$1" | sort | uniq | wc -l)

hash_changes=$(grep "hash changes" "$1" | wc -l)

echo "$total_records $unique_files $hash_changes"
