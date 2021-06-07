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
  "test-actions":
    runs-on: ubuntu-latest
    name: "Test Actions"
    steps:
      # REF: https://github.com/actions/checkout
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0  # allow to reference any commit
      # REF: https://github.com/exoscale/github-actions
      - name: "TAGS update"
        id: "tags"
        uses: exoscale/github-actions@v1
        with:
          command: "TAGS.update"
```
