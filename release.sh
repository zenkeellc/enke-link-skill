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
sed -i '' "s/version: .*/version: $VERSION/" SKILL.md

# 3. Git tag & push
git add SKILL.md
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
mkdir -p ~/.claude/skills/enke
cp enke-skill/SKILL.md ~/.claude/skills/enke/
cp -r enke-skill/references ~/.claude/skills/enke/
\`\`\`\`

Requires: \`npm install -g enke-cli && enke login\`

### Slash Commands (14)
| Command | Description |
|---------|-------------|
| \`/enke:shorten\` | Create a short link |
| \`/enke:links\` | List short links |
| \`/enke:link-update\` | Update a link |
| \`/enke:stats\` | Click analytics |
| \`/enke:revoke\` | Delete a link |
| \`/enke:doc upload\` | Upload & share a file |
| \`/enke:doc list\` | List documents |
| \`/enke:doc get\` | Get document details |
| \`/enke:doc update\` | Update document settings |
| \`/enke:doc renew\` | Reset expiration |
| \`/enke:doc expire\` | Set expiration days |
| \`/enke:doc delete\` | Delete a document |
| \`/enke:landing\` | Create landing page |
| \`/enke:whoami\` | Check auth status |

### Changes
- Split skill references by domain (links / docs / landing) for progressive loading
- Added missing commands: link-update, doc get/renew/expire, whoami
- Added missing options: --webhook, --comment, --max-downloads
- Improved CLI install/auth guidance for agents" \
    --repo "zenkeellc/$REPO"
else
  echo "GitHub CLI (gh) not found. Create release manually at:"
  echo "  https://github.com/zenkeellc/$REPO/releases/new?tag=v$VERSION"
fi

echo "=== Release complete: v$VERSION ==="
