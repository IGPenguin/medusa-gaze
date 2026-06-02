# Activity Book — Global

## Oneliner Bug Batch Fix

**Signature:** Fix a set of small, heterogeneous player/user-reported bugs, each described as a short oneliner phrase spanning multiple files and systems

**Files to open first:**
- Read each oneliner symptom and grep for the key noun (string snippet, function name, emoji, variable name) to locate the file and line
- For string complaints ("too long", "wrong message", "misleading"), search string-generator or equivalent strings file first
- For speed/difficulty complaints, search the action config or equivalent input config file
- For logic bugs ("fires when it shouldn't", "not cleaned between runs"), trace from symptom backward through the call stack

**Standard execution steps:**
1. Read all oneliners and classify each as: string fix, config/tuning fix, logic guard, or extraction (inline string → pool)
2. Grep for the specific token in each oneliner to locate the exact file and line
3. Read enough surrounding context to understand the fix without over-reading
4. Fix in order: data files first, then config, then logic, then string extractions last
5. For inline strings flagged for variety — create a named pool function in the strings file, wire the call in the logic file

**Known pitfalls:**
- "too long" = trim to match the length of other strings in the same pool, not just cut characters
- "faster/slower/harder" on a UI prompt = find the speed/difficulty config constant, not animation CSS
- "sounds like it was already used / spent" = misleading pool string, not a logic bug — replace the string, don't add guards
- "firing when it shouldn't" with no companions/empty state = check initializer value coercion (e.g. `[""]` coerces to empty string, not length 0 array)
- Log suppression during a save/restore lifecycle (level-up, save-load) needs a guard on the snapshot variable, not the entity state variable — snapshot is non-null during the window, entity state may already be reset

**Boilerplate acceptance criteria:**
- [ ] Each oneliner maps to exactly one change — no scope creep
- [ ] Extracted strings use chooseFrom pools with ≥3 variants
- [ ] No inline player-facing strings left in logic files

**Delta questions (ask these during interrogation):**
- For any "too long/too fast/too slow" item — is there a specific target, or should it match surrounding pool members?
- For any logic-sounding bug — is this a wrong message or genuinely wrong behavior?
