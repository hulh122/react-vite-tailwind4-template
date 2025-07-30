# /generate-prototype

## commands 功能
- 以 HTML 和产品描述生成 React 原型 APP

## commands 调用方式
- /generate-prototype [directory]

## commands 任务
1. 理解 directory 中的 product_plan / screen_plan 想实现的功能以及 html 页面想实现的页面样式. 选择一个最核心的页面来实现下面的需求
2. 执行 sh scripts/create-project.sh 创建应用模板
3. 进入应用模板，理解其中的 React 模板结构
4. 在应用模板中实现应用原型功能(确保功能无误，体现应用原型能力), UI 部分直接按照 Html 的样式生成
5. 通过 `pnpm build` 保证编译不报错即可
6. 调用 sh deploy.sh -n {应用文件夹名} -d {描述} 来上传到 github，我已经提供了 token，直接执行即可。将部署好的 github repo 和 pages 地址返回给我

## React 注意事项
- 在 import 类型时使用 import type
- 在 react 函数组件中如果一个变量没有使用到则不要添加