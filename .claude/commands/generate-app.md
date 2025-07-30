# /generate-app - HTML到React应用生成器

从HTML设计文件自动生成完整的React应用，**支持TDD模式开发**，创建独立的项目目录。

## 使用方法

在Claude Code中运行：
```
/generate-app [项目目录名] [--tdd]
```

## 参数说明

- `项目目录名`: 包含HTML文件和产品计划的目录名（相对于当前工作目录）
- `--tdd` (可选): 启用测试驱动开发模式，包含完整的测试配置和测试用例

## 项目命名规范

生成的应用将使用以下命名规范：
- **格式**: `[英文产品名]-[8位hash]`
- **示例**: `ai-math-error-notebook-642519d0`
- **目录**: 在当前工作目录下创建新的项目目录

## 前置要求

项目目录应包含以下文件：
- `*product_plan.md` - 产品计划文档
- `*screen_plan.md` - 屏幕设计计划
- `*.html` - HTML页面文件
- `styles.css` - 自定义样式文件
- `project.json` - 项目配置文件

## 执行步骤

### 标准模式执行步骤

#### 1. 项目分析阶段
```
📁 分析项目结构
├── 读取产品计划文档确定应用名称
├── 生成项目hash值确保唯一性
├── 解析屏幕设计计划  
├── 收集所有HTML文件
└── 提取样式和配置信息
```

#### 2. 项目初始化阶段
```
🚀 创建独立项目目录
├── 复制template模板到新目录
├── 更新项目配置信息
├── 设置正确的部署路径
└── 准备开发环境
```

#### 3. 架构设计阶段
```
🏗️ 设计应用架构
├── 根据产品计划推断数据类型
├── 设计状态管理结构
├── 规划组件层次结构
└── 制定路由配置方案
```

#### 4. 代码生成阶段
```
⚡ 生成React应用代码
├── 创建TypeScript类型定义 (src/types/index.ts)
├── 实现状态管理Context (src/contexts/)
├── 转换HTML为React组件 (src/pages/)
├── 配置应用路由 (src/App.tsx)
└── 适配自定义样式 (src/index.css)
```

#### 5. 优化完善阶段
```
🔧 优化和完善
├── 修复TypeScript类型问题
├── 完善功能设计
├── 更新项目配置信息
└── 运行构建验证
```

### TDD 模式执行步骤 (--tdd)

#### 1-2. 项目分析和初始化（同标准模式）

#### 3. 测试环境配置阶段
```
🧪 配置测试环境
├── template已预配置vitest 3.2 + happy-dom
├── 测试依赖已内置在package.json中
├── src/test/setup.ts 测试环境已配置
└── vite.config.ts 统一包含测试配置
```

#### 4. TDD开发阶段
```
🔴 Red -> 🟢 Green -> 🔵 Refactor
├── 编写组件测试用例
├── 实现组件功能通过测试
└── 重构优化代码结构
```

#### 5. 质量保证阶段
```
✅ 全面质量检查
├── 运行所有测试用例 (pnpm vitest run)
├── 执行代码检查 (pnpm lint)
├── 验证构建过程 (pnpm build)
└── 确保部署配置正确
```

## 生成的应用特性

### 🎯 **完善应用功能设计**
- 保证各页面的功能可用性

### 🎯 **精准UI还原**
- 完全基于提供的HTML设计
- 保持原有的布局和样式
- 移动端响应式适配

### ⚡ **现代技术栈**
- React 18 + TypeScript
- Vite 6.3.5 快速构建
- Tailwind CSS 4 样式框架
- React Router 6 路由管理
- Vitest 3.2 + happy-dom 测试环境

### 🧠 **智能功能**
- 自动推断数据类型
- 生成模拟数据
- 实现状态管理
- 配置页面导航

## 示例用法

假设你有一个名为 `paraflow` 的目录，包含：
```
paraflow/
├── 2:0_product_plan.md          # 产品计划：AI数学智能错题本
├── 3:0_错题列表页面_screen_plan.md
├── 4:0_错题录入页面_screen_plan.md  
├── 5:0_错题详情页面_screen_plan.md
├── 7:0.html                     # 错题列表页面
├── 8:0.html                     # 错题录入页面
├── 9:0.html                     # 错题详情页面
├── styles.css
└── project.json
```

### 标准模式
```bash
/generate-app paraflow
```

将创建独立项目目录：
```
ai-math-error-notebook-642519d0/    # 新的独立项目目录
├── .github/workflows/deploy.yml    # GitHub Pages部署配置
├── src/
│   ├── types/index.ts              # 数据类型定义
│   ├── contexts/AppContext.tsx     # 状态管理
│   ├── components/                 # 共享组件
│   ├── pages/
│   │   ├── Home.tsx               # 错题列表页
│   │   ├── AddQuestion.tsx        # 错题录入页
│   │   └── QuestionDetail.tsx     # 错题详情页
│   ├── App.tsx                    # 路由配置
│   └── index.css                  # 样式文件
├── package.json                   # 项目配置
└── index.html                     # HTML模板
```

### TDD模式
```bash
/generate-app paraflow --tdd
```

将额外包含完整的测试环境：
```
ai-math-error-notebook-642519d0/
├── src/
│   ├── test/
│   │   └── setup.ts               # 测试环境配置
│   ├── types/
│   │   ├── index.ts               # 类型定义
│   │   └── index.test.ts          # 类型测试
│   ├── contexts/
│   │   ├── AppContext.tsx         # 状态管理
│   │   └── AppContext.test.tsx    # 状态管理测试
│   ├── components/
│   │   ├── Header.tsx             # 组件实现
│   │   └── Header.test.tsx        # 组件测试
│   └── pages/
│       ├── Home.tsx               # 页面组件
│       └── Home.test.tsx          # 页面测试
├── package.json                   # 包含测试依赖
└── vite.config.ts                 # 包含测试配置
```

## 构建和部署

生成完成后，进入独立项目目录：

### 标准模式
```bash
cd ai-math-error-notebook-642519d0
pnpm install  # 安装依赖
pnpm dev      # 开发服务器: http://localhost:5173
pnpm build    # 生产构建
pnpm preview  # 预览构建结果
```

### TDD模式额外命令
```bash
pnpm test            # 运行测试（监听模式）
pnpm vitest run      # 运行测试（单次）
pnpm lint            # 代码检查
pnpm lint --fix      # 自动修复lint问题
```

这个slash command将你的静态HTML设计瞬间转换为功能完整、测试覆盖的现代React应用！