# Medusa Gaze

A Claude Code skill that closes tasks. Not completes them — closes them.

## What it is

`/medusa` is the final stage of the IGPenguin skill pipeline:

```
/styx    → raw notes → prioritized TODOs.md
/hades   → task → 6 orthogonal implementation paths
/perseus → approach → strike team challenge
/medusa  → task → interrogation → Gaze File → execution → deletion
```

Medusa takes one task, interrogates it into a locked scope (the Gaze File), executes precisely against that scope, and deletes the task from the backlog when done. Tasks don't graduate. They die.

## Repo structure

```
medusa-gaze/
├── .claude-plugin/         — marketplace registration
├── .medusa/                — default config files (installed to ~/.claude/medusa/)
│   ├── manifesto.md        — execution philosophy
│   └── papyrus.md          — Gaze File template
├── assets/
│   └── header.svg
├── claude-skill/
│   └── skills/
│       └── medusa/
│           └── SKILL.md    — the skill prompt
├── .gitignore
├── CLAUDE.md
├── LICENSE.md
├── README.md
└── install-skill.sh
```

## Dev notes

- Branch: `chaos`
- Config installs to `~/.claude/medusa/`
- Session history (Gaze Files) lives in `.medusa/` in the user's project (gitignored)
- Install script uses `cp -n` — never overwrites existing user config
- Sweep mode (queue of tasks) is v2, not in this version
