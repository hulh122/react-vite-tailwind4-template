#!/bin/bash

set -e

PROJECT_NAME=""
REPO_DESCRIPTION=""
GITHUB_USERNAME=""

usage() {
    echo "Usage: $0 -n <project-name> -d <description> [-u <github-username>]"
    echo "  -n: Project name (required)"
    echo "  -d: Repository description (required)"
    echo "  -u: GitHub username (optional, will use gh auth status if not provided)"
    exit 1
}

while getopts "n:d:u:h" opt; do
    case $opt in
        n) PROJECT_NAME="$OPTARG" ;;
        d) REPO_DESCRIPTION="$OPTARG" ;;
        u) GITHUB_USERNAME="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

if [[ -z "$PROJECT_NAME" || -z "$REPO_DESCRIPTION" ]]; then
    usage
fi

echo "🚀 Starting deployment process..."

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if user is authenticated with gh
if ! gh auth status &> /dev/null; then
    echo "❌ Error: Not authenticated with GitHub CLI."
    echo "Run: gh auth login"
    exit 1
fi

# Get GitHub username if not provided
if [[ -z "$GITHUB_USERNAME" ]]; then
    GITHUB_USERNAME=$(gh api user --jq '.login')
    echo "📝 Using GitHub username: $GITHUB_USERNAME"
fi

# Initialize git repository if not already initialized
if [[ ! -d ".git" ]]; then
    echo "📁 Initializing Git repository..."
    git init
    git branch -M main
else
    echo "📁 Git repository already exists"
fi

# Add all files and commit
echo "📝 Adding files to git..."
git add .

# Check if there are any changes to commit
if git diff --staged --quiet; then
    echo "⚠️  No changes to commit"
else
    echo "💾 Committing changes..."
    git commit -m "Initial commit: $PROJECT_NAME

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>"
fi

# Check if remote repository exists
REPO_EXISTS=$(gh repo view "$2/$PROJECT_NAME" &> /dev/null && echo "true" || echo "false")

if [[ "$REPO_EXISTS" == "false" ]]; then
    echo "🏗️  Creating GitHub repository..."
    gh repo create "$PROJECT_NAME" --description "$REPO_DESCRIPTION" --public --source=. --remote=origin --push
    REPO_URL="https://github.com/$GITHUB_USERNAME/$PROJECT_NAME"
else
    echo "📦 Repository already exists, pushing to existing repo..."
    # Add remote if not exists
    if ! git remote get-url origin &> /dev/null; then
        git remote add origin "https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git"
    fi
    git push -u origin main
    REPO_URL="https://github.com/$GITHUB_USERNAME/$PROJECT_NAME"
fi

# Enable GitHub Pages with Actions source
echo "🔧 Configuring GitHub Pages..."
gh api repos/$GITHUB_USERNAME/$PROJECT_NAME/pages \
    --method POST \
    --field build_type="workflow" \
    2>/dev/null || {
    # If Pages already exists, update it
    echo "📄 GitHub Pages already exists, updating configuration..."
    gh api repos/$GITHUB_USERNAME/$PROJECT_NAME/pages \
        --method PUT \
        --field build_type="workflow" \
        2>/dev/null || echo "⚠️  Pages configuration may need manual setup"
}

# Wait a moment and check if Actions workflow exists
echo "🚀 Triggering GitHub Actions deployment..."
sleep 2

# Check if workflow run started
WORKFLOW_STATUS=$(gh run list --repo "$GITHUB_USERNAME/$PROJECT_NAME" --limit 1 --json status,conclusion --jq '.[0].status' 2>/dev/null || echo "not_found")

if [[ "$WORKFLOW_STATUS" != "not_found" ]]; then
    echo "✅ GitHub Actions workflow triggered successfully"
    PAGES_URL="https://$GITHUB_USERNAME.github.io/$PROJECT_NAME"
    echo "🌐 Pages URL: $PAGES_URL (may take a few minutes to be available)"
else
    echo "⚠️  Workflow may need to be manually triggered"
fi

echo ""
echo "✅ Deployment completed successfully!"
echo "🌐 Repository URL: $REPO_URL"
echo ""