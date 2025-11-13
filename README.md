# Hugo 博客项目

这是一个基于 Hugo 构建的个人博客，使用 PaperMod 主题，支持部署到 Cloudflare Pages。

## 前置要求

- Hugo Extended 版本 (>= 0.112.0)
- Git

## 快速开始

### 1. 安装 Hugo

**Windows:**
```bash
# 使用 Chocolatey
choco install hugo-extended

# 或使用 Scoop
scoop install hugo-extended
```

**macOS:**
```bash
brew install hugo
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install hugo

# 或下载二进制文件
wget https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_extended_0.121.0_linux-amd64.deb
sudo dpkg -i hugo_extended_0.121.0_linux-amd64.deb
```

### 2. 初始化主题

```bash
# 初始化 Hugo 模块
hugo mod init blog

# 下载主题
hugo mod get
```

### 3. 本地预览

```bash
# 启动开发服务器（包含草稿）
hugo server -D

# 启动开发服务器（不包含草稿）
hugo server
```

访问 http://localhost:1313 查看博客。

### 4. 创建新文章

```bash
# 创建中文文章
hugo new posts/my-new-post.md

# 创建英文文章
hugo new posts/my-new-post.en.md
```

### 5. 构建生产版本

```bash
# 构建静态文件到 public 目录
hugo --minify
```

## 项目结构

```
blog/
├── content/              # 内容目录
│   ├── posts/           # 博客文章
│   ├── search.md        # 搜索页面
│   └── archives.md      # 归档页面
├── layouts/             # 自定义布局
│   └── robots.txt       # robots.txt 模板
├── static/              # 静态资源（图片、CSS、JS等）
├── public/              # 生成的静态网站（构建后）
├── hugo.toml            # Hugo 配置文件
├── hugo.yaml            # Hugo 模块配置
└── go.mod               # Go 模块依赖
```

## 配置说明

### 修改博客信息

编辑 `hugo.toml` 文件：

```toml
baseURL = 'https://yourdomain.com/'  # 修改为你的域名
title = '我的个人博客'                # 修改博客标题

[params]
  author = "Your Name"                # 修改作者名称
  description = "博客描述"            # 修改博客描述
```

### 添加社交链接

在 `hugo.toml` 中修改：

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/yourusername"

[[params.socialIcons]]
  name = "twitter"
  url = "https://twitter.com/yourusername"
```

## 部署到 Cloudflare Pages

### 方法一：通过 Git 集成（推荐）

1. 将代码推送到 GitHub/GitLab
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/blog.git
   git push -u origin main
   ```

2. 登录 [Cloudflare Pages](https://pages.cloudflare.com/)

3. 点击 "Create a project" → "Connect to Git"

4. 选择你的 Git 仓库

5. 配置构建设置：
   - **Production branch:** `main`
   - **Build command:** `hugo --minify`
   - **Build output directory:** `public`
   - **Environment variables:**
     - `HUGO_VERSION`: `0.121.0`
     - `GO_VERSION`: `1.21`

6. 点击 "Save and Deploy"

### 方法二：使用 Wrangler CLI

1. 安装 Wrangler
   ```bash
   npm install -g wrangler
   ```

2. 登录 Cloudflare
   ```bash
   wrangler login
   ```

3. 构建并部署
   ```bash
   hugo --minify
   wrangler pages deploy public --project-name=my-blog
   ```

## 写作指南

### 文章格式

每篇文章都需要包含 Front Matter：

```markdown
---
title: "文章标题"
date: 2024-01-01T00:00:00+08:00
draft: false
description: "文章描述"
tags: ["标签1", "标签2"]
categories: ["分类"]
---

文章内容...
```

### 常用参数说明

- `title`: 文章标题
- `date`: 发布日期
- `draft`: 是否为草稿（true/false）
- `description`: 文章描述（用于 SEO）
- `tags`: 标签列表
- `categories`: 分类
- `weight`: 排序权重（可选）
- `cover`: 封面图片（可选）

### 添加图片

将图片放在 `static/images/` 目录下，然后在文章中引用：

```markdown
![图片描述](/images/your-image.jpg)
```

### 代码高亮

使用三个反引号包裹代码，并指定语言：

````markdown
```python
def hello():
    print("Hello, World!")
```
````

## 多语言支持

本博客支持中英文双语：

- 中文文章：`content/posts/article.md`
- 英文文章：`content/posts/article.en.md`

用户可以通过顶部语言选择器切换语言。

## SEO 优化

本博客已包含以下 SEO 优化：

- ✅ 自动生成 sitemap.xml
- ✅ robots.txt 配置
- ✅ 语义化 HTML 标签
- ✅ Open Graph 标签
- ✅ 响应式设计
- ✅ 快速加载速度

## 常见问题

### 1. 主题没有加载？

确保已执行 `hugo mod get` 下载主题。

### 2. 本地预览没有显示草稿？

使用 `hugo server -D` 参数显示草稿文章。

### 3. 构建失败？

检查 Hugo 版本是否为 Extended 版本：
```bash
hugo version
```

### 4. Cloudflare Pages 部署失败？

确保环境变量 `HUGO_VERSION` 已设置，且版本 >= 0.112.0。

## 更新主题

```bash
# 更新到最新版本
hugo mod get -u

# 清理缓存
hugo mod clean
```

## 许可证

MIT License

## 相关链接

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod)
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
