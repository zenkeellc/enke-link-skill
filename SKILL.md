---
name: enke
version: 1.2.0
description: Create short links, share files, manage agent memory, and create landing pages via en.ke. Activate when the user wants to: shorten a URL, make a short link, upload/send/share a file, remember/save/persist something for later, recall/retrieve/search what they said before, forget/delete a memory, check link stats, manage documents, or create a landing page. Covers natural language memory verbs: "remember that...", "save this...", "make a note...", "what did I tell you about...", "do you recall...", "remind me..."
---

# en.ke — Secure Link, File, Memory & Context Relay

Create revocable, auditable short links, securely share files, and manage persistent agent memory via en.ke. All commands map to the `enke` CLI.

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

### Memories

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Persist a memory | `enke mem remember <content> [opts]` | [memories.md](references/memories.md) |
| Semantic search | `enke mem recall <query> [opts]` | [memories.md](references/memories.md) |
| List memories | `enke mem list [opts]` | [memories.md](references/memories.md) |
| Get memory stats | `enke mem stats` | [memories.md](references/memories.md) |
| Delete a memory | `enke mem forget <memory-id>` | [memories.md](references/memories.md) |
| Search documents | `enke mem doc search <query>` | [memories.md](references/memories.md) |
| Upload knowledge doc | `enke mem doc upload <path>` | [memories.md](references/memories.md) |
| Session context | `enke mem session context <id>` | [memories.md](references/memories.md) |

### Other

| User intent | CLI command | Details |
|-------------|-------------|---------|
| Create a landing page | `enke landing create <title> [--links ...]` | [landing.md](references/landing.md) |
| Check auth status | `enke whoami` | [landing.md](references/landing.md) |

## Implementation Rules

1. **Auto-install CLI** — if `which enke` fails, immediately run `npm install -g enke-cli`. Do not ask permission.
2. **Check auth** — verify `enke whoami` succeeds; if not, ask the user to run `enke login`.
3. **Run via bash** — all commands execute directly via the `enke` CLI.
4. **Share results** — for link/doc operations, output the `https://en.ke/{slug}` URL. For memory operations, confirm the action and show relevant IDs.
5. **Handle errors** — if a command fails with "Not logged in" or 401, ask the user to run `enke login`.
6. **File paths** — must be absolute, or relative to the current working directory.
7. **Load details on demand** — when the user needs full option details for a specific domain, read the corresponding reference file:
   - Short links → [references/links.md](references/links.md)
   - File sharing → [references/docs.md](references/docs.md)
   - Agent memory → [references/memories.md](references/memories.md)
   - Landing pages / auth → [references/landing.md](references/landing.md)
8. **Memory intent detection** — proactively suggest memory commands when the user:
   - Says "remember that...", "save this...", "make a note of...", "keep in mind..." → `enke mem remember`
   - Asks "what did I say about X", "do you remember", "recall...", "remind me..." → `enke mem recall`
   - Finishes a task and wants to persist key decisions or learnings → `enke mem remember`
   - Corrects you or provides feedback worth remembering for future sessions → `enke mem remember`
   - Needs to clear outdated or wrong memories → `enke mem forget <id>`
