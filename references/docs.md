# Document Commands — CLI Reference

Full options, output formats, and error handling for all document sharing commands.

## enke doc upload

Upload and share a file securely. Returns a shareable `https://en.ke/{slug}` URL.

```
enke doc upload <file-path> [options]
```

**Options:**

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--exp-days <n>` | int | 30 | Days until expiration. |
| `--password <pwd>` | string | — | Password-protect the document. |
| `--comment <text>` | string | — | Owner-facing note (not shown to viewers). |
| `--burn` | flag | false | Delete after first download. |
| `--no-download` | flag | false | Preview only, hide download button. |
| `--max-downloads <n>` | int | — | Limit total downloads. |

**Output:**
```
✓ Document uploaded:
  Slug:     abc123
  URL:      https://en.ke/abc123
  File:     report.pdf (342.5 KB)
  Expires:  7 days
```

## enke doc list

List shared documents (newest first).

```
enke doc list [--limit n]
```

**Output:**
```
Documents (3):

  Slug:     abc123
  File:     report.pdf (342.5 KB)
  Views:    12  Downloads: 3/∞

  Slug:     def456
  File:     secret.txt (1.2 KB)
  Views:    5  Downloads: 1/1
  Burn:     after first download
  Lock:     password protected
```

## enke doc get

Get full details for a single document as JSON.

```
enke doc get <slug>
```

Returns all fields: uid, id, slug, filename, content_type, size, comment, exp_days, password (presence only), max_downloads, download_count, disable_download, burn_after_reading, watermark, view_count, ctime, mtime.

## enke doc update

Update document settings. Only provided options are changed. Boolean flags accept `true`/`false` to toggle.

```
enke doc update <slug> [options]
```

**Options:** Same as `doc upload` — `--exp-days`, `--password`, `--comment`, `--burn`, `--no-download`, `--max-downloads`.

## enke doc renew

Reset the document expiration timer to the original `exp_days` from now.

```
enke doc renew <slug>
```

**Output:** `✓ Document renewed: abc123 (7 days)`

## enke doc expire

Set a new expiration in days from now.

```
enke doc expire <slug> <days>
```

**Output:** `✓ Expiration set to 30 days for abc123`

## enke doc delete

Permanently delete a shared document.

```
enke doc delete <slug>
```

**Output:** `✓ Document "abc123" deleted.`

## Common Patterns

```bash
# Basic file share (30 days)
enke doc upload ./report.pdf

# Password-protected + burn after reading
enke doc upload ./secret.txt --password hunter2 --burn

# Preview-only, max 5 downloads
enke doc upload ./slides.pdf --no-download --max-downloads 5

# Renew an expiring document
enke doc renew abc123

# Extend expiration
enke doc expire abc123 30
```
