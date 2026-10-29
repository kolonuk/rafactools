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

## Docker & deployment
The site ships as an nginx image (`ghcr.io/kolonuk/rafactools`, port 8080).

```bash
docker compose up --build   # http://localhost:8080
```

Pushes to `main` that touch the site, `nginx.conf`, `Dockerfile` or the workflow run `.github/workflows/deploy.yml`:
build, smoke-test, Trivy scan, push to GHCR (`:latest` + `:main-<sha>`), then dispatch dadock's
"1. Deploy docker stack" workflow. Requires the repo secret `DADOCK_DEPLOY_TOKEN` (fine-grained PAT,
Actions:write on `kolonuk/dadock`); without it the step skips with a reminder.

dadock still needs a service entry for `ghcr.io/kolonuk/rafactools:latest` serving `/`, with `/planner/` routed to the planner service.
