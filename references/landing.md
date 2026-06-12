# Landing Page & Auth — CLI Reference

## enke landing create

Create a simple landing page (link-in-bio style).

```
enke landing create <title> [--links url1,label1;url2,label2]
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `--links <pairs>` | string | Semicolon-separated pairs: `url,label;url2,label2`. Label defaults to URL if omitted. |

**Output:**
```
✓ Landing page created:
  Title:  My Links
  Slug:   my-links
  Links:  3
```

**Example:**
```bash
enke landing create "My Links" --links https://github.com,GitHub;https://twitter.com,Twitter
```

## enke whoami

Show authenticated user info.

```
enke whoami
```

**Output:**
```
  Email:  user@example.com
  Name:   Derek Ke
  Plan:   pro
```

## enke login / logout

```
enke login     # Open browser for OAuth
enke logout    # Remove stored credentials
```

These are interactive commands that require user presence. When they fail, guide the user to run them manually in their terminal.

## Common Error Handling

| Exit code | Message | Action |
|-----------|---------|--------|
| 1 | `Not logged in. Run 'enke login' first.` | Guide user to run `enke login` in their terminal |
| 1 | `Error: ... (401)` | Token expired; guide user to `enke login` |
