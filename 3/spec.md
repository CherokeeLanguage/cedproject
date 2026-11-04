# Draft spec (follow-up, post-migration) — cedproject hygiene

> DRAFT — awaiting developer review. Filed 2026-11-03 from cdrchops'
> clarification answers (cedproject#2, closed with the record): the tracked
> SQL files can be deleted; the real backup path is the on-server
> `backupDB.sh` + the `./build.sh` pull; execution rides THIS follow-up spec,
> gated on the completed migration (devops#14's acceptance) per cdrchops'
> directive. Values/dump contents are never reproduced here (org SOP —
> paths-only).

## Problem

cedproject tracks nine database-dump/text files under `backups/` in a public
repository (`bhd.sql`, `ced.sql`, `cedSmallDb.sql`, `cno.sql`, `cwl.sql`,
`noq.sql`, `rrd.sql`, `vrb.sql`, `output.txt`) — pulled live-data snapshots,
not intentional public artifacts (cdrchops' answer, 2026-11-03). The legacy
deploy/backup scripts carry residue: `buildScripts/deployWar.sh`'s interactive
menu (the "deploy aiki" entry unused ~5 years — a single-server-era proof of
concept), `buildMain.sh`'s password-bearing legacy deploy functions, and
`buildScripts/functions.sh`'s duplicate scp. The backup path itself
(`backupDB.sh` on the server, invoked with the database password as a
command-line argument) is the working instrument that the migration's cutover
re-dump can use as-is.

## Requirements

- **R-1** The nine tracked paths SHALL be removed from the repository tip.
  **Ungated (developer directive, 2026-11-04):** the developer stated the
  removal of these backup files "should not have dependencies against
  anything" — R-1 executes now, independent of the migration (superseding
  the prior blanket R-5 gate for this requirement). The **git-history
  treatment remains the developer's explicit election**, not yet decided:
  removal alone (history retains the dumps) vs history rewrite
  (filter-repo/BFG — an org-wide coordination event, since every
  clone/fork carries the objects); the election record in this ticket and
  the history execution, if any, ride the developer's later direction.
- **R-2** The legacy script residue SHALL be retired with the unified parent
  build (devops#23's Gradle composite replaces `build.sh`/`buildMain.sh`'s
  build role) and the stack deploy (cherokeedictionary#125 replaces the deploy
  role): `deployWar.sh`'s menu (including the unused "deploy aiki" entry),
  `buildMain.sh`'s legacy deploy/backup bash functions, `functions.sh`'s
  duplicate scp — removed or explicitly retained-with-deprecation-note at
  implementation (the AVG#25 deprecation-note pattern is the template).
- **R-3** The on-server backup path SHALL be recorded as the canonical
  instrument for the migration window: `backupDB.sh` (ced1) → zip →
  `./build.sh`'s pull step. The phase-5 cutover's fresh dump (devops#14 R-7c)
  can ride it; a **follow-up hardening item** (this spec's, not stage-A's):
  the password-as-command-line-argument invocation (process-list exposure on
  the remote) gets replaced by an argv-free mechanism (env/config file on the
  server) — behavior-compatible, no dump format change.
- **R-4** The `build.properties` credential surface (tracked, non-empty
  values: UNAME/HOSTS/USERNAME/GITHASH/DBPASS — paths-only per the SOP) rides
  the same disposition pass: once the unified build + key-based deploy land,
  the file's values have no consumer; template-with-empty-values or deletion,
  developer's election recorded here.
- **R-5** **Gating scoping (developer directive, 2026-11-04):** only
  R-2 (legacy residue), R-3 (backup-path record), and R-4
  (`build.properties` disposition) remain **gated on the completed and
  accepted migration** (devops#14's acceptance record). R-1's tracked-path
  removal is ungated and executes immediately.

## Success criteria

| ID | Criterion | Class | Instrument |
|---|---|---|---|
| SC-1 | The nine paths are absent from the repository tip; the history-treatment election is still recorded as open pending the developer's call (ungated — executes now) | structural | `git ls-files` check + the recorded election state |
| SC-2 | The legacy deploy/backup residue's disposition is recorded (removed or deprecated-in-place per file) | structural | diff review + the disposition list |
| SC-3 | The backup-path record names the on-server instrument and the pull step; the argv-free hardening item is recorded (implemented or explicitly deferred with a date) | structural | the record's presence + the item's state |
| SC-4 | `build.properties` disposition recorded; zero credential values in any post-change artifact | structural | secret-scan class check over the diff |

## Impact

Consumers: the org's secret-scan posture (the zero-hit goal); the migration's
cutover (the dump instrument); the unified build (devops#23). Blast radius:
cedproject's tracked files + scripts; no child-repo changes. Risks: minimal —
all removals are of dead or duplicated surfaces; the history rewrite (if
elected) is the one heavyweight step and is explicitly the developer's call.

## Out of scope

The unified parent build itself (devops#23); the stack deploy script
(cherokeedictionary#125); the MariaDB container's ongoing backup loop
(devops#12's — the post-migration successor of R-3's instrument); stage-B
modernization.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)

