# Link Commands — CLI Reference

Full options, output formats, and error handling for all link commands.

## enke link create

Shorten a URL.

```
enke link create <url> [options]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--slug <slug>` | string | Custom back-half. Auto-generated if omitted. |
| `--password <pwd>` | string | Password-protect the link. |
| `--expires <duration>` | string | Expire after: `1h`, `24h`, `7d`, `30d`. |
| `--webhook <url>` | string | Webhook URL called on each click. |

**Output:**
```
✓ Link created:
  Slug:       my-link
  Short URL:  https://en.ke/my-link
  Target:     https://example.com
  Clicks:     0
  Created:    2026-06-12T...
  Expires:    2026-06-19T...
```

## enke link list

List your short links (newest first).

```
enke link list [--limit 20]
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--limit <n>` | int | 20 | Max results to return. |

**Output:** One block per link, same format as `link create`.

## enke link update

Update a link's properties.

```
enke link update <slug> [options]
```

**Options:** Same as `link create` — `--slug`, `--password`, `--expires`, `--webhook`. Only provided options are changed.

**Output:** Same as `link create`.

## enke link stats

View click analytics for a link.

```
enke link stats <slug>
```

**Output:**
```
Stats for "my-link":
  Total clicks: 142
  Daily:
    2026-06-12: 23
    2026-06-11: 45
    ...
  Referrers:
    twitter.com: 56
    google.com: 34
    ...
  Countries:
    US: 78
    CN: 32
    ...
```

## enke link delete

Permanently delete a short link.

```
enke link delete <slug>
```

**Output:** `✓ Link "my-link" deleted.`

## Common Patterns

```bash
# Basic shorten
enke link create https://example.com

# Custom slug + expiration
enke link create https://example.com --slug my-page --expires 7d

# Password-protected + webhook
enke link create https://example.com --password hunter2 --webhook https://my.app/webhook
```
