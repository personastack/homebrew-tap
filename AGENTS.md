# homebrew-tap Agent Instructions

## Cross-repository workspace setup

Before significant cross-repository feature work, use the main `agent-root` workspace. Clone `git@github.com:personastack/agent-root.git` into a directory named `personastack`, then clone all 37 PersonaStack child repositories under it at the exact destinations listed in [`docs/REPOSITORY_STRUCTURE.md`](../docs/REPOSITORY_STRUCTURE.md). Each service is an independent sibling Git repository. Do not clone peers inside this standalone service checkout. This repository should be used from its mapped child directory under `personastack/` for cross-repository work.

If you started with only this repository, prepare the main workspace and all peer checkouts before cross-repository discovery or implementation. Verify each path resolves to its own Git root and expected `origin` remote. The structure guide gives the clone URL and destination for every repository.

Fetch `origin` separately in every repository the task will inspect or change. Fetching `agent-root` does not fetch this repository or its peers. Inspect local changes before fetching and preserve them; do not merge or overwrite changes automatically.
