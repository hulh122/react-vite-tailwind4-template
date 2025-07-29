# React Vite Tailwind 4 模板 - Claude Code 使用指南

这是一个用于从 HTML 文件生成 React 应用的完整模板项目。

## 项目结构

```
react-vite-tailwind4-template/
├── .github/workflows/
│   └── deploy.yml          # GitHub Pages 自动部署配置
├── .gitignore              # Git 忽略文件
├── CLAUDE.md               # 本使用指南
├── README.md               # 项目说明文档
└── template/               # React 应用模板
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
- ⚡️ **Vite 7** - 最新版本，极速构建
- ⚛️ **React 19** - 最新版本，性能优化
- 📘 **TypeScript** - 完整类型支持
- 🎨 **Tailwind CSS 4** - 使用 `@tailwindcss/vite` 插件
- 🔀 **React Router 7** - 最新路由方案
- 📦 **pnpm** - 快速、节省磁盘空间的包管理器

### 已配置功能
- ✅ TypeScript 严格模式
- ✅ ESLint 代码规范
- ✅ FontAwesome 图标库
- ✅ GitHub Actions CI/CD 自动部署
- ✅ 完整的 .gitignore 配置
- ✅ 最小化框架结构，等待内容填充

## 使用场景

当用户提供多个 HTML 文件并要求生成 React 应用时，使用此模板：

### 1. 项目初始化

```bash
# 复制整个项目（包含部署配置）
cp -r react-vite-tailwind4-template new-project-name
cd new-project-name

# 安装依赖并启动开发
cd template
pnpm install
pnpm dev
```

### 2. 基于 HTML 文件生成应用

当用户提供 HTML 文件时，按以下步骤操作：

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
   - 项目根目录已包含 `.gitignore` 和 `.github/workflows/deploy.yml`
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
cd template
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
5. **完整项目复制** - 复制整个项目目录，不只是 template 文件夹

## 常用命令

```bash
# 开发阶段
cd template
pnpm install     # 安装依赖
pnpm dev         # 开发服务器
pnpm build       # 生产构建
pnpm preview     # 预览构建结果
pnpm lint        # 代码检查

# 部署阶段
git add .
git commit -m "Update from HTML files"
git push         # 推送触发自动部署
```

## 项目交付检查清单

- [ ] 所有 HTML 页面都已转换为 React 组件
- [ ] 路由配置完整，导航功能正常
- [ ] 公共布局提取到 Layout 组件
- [ ] 样式正确应用，响应式设计正常
- [ ] TypeScript 类型定义完整
- [ ] 本地构建测试通过
- [ ] 项目信息配置正确（name、title、base）
- [ ] 推送到 GitHub 并自动部署成功
- [ ] 线上应用功能验证通过