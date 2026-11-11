# Daily Zebra plugins

Zebra keeps the memory of your day and your promises, and your assistant does the work. See [dailyzebra.com](https://dailyzebra.com).

| Folder | For |
|---|---|
| `zebra/` | Claude Code and Cowork |
| `openai/zebra/` | ChatGPT and Codex |

## Claude Code

```
/plugin marketplace add dailyzebra/plugins
/plugin install zebra@dailyzebra
```

Then run `/mcp` and sign in to Zebra.

- At the start of each session, Claude reads today's plan from Zebra: the top task, the next tasks and the promises due.
- When you paste a transcript or say you committed to something, Claude records the promise.
- After `gh pr merge`, Claude checks whether the pull request closes a task or a promise of the day and offers to close it.

## ChatGPT and Codex

The `openai/zebra` plugin connects the Zebra MCP server (`https://mcp.dailyzebra.com/mcp`, OAuth) and brings the promises skill. It has no hooks, so it can go to the public directory.

In Codex:

```
codex plugin marketplace add dailyzebra/plugins
```

Then install `zebra` and sign in when asked.
