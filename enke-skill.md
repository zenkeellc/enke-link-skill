---
name: enke
description: Shorten URLs, securely share files, and manage links via en.ke — AI agent tool for link, doc & context relay.
category: productivity
tags: [links, url-shortener, sharing, context, agent-tools, file-sharing]
---

# en.ke — Secure Link, File & Context Relay for AI Agents

en.ke provides revocable, auditable short links and secure file sharing for AI agents to pass context, share files, and create temporary references.

## Prerequisites

```bash
npm install -g enke-cli
enke login
```

## Slash Commands

### /enke:shorten

Create a short link from a URL.

```
/enke:shorten <url> [--slug x] [--expires 7d] [--password x]
```

### /enke:doc

Upload and share a file securely.

```
/enke:doc upload <file-path> [--exp-days 7] [--password x] [--burn] [--no-download]
/enke:doc list [--limit 20]
/enke:doc delete <slug>
/enke:doc update <slug> [--exp-days 30] [--password x]
```

**Output:** `https://en.ke/{slug}` — shareable URL with preview, watermark, burn-after-reading support.

### /enke:links

List your recent short links.

```
/enke:links [--limit <n>]
```

### /enke:stats

View click analytics.

```
/enke:stats <slug>
```

### /enke:revoke

Revoke a link or delete a document.

```
/enke:revoke <slug>
```

### /enke:landing

Create a landing page.

```
/enke:landing <title> --links url1,label1;url2,label2
```

## Implementation

All slash commands invoke the enke CLI via bash.

| Slash Command | CLI Command |
|---------------|-------------|
| `/enke:shorten` | `enke link create` |
| `/enke:doc upload` | `enke doc upload` |
| `/enke:doc list` | `enke doc list` |
| `/enke:doc delete` | `enke doc delete` |
| `/enke:links` | `enke link list` |
| `/enke:stats` | `enke link stats` |
| `/enke:revoke` | `enke link delete` / `enke doc delete` |
| `/enke:landing` | `enke landing create` |
