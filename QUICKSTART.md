# 🚀 快速开始指南

5 分钟快速搭建并部署你的 Hugo 博客！

## 第 1 步：安装 Hugo (2 分钟)

### Windows 用户（推荐使用 Chocolatey）

```bash
# 打开 PowerShell（管理员权限）
choco install hugo-extended -y

# 验证安装
hugo version
```

### macOS 用户

```bash
brew install hugo
hugo version
```

### Linux 用户

```bash
sudo snap install hugo
hugo version
```

> ⚠️ 必须安装 **Extended** 版本！

---

## 第 2 步：初始化项目 (1 分钟)

```bash
# 进入项目目录
cd d:\qoder\blog

# 初始化 Hugo 模块
hugo mod init blog

# 下载主题
hugo mod get

# 启动本地服务器
hugo server -D
```

🎉 打开浏览器访问 http://localhost:1313

你应该能看到博客已经运行了！

---

## 第 3 步：创建第一篇文章 (1 分钟)

### Windows 用户：

```bash
scripts\new-post.bat my-first-post
```

### Linux/macOS 用户：

```bash
chmod +x scripts/new-post.sh
./scripts/new-post.sh my-first-post
```

编辑生成的文件：
- `content/posts/my-first-post.md` （中文版本）
- `content/posts/my-first-post.en.md` （英文版本）

修改 `draft: true` 为 `draft: false` 以发布文章。

---

## 第 4 步：部署到 Cloudflare Pages (1 分钟)

### 方法 A：Git 集成（推荐）

```bash
# 1. 初始化 Git
git init
git add .
git commit -m "Initial commit"

# 2. 推送到 GitHub（需先在 GitHub 创建仓库）
git remote add origin https://github.com/yourusername/blog.git
git branch -M main
git push -u origin main

# 3. 在 Cloudflare Pages 控制台
# - 登录 https://pages.cloudflare.com/
# - 点击 "Create a project"
# - 连接 Git 仓库
# - 设置构建命令：hugo --minify
# - 设置输出目录：public
# - 添加环境变量：HUGO_VERSION = 0.121.0
# - 点击 "Save and Deploy"
```

### 方法 B：Wrangler CLI

```bash
# 1. 安装 Wrangler
npm install -g wrangler

# 2. 登录
wrangler login

# 3. 构建并部署
hugo --minify
wrangler pages deploy public --project-name=my-blog
```

---

## ✅ 完成！

你的博客现在已经：
- ✅ 本地运行
- ✅ 支持中英文
- ✅ SEO 优化
- ✅ 部署到 Cloudflare Pages

---

## 🎯 下一步做什么？

### 1. 修改博客信息

编辑 `hugo.toml`：

```toml
baseURL = 'https://yourdomain.com/'  # 改为你的域名
title = '我的个人博客'                # 改为你的名称
[params]
  author = "Your Name"                # 改为你的名字
```

### 2. 添加社交链接

在 `hugo.toml` 中修改：

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/yourusername"  # 改为你的 GitHub
```

### 3. 开始写作

```bash
# 创建新文章
scripts\new-post.bat article-name

# 编辑文章
# content/posts/article-name.md

# 预览
hugo server -D
```

### 4. 发布更新

```bash
git add .
git commit -m "Add new post"
git push
```

Cloudflare Pages 会自动部署！

---

## 📚 更多帮助

- 📖 **详细教程**: 查看 [USAGE.md](./USAGE.md)
- 📘 **项目说明**: 查看 [README.md](./README.md)
- 🌐 **Hugo 文档**: https://gohugo.io/
- 🎨 **主题文档**: https://github.com/adityatelange/hugo-PaperMod

---

## 💡 常用命令速查

```bash
# 本地开发
hugo server -D              # 启动服务器（含草稿）
hugo server                 # 启动服务器（不含草稿）

# 创建内容
hugo new posts/name.md      # 创建新文章
scripts\new-post.bat name   # 创建中英文文章

# 构建部署
hugo --minify               # 构建生产版本
git add . && git commit && git push  # 推送更新

# 主题管理
hugo mod get -u             # 更新主题
hugo mod clean              # 清理缓存
```

---

**开始你的博客之旅吧！✨**
