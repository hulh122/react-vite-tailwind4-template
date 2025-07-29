# React Tailwind 4 Template

> 🚀 用于从 HTML 文件生成 React 应用的纯框架模板

## 特性

- ⚡️ **Vite 7** - 极速构建和热重载
- ⚛️ **React 19** - 最新版本，性能更优
- 📘 **TypeScript** - 完整类型支持
- 🎨 **Tailwind CSS 4** - 原生 CSS，性能提升
- 🔀 **React Router 7** - 现代路由解决方案
- 📦 **pnpm** - 快速、节省磁盘空间的包管理器
- 🚀 **GitHub Pages** - 一键部署配置
- 🔧 **最小化框架** - 纯净模板，等待内容填充

## 使用场景

此模板专为以下场景设计：
- 用户提供多个 HTML 文件
- 需要将 HTML 转换为 React 应用
- 要求保持原有设计和布局
- 需要现代化的技术栈

## 快速开始

### 1. 使用模板

```bash
# 复制模板到你的项目
cp -r react-tailwind4-template my-new-project
cd my-new-project

# 安装依赖
pnpm install

# 启动开发
pnpm dev
```

### 2. 基于 HTML 生成应用

当收到 HTML 文件时：

1. **分析结构** - 识别公共布局和独立页面
2. **提取布局** - 更新 `src/components/Layout.tsx`
3. **创建页面** - 为每个 HTML 创建对应页面组件
4. **配置路由** - 在 `src/App.tsx` 中添加路由

## 项目结构

```
src/
├── components/
│   └── Layout.tsx          # 基础布局框架
├── pages/
│   └── Home.tsx           # 首页模板
├── types/
│   └── index.ts           # TypeScript 类型
├── App.tsx                # 应用根组件（最小路由）
├── main.tsx               # 应用入口
└── index.css              # 全局样式

.github/workflows/
└── deploy.yml             # GitHub Pages 自动部署
```

## 核心概念

### 最小化框架
- 只提供必要的技术栈配置
- 不包含任何具体的 UI 实现
- 所有内容基于用户提供的 HTML 生成

### HTML 到 React 转换
- `class` → `className`
- 静态内容 → React 组件
- 样式保持 Tailwind CSS 类名
- 交互逻辑添加 React 事件处理

### 布局提取
- 识别 HTML 中的公共元素
- 提取到 Layout 组件
- 保持页面内容的独立性

## 可用命令

```bash
pnpm dev      # 启动开发服务器
pnpm build    # 构建生产版本
pnpm preview  # 预览构建结果
pnpm lint     # 代码检查
pnpm deploy   # 手动部署到 GitHub Pages
```

## 部署

### GitHub Pages (推荐)
1. 推送到 GitHub 仓库
2. 启用 GitHub Pages (Settings > Pages > GitHub Actions)
3. 自动部署到 `https://username.github.io/repo-name/`

### 其他平台
- **Vercel**: 连接 GitHub 自动部署
- **Netlify**: 拖拽部署或 Git 集成
- **Firebase Hosting**: `pnpm add -g firebase-tools && firebase deploy`

## 工作流程

1. **接收 HTML** - 用户提供设计文件
2. **分析结构** - 识别布局和页面模式
3. **生成组件** - 转换为 React 组件
4. **配置路由** - 设置页面导航
5. **优化代码** - 添加类型和交互
6. **测试部署** - 确保正常运行

## 技术要求

- Node.js 18+
- pnpm 8+
- 现代浏览器支持

## 许可证

MIT License - 可自由使用和修改

---

⭐ 这是一个生成工具模板，等待基于 HTML 文件的具体实现