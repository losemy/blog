# 📋 Hugo 博客部署检查清单

在部署博客前，请按照此清单逐项检查。

## ✅ 安装前检查

- [ ] 已安装 Hugo Extended 版本 (>= 0.112.0)
  ```bash
  hugo version
  # 应显示 "extended"
  ```

- [ ] 已安装 Git
  ```bash
  git --version
  ```

- [ ] 已有 GitHub 账号（如果使用 Git 部署）

- [ ] 已有 Cloudflare 账号

## ✅ 项目配置检查

### hugo.toml 配置

- [ ] 修改 `baseURL` 为你的域名
  ```toml
  baseURL = 'https://yourdomain.com/'
  ```

- [ ] 修改博客标题
  ```toml
  title = '你的博客名称'
  ```

- [ ] 修改作者信息
  ```toml
  [params]
    author = "你的名字"
    description = "博客描述"
  ```

- [ ] 更新社交链接
  ```toml
  [[params.socialIcons]]
    name = "github"
    url = "https://github.com/你的用户名"
  ```

- [ ] 修改首页欢迎语
  ```toml
  [params.homeInfoParams]
    Title = "欢迎来到我的博客"
    Content = "博客简介"
  ```

### 内容检查

- [ ] 修改 `content/about.md` 关于页面
- [ ] 修改 `content/about.en.md` 英文关于页面
- [ ] 删除或修改示例文章（可选）
  - `content/posts/welcome.md`
  - `content/posts/welcome.en.md`
  - `content/posts/hugo-guide.md`

### 静态资源

- [ ] 替换 `static/favicon.ico` 为自己的图标
- [ ] 准备好封面图片（可选）
  - 建议尺寸: 1200x630 px
  - 放在 `static/images/` 目录

## ✅ 本地测试

- [ ] 初始化 Hugo 模块
  ```bash
  hugo mod init blog
  hugo mod get
  ```

- [ ] 本地启动成功
  ```bash
  hugo server -D
  ```

- [ ] 访问 http://localhost:1313 正常显示

- [ ] 检查所有页面链接
  - [ ] 首页
  - [ ] 文章列表
  - [ ] 单篇文章
  - [ ] 关于页面
  - [ ] 归档页面
  - [ ] 搜索页面
  - [ ] 标签页面

- [ ] 测试语言切换（中文/英文）

- [ ] 测试移动端显示（调整浏览器宽度）

- [ ] 检查代码高亮是否正常

## ✅ Git 配置

- [ ] 初始化 Git 仓库
  ```bash
  git init
  ```

- [ ] 检查 `.gitignore` 文件存在

- [ ] 提交所有文件
  ```bash
  git add .
  git commit -m "Initial commit: Hugo blog setup"
  ```

- [ ] 在 GitHub 创建新仓库

- [ ] 关联远程仓库
  ```bash
  git remote add origin https://github.com/用户名/仓库名.git
  ```

- [ ] 推送到 GitHub
  ```bash
  git branch -M main
  git push -u origin main
  ```

## ✅ Cloudflare Pages 部署（方法一：Git 集成）

- [ ] 登录 Cloudflare Pages
  - 访问: https://pages.cloudflare.com/

- [ ] 创建新项目
  - 点击 "Create a project"
  - 选择 "Connect to Git"

- [ ] 授权 Git 提供商
  - 选择 GitHub 或 GitLab
  - 授权访问

- [ ] 选择仓库
  - 选择你的博客仓库

- [ ] 配置构建设置
  - **Production branch**: `main`
  - **Build command**: `hugo --minify`
  - **Build output directory**: `public`

- [ ] 设置环境变量
  - **HUGO_VERSION**: `0.121.0`
  - **GO_VERSION**: `1.21`

- [ ] 开始部署
  - 点击 "Save and Deploy"
  - 等待构建完成（约 1-3 分钟）

- [ ] 检查部署状态
  - 查看构建日志
  - 确认没有错误

- [ ] 访问生成的 URL
  - 格式: `https://project-name.pages.dev`
  - 确认网站正常显示

## ✅ Cloudflare Pages 部署（方法二：GitHub Actions）

- [ ] 获取 Cloudflare API Token
  - 访问: https://dash.cloudflare.com/profile/api-tokens
  - 创建 Token（使用 "Edit Cloudflare Workers" 模板）

- [ ] 获取 Cloudflare Account ID
  - 在 Cloudflare Pages 项目 URL 中查找
  - 格式: `account/[这里是 Account ID]`

- [ ] 设置 GitHub Secrets
  - 进入仓库 Settings > Secrets and variables > Actions
  - 添加 `CLOUDFLARE_API_TOKEN`
  - 添加 `CLOUDFLARE_ACCOUNT_ID`

- [ ] 修改 `.github/workflows/deploy.yml`
  - 更新 `projectName` 为你的项目名

- [ ] 推送代码触发部署
  ```bash
  git add .
  git commit -m "Setup GitHub Actions"
  git push
  ```

- [ ] 检查 GitHub Actions
  - 访问仓库的 "Actions" 标签
  - 确认工作流运行成功

## ✅ 自定义域名（可选）

- [ ] 在 Cloudflare Pages 项目中添加域名
  - 进入项目设置
  - 点击 "Custom domains"
  - 添加域名

- [ ] 配置 DNS
  - 按照 Cloudflare 提示配置 CNAME 记录
  - 等待 DNS 传播（可能需要几分钟到几小时）

- [ ] 更新 `hugo.toml` 中的 `baseURL`
  ```toml
  baseURL = 'https://yourdomain.com/'
  ```

- [ ] 重新部署
  ```bash
  git add hugo.toml
  git commit -m "Update baseURL"
  git push
  ```

## ✅ SEO 优化检查

- [ ] 提交 sitemap 到 Google Search Console
  - 访问: https://search.google.com/search-console
  - 添加网站属性
  - 提交 sitemap: `https://yourdomain.com/sitemap.xml`

- [ ] 提交 sitemap 到 Bing Webmaster
  - 访问: https://www.bing.com/webmasters
  - 添加网站
  - 提交 sitemap

- [ ] 验证 robots.txt
  - 访问: `https://yourdomain.com/robots.txt`
  - 确认内容正确

- [ ] 测试 Open Graph 标签
  - 使用: https://www.opengraph.xyz/
  - 输入文章 URL 验证

- [ ] 测试移动端友好性
  - 使用: https://search.google.com/test/mobile-friendly

- [ ] 检查页面加载速度
  - 使用: https://pagespeed.web.dev/

## ✅ 功能验证

- [ ] RSS 订阅可用
  - 访问: `https://yourdomain.com/index.xml`
  - 使用 RSS 阅读器测试

- [ ] 搜索功能正常
  - 访问搜索页面
  - 输入关键词测试

- [ ] 标签过滤正常
  - 点击文章标签
  - 查看同标签文章列表

- [ ] 分类过滤正常
  - 点击文章分类
  - 查看同分类文章列表

- [ ] 归档页面正常
  - 按时间顺序显示文章

- [ ] 语言切换正常
  - 切换中英文
  - 内容正确显示

## ✅ 安全检查

- [ ] HTTPS 已启用
  - Cloudflare 自动提供

- [ ] HTTP 头部配置正确
  - 检查 `wrangler.toml` 中的 headers 配置

- [ ] 没有泄露敏感信息
  - 检查 Git 仓库
  - 确认没有 API 密钥等

## ✅ 后续维护

- [ ] 设置定期备份（可选）
  - GitHub 仓库即为备份

- [ ] 制定内容更新计划

- [ ] 监控网站访问统计（可选）
  - 添加 Google Analytics
  - 或使用 Cloudflare Analytics

- [ ] 定期更新主题
  ```bash
  hugo mod get -u
  git add go.mod go.sum
  git commit -m "Update theme"
  git push
  ```

## 🎉 完成！

恭喜！你的 Hugo 博客已成功部署！

### 下一步建议：

1. **开始写作**
   ```bash
   scripts\new-post.bat first-article
   ```

2. **推广博客**
   - 分享到社交媒体
   - 在个人简历中添加链接
   - 在技术社区分享

3. **持续优化**
   - 收集读者反馈
   - 优化文章质量
   - 改进网站性能

4. **学习进阶功能**
   - 自定义主题
   - 添加评论系统
   - 集成分析工具

---

**有问题？** 查看:
- [QUICKSTART.md](./QUICKSTART.md) - 快速开始
- [USAGE.md](./USAGE.md) - 详细教程
- [README.md](./README.md) - 项目说明

Happy Blogging! ✨
