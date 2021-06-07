Exoscale GitHub Actions
=======================

GitHub Actions for Exoscale repositories

TL;DR
-----
- use an `alpine:latest`-based Docker image
- including required dependencies (`bash`, `git`, ...)
- and bunch of [scripts](./scripts) corresponding to standard actions

Usage
-----

In your `.github/workflows/actions.yaml`:

```yaml
---
# REF: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions
name: "On push to main/master"

on:
  push:
    branches:
      - "main"
      - "master"

jobs:
  "sample-actions":
    runs-on: ubuntu-latest
    name: "Sample Actions"
    steps:
      - uses: actions/checkout@v2
      - name: "TAGS update"
        id: "tags"
        uses: exoscale/github-actions@v1
        with:
          command: "TAGS.update"
```
