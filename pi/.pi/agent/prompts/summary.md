---
description: Tell the story of a given subject or scope
argument-hint: "[scope]"
---

Weave a clear, factual story about this subject or scope:

$ARGUMENTS

If no subject or scope was provided, use the current uncommitted changes.

First, determine what the request refers to and inspect the relevant sources. It may refer to anything that can be investigated, including:

- `uncommitted changes`
- `pr #5`
- `issue #123`
- `this branch with master`
- `the latest commit`
- `commits since <reference>`
- A file or group of files
- A feature, component, workflow, or architectural concept
- How something is used within the project

Use the appropriate available tools, such as code search, Git, or the GitHub CLI, to gather the necessary context. Inspect the actual source material when available rather than relying only on names, commit titles, issue descriptions, or PR descriptions.

Tell the story in a natural narrative:

- Begin with the surrounding context, purpose, or problem.
- Explain how the relevant parts work and fit together.
- Describe the resulting behavior and practical impact.
- Mention important trade-offs, risks, limitations, or unfinished work.
- Clearly distinguish verified facts from reasonable interpretations.
- Remain grounded in the available evidence; do not invent motivations or details.
- Prefer a coherent narrative over a file-by-file, commit-by-commit, or symbol-by-symbol list.
- Use ASCII diagrams wherever they provide value and make the subject easier to understand.
- Use plain language while retaining enough technical detail to be useful.
