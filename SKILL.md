---
name: enke
version: 1.0.2
description: Create short links, share files securely, manage links and documents, view analytics, and create landing pages via en.ke. Use when the user asks to shorten URLs, share files, create short links, upload documents, view link stats, manage links/docs, create landing pages, or share context via temporary links.
---

# en.ke — Secure Link, File & Context Relay

Create revocable, auditable short links and securely share files via en.ke. All commands map to the `enke` CLI.

## Prerequisites

The `enke` CLI must be installed and authenticated. **Before running any command, verify the CLI is available:**

```bash
# Check if installed
which enke || npm install -g enke-cli

# Check auth status
enke whoami || enke login
```

If `enke` is not found, guide the user to install it:
> The `enke` CLI is not installed. Run: `npm install -g enke-cli && enke login`

If not logged in (exit code 1, "Not logged in"), guide the user:
> Not authenticated. Run: `enke login`

## Commands

### Links

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Shorten a URL | `enke link create <url> [opts]` | [links.md](references/links.md) |
| List my links | `enke link list [--limit n]` | [links.md](references/links.md) |
| Update a link | `enke link update <slug> [opts]` | [links.md](references/links.md) |
| View click stats | `enke link stats <slug>` | [links.md](references/links.md) |
| Delete a link | `enke link delete <slug>` | [links.md](references/links.md) |

### Documents

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Upload & share a file | `enke doc upload <path> [opts]` | [docs.md](references/docs.md) |
| List my documents | `enke doc list [--limit n]` | [docs.md](references/docs.md) |
| Get doc details | `enke doc get <slug>` | [docs.md](references/docs.md) |
| Update doc settings | `enke doc update <slug> [opts]` | [docs.md](references/docs.md) |
| Renew expiration | `enke doc renew <slug>` | [docs.md](references/docs.md) |
| Set expiration days | `enke doc expire <slug> <days>` | [docs.md](references/docs.md) |
| Delete a document | `enke doc delete <slug>` | [docs.md](references/docs.md) |

### Other

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Create a landing page | `enke landing create <title> [--links ...]` | [landing.md](references/landing.md) |
| Check auth status | `enke whoami` | [landing.md](references/landing.md) |

## Implementation Rules

1. **Check CLI first** — before any command, verify `enke` is available and authenticated (`enke whoami`).
2. **Run via bash** — all commands execute directly via the `enke` CLI.
3. **Share results** — output the `https://en.ke/{slug}` URL to the user.
4. **Handle errors** — if a command fails with "Not logged in" or 401, guide the user to run `enke login`.
5. **File paths** — must be absolute, or relative to the current working directory.
6. **Load details on demand** — when the user needs full option details for a specific domain, read the corresponding reference file:
   - Short links → [references/links.md](references/links.md)
   - File sharing → [references/docs.md](references/docs.md)
   - Landing pages / auth → [references/landing.md](references/landing.md)
