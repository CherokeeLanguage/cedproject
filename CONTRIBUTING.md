# Contributing — the PR version standard

Every pull request in any repository of this project family carries a
semantic version. This document states the standard; nothing here is
machine-enforced — compliance is a review obligation for human contributors
and for agents working in these repositories.

## The family rule

Every PR in **cedproject** and in **every repository registered, or
hereafter registered, as its submodule** carries a semver in its PR record:
a title-leading `[<version>]` segment and a version statement in the body —
the `Version:` line for non-release PRs; for release PRs, the version
statement is the changelog version itself (their bodies follow the release
composition).

## Version forms

- **Non-release PR** (dev): `MAJOR.MINOR.PATCH-dev.<short-sha>` — a true
  semver prerelease, sorted below the release it anticipates.
- **Release PR**: `MAJOR.MINOR.PATCH`.

## Derivation

From the **latest release tag** — or the **`0.1.0` baseline** before the
family's first release tag — the change's category bumps exactly one level:
breaking → major, feature → minor, fix → patch.

Examples: `0.1.0` + feature → `0.2.0`; `0.1.0` + fix → `0.1.1`; `0.1.0` +
breaking → `1.0.0`; `v0.2.0` seeded + fix → `0.2.1`.

## Dev versions are checkout-able git tags

A non-release PR's version exists as a **lightweight git tag on the PR's
head commit**, pushed to that repository's own origin and verified on the
remote (`git ls-remote --tags`):

- the tag name **embeds the tagged commit's abbreviated hash** —
  `0.2.0-dev.a1b2c3` names its own content, so `git checkout
  0.2.0-dev.a1b2c3` in any fresh clone resolves to exactly the reviewed
  change;
- existing dev tags survive branch deletion and merge-time hash churn —
  they are the family's checkout-able dev history;
- a tag name already existing but **pointing elsewhere** is reported and
  blocks the PR's creation until resolved by direction — never silently
  re-created;
- when a PR branch is rewritten (per the project's per-issue squash
  discipline), the version changes with the head commit: the stale dev tag
  is deleted from the origin, a fresh dev tag names the new head, and the
  PR record's version is updated — all under the same update triggers as
  the PR itself.

## The promotion boundary

**Only true release PRs are promoted to full tagged releases.** At merge,
the release pipeline creates the **annotated `v`-prefixed tag** on the
parent repository's trunk and publishes the **GitHub Release** built on it.

- Release PRs are **parent-repo artifacts only**: a submodule repository's
  PRs are all dev-form, and the family's promoted releases happen at the
  root.
- No non-release PR ever produces a `v`-prefixed tag or a GitHub Release.
- The `v` prefix is **reserved for promoted releases** — `git tag -l 'v*'`
  is always the release set; dev tags never carry it.

## Submodule coexistence

Submodule content ships through the parent repository's pointer capture, so
a submodule commit may carry both its pointer-capture discipline tag and a
dev version tag — different jobs, different names. A pull-only origin
receives no pushes (no branch creation there), and push failures are
reported, never silently omitted.

## Deliberate posture

No CI validates PR titles or tags. The rule binds by family membership and
is checked at PR review. Deviating PRs are corrected before merge.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
