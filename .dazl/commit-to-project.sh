#!/bin/bash
set -e

MESSAGE="$1"
if [ -z "$MESSAGE" ]; then
  echo "Usage: $0 <commit-message>"
  exit 1
fi

# Perform commit using Project repo (uses .project-git)
GIT_DIR=.project-git GIT_WORK_TREE=. git add .
GIT_DIR=.project-git GIT_WORK_TREE=. git commit -m "$MESSAGE"

echo "✅ Committed to Project Repo: $MESSAGE"
