# Daily Zebra plugins

Zebra keeps the memory of your day and your promises, and Claude does the work. See [dailyzebra.com](https://dailyzebra.com).

## Install

In Claude Code:

```
/plugin marketplace add dailyzebra/plugins
/plugin install zebra@dailyzebra
```

Then run `/mcp` and sign in to Zebra.

## What the plugin does

- At the start of each session, Claude reads today's plan from Zebra: the top task, the next tasks and the promises due.
- When you paste a transcript or say you committed to something, Claude records the promise.
- After `gh pr merge`, Claude checks whether the pull request closes a task or a promise of the day and offers to close it.
