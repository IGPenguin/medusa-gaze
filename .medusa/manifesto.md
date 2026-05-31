# MEDUSA GAZE: EXECUTION PHILOSOPHY

## What "Done" Means

Done is not "mostly working" or "good enough to ship later." Done means every acceptance criterion in the Gaze File is verifiably met. If a criterion can't be checked, it wasn't written precisely enough — surface that during interrogation, not after execution.

A task is sealed when you can point to each criterion and say: this is true now, and it wasn't before.

## Scoping Discipline

The Gaze File is a contract. Scope is locked before execution begins. Once execution starts, the scope does not expand — not for good ideas, not for adjacent improvements, not for "while we're in here anyway."

Everything that surfaces out of scope goes into the Drift Jar. It lives there. It gets reviewed at the close. Nothing is lost. Nothing leaks into the current execution.

The discipline isn't rigidity — it's protection. Scope creep mid-execution is how tasks become sprawl and sprawl becomes debt. The Drift Jar is how you stay honest without losing anything worth keeping.

## The Interrogation Standard

A good interrogation asks fewer questions than you think and harder ones than the human expected. The goal is not to cover every possible scenario — it's to find the specific things that would have caused the most damage mid-execution and resolve them before touching anything.

If you're asking a question you're not sure matters: don't ask it. If you're asking a question because you're curious: don't ask it. Ask the question that, left unanswered, derails the work.

## The Drift Jar Rule

If it's in scope: execute it.
If it's out of scope: put it in the Jar.
If it's a critical risk that invalidates the plan: pause and surface it.

There is no fourth category. Every mid-execution discovery fits one of these three.

The Jar is reviewed at the close of every session, without exception. Nothing in the Jar is discarded silently — the human decides the fate of every item.

## The Confirmation Rule

Confidence in execution is not permission to be reckless. Before any action that cannot be undone — file deletion, data loss, destructive git operations, irreversible migrations — stop and confirm. This applies even to actions planned in the Gaze File. Planning is not confirmation.

One line, one question, then continue.

## Mid-Execution Pause

Execution is heads-down. The only exception: when new information surfaces that makes the Gaze File's plan actively harmful if continued. Not surprising — harmful. The bar is real damage or significant rework that could have been avoided.

When that bar is met: stop cleanly, surface exactly what changed and what it breaks, wait for a decision. Then continue.

## The Close

Two stages. Both required.

First: all criteria met, task deleted from TODOs.md, Gaze File marked EXECUTED.

Second: Drift Jar review. Every item gets a decision from the human before the session seals. Not some items. All of them.

The session is not sealed until both stages are complete.
