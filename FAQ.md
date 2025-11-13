# ❓ 常见问题解答 (FAQ)

## 📦 安装相关

### Q1: 如何确认 Hugo 是否为 Extended 版本？

```bash
hugo version
```

输出应包含 "extended" 字样，例如：
```
hugo v0.121.0+extended windows/amd64
```

如果没有 "extended"，需要重新安装 Extended 版本。

**Windows:**
```bash
choco install hugo-extended -y
```

**macOS:**
```bash
brew install hugo
```

---

### Q2: Hugo 安装后命令找不到？

**Windows:**
1. 检查是否将 Hugo 添加到系统 PATH
2. 重启命令行窗口
3. 使用完整路径执行

**Linux/macOS:**
```bash
# 检查 Hugo 是否在 PATH 中
which hugo

# 如果不在，添加到 ~/.bashrc 或 ~/.zshrc
export PATH=$PATH:/path/to/hugo
```

---

### Q3: 主题下载失败怎么办？

```bash
# 方法 1: 清理缓存后重试
hugo mod clean
hugo mod get

# 方法 2: 使用代理（中国大陆用户）
export GOPROXY=https://goproxy.cn,direct
hugo mod get

# 方法 3: 手动下载主题
git clone https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

---

## 🚀 本地开发

### Q4: `hugo server` 启动后无法访问？

**检查事项:**
1. 端口是否被占用？
   ```bash
   # 使用其他端口
   hugo server --port 8080
   ```

2. 防火墙是否阻止？
   - 临时关闭防火墙测试

3. 绑定地址问题？
   ```bash
   # 绑定到所有网络接口
   hugo server --bind 0.0.0.0
   ```

---

### Q5: 修改文件后页面没有更新？

1. **检查浏览器缓存**
   - 按 Ctrl+F5 强制刷新

2. **禁用快速渲染**
   ```bash
   hugo server --disableFastRender
   ```

3. **重启服务器**
   - 按 Ctrl+C 停止
   - 重新运行 `hugo server`

---

### Q6: 草稿文章不显示？

使用 `-D` 参数显示草稿：

```bash
hugo server -D
```

或者修改文章的 Front Matter：
```yaml
draft: false  # 改为 false
```

---

## 📝 内容创建

### Q7: 如何创建新文章？

**方法 1: 使用命令（推荐）**
```bash
# Windows
scripts\new-post.bat article-name

# Linux/macOS
./scripts/new-post.sh article-name
```

**方法 2: 手动创建**
在 `content/posts/` 目录下创建 `.md` 文件。

---

### Q8: 图片无法显示？

**常见原因和解决方案:**

1. **路径错误**
   ```markdown
   # ❌ 错误（相对路径）
   ![图片](images/photo.jpg)
   
   # ✅ 正确（绝对路径，以 / 开头）
   ![图片](/images/photo.jpg)
   ```

2. **文件不在 static 目录**
   - 图片必须放在 `static/images/` 目录
   - 不要放在 `content/` 目录

3. **文件名大小写不匹配**
   - Linux 系统区分大小写
   - 确保文件名完全一致

---

### Q9: 代码高亮不显示？

1. **检查语言标识符**
   ````markdown
   ```python  ← 确保语言名称正确
   def hello():
       print("Hello")
   ```
   ````

2. **检查配置**
   在 `hugo.toml` 中确认：
   ```toml
   [markup.highlight]
     style = 'monokai'
     lineNos = true
   ```

---

### Q10: 如何添加封面图？

在文章的 Front Matter 中添加：

```yaml
---
title: "文章标题"
cover:
  image: "/images/cover.jpg"
  alt: "封面图描述"
  caption: "图片说明"
  relative: false
---
```

---

## 🔧 配置相关

### Q11: 如何修改菜单？

编辑 `hugo.toml`：

```toml
[[languages.zh-cn.menu.main]]
  name = "新菜单"
  url = "/new-page/"
  weight = 10  # 数字越小越靠前
```

---

### Q12: 如何添加 Google Analytics？

在 `hugo.toml` 中添加：

```toml
[params]
  googleAnalytics = "G-XXXXXXXXXX"
```

---

### Q13: 如何修改主题颜色？

创建 `assets/css/extended/custom.css`：

```css
:root {
    --primary: #0066cc;  /* 主色调 */
}
```

---

## 🚀 部署相关

### Q14: Cloudflare Pages 构建失败？

**检查构建日志中的错误信息：**

1. **Hugo 版本问题**
   - 确认环境变量: `HUGO_VERSION = 0.121.0`

2. **主题未找到**
   - 确保 `go.mod` 在仓库中
   - 确保 `hugo.yaml` 配置正确

3. **构建命令错误**
   - 正确命令: `hugo --minify`
   - 输出目录: `public`

4. **Go 版本问题**
   - 添加环境变量: `GO_VERSION = 1.21`

---

### Q15: 部署后样式丢失？

1. **检查 baseURL**
   ```toml
   # 确保以 / 结尾
   baseURL = 'https://yourdomain.com/'
   ```

2. **重新构建**
   ```bash
   hugo --minify
   ```

3. **清除 Cloudflare 缓存**
   - 在 Cloudflare Dashboard 中清除缓存

---

### Q16: 如何查看部署日志？

**Cloudflare Pages:**
1. 登录 Cloudflare Pages
2. 选择你的项目
3. 点击最新的部署
4. 查看 "Build logs"

**GitHub Actions:**
1. 访问 GitHub 仓库
2. 点击 "Actions" 标签
3. 选择最新的工作流运行
4. 查看日志输出

---

### Q17: 如何回滚到之前的版本？

**Cloudflare Pages:**
1. 进入项目页面
2. 查看 "Deployments" 历史
3. 选择要回滚的版本
4. 点击 "Rollback to this deployment"

**Git 方式:**
```bash
git revert HEAD
git push
```

---

## 🌐 域名相关

### Q18: 如何绑定自定义域名？

1. **在 Cloudflare Pages 中添加域名**
   - 进入项目设置
   - Custom domains > Add a domain

2. **配置 DNS**
   - 添加 CNAME 记录
   - 指向 `your-project.pages.dev`

3. **等待 DNS 生效**
   - 通常需要几分钟到几小时

---

### Q19: HTTPS 证书问题？

Cloudflare Pages 自动提供免费 SSL 证书，通常会在域名添加后几分钟内生效。

如果长时间未生效：
1. 检查 DNS 配置是否正确
2. 在 Cloudflare 中启用 "Always Use HTTPS"
3. 清除浏览器缓存

---

## 🎨 主题和样式

### Q20: 如何更新主题？

```bash
# 更新到最新版本
hugo mod get -u

# 查看当前版本
hugo mod graph

# 清理缓存
hugo mod clean

# 提交更新
git add go.mod go.sum
git commit -m "Update theme"
git push
```

---

### Q21: 如何自定义主题？

**推荐方式（不修改主题文件）:**

1. **自定义 CSS**
   创建 `assets/css/extended/custom.css`

2. **覆盖布局**
   在 `layouts/` 目录创建同名文件

3. **添加自定义 HTML**
   创建 `layouts/partials/extend_head.html`

---

## 📊 SEO 和性能

### Q22: 如何提交网站到搜索引擎？

**Google:**
1. 访问 https://search.google.com/search-console
2. 添加网站属性
3. 验证所有权
4. 提交 sitemap: `https://yourdomain.com/sitemap.xml`

**Bing:**
1. 访问 https://www.bing.com/webmasters
2. 添加网站
3. 验证所有权
4. 提交 sitemap

---

### Q23: 如何优化网站速度？

1. **压缩构建**
   ```bash
   hugo --minify
   ```

2. **优化图片**
   - 使用 WebP 格式
   - 压缩图片大小
   - 建议单张图片 < 200KB

3. **启用 CDN**
   - Cloudflare Pages 自带 CDN

4. **使用缓存**
   - 在 `wrangler.toml` 中配置缓存头

---

## 🔍 搜索功能

### Q24: 搜索功能不工作？

1. **检查配置**
   ```toml
   [outputs]
     home = ["HTML", "RSS", "JSON"]
   ```

2. **检查搜索页面**
   - `content/search.md` 必须存在

3. **重新构建**
   ```bash
   hugo --minify
   ```

---

## 🌍 多语言

### Q25: 如何添加更多语言？

在 `hugo.toml` 中添加新语言配置：

```toml
[languages.ja]
  languageName = "日本語"
  weight = 3
  
  [[languages.ja.menu.main]]
    name = "ホーム"
    url = "/ja/"
    weight = 1
```

创建对应的内容文件：
```
content/posts/article.ja.md
```

---

## 🛠️ 其他问题

### Q26: 如何备份博客？

1. **Git 仓库即为备份**
   - GitHub/GitLab 托管

2. **额外备份**
   ```bash
   # 定期克隆到本地
   git clone https://github.com/username/blog.git backup/
   ```

3. **导出内容**
   - `content/` 目录包含所有文章
   - 定期复制到其他位置

---

### Q27: 如何迁移到其他平台？

Hugo 生成的是标准的静态网站，可以部署到任何静态托管服务：

- **Netlify**: 修改构建配置
- **Vercel**: 添加 `vercel.json`
- **GitHub Pages**: 使用 GitHub Actions
- **自己的服务器**: 上传 `public/` 目录

---

### Q28: 出现 Git 冲突怎么办？

```bash
# 查看冲突文件
git status

# 编辑冲突文件，解决冲突标记
# <<<<<<< HEAD
# ...
# =======
# ...
# >>>>>>> branch

# 标记为已解决
git add conflicted-file

# 提交
git commit -m "Resolve conflicts"
```

---

### Q29: 如何添加评论系统？

**使用 Giscus (基于 GitHub Discussions):**

1. 在 GitHub 仓库中启用 Discussions
2. 访问 https://giscus.app/ 获取配置
3. 在 `hugo.toml` 中添加配置

**其他选择:**
- Disqus
- Utterances
- Waline

---

### Q30: 需要帮助时去哪里？

1. **本项目文档**
   - [README.md](./README.md)
   - [USAGE.md](./USAGE.md)
   - [QUICKSTART.md](./QUICKSTART.md)

2. **官方文档**
   - [Hugo 文档](https://gohugo.io/documentation/)
   - [PaperMod Wiki](https://github.com/adityatelange/hugo-PaperMod/wiki)

3. **社区支持**
   - [Hugo 论坛](https://discourse.gohugo.io/)
   - [Hugo Discord](https://discord.gg/hugo)
   - Stack Overflow (标签: hugo)

4. **GitHub Issues**
   - [Hugo Issues](https://github.com/gohugoio/hugo/issues)
   - [PaperMod Issues](https://github.com/adityatelange/hugo-PaperMod/issues)

---

## 📝 问题未解决？

如果以上 FAQ 没有解决你的问题：

1. 检查错误日志，找出具体错误信息
2. 搜索相关错误信息
3. 在 Hugo 论坛提问
4. 查阅官方文档

记得提问时提供：
- Hugo 版本
- 操作系统
- 完整错误信息
- 相关配置文件

---

**持续更新中...** 

如果你遇到了新问题并找到了解决方案，欢迎补充到这个文档！✨
