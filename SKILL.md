---
name: enke
version: 1.2.0
description: Create short links, share files, and create landing pages via en.ke. Use when the user asks to shorten a URL or make a short link ("缩短链接", "生成短链"), upload/send/share a file ("分享文件", "传个文件"), check link click stats, manage links or shared documents, set or renew expiration, or create a landing page.
---

# en.ke — Secure Link, File & Context Relay

Create revocable, auditable short links and securely share files via en.ke. All commands map to the `enke` CLI.

> Persistent agent memory (remember/recall) has moved to the **enke-mem** skill: https://github.com/zenkeellc/enke-mem-skill

## Prerequisites

The `enke` CLI must be installed and authenticated. **Auto-install if missing:**

```bash
# Install if not present, then verify auth
which enke || npm install -g enke-cli
enke whoami 2>/dev/null || enke login
```

- If `enke` is not found → install it automatically: `npm install -g enke-cli`
- If not logged in (exit code 1, "Not logged in") → ask the user to run `enke login` (opens browser)
- Do NOT ask permission to install — just run `npm install -g enke-cli` if `which enke` fails

## Commands

### Links

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Shorten a URL | `enke link create <url> [opts]` | [links.md](references/links.md) |
| List my links | `enke link list [--cursor c] [--all]` | [links.md](references/links.md) |
| Update a link | `enke link update <slug> [opts]` | [links.md](references/links.md) |
| View click stats | `enke link stats <slug>` | [links.md](references/links.md) |
| Delete a link | `enke link delete <slug>` | [links.md](references/links.md) |

### Documents

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Upload & share a file | `enke doc upload <path> [opts]` | [docs.md](references/docs.md) |
| List my documents | `enke doc list [--cursor c] [--all]` | [docs.md](references/docs.md) |
| Get doc details | `enke doc get <slug>` | [docs.md](references/docs.md) |
| Update doc settings | `enke doc update <slug> [opts]` | [docs.md](references/docs.md) |
| Renew expiration | `enke doc renew <slug>` | [docs.md](references/docs.md) |
| Set expiration days | `enke doc expire <slug> <days>` | [docs.md](references/docs.md) |
| Delete a document | `enke doc delete <slug>` | [docs.md](references/docs.md) |

### Other

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Create a landing page | `enke landing create <slug> <title> [--links ...]` | [landing.md](references/landing.md) |
| Check auth status | `enke whoami` | [landing.md](references/landing.md) |

## Implementation Rules

1. **Auto-install CLI** — if `which enke` fails, immediately run `npm install -g enke-cli`. Do not ask permission.
2. **Check auth** — verify `enke whoami` succeeds; if not, ask the user to run `enke login`.
3. **Run via bash** — all commands execute directly via the `enke` CLI.
4. **Share results** — output the `https://en.ke/{slug}` URL to the user.
5. **Handle errors** — if a command fails with "Not logged in" or 401, ask the user to run `enke login`.
6. **File paths** — must be absolute, or relative to the current working directory.
7. **Load details on demand** — when the user needs full option details for a specific domain, read the corresponding reference file:
   - Short links → [references/links.md](references/links.md)
   - File sharing → [references/docs.md](references/docs.md)
   - Landing pages / auth → [references/landing.md](references/landing.md)
