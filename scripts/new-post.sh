#!/bin/bash
# 快速创建新文章的脚本

if [ -z "$1" ]; then
  echo "Usage: ./new-post.sh <post-name>"
  echo "Example: ./new-post.sh my-first-post"
  exit 1
fi

POST_NAME=$1
DATE=$(date +%Y-%m-%d)

# 创建中文文章
hugo new "posts/${POST_NAME}.md"

# 创建英文文章
hugo new "posts/${POST_NAME}.en.md"

echo "✅ Created posts/${POST_NAME}.md and posts/${POST_NAME}.en.md"
echo "📝 You can now edit these files in the content/posts/ directory"
