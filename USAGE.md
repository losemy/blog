# Hugo 博客完整使用指南

本文档提供完整的 Hugo 博客使用示例和最佳实践。

## 📋 目录

1. [快速开始](#快速开始)
2. [日常写作](#日常写作)
3. [本地预览](#本地预览)
4. [部署到 Cloudflare Pages](#部署到-cloudflare-pages)
5. [常用操作](#常用操作)
6. [高级配置](#高级配置)

---

## 🚀 快速开始

### 步骤 1: 安装 Hugo

#### Windows 用户

**方法 1: 使用 Chocolatey（推荐）**
```bash
choco install hugo-extended -y
```

**方法 2: 使用 Scoop**
```bash
scoop install hugo-extended
```

**方法 3: 手动安装**
1. 访问 https://github.com/gohugoio/hugo/releases
2. 下载 `hugo_extended_xxx_windows-amd64.zip`
3. 解压到某个目录（如 `C:\Hugo\bin`）
4. 将该目录添加到系统 PATH

#### macOS 用户

```bash
brew install hugo
```

#### Linux 用户

```bash
# Debian/Ubuntu
sudo apt install hugo

# 或使用 Snap
sudo snap install hugo
```

### 步骤 2: 验证安装

```bash
hugo version
```

应该看到类似输出：
```
hugo v0.121.0+extended windows/amd64 BuildDate=...
```

**注意**: 必须是 **extended** 版本！

### 步骤 3: 初始化项目

```bash
# 进入项目目录
cd d:\qoder\blog

# 初始化 Hugo 模块
hugo mod init blog

# 下载主题（PaperMod）
hugo mod get

# 验证主题是否下载成功
hugo mod verify
```

### 步骤 4: 本地预览

```bash
# 启动开发服务器（包含草稿）
hugo server -D

# 或者不显示草稿
hugo server
```

访问 http://localhost:1313 查看你的博客！

---

## ✍️ 日常写作

### 创建新文章

#### 方法 1: 使用命令（推荐）

**Windows:**
```bash
# 创建中文文章
hugo new posts/my-article.md

# 创建英文文章
hugo new posts/my-article.en.md
```

**使用快捷脚本:**
```bash
# Windows
scripts\new-post.bat my-article

# Linux/macOS
chmod +x scripts/new-post.sh
./scripts/new-post.sh my-article
```

这会自动创建中英文两个版本的文章。

#### 方法 2: 手动创建

在 `content/posts/` 目录下创建新的 `.md` 文件：

**示例: content/posts/hello-world.md**

```markdown
---
title: "我的第一篇文章"
date: 2024-01-15T10:00:00+08:00
draft: false
description: "这是一篇示例文章"
tags: ["教程", "Hugo"]
categories: ["技术"]
cover:
  image: "/images/cover.jpg"
  alt: "封面图"
  caption: "封面图说明"
---

## 开始写作

这里是文章内容...

### 添加代码

```python
def hello():
    print("Hello, Hugo!")
```

### 添加图片

![示例图片](/images/example.jpg)

### 添加链接

[访问 Hugo 官网](https://gohugo.io)
```

### Front Matter 参数详解

```yaml
---
# 必填字段
title: "文章标题"              # 显示的标题
date: 2024-01-15T10:00:00+08:00  # 发布日期（ISO 8601 格式）

# 重要字段
draft: false                   # true=草稿, false=发布
description: "文章摘要"        # SEO 描述，显示在搜索结果
tags: ["标签1", "标签2"]       # 标签列表
categories: ["分类"]           # 分类

# 可选字段
weight: 1                      # 排序权重（数字越小越靠前）
author: "作者名"               # 覆盖默认作者
summary: "自定义摘要"          # 覆盖自动生成的摘要
keywords: ["关键词1", "关键词2"]  # SEO 关键词

# 封面图（可选）
cover:
  image: "/images/cover.jpg"   # 图片路径
  alt: "图片描述"              # 无障碍文本
  caption: "图片说明"          # 图片说明文字
  relative: false              # true=相对路径, false=绝对路径

# 显示控制
ShowToc: true                  # 显示目录
TocOpen: false                 # 目录默认展开
ShowReadingTime: true          # 显示阅读时间
ShowShareButtons: true         # 显示分享按钮
ShowPostNavLinks: true         # 显示上一篇/下一篇
---
```

### 编写技巧

#### 1. 使用标题层级

```markdown
## 二级标题（章节）
### 三级标题（小节）
#### 四级标题（细节）
```

#### 2. 代码高亮

支持的语言：

````markdown
```python
# Python 代码
def example():
    pass
```

```javascript
// JavaScript 代码
const hello = () => {
  console.log("Hello");
};
```

```go
// Go 代码
func main() {
    fmt.Println("Hello")
}
```

```bash
# Shell 命令
npm install
hugo server
```
````

#### 3. 插入图片

```markdown
# 方法 1: 使用 static 目录
![图片描述](/images/photo.jpg)

# 方法 2: 使用外链
![图片描述](https://example.com/image.jpg)

# 方法 3: 带链接的图片
[![图片描述](/images/photo.jpg)](https://example.com)
```

图片建议放在 `static/images/` 目录下。

#### 4. 表格

```markdown
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 数据1 | 数据2 | 数据3 |
| 数据4 | 数据5 | 数据6 |
```

#### 5. 引用

```markdown
> 这是一段引用文字
> 
> 可以有多行
```

#### 6. 列表

```markdown
# 无序列表
- 项目 1
- 项目 2
  - 子项目 2.1
  - 子项目 2.2

# 有序列表
1. 第一步
2. 第二步
3. 第三步

# 任务列表
- [x] 已完成任务
- [ ] 未完成任务
```

---

## 👀 本地预览

### 基本命令

```bash
# 启动开发服务器
hugo server

# 包含草稿文章
hugo server -D

# 指定端口
hugo server --port 8080

# 绑定到所有网络接口（局域网访问）
hugo server --bind 0.0.0.0

# 禁用快速渲染（修复某些问题）
hugo server --disableFastRender
```

### 热重载

Hugo 支持热重载，修改文件后浏览器会自动刷新：

- ✅ 修改内容文件 (`.md`)
- ✅ 修改配置文件 (`hugo.toml`)
- ✅ 修改布局文件
- ✅ 修改静态资源

### 查看草稿

```bash
# 方法 1: 使用 -D 参数
hugo server -D

# 方法 2: 修改文章 front matter
draft: false  # 将 true 改为 false
```

---

## 🚀 部署到 Cloudflare Pages

### 方法一：Git 集成（推荐）

这是最简单、最自动化的方式。

#### 步骤 1: 初始化 Git 仓库

```bash
# 初始化 Git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Hugo blog setup"

# 创建 GitHub 仓库（在 GitHub 网站上）
# 然后关联远程仓库
git remote add origin https://github.com/yourusername/blog.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

#### 步骤 2: 连接 Cloudflare Pages

1. 访问 https://pages.cloudflare.com/
2. 登录你的 Cloudflare 账户
3. 点击 **"Create a project"**
4. 选择 **"Connect to Git"**
5. 授权 GitHub/GitLab
6. 选择你的博客仓库

#### 步骤 3: 配置构建设置

在 Cloudflare Pages 配置页面：

```
Production branch: main
Build command: hugo --minify
Build output directory: public

Environment variables:
- HUGO_VERSION: 0.121.0
- GO_VERSION: 1.21
```

点击 **"Save and Deploy"**

#### 步骤 4: 等待部署

- 第一次部署大约需要 1-3 分钟
- 后续推送会自动触发部署
- 可以在 Cloudflare Pages 控制台查看部署日志

#### 步骤 5: 配置自定义域名（可选）

1. 在 Cloudflare Pages 项目设置中
2. 点击 **"Custom domains"**
3. 添加你的域名
4. 按照提示配置 DNS

### 方法二：GitHub Actions 自动部署

项目已包含 `.github/workflows/deploy.yml` 配置。

#### 步骤 1: 设置 GitHub Secrets

在 GitHub 仓库设置中添加：

```
Settings > Secrets and variables > Actions > New repository secret

需要添加:
- CLOUDFLARE_API_TOKEN
- CLOUDFLARE_ACCOUNT_ID
```

**获取 API Token:**
1. 访问 https://dash.cloudflare.com/profile/api-tokens
2. 创建 Token，使用 "Edit Cloudflare Workers" 模板
3. 复制 Token

**获取 Account ID:**
1. 访问 Cloudflare Pages
2. 在 URL 中找到类似 `account/xxx` 的字符串
3. `xxx` 就是你的 Account ID

#### 步骤 2: 推送代码

```bash
git add .
git commit -m "Update blog"
git push
```

GitHub Actions 会自动构建并部署到 Cloudflare Pages！

### 方法三：使用 Wrangler CLI

适合本地直接部署，无需 Git。

#### 步骤 1: 安装 Wrangler

```bash
npm install -g wrangler
```

#### 步骤 2: 登录

```bash
wrangler login
```

会打开浏览器进行授权。

#### 步骤 3: 构建并部署

```bash
# 构建
hugo --minify

# 部署
wrangler pages deploy public --project-name=my-blog

# 首次部署需要创建项目
wrangler pages project create my-blog
```

#### 步骤 4: 后续更新

```bash
# 每次更新只需：
hugo --minify
wrangler pages deploy public --project-name=my-blog
```

---

## 🔧 常用操作

### 1. 修改博客信息

编辑 `hugo.toml`:

```toml
baseURL = 'https://yourdomain.com/'  # 改为你的域名
title = '我的个人博客'                # 改为你的博客名称

[params]
  author = "Your Name"                # 改为你的名字
  description = "博客描述"            # 改为你的描述
```

### 2. 添加社交链接

在 `hugo.toml` 中添加：

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/yourusername"

[[params.socialIcons]]
  name = "email"
  url = "mailto:your@email.com"

[[params.socialIcons]]
  name = "twitter"
  url = "https://twitter.com/yourusername"

[[params.socialIcons]]
  name = "linkedin"
  url = "https://linkedin.com/in/yourusername"
```

支持的图标：github, twitter, linkedin, email, rss, youtube, instagram 等。

### 3. 修改首页欢迎语

在 `hugo.toml` 中修改：

```toml
[params.homeInfoParams]
  Title = "欢迎来到我的博客 👋"
  Content = "分享技术、记录生活、探索世界"
```

### 4. 添加菜单项

在 `hugo.toml` 中：

```toml
[[languages.zh-cn.menu.main]]
  name = "关于"
  url = "/about/"
  weight = 6

[[languages.en.menu.main]]
  name = "About"
  url = "/en/about/"
  weight = 6
```

然后创建对应页面：

```bash
hugo new about.md
hugo new about.en.md
```

### 5. 更新主题

```bash
# 更新到最新版本
hugo mod get -u

# 查看当前版本
hugo mod graph

# 清理缓存
hugo mod clean
```

### 6. 构建生产版本

```bash
# 标准构建
hugo

# 压缩构建（推荐）
hugo --minify

# 构建草稿
hugo --buildDrafts

# 清理并重新构建
rm -rf public
hugo --minify
```

### 7. 批量管理文章

```bash
# 查找所有草稿
grep -r "draft: true" content/posts/

# 批量发布草稿（将 draft 改为 false）
# Linux/macOS
find content/posts/ -name "*.md" -exec sed -i 's/draft: true/draft: false/g' {} \;

# Windows (需要安装 Git Bash)
find content/posts/ -name "*.md" -exec sed -i 's/draft: true/draft: false/g' {} \;
```

---

## 🎨 高级配置

### 1. 自定义 CSS

创建 `assets/css/extended/custom.css`:

```css
/* 自定义样式 */
:root {
    --primary: #0066cc;
}

.post-content {
    font-size: 18px;
}
```

### 2. 添加 Google Analytics

在 `hugo.toml` 中：

```toml
[params]
  googleAnalytics = "G-XXXXXXXXXX"
```

### 3. 添加评论系统

**使用 Giscus (GitHub Discussions):**

在 `hugo.toml` 中：

```toml
[params.giscus]
  repo = "yourusername/blog"
  repoId = "R_xxxxx"
  category = "Comments"
  categoryId = "DIC_xxxxx"
  mapping = "pathname"
  theme = "preferred_color_scheme"
```

### 4. 添加搜索功能

已配置！搜索页面在 `/search/`

### 5. 性能优化

```toml
# hugo.toml
[minify]
  minifyOutput = true

[imaging]
  quality = 85
  resampleFilter = "Lanczos"
```

### 6. 添加 RSS 订阅

Hugo 自动生成 RSS，访问：
- 中文: `https://yourdomain.com/index.xml`
- 英文: `https://yourdomain.com/en/index.xml`

---

## 📊 SEO 优化清单

已内置的 SEO 优化：

- ✅ 自动生成 `sitemap.xml`
- ✅ `robots.txt` 配置
- ✅ Open Graph 标签
- ✅ Twitter Card 标签
- ✅ 规范化 URL
- ✅ 语义化 HTML
- ✅ 移动端适配

**额外建议:**

1. **提交站点地图**
   - Google Search Console: https://search.google.com/search-console
   - Bing Webmaster: https://www.bing.com/webmasters

2. **优化图片**
   ```bash
   # 压缩图片（使用 ImageOptim 或在线工具）
   - JPEG: 质量 85
   - PNG: 使用 TinyPNG 压缩
   - 使用 WebP 格式
   ```

3. **添加结构化数据**
   创建 `layouts/partials/extend_head.html` 添加 JSON-LD

---

## 🐛 常见问题

### 问题 1: 主题没有加载

**解决:**
```bash
hugo mod get
hugo mod verify
```

### 问题 2: 端口被占用

**解决:**
```bash
# 使用其他端口
hugo server --port 8080
```

### 问题 3: 修改配置后没有生效

**解决:**
```bash
# 停止服务器 (Ctrl+C)
# 清理缓存
hugo mod clean
# 重新启动
hugo server
```

### 问题 4: Cloudflare Pages 构建失败

**检查:**
1. 环境变量是否设置正确
2. Hugo 版本是否为 Extended
3. 构建命令是否正确: `hugo --minify`
4. 输出目录是否正确: `public`

### 问题 5: 图片不显示

**检查:**
1. 图片路径是否正确（以 `/` 开头）
2. 图片是否在 `static/` 目录下
3. 文件名大小写是否匹配

---

## 📚 学习资源

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [Markdown 语法指南](https://www.markdownguide.org/)
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)

---

## 🎯 下一步

1. ✅ 修改 `hugo.toml` 中的个人信息
2. ✅ 创建第一篇文章
3. ✅ 本地预览确认效果
4. ✅ 推送到 GitHub
5. ✅ 部署到 Cloudflare Pages
6. ✅ 配置自定义域名
7. ✅ 持续写作，分享知识！

---

**Happy Blogging! 🎉**

有问题？参考 README.md 或查阅官方文档。
