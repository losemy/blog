# Hugo 博客项目文件说明

本文档说明项目中各个文件和目录的作用。

## 📁 项目结构

```
blog/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions 自动部署配置
│
├── archetypes/
│   └── default.md              # 新文章模板
│
├── content/                    # 网站内容目录
│   ├── posts/                  # 博客文章目录
│   │   ├── welcome.md          # 示例文章（中文）
│   │   ├── welcome.en.md       # 示例文章（英文）
│   │   ├── hugo-guide.md       # Hugo 指南（中文）
│   ├── about.md                # 关于页面（中文）
│   ├── about.en.md             # 关于页面（英文）
│   ├── archives.md             # 归档页面
│   └── search.md               # 搜索页面
│
├── layouts/                    # 自定义布局模板
│   └── robots.txt              # robots.txt 模板
│
├── static/                     # 静态资源目录
│   ├── images/                 # 图片目录
│   │   └── .gitkeep            # 保持目录的占位文件
│   └── favicon.ico             # 网站图标（需替换）
│
├── scripts/                    # 辅助脚本
│   ├── new-post.sh             # 创建新文章脚本（Linux/macOS）
│   └── new-post.bat            # 创建新文章脚本（Windows）
│
├── .gitignore                  # Git 忽略文件配置
├── go.mod                      # Go 模块依赖
├── hugo.toml                   # Hugo 主配置文件
├── hugo.yaml                   # Hugo 模块配置
├── wrangler.toml               # Cloudflare Pages 配置
├── README.md                   # 项目说明文档
├── QUICKSTART.md               # 快速开始指南
├── USAGE.md                    # 详细使用指南
└── .hugo_build.lock            # Hugo 构建锁文件
```

## 📄 核心文件说明

### hugo.toml
**作用**: Hugo 的主配置文件
**包含内容**:
- 网站基本信息（标题、URL、语言）
- 主题配置
- 菜单设置
- SEO 设置
- 多语言支持配置

**需要修改的部分**:
```toml
baseURL = 'https://example.com/'  # 改为你的域名
title = '我的个人博客'             # 改为你的博客名
[params]
  author = "Your Name"            # 改为你的名字
```

### hugo.yaml
**作用**: Hugo 模块配置
**功能**: 指定使用的主题（PaperMod）

### go.mod
**作用**: Go 模块依赖管理
**功能**: 定义项目依赖的 Hugo 主题版本

### wrangler.toml
**作用**: Cloudflare Pages 部署配置
**包含内容**:
- 构建命令
- 输出目录
- 环境变量
- HTTP 头部设置

### .gitignore
**作用**: 指定 Git 忽略的文件和目录
**忽略内容**:
- `/public/` - 构建输出目录
- `/resources/` - Hugo 缓存
- `.hugo_build.lock` - 构建锁文件

## 📝 内容文件说明

### content/posts/
存放所有博客文章的目录

**文章命名规范**:
- 中文文章: `article-name.md`
- 英文文章: `article-name.en.md`

**Front Matter 必填字段**:
```yaml
---
title: "文章标题"
date: 2024-01-01T00:00:00+08:00
draft: false
description: "文章描述"
tags: ["标签"]
categories: ["分类"]
---
```

### content/about.md
关于页面，介绍你自己和博客信息

### content/search.md
搜索功能页面，配合 PaperMod 主题的搜索功能

### content/archives.md
文章归档页面，按时间顺序显示所有文章

## 🎨 布局文件说明

### layouts/robots.txt
**作用**: 生成 robots.txt 文件
**功能**: 告诉搜索引擎哪些页面可以抓取

## 📦 静态资源说明

### static/images/
存放所有图片文件

**使用方法**:
```markdown
![图片描述](/images/photo.jpg)
```

### static/favicon.ico
网站图标，显示在浏览器标签页上
**需要替换**: 使用你自己的 favicon

## 🚀 脚本说明

### scripts/new-post.sh
**平台**: Linux/macOS
**功能**: 快速创建中英文双语文章
**使用方法**:
```bash
chmod +x scripts/new-post.sh
./scripts/new-post.sh my-article
```

### scripts/new-post.bat
**平台**: Windows
**功能**: 快速创建中英文双语文章
**使用方法**:
```bash
scripts\new-post.bat my-article
```

## 📚 文档说明

### README.md
**内容**: 项目概述、安装指南、配置说明
**适合**: 第一次接触项目的用户

### QUICKSTART.md
**内容**: 5 分钟快速开始指南
**适合**: 想快速搭建博客的用户

### USAGE.md
**内容**: 完整使用教程、写作指南、部署教程
**适合**: 需要详细了解功能的用户

## 🔧 配置文件说明

### .github/workflows/deploy.yml
**作用**: GitHub Actions 自动部署
**功能**: 代码推送到 GitHub 后自动构建并部署到 Cloudflare Pages

**需要配置的 Secrets**:
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`

### archetypes/default.md
**作用**: 新文章模板
**功能**: 使用 `hugo new` 创建文章时的默认模板

## 📊 生成的目录（不在版本控制中）

### public/
**作用**: 构建输出目录
**内容**: 静态 HTML 文件
**生成**: 运行 `hugo` 或 `hugo --minify`

### resources/
**作用**: Hugo 资源缓存
**内容**: 处理过的图片、CSS 等
**生成**: Hugo 自动生成

## 🔍 特殊文件

### .hugo_build.lock
**作用**: Hugo 构建锁文件
**功能**: 确保构建的一致性
**状态**: 通常被 Git 忽略

## 📝 需要修改的文件清单

在开始使用前，建议修改以下文件：

1. ✅ `hugo.toml` - 修改网站信息、作者、社交链接
2. ✅ `content/about.md` - 修改关于页面
3. ✅ `content/about.en.md` - 修改英文关于页面
4. ✅ `static/favicon.ico` - 替换为自己的图标
5. ✅ `.github/workflows/deploy.yml` - 修改项目名称（如果使用 GitHub Actions）

## 📝 可选修改的文件

1. `wrangler.toml` - 修改项目名称、环境变量
2. `archetypes/default.md` - 自定义文章模板
3. `layouts/robots.txt` - 自定义 robots.txt

## 🎯 文件权限说明

### 需要执行权限
- `scripts/new-post.sh` (Linux/macOS)

**设置方法**:
```bash
chmod +x scripts/new-post.sh
```

### 不需要执行权限
- 所有其他文件

## 📖 更多信息

- 详细使用说明：查看 [USAGE.md](./USAGE.md)
- 快速开始：查看 [QUICKSTART.md](./QUICKSTART.md)
- 项目概述：查看 [README.md](./README.md)

---

**最后更新**: 2024-01-15
