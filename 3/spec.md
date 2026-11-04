# Spec — cedproject#3 — the tracked production-database dumps: removal-only

## Intent

Ticket #3's scope is the **removal of the tracked production-database dump
files from the repository tip — nothing else.** The removal is executed and
trunk-landed; what remains is the ticket's record: the removal's fact, and
the standing history-treatment disposition, recorded on the ticket. Every
other statement in the ticket's pre-store-era draft (legacy script residue,
backup-path records, `build.properties`, and any dependency on the devops
repo) is **out of this ticket** — those surfaces have their own homes and no
dependency of any kind runs from this ticket to another repository.

## Provenance

- Developer answers 2026-11-03 (ticket #2, closed with the record): the
  tracked SQL files can be deleted — removal alone. (Values/dump contents
  are never reproduced anywhere — paths-only per the org SOP.)
- Developer scope direction 2026-11-04, in session: "#3 is only for the
  removals … it has nothing to do with anything else … and does not need
  dependencies on devops."
- The removal **executed**: commit `8e3debd` (`fix(#3): remove tracked
  production database dumps from the repository tip`) — nine `backups/`
  paths, 8,994 deletions — carried by the stacked PR (cedproject#7) and
  merged to trunk at `f7bef28` on 2026-11-04.

## Requirements

- **R-1** The nine tracked paths (`backups/bhd.sql`, `backups/ced.sql`,
  `backups/cedSmallDb.sql`, `backups/cno.sql`, `backups/cwl.sql`,
  `backups/noq.sql`, `backups/rrd.sql`, `backups/vrb.sql`,
  `backups/output.txt`) SHALL be absent from the repository tip. — **Already
  delivered** by the commit above; this ticket records it, it does not
  re-execute it.
- **R-2** The history treatment SHALL stand as **removal-alone**: the dumps
  remain in git history; no history rewrite is elected. The recording here
  is the ticket's disposition record; a future history rewrite would be its
  own ticket. *Trace: the 2026-11-03 answers; the 2026-11-04 scope
  direction.*

## Success criteria

| ID | Class | Criterion | Instrument | Tests |
|---|---|---|---|---|
| SC-1 | structural | The nine paths are absent from trunk | `git ls-files backups/` on the synced trunk returns empty | R-1 |
| SC-2 | structural | The ticket carries the removal record (the executing commit, merge evidence) and the removal-alone disposition line | The ticket's record set (local `{3}/` record + remote-tracker comment) contains both lines paths-only | R-1, R-2 |
| SC-3 | structural | No other surface is touched by this ticket's work: no code, script, or doc change, no cross-repo dependency | `git status --porcelain` shows no tracked modification; `git log f7bef28..HEAD --stat` shows no repo-content commit after the merge | R-1, R-2 |

**Evidence types:** executed command outputs (`git ls-files`, ticket-record
reads) — never assertions.

## Out of scope

- Everything else the pre-store draft mentioned: legacy script residue,
  backup-path records, the `build.properties` file, and any other
  repository's work (no devops or other cross-repo dependencies).
- History rewriting (not elected; recorded as the standing disposition's
  complement — a future ticket's matter, never this one).

## Impact

- **Consumers:** ticket #3 itself (its record set) and anyone auditing the
  removal's disposition later.
- **Blast radius:** zero repository changes; ticket-record edits only.
- **Risks:** none — record edits, paths-only.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)
