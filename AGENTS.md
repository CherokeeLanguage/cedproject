# AGENTS.md — cedproject

## What this repo actually is

This is a **build/orchestration shell** for the Cherokee Language Dictionary
project family, not an application. `build.gradle` is empty and every
`include` in `settings.gradle` is commented out — the real code lives in
sibling repos cloned by `buildScripts/functions.sh` (`dictionary` (Grails
app → `dictionary-0.1.war`), `transliteration`, `utilities`, `conjugation`,
`dateTime`, `deconstructor`, `reactCED`, `grooscript`, etc.).

## Toolchain (deprecated-but-required versions)

Don't assume modern Gradle. Target stack: **JDK 8, Gradle 6.8.3/6.9.2 (+ a
3.5 install), Grails 4.0.x, Node 14, MySQL** — installed via SDKMAN
(`installDependencies.sh` documents the steps). The bundled
`gradlew` wrapper is Gradle **3.5** and is stale relative to the documented
version; don't rely on it blindly.

## Build & deploy scripts

- `build.sh` is **generated** — never hand-edit it. Edit
  `buildScripts/functions.sh` (and add menu entries in
  `buildScripts/CreateMenu.groovy`), then regenerate with
  `sh buildScripts/createMenu.sh`. `build.sh` is gitignored.
- `build.properties` carries blank `USERNAME=`, `SITEPASS=`, `DBPASS=`,
  `HOSTS=` placeholders that `build.sh` → `buildMain.sh` consume as
  positional args for **live production deploy**: scp of the war to the
  server, DB dump pull/import, remote restart over `sshpass`. These
  scripts touch a real server — never run them casually, and never put
  real credentials in `build.properties` or commits.
- `backups/` holds **production DB dumps** (`.sql` files) — production
  data; do not read, import, or share without explicit current-session
  instruction.

## Agent deck & workflow (this repo's own configuration)

- `.opencode/` is this project's OpenCode configuration — `opencode.jsonc`
  injects `.opencode/floor.md` as instruction. Editing anything under
  `skills/`, `guidelines/`, or `.opencode/floor.md` goes through the
  deck-governance rules (`skill-creator` card), not ordinary edits.
- The session-init tool is `./.opencode/tools/session-init`; local issue
  store lives in `.issues/` (git-tracked branch, one subdir per issue —
  read the store before working an issue).
- Behavior tests live under `tests-v2/` with a dedicated harness — never
  hand-roll an `opencode run` for behavioral scenarios.

## PR standard

`CONTRIBUTING.md` is the PR version standard for the whole family: every PR
title starts `[<version>]` with a `Version:` body line. Non-release PRs use
`MAJOR.MINOR.PATCH-dev.<short-sha>` and push a matching lightweight git tag
on the head commit (self-naming via embedded sha). `v*` tags and GitHub
Releases are promoted **only** from release PRs at the parent repo.
`.gitattributes` forces CRLF for `*.bat`.

## Glob caveat

The `glob` tool does not traverse `@submodule`/dir-referenced repos — "no
files found" there is false absence. Use `grep`, `read`, or `bash` for
file discovery in sibling repos.
