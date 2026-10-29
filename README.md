# rafactools

Landing page and menu for RAFAC tools. Static HTML/CSS (Material Design 3, RAF blue, light/dark), no build step.

- **Web sub-apps** live in sub-directories of the same domain, e.g. `/planner/` ([rafactools-planner](https://github.com/kolonuk/rafactools-planner)). Route them with your reverse proxy.
- **Chrome extensions** link out to the Chrome Web Store.

## Adding a sub-app
Add an entry to the `apps` array in `index.html` (title, glyph, `href: "/yourapp/"`, desc).

## Local preview
```bash
python3 -m http.server 8000
```
