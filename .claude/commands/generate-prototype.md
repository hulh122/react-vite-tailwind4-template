# /generate-prototype

## commands 功能
- 以 HTML 和产品描述生成 React 原型 APP

## commands 调用方式
- /generate-prototype [directory]

## commands 任务
1. 执行 sh scripts/create-project.sh 创建应用模板
2. 进入应用模板，理解其中的 React 模板结构
3. 理解 directory 中的 product_plan / screen_plan 想实现的功能以及 html 页面想实现的页面样式
4. 在应用模板中先实现应用原型功能，确保功能无误，体现应用原型能力
5. 按照 html 精细化 UI，确保 UI 还原度
6. 保证可以通过 `pnpm build & pnpm preview` 可以正确完成不报错
7. 在应用模板中生成合理的 README