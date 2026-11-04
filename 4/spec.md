# Spec — PR version directive: dev-semver tagging + release-only promotion for the repo family

## Intent

Every pull request in the repository family carries a semantic version. A
non-release PR's version is the **dev form** — a real, checkout-able git tag.
A release PR's version is the **release form** — the only version promoted to
a full tagged release (annotated `v`-prefixed tag + GitHub Release). The
directive is recorded in this root repository as a repo-facing standard and
enforced for agent-created PRs through the agent deck. The rule binds by
family membership: cedproject and every repository registered, or hereafter
registered, as its submodule.

**Problem.** The family has no version identity for PRs: zero git tags exist
in the entire history (verified 2026-11-04: `git tag | wc -l` = 0), no PR has
ever been opened, no version location exists (no `gradle.properties`, no
version file, empty `build.gradle`), and no repo-facing standards document
exists. A merged PR's content becomes unnameable once its branch is deleted
(squash-merge SHA churn); dev work cannot be checked out by any version name;
releases are unversioned until promoted.

**Root causes.** The family's PR-and-release machinery (the agent deck's
`git-workflow-pr`, `release-promoter`) was built without a version-identity
layer: no standard states what version a PR carries, no mechanism materializes
a dev version in git, and no repo-facing document states the rule for
human-created PRs.

**Provenance.** Developer directive, 2026-11-04, in session: "all PRs need to
include a semver. non-release PRs need to be a dev semver and the release PRs
need to be release semver. this needs to apply to this repo and all current
and future submodules." Refined through exploration into the finalized design
("proceed to spec creation" — the developer's finalization statement). The
load-bearing refinement: "we need to checkout dev versions — which is why we
want dev semver tracking added" — dev versions must be checkout-able, which
makes them git tags, not PR-record labels alone.

## Requirements

- **R-1** Every PR in a family repository SHALL carry a semantic version in
  its PR record: a title-leading `[<version>]` segment and a version
  statement in the body — the `Version:` line for non-release PRs; for
  release PRs, the version statement is the changelog version itself (their
  bodies follow the `release-promoter` composition). *Trace: S1, S5, S8.*
- **R-2** A non-release PR's version SHALL be the dev form
  `MAJOR.MINOR.PATCH-dev.<short-sha>`. The base is the next release version
  the PR's work would earn: from the latest release tag (or the `0.1.0`
  baseline before the family's first release tag), the PR's change category
  per the changelog-category rule — breaking→major, feature→minor,
  fix→patch (the `version-manager` rule) — bumps exactly one level
  (0.1.0 + feature → 0.2.0; 0.1.0 + fix → 0.1.1; 0.1.0 + breaking → 1.0.0).
  `<short-sha>` is the abbreviated hash of the commit the version tags —
  the hash tagging that makes the label self-verifying against the content
  it names. *Trace: S2, S8.*
- **R-3** A non-release PR's dev version SHALL exist as a git tag on the PR's
  head commit — created at PR creation, pushed to that repository's own
  origin, verified on the remote (`git ls-remote --tags` listing a tag whose
  commit is the head SHA), and checkout-able in a fresh clone
  (`git checkout <dev-version>` resolves to the head commit). The tag name's
  SHA segment SHALL equal the head commit's abbreviated hash — the name
  self-verifies against the content it names. The tag is lightweight (the
  name carries version + hash; annotation is reserved for release tags). A
  tag name already existing but pointing elsewhere SHALL be reported and
  SHALL block the PR's creation gate until resolved by direction — never
  silently re-created. *Trace: S5, S7, S9.*
- **R-4** When a PR branch is rewritten under the `git-workflow-pr` §3
  scoped-rewrite authorization, the head commit changes, so the dev version
  changes with it: the stale dev tag (whose name embeds the abandoned head's
  SHA) SHALL be deleted on the remote, a fresh dev tag for the new head
  SHALL be created, pushed, and verified per R-3, and the PR record's
  version SHALL be updated to the new version — all under the same two
  update triggers as the PR itself (review feedback; submodule pointer
  movement), and the tag deletion only under the scoped-rewrite conditions
  (branch created by this agent, unmerged, no other party holds it). A tag
  left pointing at abandoned history is a defect. *Trace: exploration
  record (stated default, unchallenged through finalization); mechanism
  resolved to preserve R-2's self-verifying naming.*
- **R-5** A release PR's version SHALL be the release form
  `MAJOR.MINOR.PATCH`; at merge it SHALL be promoted by the existing
  release-promoter pipeline (annotated `v`-prefixed tag + GitHub Release). A
  release PR SHALL carry no dev-form pre-merge tag. No non-release PR SHALL
  produce a GitHub Release or a `v`-prefixed tag. *Trace: S2, S6, S8.*
- **R-6** The `v` tag-prefix SHALL be reserved for promoted releases:
  `git tag -l 'v*'` is the release set; dev tags never carry the prefix.
  *Trace: S6, S8 (the promotion boundary, made mechanically greppable).*
- **R-7** Release PRs SHALL remain parent-repo artifacts only (the existing
  deck rule, .opencode#2592/#2683, stands): a submodule repository's PRs are
  all dev-form; the family's promoted releases happen at cedproject.
  *Trace: S3.*
- **R-8** The directive SHALL be recorded in a repo-facing standards document
  in cedproject — `CONTRIBUTING.md` at the repository root, the surface
  GitHub presents at PR time — stating the family rule, both forms, the
  promotion boundary, the `0.1.0` baseline, the derivation rule, and the `v`
  reservation. The deck cards `git-workflow-pr` (pre-create checklist: the
  dev-tag create/push/verify step, including the collision-block disposition;
  §4 body contract: the `Version:` line; the §6 update-trigger composition:
  the rewrite-retag clause — stale-tag deletion and fresh-tag verification
  per R-4) and `version-manager` (dev-base derivation + baseline) SHALL be
  amended to enforce the directive for agent-created PRs, through the
  skill-creator admission gate. *Trace: S4, S1 (enforcement surface).*
- **R-9** Enforcement SHALL be deck-level only; this change SHALL create no
  CI. *Trace: exploration record (stated default, unchallenged through
  finalization; no CI exists in the family and none is warranted before
  human PR volume appears).*

## Approach

Title-led dev semver with the embedded short SHA; the dev tag created at PR
creation on the PR head commit, pushed to the PR repository's own origin and
verified — checkout-able from the moment the PR exists and after the branch
dies. Release-only promotion through the existing annotated-tag + GitHub
Release pipeline; the `v` prefix reserved for promoted releases;
changelog-category base derivation with the `0.1.0` baseline; the standards
document plus two deck amendments for enforcement.

**Deliberate deviation from the commodity tooling default** (GitVersion
labels a PR `PullRequest{Number}`): the short SHA, because the version is
stamped at PR-record time — before a PR number exists — and is
self-verifying against the commit it names. Verified 2026-11-04 against
GitVersion's configuration reference (PR scheme is context-derived
prerelease, never a tag; release versions come from `v`-prefixed tags) — the
dev-tag mechanism here is the developer's stated operational requirement
(checkout-able dev versions), not a claim that per-PR tags are commodity
practice.

**Composition with existing deck machinery (all unchanged):**
- `release-promoter`: the release pipeline already produces the annotated
  `v`-tag + GitHub Release at merge; R-5 adds nothing to its mechanics.
- `git-workflow-branch` rule 3 hash-permanence tags: separate tags, separate
  jobs; a submodule commit may carry both its
  `<parent-repo>/<issue-number>-<submodule-dir>` discipline tag and a dev
  version tag. The dev tag never replaces the discipline tag (the discipline
  tag's name encodes parent-issue traceability the dev name cannot).
- `git-workflow-pr` §2(d-2) tag-pushed gate, §2(e) pointer-only exclusion,
  §2(f) submodule-PR ordering gate: untouched.
- `version-manager` rule 5 (submodule package metadata is tooling
  versioning): untouched.

## Success criteria

| ID | Class | Criterion | Instrument | Tests |
|---|---|---|---|---|
| SC-1 | behavioral | A non-release PR created under the amended workflow carries a title matching `^\[\d+\.\d+\.\d+-dev\.[0-9a-f]{7,40}\] ` and a body `Version:` line | Behavioral harness run (real remote PR creation): assert the title regex and the body line against the created PR | R-1, R-2 |
| SC-2 | behavioral | SC-1's PR has a dev tag on its head commit on the remote whose name's SHA segment equals the head commit's abbreviated hash, matching the dev format (no `v` prefix), and a fresh clone's `git checkout <dev-version>` resolves to the head commit SHA | `git ls-remote --tags` lists the tag at the head SHA; the name's SHA segment compared to `git rev-parse --short <head>`; fresh-clone checkout with SHA equality | R-3, R-6, R-2 |
| SC-3 | behavioral | After a scoped branch rewrite of SC-1's PR branch, the remote carries no tag named for the abandoned head and carries the new head's dev tag (name embedding the new head's SHA, target the new head) | Harness rewrite (`git push --force-with-lease`) + `git ls-remote --tags`: absent stale name, present new name at the new head SHA | R-4 |
| SC-4 | behavioral | A release PR carries, at creation, a title matching `^\[\d+\.\d+\.\d+\] ` and no dev-form pre-merge tag | Harness/API check at release-PR creation: title regex + tag listing (absence of dev-form tag) | R-5, R-1 |
| SC-5 | structural | `CONTRIBUTING.md` exists at the root stating the family rule, both forms, the promotion boundary, the `0.1.0` baseline, the derivation rule, and the `v` reservation | File-existence check + per-statement content grep | R-8 (with R-2, R-6) |
| SC-6 | structural | `git-workflow-pr` carries the pre-create dev-tag step (with the collision-block disposition), the `Version:` line in its §4 body contract, and the rewrite-retag clause; `version-manager` carries the dev-base derivation and the baseline | Grep of the two card files for the amended clauses, including the rewrite-retag clause | R-8 |
| SC-7 | behavioral | Post-merge, SC-4's release PR has the promoted artifacts: an annotated `vX.Y.Z` tag on the merged trunk commit and a GitHub Release built on it | API checks post-merge: annotated-tag listing + `gh release view` | R-5 |
| SC-8 | structural | The amended `git-workflow-pr` retains the "Release PRs are parent-repo artifacts only" rule unchanged | Grep of the card file for the parent-only clause | R-7 |
| SC-9 | structural | The change creates no CI: no workflow files exist under `.github/workflows/` in the root after implementation | Directory-absence check (glob) | R-9 |
| SC-10 | behavioral | A non-release PR's version equals the rule-derived expectation for its change category and base state — baseline case (no release tag: 0.1.0 + category) and post-release case (latest release tag + category), the breaking→major branch included | Harness runs asserting exact version strings: a baseline-seeded repo and a release-tag-seeded repo, category varied over feature, fix, and breaking (e.g. 0.1.0 + breaking → 1.0.0-dev.<sha>) | R-2 |
| SC-11 | behavioral | A pre-seeded colliding tag name (pointing elsewhere) blocks the PR's creation gate: the PR is not created, the existing tag's target is unchanged, and the collision is reported | Harness run seeding a colliding tag, then asserting no PR exists, the original tag target is unchanged, and the report is in the run's record | R-3 |
| SC-12 | behavioral | SC-1's non-release PR flow produces no `v`-prefixed tag and no GitHub Release | The same harness run's full `git ls-remote --tags` listing (no `v*` names) + a release-list API check (no release exists) | R-5, R-6 |

**Evidence types.** Behavioral SCs: executed harness/API output (PR URLs,
tag listings, checkout SHA assertions, release views) — never assertions.
Structural SCs: command output showing file presence and clause content.

## Out of scope

- CI enforcement — deferred until human PR volume justifies it (R-9).
- Registering the submodules themselves (the `settings.gradle` includes are
  commented out) — the rule binds when they register; this change registers
  nothing.
- Backfilling versions or tags onto existing history (nothing to backfill —
  zero tags exist).
- `release-promoter`'s pipeline mechanics (composition only).
- Submodule-repo package-metadata versioning (`version-manager` rule 5
  unchanged).
- Per-submodule releases (the parent-only rule stands, R-7).
- Answering cedproject#1's submodules-vs-gradle-sourceSets question — this
  spec assumes the submodule direction per the developer's directive; #1
  stays open for the developer.

## Impact

- **Consumers:** every future PR flow in the family (agent-created and
  human-created); the release-promoter pipeline (composition only); the
  hash-permanence pointer discipline (coexistence, unchanged); human
  contributors via `CONTRIBUTING.md`.
- **Blast radius:** one new `CONTRIBUTING.md` at the root; two deck cards
  amended (`git-workflow-pr`, `version-manager`); zero code or build
  changes; the issue store carries this spec (#4).
- **Risks and safeguards:**
  - Dev tags accumulate on family remotes — by design: they are the
    checkout-able dev history. The no-`v`-prefix naming keeps the release
    set greppable (`git tag -l 'v*'`).
  - Tag churn on branch rewrites — retagging happens only under the §3
    scoped-rewrite conditions (branch created by this agent, unmerged, no
    other party holds it); no other tag force-move exists in this design.
  - Squash-merge SHA churn — a dev tag names the reviewed head content, not
    the trunk commit; the release tag is the trunk anchor. Stated semantics,
    not an oversight.
  - Pull-only origins — no branch creation there per `git-workflow-branch`
    #2667, so no dev-tag push arises; a push failure on any origin is
    reported per that rule, never silently omitted.

## Edge cases

- **Tag-name collision:** an existing tag name pointing elsewhere is
  reported and blocks the PR's creation gate until resolved by direction
  (R-3) — mirrors the idempotence discipline of `git-workflow-branch` rule 3.
- **Baseline ambiguity:** before the first release tag, "the latest release
  tag" does not exist; R-2's `0.1.0` baseline resolves it.
- **Simultaneous PRs claiming the same base:** two in-flight PRs may both
  anticipate `0.2.0` (`0.2.0-dev.<sha-a>`, `0.2.0-dev.<sha-b>`) — the short
  SHA disambiguates; dev identities make no ordering promise, only the
  release does.
- **Human-created PRs:** bound by `CONTRIBUTING.md`; deck enforcement covers
  agent-created PRs; CI is deferred (R-9).
- **Rewrite invalidation:** a tag created before a mid-review rewrite is
  replaced under R-4's triggers — the stale tag (named for the abandoned
  head) is deleted and a fresh tag names the new head; between triggers the
  remote may carry the pre-rewrite tag, and the PR record's version is
  updated to the new version at the trigger.

## Traceability

| Developer statement (2026-11-04 session) | Requirements | SCs |
|---|---|---|
| S1 "all PRs need to include a semver" | R-1 | SC-1, SC-4 |
| S2 "non-release PRs … dev semver … release PRs … release semver" | R-2, R-5 | SC-1, SC-2, SC-4 |
| S3 "…this repo and all current and future submodules" | R-1, R-7, R-8 | SC-5 |
| S4 "a directive to add to this root repo to reflect this repo's standards" | R-8 | SC-5, SC-6 |
| S5 "the goal is to have each PR tagged with a version" | R-1, R-3 | SC-1, SC-2 |
| S6 "release PRs are the only ones that get promoted to full tagged releases" | R-5, R-6 | SC-4 |
| S7 "always get git tags else what good are the PR tags?" | R-3 | SC-2 |
| S8 "only true release PRs … otherwise … branch/repo/hash tagging" | R-2, R-5, R-6 | SC-2, SC-4 |
| S9 "we need to checkout dev versions" | R-3 | SC-2 |
| Exploration record (stated defaults, unchallenged through finalization) | R-4, R-9 | SC-3 |

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
