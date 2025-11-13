---
title: "Hugo 博客搭建指南"
date: 2024-01-02T10:00:00+08:00
draft: false
description: "详细介绍如何使用 Hugo 搭建个人博客"
tags: ["Hugo", "教程", "博客"]
categories: ["技术"]
---

## 什么是 Hugo？

Hugo 是一个用 Go 语言编写的静态网站生成器，以其极快的构建速度而闻名。

## 为什么选择 Hugo？

- ⚡ **速度快**：毫秒级的构建速度
- 🎯 **简单**：易于学习和使用
- 🔧 **灵活**：强大的主题系统
- 📦 **单文件**：无需依赖，一个二进制文件即可运行

## 主要特性

### 1. Markdown 支持

Hugo 原生支持 Markdown 格式，让写作变得简单。

### 2. 主题系统

```bash
# 安装主题
hugo mod get github.com/adityatelange/hugo-PaperMod
```

### 3. 快速构建

```bash
# 本地预览
hugo server -D

# 构建生产版本
hugo --minify
```

## 目录结构

```
blog/
├── content/          # 内容目录
│   └── posts/       # 博客文章
├── static/          # 静态资源
├── themes/          # 主题目录
└── hugo.toml        # 配置文件
```

## 总结

Hugo 是一个优秀的静态网站生成器，适合搭建个人博客、文档站点等。

Happy Blogging! 🎉
