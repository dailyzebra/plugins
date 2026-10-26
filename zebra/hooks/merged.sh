#!/bin/sh
grep -q 'gh pr merge' || exit 0
printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"A pull request was just merged. Call the Zebra tool today. If the pull request is the source of the top task, a next task or a promise due, tell the person and offer to complete that task in their task manager, or to resolve the promise as done."}}'
