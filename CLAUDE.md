# React Vite Tailwind 4 模板 - Claude Code 使用指南

这是一个用于从 HTML 文件生成 React 应用的完整模板项目。

## 项目结构

```
react-vite-tailwind4-template/
├── CLAUDE.md               # 本使用指南
├── README.md               # 项目说明文档
└── template/               # React 应用模板
    ├── .github/workflows/
    │   └── deploy.yml      # GitHub Pages 自动部署配置
    ├── src/
    │   ├── components/
    │   │   └── Layout.tsx  # 基础布局框架
    │   ├── pages/
    │   │   └── Home.tsx    # 首页模板
    │   ├── types/
    │   │   └── index.ts    # TypeScript 类型定义
    │   ├── App.tsx         # 应用根组件
    │   ├── main.tsx        # 应用入口
    │   └── index.css       # 全局样式
    ├── public/             # 静态资源
    ├── package.json        # 项目依赖配置
    ├── vite.config.ts      # Vite 构建配置
    ├── tsconfig.json       # TypeScript 配置
    └── README.md           # 模板说明
```

## 模板特性

### 核心技术栈
- ⚡️ **Vite 6.3.5** - 最新版本，极速构建
- ⚛️ **React 18** - 稳定版本，性能优化
- 📘 **TypeScript** - 完整类型支持
- 🎨 **Tailwind CSS 4** - 使用 `@tailwindcss/vite` 插件
- 🔀 **React Router 6** - 路由管理
- 📦 **pnpm** - 快速、节省磁盘空间的包管理器

### 已配置功能
- ✅ TypeScript 严格模式
- ✅ ESLint 代码规范
- ✅ FontAwesome 图标库
- ✅ 完整的测试环境（Vitest 3.2 + happy-dom）
- ✅ GitHub Actions CI/CD 自动部署
- ✅ 完整的 .gitignore 配置
- ✅ 最小化框架结构，等待内容填充

## 使用场景

当用户提供多个 HTML 文件并要求生成 React 应用时，使用此模板：

### 1. 项目初始化和命名

**推荐使用 TDD 方式生成应用**，按以下规范创建项目：

```bash
# 1. 分析产品计划确定应用名称
# 从产品计划文档中提取核心名称，如："AI 数学智能错题本"
# 转换为英文：ai-math-error-notebook

# 2. 生成项目 hash（确保唯一性）
echo "产品名称$(date +%Y%m%d)" | md5 | cut -c1-8

# 3. 创建项目目录（格式：英文名-hash值）
cp -r react-vite-tailwind4-template/template ai-math-error-notebook-642519d0
cd ai-math-error-notebook-642519d0

# 4. 安装依赖（包含测试依赖）
pnpm install
```

**项目命名规范**：
- 格式：`[英文产品名]-[8位hash]`
- 示例：`ai-math-error-notebook-642519d0`
- Hash 生成：基于产品名称和日期

### 2. TDD 开发流程（推荐）

**以测试驱动开发方式实现应用**，确保代码质量和功能完整性：

#### 第一阶段：配置和类型定义（15分钟）
```bash
# 1. 更新项目配置
# - package.json: 修改 name，添加测试脚本和依赖
# - index.html: 更新 title
# - vite.config.ts: 添加测试配置，更新 base 路径

# 2. 配置测试环境
mkdir -p src/test
echo "// Test setup for happy-dom environment" > src/test/setup.ts

# 3. 编写类型定义测试
# src/types/index.test.ts: 测试数据结构

# 4. 实现类型定义
# src/types/index.ts: 定义 ErrorQuestion, SimilarQuestion 等类型
```

#### 第二阶段：状态管理（30分钟）
```bash
# 1. 编写状态管理测试
# src/contexts/AppContext.test.tsx: 测试状态管理逻辑

# 2. 实现状态管理
# src/contexts/AppContext.tsx: Context + useReducer 实现

# 3. 运行测试验证
pnpm vitest run
```

#### 第三阶段：组件实现（1-2小时）
```bash
# 1. 编写组件测试用例
# 2. 实现共享组件 (StatusBar, Header, etc.)
# 3. 转换 HTML 页面为 React 组件
# 4. 配置路由和页面导航
```

### 3. 传统方式生成应用

当不使用 TDD 时，按以下步骤操作：

#### 分析 HTML 文件结构
1. 查看所有提供的 HTML 文件
2. 识别公共布局元素（header、nav、footer等）
3. 识别独立页面内容
4. 分析路由结构和导航关系

#### 生成布局组件
根据 HTML 文件中的公共元素，更新 `template/src/components/Layout.tsx`：

- 分析所有 HTML 文件，找出重复出现的结构（如导航栏、页脚、侧边栏等）
- 将这些公共元素提取到 Layout 组件中
- 保持 `{children}` 作为页面内容的占位符
- 根据实际设计决定布局结构，不要假设固定的 header/main/footer 模式

#### 生成页面组件
为每个 HTML 文件创建对应的页面组件：

- 在 `template/src/pages/` 目录下创建对应的 `.tsx` 文件
- 将 HTML 内容转换为 JSX 格式
- 注意转换规则：`class` → `className`，`onclick` → `onClick` 等
- 移除已提取到 Layout 的公共部分，只保留页面特有内容

#### 配置路由
在 `template/src/App.tsx` 中配置页面路由：

- 导入所有创建的页面组件
- 为每个页面设置合适的路由路径
- 根据 HTML 文件的导航结构确定路由层级
- 考虑是否需要嵌套路由或重定向

#### 项目配置
1. **更新项目信息**：
   - `template/package.json` - 修改 `name` 字段
   - `template/index.html` - 修改 `title`
   - `template/vite.config.ts` - 修改 `base` 路径为仓库名

2. **Git 仓库配置**：
   - 模板目录已包含 `.github/workflows/deploy.yml` 部署配置
   - 直接推送到 GitHub 即可自动部署

### 3. HTML 到 React 转换指南

#### CSS 类名转换
- `class="container"` → `className="container"`
- 保持所有 Tailwind CSS 类名不变
- 自定义样式添加到 `template/src/index.css`

#### 属性转换
- `onclick="handleClick()"` → `onClick={handleClick}`
- `onsubmit="handleSubmit()"` → `onSubmit={handleSubmit}`
- `for="input"` → `htmlFor="input"`

#### 表单处理
```tsx
// HTML 表单
<input type="text" value="default" onchange="handleChange()">

// React 受控组件
const [value, setValue] = useState('default');
<input 
  type="text" 
  value={value} 
  onChange={(e) => setValue(e.target.value)} 
/>
```

#### 条件渲染和列表
```tsx
// 条件渲染
{isVisible && <div>Content</div>}

// 列表渲染
{items.map((item, index) => (
  <div key={index}>{item.name}</div>
))}
```

### 4. 部署配置

#### GitHub Pages 自动部署
项目已包含完整的部署配置：

1. **推送到 GitHub**：
   ```bash
   git init
   git add .
   git commit -m "Initial commit from HTML template"
   git branch -M main
   git remote add origin https://github.com/username/repo-name.git
   git push -u origin main
   ```

2. **启用 GitHub Pages**：
   - 进入仓库 Settings → Pages
   - Source 选择 "GitHub Actions"
   - 等待自动部署完成

3. **访问应用**：
   - 访问：`https://username.github.io/repo-name/`

#### 本地构建测试
```bash
pnpm build      # 构建生产版本
pnpm preview    # 本地预览构建结果
```

## 开发工作流

### 分析阶段（15-30分钟）
1. 仔细查看所有 HTML 文件
2. 识别页面间的公共元素
3. 分析页面结构和导航逻辑
4. 规划组件架构

### 转换阶段（1-3小时）
1. 提取公共布局到 Layout 组件
2. 转换每个 HTML 页面为 React 组件
3. 配置路由和页面导航
4. 处理样式和资源引用

### 优化阶段（30分钟-1小时）
1. 添加 TypeScript 类型定义
2. 优化组件结构和代码复用
3. 处理响应式设计和交互功能
4. 测试各个页面和功能

### 部署阶段（10-15分钟）
1. 更新项目配置信息
2. 测试本地构建：`pnpm build`
3. 推送到 GitHub 并等待自动部署
4. 验证线上应用功能正常

**注意**：现在 `.github/workflows/deploy.yml` 位于项目内部，推送项目到 GitHub 时会自动包含部署配置。

## 常见问题和解决方案

### 构建问题
- **Tailwind 样式不生效**：确认 `tailwindcss` 包已安装
- **TypeScript 报错**：检查类型定义和导入路径
- **路由不工作**：确认 `vite.config.ts` 中的 `base` 配置

### 部署问题
- **GitHub Pages 404**：检查 `base` 路径是否与仓库名匹配
- **资源加载失败**：确认静态资源路径配置正确
- **构建失败**：查看 GitHub Actions 日志排查问题

## 重要提醒

1. **保持框架纯净** - 模板只提供最小化框架结构
2. **基于需求生成** - 所有内容都基于用户提供的 HTML 文件
3. **遵循最佳实践** - 组件化、类型安全、性能优化
4. **确保可部署** - 每次修改后测试构建和部署流程
5. **自包含项目** - 现在 template 目录包含所有必要的配置文件，包括部署配置

## 常用命令

```bash
# 开发阶段
pnpm install     # 安装依赖
pnpm dev         # 开发服务器
pnpm build       # 生产构建
pnpm preview     # 预览构建结果
pnpm lint        # 代码检查

# 测试阶段（TDD 开发时）
pnpm test        # 运行测试（监听模式）
pnpm vitest run  # 运行测试（单次执行）
pnpm test:ui     # 测试 UI 界面（如果配置了）

# 部署阶段
git add .
git commit -m "Update from HTML files"
git push         # 推送触发自动部署
```

## TDD 开发最佳实践

### 测试环境配置

template 已预配置完整的测试环境：

**核心测试依赖**：
- `vitest: ^3.2.0` - 现代测试框架，与 Vite 深度集成
- `happy-dom: ^17.6.1` - 轻量级 DOM 模拟环境，比 jsdom 更快
- `@testing-library/react: ^16.1.0` - React 组件测试工具
- `@testing-library/user-event: ^14.5.2` - 用户交互模拟

**配置文件**：
```typescript
// vite.config.ts - 统一配置
/// <reference types="vitest" />
export default defineConfig({
  plugins: [react(), tailwindcss()],
  // ... 其他配置
  test: {
    globals: true,
    environment: 'happy-dom',
    setupFiles: ['./src/test/setup.ts'],
  },
})
```

**测试脚本**：
```json
// package.json
{
  "scripts": {
    "test": "vitest",
    "test:ui": "vitest --ui"
  }
}
```

### 测试文件组织
```
src/
├── types/
│   ├── index.ts          # 类型定义
│   └── index.test.ts     # 类型测试
├── contexts/
│   ├── AppContext.tsx    # 状态管理
│   └── AppContext.test.tsx # 状态管理测试
├── components/
│   ├── Header.tsx        # 组件实现
│   └── Header.test.tsx   # 组件测试
└── test/
    └── setup.ts          # 测试环境配置
```

## Lint 常见问题和解决方案

### TypeScript 类型导入问题
当遇到 `'Type' is a type and must be imported using a type-only import when 'verbatimModuleSyntax' is enabled` 错误时：

```typescript
// ❌ 错误的导入方式
import { ErrorQuestionCardProps } from '../types';

// ✅ 正确的导入方式  
import type { ErrorQuestionCardProps } from '../types';
```

### 未使用变量问题
当遇到 `'variable' is defined but never used` 错误时：

```typescript
// ❌ 错误：定义了但未使用
const { id } = useParams<{ id: string }>();

// ✅ 方法1：使用下划线前缀标记为故意未使用
const { id: _id } = useParams<{ id: string }>();

// ✅ 方法2：如果确实不需要，直接调用不解构
useParams<{ id: string }>();
```

### React Refresh 问题
当遇到 `Fast refresh only works when a file only exports components` 错误时：

```typescript
// ❌ 错误：在组件文件中混合导出工具函数
export function useApp() { ... }

// ✅ 正确：添加 eslint-disable 注释
// eslint-disable-next-line react-refresh/only-export-components
export function useApp() { ... }
```

### 自动修复lint问题命令
```bash
pnpm lint --fix    # 自动修复可修复的lint问题
```

## 项目交付检查清单

### 基础实现检查
- [ ] 所有 HTML 页面都已转换为 React 组件
- [ ] 路由配置完整，导航功能正常
- [ ] 公共布局提取到 Layout 组件
- [ ] 样式正确应用，响应式设计正常
- [ ] TypeScript 类型定义完整
- [ ] 项目信息配置正确（name、title、base）

### TDD 开发检查（推荐）
- [ ] 测试环境配置完成（vitest 3.2 + happy-dom）
- [ ] 类型定义测试通过
- [ ] 状态管理测试通过
- [ ] 关键组件测试覆盖
- [ ] 所有测试用例运行通过（`pnpm vitest run`）

### 质量保证检查
- [ ] Lint 检查通过（`pnpm lint`）
- [ ] 本地构建测试通过（`pnpm build`）
- [ ] 代码遵循项目规范
- [ ] 无 TypeScript 类型错误

### 部署验证检查
- [ ] 推送到 GitHub 并自动部署成功
- [ ] 线上应用功能验证通过
- [ ] GitHub Pages 访问正常
- [ ] 移动端适配正确

### 文档完整性检查
- [ ] README.md 包含项目说明
- [ ] 代码注释清晰完整
- [ ] 组件使用说明完整