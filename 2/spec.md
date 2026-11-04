# Clarification — tracked database dumps under `backups/` (public repository)

**Provenance:** found 2026-11-03 during the migration spec-audit pass
(cherokeelanguage-devops#23 records the paths-only finding; the org SOP is
values/dump-contents redacted on sight — **the dump files' contents were
never opened or reproduced anywhere**). Filed here as a clarification request
assigned to cdrchops: you know these files' provenance best.

## The finding (paths only)

`git ls-files` shows these committed at the repository root's `backups/`
directory:

- `backups/bhd.sql`
- `backups/ced.sql`
- `backups/cedSmallDb.sql`
- `backups/cno.sql`
- `backups/cwl.sql`
- `backups/noq.sql`
- `backups/rrd.sql`
- `backups/vrb.sql`
- `backups/output.txt`

The build flow explains how they arrive (cedproject's `buildMain.sh`:
`backupDatabaseOnServer()` → remote `backupDB.sh` → `pullDatabaseFromServer()`
scps `dump.sql.gz` back) — but not whether committing them is intended.

## The clarification request

1. **Are these dumps intentional public artifacts** (scrubbed/sanitized
   fixtures), or pulled live-data snapshots that were committed without a
   disposition decision?
2. **What do they carry?** Which databases do the filenames correspond to,
   and do any contain user-identifying or otherwise sensitive rows?
3. **The disposition** — per the org's data-confidentiality posture
   (cherokeelanguage-devops' `docs/runbooks/private-data-confidentiality.md`):
   keep as-is, remove + treat git history, or scrub-and-retain. Note that
   removal alone leaves the dumps in the git history — the decision should
   say which applies.
4. Adjacent path-only note from the same flow: `backupDB.sh` is invoked with
   the database password as a **command-line argument** (visible in remote
   process listings while it runs), and the deploy flow uses `sshpass` with
   `build.properties` values — same workstream if you're already touching it.

## Context

The dockerized replacement (cherokeelanguage-devops#12's MariaDB container +
its backup loop, phases 3/5) supersedes this backup flow after cutover — but
the currently tracked dumps are a present-tense question independent of the
migration.

🤖 Co-authored with AI: OpenCode (huggingface/zai-org/GLM-5.3-Flash)

