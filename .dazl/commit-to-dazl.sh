#!/bin/bash
set -e

MESSAGE="$1"
if [ -z "$MESSAGE" ]; then
  echo "Usage: $0 <commit-message>"
  exit 1
fi

# Track renamed .gitignore files
RENAMED_FILES=()

# Disable all .gitignore files
while IFS= read -r path; do
  new_path="${path}.__disabled__"
  mv "$path" "$new_path"
  RENAMED_FILES+=("$new_path")
done < <(find . -type f -name ".gitignore")

# Perform commit using Dazl repo (uses regular .git)
git add .
git commit -m "$MESSAGE"

# Restore .gitignore files
for disabled_path in "${RENAMED_FILES[@]}"; do
  original_path="${disabled_path%.__disabled__}"
  mv "$disabled_path" "$original_path"
done

echo "✅ Committed to Dazl Repo: $MESSAGE"
