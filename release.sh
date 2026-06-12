#!/bin/bash
set -euo pipefail

VERSION="${1:-1.0.0}"
REPO="enke-skill"
GITHUB_REMOTE="origin"

echo "=== Releasing $REPO v$VERSION ==="

# 1. Check working directory clean
if [[ -n $(git status --porcelain) ]]; then
  echo "Error: working directory not clean. Commit or stash changes first."
  exit 1
fi

# 2. Update version in skill frontmatter
sed -i '' "s/version: .*/version: $VERSION/" enke-skill.md

# 3. Git tag & push
git add enke-skill.md
git commit -m "release: v$VERSION"
git tag "v$VERSION"
git push "$GITHUB_REMOTE" main
git push "$GITHUB_REMOTE" "v$VERSION"

# 4. Create GitHub Release
if command -v gh &> /dev/null; then
  gh release create "v$VERSION" \
    --title "enke Claude Code Skill v$VERSION" \
    --notes "## enke Claude Code Skill v$VERSION

### Install
\`\`\`bash
git clone git@github-zenkee:zenkeellc/enke-skill.git
cp enke-skill/enke-skill.md ~/.claude/skills/
\`\`\`\`

Requires: \`npm install -g enke-cli && enke login\`

### Slash Commands (9)
| Command | Description |
|---------|-------------|
| \`/enke:shorten\` | Create a short link |
| \`/enke:doc upload\` | Upload & share a file |
| \`/enke:doc list\` | List documents |
| \`/enke:doc delete\` | Delete a document |
| \`/enke:links\` | List short links |
| \`/enke:stats\` | Click analytics |
| \`/enke:revoke\` | Delete link or document |
| \`/enke:landing\` | Create landing page |
| \`/enke:share\` | Share text/file via temp link |

### Changes
- Added document share commands (upload, list, delete)
- Updated tagline to match AI agent positioning
- Improved command descriptions" \
    --repo "zenkeellc/$REPO"
else
  echo "GitHub CLI (gh) not found. Create release manually at:"
  echo "  https://github.com/zenkeellc/$REPO/releases/new?tag=v$VERSION"
fi

echo "=== Release complete: v$VERSION ==="
