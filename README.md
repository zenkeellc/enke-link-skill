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

## Memory Commands

The skill also handles natural-language memory verbs. When a user says "remember that...", "save this...", or "recall...", the CLI executes the corresponding command:

| User says | CLI executed |
|-----------|-------------|
| "remember that X", "save this" | `enke mem remember <content>` |
| "what did I say about X", "recall X" | `enke mem recall <query>` |
| "list memories", "what do you remember" | `enke mem list` |
| "forget X", "delete memory X" | `enke mem forget <id>` |
| "search docs for X" | `enke mem doc search <query>` |
| "upload this doc to my knowledge base" | `enke mem doc upload <path>` |

See [references/memories.md](references/memories.md) for full memory command details.

## Skill Structure

```
enke-skill/
├── SKILL.md                  # Skill instructions (loaded when triggered)
├── references/
│   ├── links.md              # Link commands — loaded for URL shortening tasks
│   ├── docs.md               # Document commands — loaded for file sharing tasks
│   ├── memories.md           # Memory commands — loaded for agent memory tasks
│   └── landing.md            # Landing page & auth — loaded when needed
├── README.md                 # This file
├── LICENSE                   # MIT
└── release.sh                # Release script
```

Progressive disclosure: Claude only loads the reference file relevant to the user's task (links, docs, memories, or landing), keeping context usage minimal.

## License

MIT
