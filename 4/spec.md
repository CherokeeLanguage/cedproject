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
makes them git tags, not PR-record labels alone. **Scope correction
(2026-11-04, mid-implementation):** "…opencode is out of scope. I told you to
update the root repo, not the opencode deck" — the deliverable set shown to
this change is the root repository's content alone; the agent deck (`.opencode`)
is amended by nothing in this change, and this spec's verification instruments
live in the root repository.

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
  reservation. The enforcement surface of this change is this document: the
  agent deck (`.opencode`) is amended by NOTHING in this change, and this
  change creates no verification machinery outside the root repository.
  *Trace: S4, S1; scope correction 2026-11-04.*
- **R-9** Enforcement SHALL be deck-level only; this change SHALL create no
  CI. *Trace: exploration record (stated default, unchallenged through
  finalization; no CI exists in the family and none is warranted before
  human PR volume appears).*

## Approach

The deliverable is the standards document. Title-led dev semver with the
embedded short SHA is stated as the family rule; release-only promotion
through the existing annotated-tag + GitHub Release pipeline; the `v` prefix
reserved for promoted releases; changelog-category base derivation with the
`0.1.0` baseline. The agent deck's existing cards govern agent-created PR
flows UNCHANGED by this change — the deck is out of scope (scope correction,
2026-11-04) — so the standard's enforcement surface is the document itself,
read by contributors and by agents working in this repository.

**Deliberate deviation from the commodity tooling default** (GitVersion
labels a PR `PullRequest{Number}`): the short SHA, because the version is
stamped at PR-record time — before a PR number exists — and is
self-verifying against the commit it names. Verified 2026-11-04 against
GitVersion's configuration reference (PR scheme is context-derived
prerelease, never a tag; release versions come from `v`-prefixed tags) — the
dev-tag mechanism here is the developer's stated operational requirement
(checkout-able dev versions), not a claim that per-PR tags are commodity
practice.

**Composition with existing deck machinery (all unchanged, stated as the
standard's coexistence rules, not as amendment targets):**
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
| SC-1 | structural | `CONTRIBUTING.md` exists at the root stating the family rule, both forms, the promotion boundary, the `0.1.0` baseline, the derivation rule, and the `v` reservation | File-existence check + per-statement content grep | R-8 (with R-1..R-7 as its stated content) |
| SC-2 | structural | The change creates no CI: no workflow files exist under `.github/workflows/` in the root after implementation | Directory-absence check (glob) | R-9 |

**Evidence types.** Structural SCs: command output showing file presence and
clause content — never assertions.

## Out of scope

- The agent deck (`.opencode`): NO deck edit, NO harness scenario, NO
  changes to any deck-tree content — explicit developer directive
  2026-11-04 ("…update the root repo, not the opencode deck"). Runtime
  behavioral verification through the deck-embedded test harness is out of
  scope for the same reason.
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
  human-created — the standard states the rule); human contributors via
  `CONTRIBUTING.md`; the family's release pipeline (stated coexistence,
  unchanged).
- **Blast radius:** one new `CONTRIBUTING.md` at the root; zero deck edits;
  zero code or build changes; the issue store carries this spec (#4).
- **Risks:** the standard's compliance is not machine-enforced (no CI, no
  deck hook by design — R-9 and the scope correction); drift between stated
  rule and practiced flow is detected by PR review, not by tooling. This is
  the developer's chosen posture, stated so no reviewer later mistakes it
  for an oversight.

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

| Developer statement (2026-11-04 session) | Recorded as |
|---|---|
| S1 "all PRs need to include a semver" | R-1 → SC-1 content |
| S2 "non-release PRs … dev semver … release PRs … release semver" | R-2, R-5 → SC-1 content |
| S3 "…this repo and all current and future submodules" | R-1, R-7 → SC-1 content |
| S4 "a directive to add to this root repo to reflect this repo's standards" | R-8 → SC-1 |
| S5 "the goal is to have each PR tagged with a version" | R-1, R-3 → SC-1 content |
| S6 "release PRs are the only ones that get promoted to full tagged releases" | R-5, R-6 → SC-1 content |
| S7 "always get git tags else what good are the PR tags?" | R-3 → SC-1 content |
| S8 "only true release PRs … otherwise … branch/repo/hash tagging" | R-2, R-5, R-6 → SC-1 content |
| S9 "we need to checkout dev versions" | R-3 → SC-1 content |
| Scope correction 2026-11-04 "…root repo, not the opencode deck" | R-8's enforcement-surface sentence, Out-of-scope first bullet |
| Exploration record (stated defaults, unchallenged through finalization) | R-4, R-9 → SC-1 content, SC-2 |

Every stated rule is recorded as the standard's content in `CONTRIBUTING.md`
and verified by SC-1's per-statement grep; no behavioral runtime criterion
remains — the runtime machinery class lived in the deck tree, which this
change does not touch.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
