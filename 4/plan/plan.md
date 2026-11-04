# Plan — cedproject#4 (PR version directive)

Consumes the validated spec at `.issues/4/spec.md` (validation PASS, 2026-11-04,
five rounds). Items derive entirely from its SCs; implementation order so each
RED runs against the pre-amendment state and each GREEN builds on verified
prior state.

## Approach

The change's deliverables are documents, not code: a repo-facing standards
doc, two deck-card amendments, and the behavioral proof that the amended deck
produces the spec'd behavior. Deck edits route through the skill-creator
admission gate (deck governance). Behavioral SCs run through the
behavioral-testing harness (self-contained remote container), never ad-hoc.

**Surfaces.** This repository gitignores `/.opencode/` entirely (`.gitignore`
line 23; `git ls-files .opencode` is empty) — the deck and the tests-v2
harness are agent-side working-tree state that never enters git. The only
tracked file the implementation PR carries is the new `CONTRIBUTING.md`; the
deck-card amendments (SC-6/SC-8) and the harness scenario scripts (the
behavioral instruments) are working-tree changes verified by their greps and
runs, never committed. The spec's blast-radius enumeration therefore holds
unchanged.

**Scenario storage and tiers.** Scenarios are authored under
`.opencode/tests-v2/behaviors/` per the behavioral-testing card: copy
`template.sh`, `SCENARIO_NAME` kebab-case matching any
`fixtures/setup/<name>.sh`, remote needs declared with `BEHAVIOR_NEEDS_REMOTE=1`
(provisioned GitBucket container), `SCENARIO_TIER="3"`, artifact-only
generators (never evaluate output), evaluated afterward by the standard
clean-room evaluator sub-agent (the two-SC pattern: artifact generation and
evaluation are separate dispatches).

## Items

### Item 1 — Behavioral scenario A: non-release PR version behavior (SC-1, SC-2, SC-10)

- **Deliverable:** a harness test scenario, authored per the behavioral-testing
  card, driving a fresh agent session through a non-release PR flow in the
  harness repository. The scenario asserts: the created PR's title matches
  `^\[\d+\.\d+\.\d+-dev\.[0-9a-f]{7,40}\] ` with a body `Version:` line
  (SC-1); a dev tag exists on the PR head commit whose name's SHA segment
  equals `git rev-parse --short <head>`, carries no `v` prefix, is listed by
  remote `git ls-remote --tags` at the head SHA, and a fresh clone's
  `git checkout <dev-version>` resolves to the head commit (SC-2); the
  version string equals the rule-derived expectation in a baseline-seeded
  repo (0.1.0 + feature → `0.2.0-dev.<sha>`, + fix → `0.1.1-dev.<sha>`,
  + breaking → `1.0.0-dev.<sha>`) and in a release-tag-seeded repo
  (e.g. `v0.2.0` seeded; + fix → `0.2.1-dev.<sha>`, + feature →
  `0.3.0-dev.<sha>`, + breaking → `1.0.0-dev.<sha>`) (SC-10).
- **RED** run against the unamended deck: the assertion fails — the current
  agent flow produces no version-carrying PR.
- **Instrument:** harness run outputs — the created PR record, `git
  ls-remote --tags` listing, fresh-clone checkout SHA, exact version strings
  compared by equality.

### Item 2 — Behavioral scenario B: rewrite, prohibition, collision (SC-3, SC-11, SC-12)

- **Deliverable:** a harness scenario extending the non-release flow with
  three assertion groups: after a scoped branch rewrite (`git push
  --force-with-lease`), the remote carries no tag named for the abandoned
  head, carries the new head's dev tag (SHA segment = new head, target = new
  head), and the PR record's title and `Version:` line carry the new
  version (SC-3); throughout the non-release flow, the full tag listing shows
  no `v*` name and the release-list API shows no release (SC-12); with a
  colliding tag name pre-seeded (pointing elsewhere), the PR creation gate
  blocks — no PR exists, the original tag's target is unchanged, the
  collision report is in the run record (SC-11).
- **RED** run against the unamended deck: assertions fail.
- **Instrument:** harness run outputs — `git ls-remote --tags` listings,
  release-list API check, PR-record re-fetch, seeded-collision run record.

### Item 3 — Behavioral scenario C: release PR (SC-4, SC-7)

- **Deliverable:** a harness scenario driving the release-PR flow in two
  phase boundaries the harness composes: at release-PR creation, the PR
  title matches `^\[\d+\.\d+\.\d+\] ` and no dev-form tag exists (SC-4);
  after the merge, an annotated `vX.Y.Z` tag exists on the merged trunk
  commit and a GitHub Release is built on it (SC-7). **Merge composition:**
  the merge itself is harness-fixture infrastructure simulating the
  developer's merge action — a seeded merged-PR state (or an equivalent
  fixture-merged boundary) precedes the agent's post-merge promotion work;
  the agent never performs a merge in any phase (the human merge gate is
  categorical), and existing scenarios test refusal of merges, never
  execution.
- **RED** run against the unamended deck: assertions fail.
- **Instrument:** harness/API outputs — tag listing at creation, annotated
  tag listing + release view post-merge.

### Item 4 — Standards document (SC-5)

- **Deliverable:** `CONTRIBUTING.md` at the repository root, stating: the
  family rule (every PR in cedproject or any current/future submodule carries
  a semver), the dev form `MAJOR.MINOR.PATCH-dev.<short-sha>`, the release
  form `MAJOR.MINOR.PATCH`, the promotion boundary (only release PRs get the
  annotated `v`-tag + GitHub Release), the `0.1.0` baseline, the
  changelog-category derivation rule, and the `v` prefix reservation.
- **RED** against current state: the file does not exist; per-statement
  greps fail.
- **GREEN:** create the document with exactly the stated rule set.
- **Instrument:** file-existence check + per-statement content grep.

### Item 5 — Deck amendments + behavioral GREEN suite (SC-6, SC-8, SC-9; GREEN for SC-1..4, SC-7, SC-10..12)

- **Deliverable:** `git-workflow-pr` amended with (a) the pre-create
  dev-tag step (create on the PR head commit, push to the repo's origin,
  verify via `git ls-remote --tags`, collision blocks the gate), (b) the
  `Version:` line in the §4 body contract, (c) the rewrite-retag clause in
  the update-trigger composition (stale tag deleted under the scoped-rewrite
  conditions, fresh tag verified, PR record updated); the "Release PRs are
  parent-repo artifacts only" clause retained verbatim. `version-manager`
  amended with the dev-base derivation (latest release tag / `0.1.0`
  baseline, one-level bump per changelog category) and the baseline. No
  workflow files created.
- **RED** against current state: clause greps fail on both cards.
- **GREEN:** the amendments, routed through the skill-creator admission gate;
  then re-run scenarios A, B, C — all assertions pass.
- **Instrument:** clause greps per amended location (SC-6); parent-only
  clause retention grep (SC-8); `.github/workflows/` absence glob (SC-9);
  the three scenarios' green outputs (behavioral SCs).

## Dependency order

1 → 2 → 3 → 4 → 5. The scenarios (items 1–3) author and run RED against the
unamended state first; the document (item 4) and the amendments (item 5) are
the GREEN changes; item 5's verification re-runs all three scenarios against
the amended deck. Item 4 has no behavioral dependency and may execute any time
after item 3's RED; it is sequenced before item 5 so the amendment commit set
lands last, immediately before verification.

## Traceability

| SC | Item |
|---|---|
| SC-1, SC-2, SC-10 | 1 (author+RED), 5 (GREEN) |
| SC-3, SC-11, SC-12 | 2 (author+RED), 5 (GREEN) |
| SC-4, SC-7 | 3 (author+RED), 5 (GREEN) |
| SC-5 | 4 |
| SC-6, SC-8, SC-9 | 5 |

Every SC is covered; every item traces. No item without an SC, no SC without
an item.

## Documentation sources

- Spec: `.issues/4/spec.md` (authoritative SC text and requirement wording —
  the items restate, never reinterpret).
- Deck cards amended: `.opencode/skills/git-workflow-pr/SKILL.md`,
  `.opencode/skills/version-manager/SKILL.md` (read in full before editing;
  provenance lines updated per deck convention).
- Deck governance: skill-creator card, per its admission gate.
- Harness mechanics: behavioral-testing card (scenario authoring, container
  provisioning, evidence capture).

## Edge cases

- Harness repo state seeding (baseline vs release tag) is controlled by the
  scenario fixtures, not by family state — the derivation's two cases are
  exercised deterministically (SC-10).
- The seeded-collision case (SC-11) seeds the tag in the harness repo before
  the agent session starts, so the collision is a precondition, not a race.
- The rewrite case (SC-3) uses only the scoped-rewrite conditions the deck
  already defines; the harness agent's branch satisfies all three by
  construction.

## Not included

Everything the spec's Out-of-scope section names: CI, submodule registration,
history backfill, release-promoter mechanics changes, submodule package
metadata, per-submodule releases, cedproject#1's answer.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
