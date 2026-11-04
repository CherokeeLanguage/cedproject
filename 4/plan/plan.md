# Plan — cedproject#4 (PR version directive)

Consumes the revised spec at `.issues/4/spec.md` (SC set restated after the
developer's 2026-11-04 scope correction: the agent deck is out of scope; the
deliverable set shown to this change is the root repository's content alone).
Restated items derive from the revised SCs.

## Approach

The change's deliverable is one tracked file: the repo-facing standards
document. The deck is untouched; there is no behavioral machinery to build —
the standard's runtime compliance is not machine-enforced by design (R-9, the
scope correction), and PR review is its detection surface.

## Items

### Item 1 — Standards document (SC-1) with the no-CI absence check (SC-2)

- **Deliverable:** `CONTRIBUTING.md` at the repository root, stating: the
  family rule (every PR in cedproject or any current/future submodule carries
  a semver), the dev form `MAJOR.MINOR.PATCH-dev.<short-sha>`, the release
  form `MAJOR.MINOR.PATCH`, the promotion boundary (only release PRs get the
  annotated `v`-tag + GitHub Release — parent-repo artifacts only), the
  `0.1.0` baseline, the changelog-category derivation rule, the dev-tag
  mechanics (on the PR head commit, pushed and verified, checkout-able;
  collision blocks the gate, never silently re-created), the rewrite-retag
  rule, and the `v` prefix reservation.
- **RED** against current state: the file does not exist; per-statement
  greps fail.
- **GREEN:** create the document with exactly the stated rule set; create no
  workflow files.
- **Instrument:** file-existence check + per-statement content grep (SC-1);
  `.github/workflows/` absence glob (SC-2).

## Dependency order

1 — a single item; RED runs against the missing file, GREEN is its creation,
verification is the grep set and glob.

## Traceability

| SC | Item |
|---|---|
| SC-1 | 1 |
| SC-2 | 1 |

Both directions hold.

## Documentation sources

- Spec: `.issues/4/spec.md` (authoritative rule wording — the item restates,
  never reinterprets).

## Edge cases

None beyond the spec's — the deliverable is a document; the stated rules
carry the mechanics (the doc states them; no runtime surface implements
them in this change).

## Not included

Everything the revised spec's Out-of-scope section names, including the
agent deck and any verification machinery outside the root repository.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
