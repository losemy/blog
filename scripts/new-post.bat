@echo off
REM 快速创建新文章的脚本 (Windows)

if "%1"=="" (
  echo Usage: new-post.bat ^<post-name^>
  echo Example: new-post.bat my-first-post
  exit /b 1
)

set POST_NAME=%1

REM 创建中文文章
hugo new "posts/%POST_NAME%.md"

REM 创建英文文章
hugo new "posts/%POST_NAME%.en.md"

echo.
echo ✅ Created posts/%POST_NAME%.md and posts/%POST_NAME%.en.md
echo 📝 You can now edit these files in the content/posts/ directory
