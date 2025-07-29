# /generate-app - HTML到React应用生成器

从HTML设计文件自动生成完整的React应用，直接修改现有的template框架。

## 使用方法

在Claude Code中运行：
```
/generate-app [项目目录名]
```

## 参数说明

- `项目目录名`: 包含HTML文件和产品计划的目录名（相对于当前工作目录）

## 前置要求

项目目录应包含以下文件：
- `*product_plan.md` - 产品计划文档
- `*screen_plan.md` - 屏幕设计计划（可选）  
- `*.html` - HTML页面文件
- `styles.css` - 自定义样式文件（可选）
- `project.json` - 项目配置文件（可选）

## 执行步骤

### 1. 项目分析阶段
```
📁 分析项目结构
├── 读取产品计划文档
├── 解析屏幕设计计划  
├── 收集所有HTML文件
└── 提取样式和配置信息
```

### 2. 架构设计阶段
```
🏗️ 设计应用架构
├── 根据产品计划推断数据类型
├── 设计状态管理结构
├── 规划组件层次结构
└── 制定路由配置方案
```

### 3. 代码生成阶段
```
⚡ 生成React应用代码
├── 创建TypeScript类型定义 (src/types/index.ts)
├── 实现状态管理Context (src/contexts/)
├── 转换HTML为React组件 (src/pages/)
├── 配置应用路由 (src/App.tsx)
└── 适配自定义样式 (src/index.css)
```

### 4. 优化完善阶段
```
🔧 优化和完善
├── 修复TypeScript类型问题
├── 添加移动端适配样式
├── 更新项目配置信息
└── 运行构建验证
```

## 生成的应用特性

### 🎯 **精准UI还原**
- 完全基于提供的HTML设计
- 保持原有的布局和样式
- 移动端响应式适配

### ⚡ **现代技术栈**
- React 18 + TypeScript
- Vite 7 快速构建
- Tailwind CSS 4 样式框架
- React Router 6 路由管理

### 🧠 **智能功能**
- 自动推断数据类型
- 生成模拟数据
- 实现状态管理
- 配置页面导航

### 📱 **移动优先**
- 390px移动端布局
- FontAwesome图标支持
- 自定义阴影效果
- 底部指示器样式

## 示例用法

假设你有一个名为 `my-app-design` 的目录，包含：
```
my-app-design/
├── app_product_plan.md
├── home_screen_plan.md
├── login_screen_plan.md
├── home.html
├── login.html
├── styles.css
└── project.json
```

在Claude Code中运行：
```
/generate-app my-app-design
```

将自动生成：
```
template/
├── src/
│   ├── types/index.ts           # 数据类型定义
│   ├── contexts/AppContext.tsx  # 状态管理
│   ├── pages/
│   │   ├── Home.tsx            # 首页组件
│   │   └── Login.tsx           # 登录页组件
│   ├── App.tsx                 # 路由配置
│   └── index.css               # 样式文件
├── package.json                # 项目配置
└── index.html                  # HTML模板
```

## 高级特性

### 🔄 **状态管理自动化**
- 基于Context API的全局状态
- useReducer处理复杂状态变更
- 自定义Hook简化状态访问

### 🎨 **样式智能转换**
- HTML class属性转换为className
- 自定义CSS类名保持不变
- Tailwind工具类自动识别

### 🛣️ **路由自动配置**
- 基于HTML文件数量生成路由
- 支持参数路由 (`/item/:id`)
- 自动添加导航逻辑

### 📦 **模块化架构**
- 组件化页面结构
- 可复用的业务逻辑
- 清晰的文件组织结构

## 构建和部署

生成完成后，可以立即运行：

```bash
cd template
pnpm install  # 如果需要
pnpm dev      # 开发服务器
pnpm build    # 生产构建
```

应用将在 `http://localhost:5173` 可访问。

## 注意事项

⚠️ **重要提醒**：
- 确保HTML文件结构完整且语义化
- 产品计划文档有助于生成更准确的数据类型
- 自定义样式将被保留并适配到React环境
- 生成的代码遵循React和TypeScript最佳实践

🎯 **最佳实践**：
- 使用描述性的HTML id和class名称
- 在产品计划中明确说明数据结构和业务逻辞
- 保持HTML文件的一致性和规范性

这个slash command将你的静态HTML设计瞬间转换为功能完整的现代React应用！