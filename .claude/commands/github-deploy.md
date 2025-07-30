# /github-deploy

## commands 功能
将生成的原型应用推送到 github 仓库，并完成部署

## commands 任务
1. 通过 sh deploy.sh 推送到 github 仓库
2. 判断 actions 执行完成并保证 pages 部署成功
3. 如果不成功修复应用并推送知道 pages 部署成功
4. 输出 pages 地址和 git repo 地址