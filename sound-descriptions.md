# Sound Description Labels

Human-readable descriptions for every sound in both collections.
These labels appear beneath the sound filename in the control panel UI,
so users know what they'll hear before clicking play.

Format: `sound_file` -- "Label shown in UI"

---

## MGS Collection -- Sound Labels

Each label describes the actual audio character in MGS terms.

| Event | Sound File | Sound Label |
|-------|-----------|-------------|
| session_start | 0x1a.wav | "Codec call ring" |
| session_end | 0x41.wav | "Mission debrief tone" |
| task_complete | 0x1F.wav | "Objective cleared" |
| permission | 0x24.wav | "Awaiting orders" |
| git_commit | 0x67.wav | "Item pickup chime" |
| git_push | 0x08.wav | "Area transition" |
| git_pr_create | 0x44.wav | "Mission milestone" |
| git_error | 0x0E.wav | "Caution ping" |
| test_pass | 0x73.wav | "Stealth success" |
| test_fail | 0x15.wav | "? -- Guard alerted" |
| build_complete | 0x20.wav | "Equipment ready" |
| build_error | 0x2D.wav | "System malfunction" |
| tool_success | 0x4F.wav | "Radar blip" |
| tool_failure | 0x36.wav | "Operation failed" |
| tool_pre | 0x4A.wav | "Initiating action" |
| context_50 | 0x0E.wav | "Caution ping" |
| context_75 | 0x0D.wav | "Guards searching" |
| context_90 | 0x01.wav | "! -- Alert triggered" |
| streak_3 | 0x27.wav | "Combo rising" |
| streak_5 | 0x3E.wav | "Rank upgrade" |
| streak_10 | 0x44.wav | "Boss defeated" |
| morning | 0x0F.wav | "Dawn briefing" |
| afternoon | 0x25.wav | "Midday check-in" |
| evening | 0x76.wav | "Night ops begin" |
| late_night | 0x64.wav | "Rest, Snake" |
| plan_mode_enter | 0x40.wav | "Cardboard box" |
| plan_mode_exit | 0x2B.wav | "Resuming operation" |
| subagent_start | 0x13.wav | "Codec frequency dial" |
| subagent_stop | 0x2E.wav | "Support signed off" |
| agent_response | 0x03.wav | "Incoming transmission" |
| team_created | 0x7B.wav | "Squad assembled" |
| team_deleted | 0x7D.wav | "Squad disbanded" |
| teammate_message | 0x1C.wav | "Codec incoming" |
| thinking_short | 0x17.wav | "Processing" |
| thinking_medium | 0x50.wav | "Analyzing intel" |
| thinking_long | 0x56.wav | "Deep analysis" |
| long_task | 0x30.wav | "Extended operation" |
| error_threshold | 0x7A.wav | "Critical failure" |
| background_task_done | 0x15.wav | "? -- Task returned" |
| skill_commit | 0x05.wav | "Securing intel" |
| skill_deploy | 0x4B.wav | "Deployment confirmed" |
| skill_gsd | 0x10.wav | "Situation report" |
| skill_newday | 0x12.wav | "New mission" |
| skill_publish | 0x6b.wav | "Intel published" |
| user_prompt | 0x68.wav | "Awaiting input" |

---

## Sims 2 Collection -- Sound Labels

Each label describes the Simlish audio character -- what emotion or action it conveys.

| Event | Sound File | Sound Label |
|-------|-----------|-------------|
| session_start | mGREETING.wav | "Cheerful greeting" |
| session_end | mOPTIONS.wav | "Thoughtful goodbye" |
| task_complete | FemalePLSSuccess.wav | "Pleased success" |
| permission | fWAITING0.wav | "Waiting patiently" |
| git_commit | Good Shot M.wav | "Enthusiastic 'Dag dag!'" |
| git_push | FemaleSKSSSuccess.wav | "Confident delivery" |
| git_pr_create | fCELEB0.wav | "Party celebration" |
| git_error | Bad Shot M.wav | "Disappointed groan" |
| test_pass | Easy Shot FM.wav | "Casual success" |
| test_fail | fBADHOLE.wav | "Grumpy muttering" |
| build_complete | MalePLSSuccess.wav | "Satisfied approval" |
| build_error | MalePLSFailure.wav | "Frustrated sigh" |
| tool_success | fSTORYOK.wav | "Quick acknowledgment" |
| tool_failure | fOOPS0.wav | "Oops!" |
| tool_pre | mBLIND.wav | "Curious murmur" |
| context_50 | fSNACK0.wav | "Snack time" |
| context_75 | fHUNGRY.wav | "Getting hungry" |
| context_90 | fHUNGRY2.wav | "Very hungry complaint" |
| streak_3 | Good Shot FM.wav | "Nice shot!" |
| streak_5 | Good Shot FM2.wav | "Great shot!" |
| streak_10 | fCELEB0.wav | "House party!" |
| morning | mGREETING.wav | "Morning greeting" |
| afternoon | fHAVEADRINK.wav | "Time for a drink" |
| evening | mCOKE0.wav | "Evening unwind" |
| late_night | mTIRED.wav | "Sleepy yawn" |
| plan_mode_enter | mBENCH0.wav | "Sitting to study" |
| plan_mode_exit | mSTORYYES.wav | "Idea accepted" |
| subagent_start | mHAPPY0.wav | "Happy greeting" |
| subagent_stop | MaleSSSSuccess.wav | "Job well done" |
| agent_response | mSTORY0.wav | "Telling a story" |
| team_created | FemaleSKSSHappy.wav | "Excited gathering" |
| team_deleted | FemaleSSSSad.wav | "Sad farewell" |
| teammate_message | fHAPPY1.wav | "Friendly chat" |
| thinking_short | mWAITING0.wav | "Brief pause" |
| thinking_medium | mTHIRSTY.wav | "Getting thirsty" |
| thinking_long | mTIRED.wav | "Getting tired" |
| long_task | fTIRED.wav | "Exhausted sigh" |
| error_threshold | fMAD0.wav | "Angry outburst" |
| background_task_done | fLOVELY0.wav | "Pleasant surprise" |
| skill_commit | Good Shot M.wav | "Nailed it!" |
| skill_deploy | MaleSSSSuccess.wav | "Smooth delivery" |
| skill_gsd | mBENCH0.wav | "Focused study" |
| skill_newday | FemalePLSHappy.wav | "Fresh start" |
| skill_publish | FemaleSKSSSuccess.wav | "Proud announcement" |
| user_prompt | fSTORY0.wav | "Listening..." |

---

## Label Style Guide

**Format rules for the control panel UI:**
- Labels should be 1-3 words, max 25 characters
- Use sentence case, not ALL CAPS
- MGS labels use military/tactical language
- Sims labels use emotional/domestic language
- Labels describe the *character* of the sound, not the event it's mapped to
- When a sound has an iconic reference, include it: "? -- Guard alerted", "Oops!"
- Quoted Simlish words are fine: "'Dag dag!'"

**Why this matters:**
"0x67.wav" tells you nothing. "Item pickup chime" tells you everything. Users can scan the control panel and understand their entire sound mapping without pressing a single play button.

---

## Implementation Notes

These labels should be stored per-collection in config.json as a `sound_label` field on each event:

```json
{
  "git_commit": {
    "enabled": true,
    "sound": "0x67.wav",
    "description": "When a git commit succeeds",
    "sound_label": "Item pickup chime"
  }
}
```

- `description` = what the EVENT does (already exists)
- `sound_label` = what the SOUND sounds like (new field)

The `sound_label` changes when the user swaps sounds. Ideally it's populated automatically from a lookup table keyed by filename, so switching the sound dropdown also updates the label.
