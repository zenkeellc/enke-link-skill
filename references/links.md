# Link Commands — CLI Reference

Full options, output formats, and error handling for all link commands.

## enke link create

Shorten a URL.

```
enke link create <url> [options]
```

**Options:**

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--slug <slug>` | string | auto-generated | Custom back-half. Auto-generated if omitted. |
| `--password <pwd>` | string | — | Password-protect the link. |
| `--keep-days <n>` | int | 30 | Days until expiration. |

**Output:**
```
✓ Link created:
  Slug:       my-link
  Short URL:  https://en.ke/my-link
  Target:     https://example.com
  Created:    2026-06-12T...
  Expires:    2026-06-19T...
```

## enke link get

Get full details for a single link.

```
enke link get <slug> [--json]
```

**Output:** Full link record with all fields (slug, url, password presence, comment, rules, A/B targets, preview config, etc.).

## enke link list

List your short links (paginated).

```
enke link list [--cursor c] [--all] [--json]
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--cursor <c>` | string | — | Pagination cursor from previous response. |
| `--all` | flag | false | Auto-paginate — fetch all pages. |

**Output:** One block per link, same format as `link create`.

## enke link update

Update a link's properties.

```
enke link update <slug> [options]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--url <url>` | string | New redirect URL. |
| `--password <pwd>` | string | New password (empty string to remove). |

**Output:** Same format as `link create`.

## enke link stats

View click analytics for a link.

```
enke link stats <slug> [--json]
```

**Output:**
```
Stats for "my-link":
  Total visits:     142
  Unique countries: 5
  Unique referers:  8
  Daily:
    2026-06-12: 23
    2026-06-11: 45
    ...
  Top referrers:
    twitter.com: 56
    google.com: 34
    ...
  Top countries:
    US: 78
    CN: 32
    ...
  Devices:
    desktop: 80
    mobile: 52
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

# Custom slug + keep duration
enke link create https://example.com --slug my-page --keep-days 7

# Password-protected
enke link create https://example.com --password hunter2

# Update target URL
enke link update my-link --url https://new-target.com

# List all links (paginated)
enke link list --all

# JSON output for scripting
enke link list --json
```
