---
name: enke
description: Shorten URLs, share context between agents, and manage links via en.ke — secure link & context relay for AI agents.
category: productivity
tags: [links, url-shortener, sharing, context, agent-tools]
---

# en.ke — Secure Link & Context Relay for AI Agents

en.ke provides revocable, auditable short links for AI agents to share files, pass context, and create temporary references.

## Prerequisites

Install the enke CLI and log in:

```bash
npm install -g enke-cli
enke login
```

## Slash Commands

### /enke:shorten

Create a short link from a URL.

```
/enke:shorten <url> [--slug <custom-slug>] [--expires <duration>] [--password <pwd>]
```

**Examples:**
```
/enke:shorten https://example.com/very-long-url
/enke:shorten https://example.com --slug my-report --expires 7d
```

**Output:** The short URL (e.g., `https://en.ke/abc123`) which can be shared with users or other agents.

### /enke:share

Share text content or a file path via a temporary link. Content is included as a URL fragment or uploaded via the landing page.

```
/enke:share <text-or-file-path> [--expires <duration>]
```

**Examples:**
```
/enke:share "Here is the context from our previous analysis..."
/enke:share ./output/report.json --expires 24h
```

### /enke:links

List your recent short links.

```
/enke:links [--limit <n>]
```

### /enke:stats

View click analytics for a link.

```
/enke:stats <slug>
```

### /enke:revoke

Revoke (delete) a short link. The link will stop working immediately.

```
/enke:revoke <slug>
```

### /enke:landing

Create a landing page with multiple links.

```
/enke:landing <title> --links url1,label1;url2,label2
```

## Implementation

This skill invokes the enke CLI (`enke`) via bash. The CLI must be installed and authenticated.

All slash commands map directly to enke CLI commands:

| Slash Command | CLI Command |
|---------------|-------------|
| `/enke:shorten` | `enke link create` |
| `/enke:links` | `enke link list` |
| `/enke:stats` | `enke link stats` |
| `/enke:revoke` | `enke link delete` |
| `/enke:landing` | `enke landing create` |
