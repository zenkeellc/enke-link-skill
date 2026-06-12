# enke Skill for Claude Code

**Secure link, file & context relay skill for Claude Code.**

## Quick Start

### 1. Install the CLI

```bash
npm install -g enke-cli
enke login
```

Verify installation:
```bash
enke whoami
```

If `enke` is not found after install, ensure your npm global bin directory is in PATH.

### 2. Install the Skill

```bash
mkdir -p ~/.claude/skills/enke
cp SKILL.md ~/.claude/skills/enke/
cp -r references ~/.claude/skills/enke/
```

## Commands

| Command | Description |
|---------|-------------|
| `/enke:shorten <url>` | Create a short link |
| `/enke:links` | List your short links |
| `/enke:link-update <slug>` | Update a link |
| `/enke:stats <slug>` | View click analytics |
| `/enke:revoke <slug>` | Delete a link |
| `/enke:doc upload <path>` | Upload & share a file |
| `/enke:doc list` | List shared documents |
| `/enke:doc get <slug>` | Get document details (JSON) |
| `/enke:doc update <slug>` | Update document settings |
| `/enke:doc renew <slug>` | Reset expiration timer |
| `/enke:doc expire <slug> <days>` | Set expiration days |
| `/enke:doc delete <slug>` | Delete a document |
| `/enke:landing <title>` | Create a landing page |
| `/enke:whoami` | Check auth status |

## Skill Structure

```
enke-skill/
├── SKILL.md                  # Skill instructions (loaded when triggered)
├── references/
│   ├── links.md              # Link commands — loaded for URL shortening tasks
│   ├── docs.md               # Document commands — loaded for file sharing tasks
│   └── landing.md            # Landing page & auth — loaded when needed
├── README.md                 # This file
├── LICENSE                   # MIT
└── release.sh                # Release script
```

Progressive disclosure: Claude only loads the reference file relevant to the user's task (links, docs, or landing), keeping context usage minimal.

## License

MIT
