#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 生成8位随机hash
generate_hash() {
    echo $(date +%s | md5 | head -c 8) 2>/dev/null || echo $(date +%s | sha256sum | head -c 8)
}

# 显示帮助
show_help() {
    echo -e "${YELLOW}使用方法: ./create-project.sh <项目名称> [8位hash]${NC}"
    echo ""
    echo "示例:"
    echo "  ./create-project.sh my-project"
    echo "  ./create-project.sh my-project abcd1234"
    echo ""
    echo "参数说明:"
    echo "  项目名称    必需，英文项目名称"
    echo "  8位hash     可选，8位字符，不提供则自动生成"
}

# 主函数
main() {
    if [[ $# -eq 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        show_help
        exit 0
    fi
    
    PROJECT_NAME="$1"
    HASH="${2:-$(generate_hash)}"
    
    # 验证参数
    if [[ -z "$PROJECT_NAME" ]]; then
        echo -e "${RED}❌ 项目名称不能为空${NC}"
        exit 1
    fi
    
    # 验证hash长度
    if [[ ${#HASH} -ne 8 ]]; then
        echo -e "${RED}❌ Hash 必须是8位字符，当前长度: ${#HASH}${NC}"
        exit 1
    fi
    
    # 验证hash格式（只包含字母和数字）
    if [[ ! "$HASH" =~ ^[a-zA-Z0-9]+$ ]]; then
        echo -e "${RED}❌ Hash 只能包含字母和数字${NC}"
        exit 1
    fi
    
    FULL_NAME="${PROJECT_NAME}-${HASH}"
    
    # 定义路径
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    TEMPLATE_DIR="$(dirname "$SCRIPT_DIR")/template"
    TARGET_DIR="$(dirname "$SCRIPT_DIR")/$FULL_NAME"
    
    echo -e "${BLUE}🚀 创建项目: $FULL_NAME${NC}"
    echo -e "${YELLOW}📂 模板目录: $TEMPLATE_DIR${NC}"
    echo -e "${YELLOW}📂 目标目录: $TARGET_DIR${NC}"
    
    # 检查模板目录
    if [[ ! -d "$TEMPLATE_DIR" ]]; then
        echo -e "${RED}❌ 模板目录不存在: $TEMPLATE_DIR${NC}"
        exit 1
    fi
    
    # 检查目标目录
    if [[ -d "$TARGET_DIR" ]]; then
        echo -e "${RED}❌ 目录已存在: $TARGET_DIR${NC}"
        exit 1
    fi
    
    # 复制模板
    echo -e "${BLUE}📋 复制模板...${NC}"
    if cp -r "$TEMPLATE_DIR" "$TARGET_DIR"; then
        echo -e "${GREEN}✅ 模板复制成功${NC}"
    else
        echo -e "${RED}❌ 复制模板失败${NC}"
        exit 1
    fi
    
    # 更新配置文件 - 统一替换 TEMPLATE_NAME 占位符
    echo -e "${BLUE}⚙️ 更新配置...${NC}"
    
    # 使用 find 和 sed 批量替换所有文件中的 TEMPLATE_NAME
    find "$TARGET_DIR" -type f \( -name "*.json" -o -name "*.ts" -o -name "*.tsx" -o -name "*.html" -o -name "*.js" -o -name "*.jsx" \) -exec sed -i.bak "s/TEMPLATE_NAME/$FULL_NAME/g" {} \; 2>/dev/null
    
    # 清理备份文件
    find "$TARGET_DIR" -name "*.bak" -delete 2>/dev/null
    
    echo -e "${GREEN}✅ 统一替换所有 TEMPLATE_NAME 占位符为: $FULL_NAME${NC}"
    
    echo ""
    echo -e "${GREEN}🎉 项目创建成功!${NC}"
    echo ""
    echo -e "${YELLOW}下一步:${NC}"
    echo "  cd $FULL_NAME"
    echo "  pnpm install"
    echo "  pnpm dev"
    echo ""
    echo -e "${YELLOW}构建和预览:${NC}"
    echo "  pnpm build"
    echo "  pnpm preview"
    echo ""
    echo -e "${YELLOW}部署到 GitHub Pages:${NC}"
    echo "  1. 创建 GitHub 仓库: $FULL_NAME"
    echo "  2. 推送代码到仓库"
    echo "  3. 在仓库设置中启用 GitHub Pages (Source: GitHub Actions)"
}

main "$@"