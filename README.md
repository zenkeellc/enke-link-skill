# enke Skill for Claude Code

**Secure link & context relay slash commands for Claude Code.**

## Install

Copy the skill file:

```bash
cp enke-skill.md ~/.claude/skills/
```

Requires `enke-cli` installed and authenticated:

```bash
npm install -g enke-cli
enke login
```

## Slash Commands

| Command | Description |
|---------|-------------|
| `/enke:shorten <url>` | Create a short link |
| `/enke:share <text>` | Share context via a temporary link |
| `/enke:links` | List your short links |
| `/enke:stats <slug>` | View click analytics |
| `/enke:revoke <slug>` | Revoke a link |
| `/enke:landing <title>` | Create a landing page |

## License

MIT
