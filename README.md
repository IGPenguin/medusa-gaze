<p align="center">
  <img src="assets/header.svg?v=2" width="100%" alt="Medusa Gaze Header">
</p>

## 🐍 Close tasks for real, not just complete them

**Medusa Gaze** is a Claude Code skill that takes one task, refines it into locked scope, executes it precisely, and deletes it from your backlog. Tasks don't graduate from Medusa, they get done and crossed out.

---

## ⚡ Claude Code - Skill

Medusa Gaze lives natively inside Claude Code as a `/medusa` skill. No API keys, no config per project. Install once, invoke from any session.

### Usage

Type `/medusa` in any [Claude Code](https://claude.com/product/claude-code) session.

1. Silently reads `CLAUDE.md`, `TODOs.md`, `DESIGN.md`, `CONTENT.md`, `WIKI.md` — whatever's present
2. Asks which task to complete, or finds the highest priority open item
3. Interrogates the task - not a checklist, a conversation — until scope is airtight
4. Generates the **Gaze File** and saves it to disk before touching anything
5. Executes precisely against the Gaze File; out-of-scope catches go into the Drift Jar
6. Deletes the task from `TODOs.md` when done, then reviews the Jar

### Modes

| Mode | How to trigger | What it does |
|---|---|---|
| **Lock** | Default | Full loop: interrogate → Gaze File → execute |
| **Strike** | Say `strike` | Skip interrogation, straight to Gaze File and execution |
| **Open** | Say `open [filename]` | Load a saved Gaze File, go straight to execution |

**Lock** is for most tasks. **Strike** is for tasks that already have airtight specs. **Open** is for resuming a session across context limits or intentional pauses.

### The Gaze File

Before execution begins, Medusa writes a contract to `.medusa/gaze-YYYY-MM-DD-HHMM-[slug].md`:

- Scope — what's in AND what's explicitly out
- Acceptance criteria
- Execution plan
- Risk flags
- Drift Jar — for out-of-scope catches during execution

The Gaze File can be executed immediately or saved for a future session.

### The Drift Jar

While executing, Medusa catches everything interesting that's out of scope? ideas, adjacent improvements, things noticed in passing - and holds them in the Drift Jar without interrupting execution. At the close, every Jar item gets a decision: push to `TODOs.md`, keep in the Gaze File, or discard. Nothing is silently lost.

### Safety

Medusa asks for confirmation before any irreversible action: file deletion, destructive git operations, database drops - even if it was planned. She also pauses mid-execution if new information surfaces that materially changes the risk of the current plan (a changed file, a wrong assumption, a missing dependency). Both are one-line stops, not re-interrogations.

### History

Every `/medusa` session saves a record to `.medusa/YYYY-MM-DD-HHMM-slug.md`: task, mode, sibling input, and the full Gaze File.

The skill adds `.medusa/` to your `.gitignore` automatically on first run, so session history stays local.

### Tweaking

The execution philosophy and Gaze File template live in your home directory. Changes take effect immediately.

| File | Purpose |
| :--- | :--- |
| `~/.claude/medusa/manifesto.md` | Execution philosophy — what "done" means, scoping rules, the Drift Jar rule |
| `~/.claude/medusa/papyrus.md` | Gaze File template — rename fields, add sections, change structure |

### Setup

```bash
git clone https://github.com/IGPenguin/medusa-gaze.git
cd medusa-gaze
chmod +x install-skill.sh
./install-skill.sh
```

Then restart Claude Code.

### Updating

```bash
git pull && ./install-skill.sh
```

Then restart Claude Code.

---

## 🔗 Related

- 🌊 **[Styx Flow](https://github.com/IGPenguin/styx-flow)** - Turn raw notes into a prioritized backlog (`/styx`)
- 🔥 **[Hades Gate](https://github.com/IGPenguin/hades-gate)** - Turn a task into 6 orthogonal implementation paths (`/hades`)
- ⚔️ **[Perseus Blade](https://github.com/IGPenguin/perseus-blade)** - Virtual studio that challenges your approach with expert voices (`/perseus`)
