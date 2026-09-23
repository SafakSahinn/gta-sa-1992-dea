# GTA SA: 1992 DEA Mod — Game Design Document v2

> **Language:** English is the primary language of this project. A Turkish version of this document (and of the in-game dialogue) lives in [`docs/tr/GDD.md`](tr/GDD.md).
>
> **v2 note (2026-09-23):** v2 keeps the story and dialogue of v1 and fixes its geography, money, timeline, key-binding and plot inconsistencies. Every change is listed in **Section 7 — Changelog**. Undecided topics are in **Section 6 — Open Decisions** and marked `[OPEN]` in the text.

---

## 1. CORE FRAMEWORK

| Topic | Decision |
|---|---|
| Game | GTA San Andreas (PC, v1.0 US — for mod compatibility) |
| Map | The game's **original map**. Chapters 1–2 take place entirely in **Los Santos**. (Project Eagle may be evaluated later for interstate chapters.) |
| Era | 1992 — the same year and city as CJ's story |
| Tech stack | **CLEO scripts** written in Sanny Builder. The original `main.scm` is not touched. |
| Canon ties | Ballas (street level), the cartel supplying the Loco Syndicate (shipments), Frank Tenpenny / C.R.A.S.H. (the door to the corrupt path) |
| Languages | English (primary). Turkish dialogue as an additional localization. |

### 1.1 Cast

* **Raymond "Ray" Cross (35):** DEA agent. Loyal to his badge and the law, worn down by the system, an honest father ready to risk everything for his family. `[OPEN: ethnicity]`
* **Sarah Cross (33):** Ray's wife. **Lung cancer.** An experimental chemotherapy protocol at All Saints General Hospital requires a **$12,500 down payment by Friday 10:00**. Ray's federal health insurance rejected the protocol as "experimental treatment, not covered."
* **Danny Cross (10):** Their son. Sees his father as a hero; forced to grow up early by his mother's illness.
* **Agent Miller:** Ray's honest, loyal partner.
* **Chief Garcia:** Head of the LSPD/DEA Joint Task Force. Powerless since the state cut the task force budget by 20%.
* **Dr. Evans:** Sarah's physician at All Saints General Hospital.
* **Slick:** Street informant on the Idlewood/Jefferson beat (sells information for $20).
* **Cartel Lieutenant:** Ocean Docks man of the cartel that supplies the Loco Syndicate — the Ballas' wholesaler.
* **Frank Tenpenny (canon, behind the scenes):** C.R.A.S.H. officer. Brief appearance in Chapter 1; on the Corrupt Path he turns Ray into his pawn.

---

## 2. IN-GAME EQUIPMENT AND UI

> Keys were checked in Phase 1 against the bindings read from the game's memory (`dev_controls_dump`, see [CONTROLS.md](CONTROLS.md)). Every mod key below is unbound in SA's defaults.

| Equipment | Key | Purpose |
|---|---|---|
| **Field Notebook** | `B` *(was N in v1 — N is SA's "No" key)* | Leather-bound, handwritten notebook. Page 1: radio calls and case notes. Page 2: suspect and informant statements. Page 3: personal notes and the debt list. |
| **Brick Phone** (Motorola MicroTAC 9800X) | `P` | **Voice calls only**: Sarah, Danny, Chief Garcia, Miller, Dr. Evans, Slick. *(Consumer SMS did not exist in 1992; written messages moved to the pager.)* |
| **Pager** | automatic | Hospital and office messages. Upper case, ASCII only: `41 HOURS LEFT`. |
| **Bank ATM terminal** | `T` (at an ATM) | 1992 green CRT screen. Balance and debt display. *(v1's "Fleeca" is a GTA V brand; removed.)* |
| **MDT car computer** | `M` (in vehicle) *(TAB is SA's "answer phone")* | In Ray's unmarked DEA Premier. Plate lookup, suspect database, patrol calls, evidence log. |
| **Interact** | `T` *(E is SA's "next weapon" / "look right")* | Frisk / vehicle search, cuffing, putting a suspect in the car |
| **Fate decision** | `Y` / `N` | SA's own "conversation yes/no" keys, only active in conversations — reusing them on our own decision screen fits the game's language. |

---

## 3. ECONOMY, TIME AND MORALITY SYSTEMS

### 3.1 Money (a single "balance" in the first release)

| Item | Amount | Note |
|---|---|---|
| Starting balance | **$450** | Wednesday morning |
| Weekly net salary | **$950** | Paid Monday — i.e. **after** the deadline |
| Mortgage | **-$850** | Deducted from Monday's salary |
| Bills | **-$120** | Monday |
| Hospital down payment | **-$12,500** | Deadline **Friday 10:00** |
| Legal evidence bonus | **$15–20 per package** | The only payment Chief Garcia can authorize |

> Monday's salary ($950) doesn't even cover the mortgage and bills ($970). The very first ATM screen shows the player that "wait for payday" is not an option.

**Balance flow on the legal path (an honest player):**

| When | Event | Change | Balance |
|---|---|---|---|
| Wed 07:30 | Start | — | **$450** |
| Wed 10:15 | Idlewood: 3 crack vials turned in (3 × $15) | +$45 | **$495** |
| Wed 14:30 | Paying Slick | -$20 | **$475** |
| Wed 15:15 | Motel raid bonus | +$85 | $560 |
| Wed 15:15 | $100 morality test → [B] bag it (reporting bonus) | +$15 | **$575** |
| Thursday | Free patrol (player-dependent) | +$100–250 | ~$700–825 |
| Thu 22:45 | Ocean Docks | — | still ~$11,700 short of $12,500 |

* The **$45 undeclared cash** found on the suspect is **evidence** and does not go to Ray.
* If [A] is chosen (pocket the money): $475 + $85 + $100 = **$660**, Corruption +2.
* Scene notes and notebook entries read the balance **from a variable**; no hard-coded amounts.

### 3.2 Timeline and countdown

**Deadline: Friday 10:00.** Every pager message is computed from it.

| When | Time left | Pager text |
|---|---|---|
| Wed 10:15 | 47 h 45 min | `ALL SAINTS: SARAH CROSS NO PAYMENT. DEADLINE FRI 10:00` |
| Wed 16:30 | 41 h 30 min | `ALL SAINTS: 41 HOURS LEFT. $12,500 UNPAID` |
| Thu 18:00 | 16 h | `ALL SAINTS: 16 HOURS LEFT` |
| Thu 22:45 | 11 h 15 min | `ALL SAINTS: 11 HOURS LEFT` |

### 3.3 Morality meter — a single variable: `CORRUPTION` (0–100)

v1 used "Honor Points" and "Corruption Level" side by side. v2 has **one variable**; the "Honor" shown on screen = 100 − Corruption.

| Range | State | How the world reacts |
|---|---|---|
| 0–24 | **Clean** | Full radio backup |
| 25–49 | **Grey** | Dealers start offering bribes |
| 50–74 | **Dirty** | Evidence-tampering options unlock, Internal Affairs takes interest |
| 75–100 | **Badged baron** | Street gangs pay protection |

| Action | Effect |
|---|---|
| Pocketing the undeclared $100 | +2 |
| Shooting an unarmed fleeing suspect (excessive force) | +5, -$300 fine, Internal Affairs investigation |
| Unjustified search in a rich district (if a complaint is filed) | -$200 to -$350 damages, reprimand from the chief (Corruption unchanged) |
| Breaking point: Corrupt Path | Corruption rises to **at least 50** |

### 3.4 Core police mechanics

* **Frisk and vehicle search (`T`):** The suspect leans against a wall/car. Outcome odds: 70% surrenders, 20% runs, 10% draws a weapon. **These odds apply only during free patrol**; story scenes have scripted outcomes.
* **Foot chase and surrender:** A suspect who realizes he can't escape raises his hands and kneels. `T` cuffs him and puts him in the car; turning him in at the office pays the bonus.
* **Use of force policy:** Shooting an unarmed fleeing suspect is forbidden. Penalty in Section 3.3.
* **Rich district complaint risk (Rodeo / Vinewood / Mulholland):** Searching a civilian who turns out clean has a 10–15% chance of a complaint.
* **Later stage (Corrupt Path):** Bribing Internal Affairs, judicial connections, laundering money through a video rental store (VHS), "philanthropic hero" image via donations to All Saints and the church.

---

## 4. LOCATIONS (original SA map)

Coordinates are recorded in [`LOCATIONS.md`](LOCATIONS.md).

| Location | District | In-game status | Note |
|---|---|---|---|
| Cross family house | **Jefferson** | Front door recorded | v1 had Commerce; Commerce is a business district. |
| LSPD/DEA office | Pershing Square | Interior 6, recorded | |
| Behind the Idlewood gas station | Idlewood | Recorded, Ballas turf | |
| All Saints General Hospital | Market | **No interior** | Doctor scene: exterior shot + another interior `[OPEN]` |
| Jefferson Motel | Jefferson | Interior 15, recorded | Replaces v1's "Garcia Motel". Garcia is in San Fierro. |
| Ocean Docks, Warehouse 4 | Ocean Docks | Container yard recorded | A few objects will be added for the container interior |

---

## 5. STORY AND DIALOGUE

### Chapter and mission structure

| Chapter / Mission | Title | Day | Content |
|---|---|---|---|
| Chapter 1 / Mission 1 | Routine Patrol and Balance Shock | Wednesday morning–noon | House, office, Idlewood patrol, hospital, $495 shock |
| Chapter 1 / Mission 2 | Pushing the Limits | Wednesday afternoon | Slick, Jefferson Motel raid, $100 morality test, $575, shipment intel |
| Interlude | Free Patrol Day | Thursday daytime | The player patrols freely and sees for himself that the legal path won't be enough |
| Chapter 2 / Mission 3 | Breaking Point | Thursday night | Ocean Docks raid, Cartel Lieutenant, bribe bag, `[Y]` / `[N]` decision |

---

### CHAPTER 1 / MISSION 1: ROUTINE PATROL AND BALANCE SHOCK

#### SCENE 1: Jefferson — The Cross house (Wednesday 07:30)
**Setting:** Kitchen and living room. Piled-up bills on the table, red final notices from All Saints Hospital.
**Characters:** Ray, Danny, Sarah.

*(Ray comes out of the bedroom into the kitchen. Danny is eating cereal at the table.)*

* **Danny:** *"Morning, Dad! Are you chasing bad guys again today?"*
* **Ray:** *(Ruffles his son's hair, smiles faintly)* *"That's the job, kiddo. Gotta keep the city safe for you. How's your school project going?"*
* **Danny:** *"I told my teacher my dad's a DEA agent. Everybody wants to see your badge! Will you take me for a ride in your patrol car someday?"*
* **Ray:** *"I promise. As soon as your mom gets better, I'll give you the full tour."*

*(A violent coughing fit comes from the living room. Ray rushes in. Sarah sits on the couch, coughing into a handkerchief.)*

* **Ray:** *(Kneels beside her, pours a glass of water)* *"Sarah! Did you take your meds? Breathe, take it easy..."*
* **Sarah:** *(Takes the glass, catching her breath)* *"I'm fine, Ray... I took them... My lungs just seized up again. Did you see the letter on the table?"*
* **Ray:** *(Picks up the envelope bearing the All Saints General Hospital logo from the kitchen table)*
* **Sarah:** *"Dr. Evans called again last night. If the mass doesn't start chemo right away, it'll spread. Insurance won't pay — they call it 'experimental.' They want $12,500 up front. If we don't pay by ten on Friday morning, they'll give our slot to someone else..."*
* **Ray:** *(Crumples the letter, trying to keep his voice steady)* *"Don't worry, Sarah. I'm a lawman of this state. As long as I stay true to my badge and my job, we'll find a way. I'll ask the office for an advance, put in for overtime. That money will be paid."*
* **Sarah:** *(Takes Ray's hand)* *"Last week's medicine ate half your paycheck, Ray... Please don't put yourself in danger."*
* **Ray:** *(Clips his badge to his belt, holsters his Glock-17)* *"Everything's gonna be fine. You rest — I'll drop Danny off at school."*

---

#### SCENE 2: Pershing Square — LSPD/DEA Joint Task Force office (08:45)
**Setting:** Chief Garcia's office and the bullpen.
**Characters:** Ray, Chief Garcia, Agent Miller. *(Cameo: Tenpenny)*

*(Ray walks into the office. Miller is leaning on a desk with a cup of coffee.)*

* **Agent Miller:** *"Morning, Ray. You look like hell again. How's Sarah?"*
* **Ray:** *"Same, Miller... The hospital bills are piling up on me. Is the chief in?"*
* **Agent Miller:** *"He's in, but watch yourself. The state cut the task force budget — he's been on the warpath since dawn."*

*(A burly officer with a C.R.A.S.H. badge walks down the hallway. Tenpenny shoots Ray a brief look and keeps walking.)*

* **Agent Miller:** *(Lowering his voice)* *"Tenpenny. C.R.A.S.H. Don't even get in an elevator with that guy."*

*(Ray knocks and enters Chief Garcia's office.)*

* **Chief Garcia:** *"Come in, Cross, sit down. The crack epidemic in this city is about to spiral out of control. The Ballas are poisoning Idlewood and Jefferson, and a cartel bringing it in through the port is feeding them. We need evidence off the streets and the dealers cleaned up."*
* **Ray:** *"Chief, I'm sorry to cut in, but I've got an emergency. My wife Sarah needs $12,500 for her lung cancer treatment, urgently. Can I request an emergency medical fund or a salary advance from the office?"*
* **Chief Garcia:** *(Sighs deeply, closes the file)* *"Look, Ray... You're the most honest man in this office. But the state cut the task force budget by 20%. Forget an advance — I can't even get weekly overtime approved. All I can do is apply the legal bonus procedure for every drug seizure and piece of evidence you bring in clean. $15–20 a package... That's all I've got."*
* **Ray:** *(Stays silent, nods helplessly)* *"Understood, Chief. I'm heading out on patrol."*

---

#### SCENE 3: Idlewood — Patrol and the first street stop (10:15)
**Setting:** Unmarked DEA Premier & behind the Idlewood gas station.
**Characters:** Ray, Miller, dealer in a black jacket.

*(Miller is driving, Ray lost in thought in the passenger seat.)*

* **Agent Miller:** *"I'm taking the wife to Las Venturas this weekend. Found a little casino hotel — thought we'd play some roulette. What are you up to?"*
* **Ray:** *(Takes the leather-bound notebook [`B`] out of his pocket and looks over the debt list)* *"Staying home, Miller... I'll be looking after Sarah."*

*(The radio crackles.)*
* **Dispatch:** *"All units: report of drug sales behind the Idlewood gas station. Suspect is a male, black jacket, purple bandana. Nearby units respond."*
* **Agent Miller:** *"1-DEA-CROSS copies, en route."*

*(The car stops behind the gas station. Ray gets out and approaches the dealer.)*

* **Ray:** *"DEA! Against the wall, hands where I can see them!"*
* **Suspect:** *"Whoa whoa! You got the wrong guy, man, I'm just waitin' here!"*

*(Ray presses `T`, the frisk animation starts. **Scripted moment:** the suspect shoves Ray and runs.)*

* **Suspect:** *"You'll never catch me, pig!"* `[OPEN: v1's racial slur was replaced, see Section 6]`
* **Ray:** *(Running after him)* *"Stop! Don't run!"*
* **Agent Miller:** *(Cuts him off through a shortcut)* *"End of the line, kid!"*

*(The suspect runs into a dead end, raises his hands and kneels.)*

* **Suspect:** *"Okay, okay! Don't shoot! I give up!"*
* **Ray:** *(Cuffs him)* *"You have the right to remain silent. Anything you say can and will be used against you."*
* **Evidence found:** 3 crack vials, $45 undeclared cash *(goes into the evidence bag)*.

*(The pager on Ray's belt beeps.)*
* **Pager:** `ALL SAINTS: SARAH CROSS NO PAYMENT. DEADLINE FRI 10:00`

> **Gameplay note:** Firing in this scene triggers the use of force rule — the suspect is unarmed. v1's *"Stop, or I'll shoot!"* line was changed because it misled the player.

---

#### SCENE 4: All Saints General Hospital (13:00)
**Setting:** The ATM at the hospital entrance, Dr. Evans's office. `[OPEN: interior solution]`
**Characters:** Ray, Dr. Evans.

*(Ray has turned in the suspect and the evidence and collected the $45 bonus. He puts his card into the ATM at the hospital entrance.)*

* **ATM screen:**
  ```text
  AVAILABLE BALANCE : $495.00
  CRITICAL DEBT     : -$12,500.00 (ALL SAINTS HOSP.)
  DUE               : FRI 10:00
  ```

*(Ray thumps the ATM with his fist and heads to Dr. Evans's office.)*

* **Dr. Evans:** *"Agent Cross, come in. Sarah's latest X-rays are back."*
* **Ray:** *"How is she, Doc?"*
* **Dr. Evans:** *(Holds the film up to the light)* *"I'll be straight with you, Ray. The tumor in the left lung keeps growing. If we don't start the protocol by Friday morning, organ failure sets in within a few months. Were you able to bring the $12,500?"*
* **Ray:** *"Give me a little more time, Doctor... Just a few days. I'll sign a note — take it out of my salary!"*
* **Dr. Evans:** *"I wish I could do something, Ray... But this protocol is the pharmaceutical company's program; slots are limited, and the moment the deposit isn't in, I have to take the next patient. Friday, ten a.m., is the last day."*

---

### CHAPTER 1 / MISSION 2: PUSHING THE LIMITS (JEFFERSON MOTEL RAID)

#### SCENE 1: Idlewood back alley — Informant Slick (14:30)
**Characters:** Ray, Slick.

*(Ray leaves the hospital. He knows a legal salary will never raise this money and goes looking for something bigger. He meets Slick and hands over $20 from the last of his cash. Balance -$20.)*

* **Ray:** *"Slick, I need a stash I can hit right now. Big or small, doesn't matter!"*
* **Slick:** *(Pockets the money, glances around)* *"Easy, Agent Cross... Jefferson Motel, room 104 — Ballas boys are bagging product. Two, three guys inside. Move fast and you'll catch 'em."*
* **Ray:** *(Makes a note in his notebook [`B`])* *"Just two or three dealers?"*
* **Slick:** *"Yeah, man. Regular street business."*

---

#### SCENE 2: Jefferson Motel — Raid on room 104 (15:15)
**Characters:** Ray, Miller, Suspect 1, Suspect 2.

*(Ray and Miller draw their weapons and take position at the door.)*

* **Ray:** *"On three, Miller. One... Two... Three!"*
* **Mechanic:** The door is kicked in (Breach & Clear).
* **Suspect 1:** *"Cops! Light 'em up!"* *(Opens fire)*
* **Agent Miller:** *"Take cover, Ray!"* *(Firefight; Suspect 1 is neutralized)*
* **Suspect 2:** *"Damn it!"* *(Jumps out of the back window and runs)*
* **Ray:** *"He went out the window! I got him, Miller — you secure the room!"*

*(Chase. The suspect raises his hands in a dead end and kneels. Ray cuffs him with `T` and puts him in the car.)*

*(Ray returns to the room. Under the bed he finds **$100 in undeclared cash** that never made it onto the evidence list.)*

* **Micro morality test:**
  * `[A] Pocket the money` → +$100, Corruption +2
  * `[B] Put it in the evidence bag` → Reporting bonus +$15

---

#### SCENE 3: The office — System failure (16:30)
**Characters:** Ray, Miller.

*(Ray turns in the evidence and the suspect. Raid bonus: $85. Balance: **$575** if [B] was chosen, **$660** if [A].)*

* **Pager:** `ALL SAINTS: 41 HOURS LEFT. $12,500 UNPAID`

*(Ray sits at his desk, head in his hands. He opens his notebook and writes.)*
* **Notebook entry:** *"16:30 — Two operations today. All I have is `{BALANCE}`. Raising $12,500 on the state's legal bonuses is impossible. Sarah is dying. I need to find a way..."*

---

#### SCENE 4: Operations room — Intelligence briefing (17:00)
**Characters:** Ray, Miller, radio operator, Chief Garcia.

*(The main radio crackles.)*

* **Radio operator:** *"Attention all units! Intelligence says the cartel's big shipment docks at Ocean Docks, Warehouse 4, tomorrow night. The containers are estimated to hold $500,000 in cash and narcotics. The joint operation starts tomorrow at 22:00."*
* **Agent Miller:** *(Jumps to his feet)* *"Ray! You hear that? That's the break we've been waiting for! Tomorrow night the port is ours!"*
* **Ray:** *(Settles the Glock in its holster, mutters to himself)* *"$500,000..."*
* **Agent Miller:** *"You say something, Ray?"*
* **Ray:** *"Let's be ready tomorrow night, Miller."*

---

### INTERLUDE: FREE PATROL DAY (Thursday 08:00–21:00)

**Goal:** Let the player test the legal path with his own hands — play the story's "the system isn't enough" claim instead of telling it.

* The player patrols Idlewood, Ganton, Jefferson and, if he wants, the rich districts.
* Random suspects: frisk odds 70% / 20% / 10% (Section 3.4).
* The rich district complaint risk and the use of force rule have real consequences for the first time.
* Expected earnings: $100–250.
* **18:00 pager:** `ALL SAINTS: 16 HOURS LEFT`
* **Optional phone call:** Danny calls: *"Dad, Mom couldn't get out of bed at all today..."*
* **21:00:** The game calls the player back to the office for the operation.

---

### CHAPTER 2 / MISSION 3: BREAKING POINT (OCEAN DOCKS)

#### SCENE 1: Arriving at Ocean Docks (Thursday 22:45)
**Setting:** Port entrance, heavy rain and lightning.

*(The car stops at the port gate. Wipers going hard, thunder rolling. Miller and Ray put on their vests.)*

* **Agent Miller:** *"Weather's a mess... but it's boiling in there, Ray. LSPD backup has the back gate. Word is there are at least 10–12 armed men inside."*
* **Ray:** *(Checks the Glock's magazine, eyes locked on a single point)* *"We're not waiting for backup, Miller. We're going in."*
* **Agent Miller:** *"Whoa, whoa, slow down, buddy! This is a drug raid, not a suicide mission!"*
* **Ray:** *(Looks at his pager: `11 HOURS LEFT`)* *"For me it is a suicide mission, Miller. Now or never."*

---

#### SCENE 2: The dark container — The bribe (23:20)
**Characters:** Ray, Cartel Lieutenant.

*(Gun drawn, Ray enters the dark steel container at the very back of the warehouse. The wounded Cartel Lieutenant stands in the corner. At his feet is a leather travel bag; behind him, pallets holding the rest of the shipment.)*

* **Ray:** *"Don't move! Hands up! It's over!"*
* **Cartel Lieutenant:** *(Laughs through the pain, spits blood)* *"Over? You really think it's over, Agent Cross?"*
* **Ray:** *"How do you know my name?"*
* **Cartel Lieutenant:** *"We know you, Agent Cross... Your wife Sarah, fighting lung cancer in that little house in Jefferson. Your ten-year-old boy, Danny..."*
* **Ray:** *(His gun hand trembles)* *"Shut your mouth! Don't you say my wife's name!"*
* **Cartel Lieutenant:** *(Unzips the bag; it's full of stacks of $100 bills)* *"How much did All Saints want? $12,500? There's $50,000 in this bag. Leave the $450,000 behind me for your partner and you're both heroes. Nobody's gonna count a missing fifty grand."*
* **Ray:** *"The call said five hundred thousand."*
* **Cartel Lieutenant:** *"Half the people who made that call are on our payroll, Agent Cross. Cuff me, and with the $150 honest-cop bonus they'll give you, you can buy your wife a coffin on Friday. Your call..."*

---

### BREAKING POINT: FATE SCREEN

> In-game text is ASCII upper case (SA's font); a Turkish version is planned as a localization.

```text
===================================================================================
                        BREAKING POINT: CHOOSE YOUR FATE
===================================================================================

 [Y] CORRUPT PATH (DIRTY MONEY AND LIFE)
 ----------------------------------------------------------------------------------
  - Take the $50,000 bag. Let the lieutenant slip away.
  - Pay Sarah's $12,500 chemotherapy down payment and save her life.
  - Lie to Miller and to the office.
  - OUTCOME: Corruption rises to at least 50. The missing $50,000 draws
    Internal Affairs' attention; Tenpenny becomes your "protector" and
    you become his pawn. Money laundering (VHS store) mechanics unlock.

 [N] CLEAN PATH - HARD MODE (HONOR AND REVENGE)
 ----------------------------------------------------------------------------------
  - Refuse the bribe. Cuff or shoot the lieutenant.
  - Turn in all $500,000 to the office (legal bonus: $150).
  - Friday 10:00 comes with no payment. [OPEN: Sarah's fate]
  - OUTCOME: You stay honest but die inside. Police backup is cut off.
    You become a cold, revenge-driven enforcer (Hard Mode).
===================================================================================
```

**What the decision does in the systems:**
* The lieutenant is wounded and unarmed; **shooting him on the N path triggers the use of force rule** (Corruption +5, Internal Affairs). Even the "clean" path contains a small grey choice.
* **On the Y path** the report says $450,000 while the call said $500,000. That gap is Chapter 3's opening conflict.
* **Reason "police backup is cut off" on the N path (proposal):** Thanks to his connections the lieutenant walks within 48 hours; Ray leaves his badge on the desk and goes after revenge outside the law. `[OPEN]`

---

## 6. OPEN DECISIONS

| # | Topic | Options | Recommendation |
|---|---|---|---|
| 1 | **Sarah's fate on the N path** | (a) She dies, as in v1 (b) There is an expensive alternative way to save her (loan shark, Miller's fundraiser...) | A theme decision for the author |
| 2 | **In-game Turkish characters** (for the Turkish localization) | (a) Turkish font patch (b) ASCII-only Turkish ("YOZLASMIS") | Test (a) in Phase 1, fall back to (b) |
| 3 | **Ray's ethnicity** and the Scene 3 insult | (a) Define it and tie the insult into the story (1992 LA, Rodney King era) (b) Leave it neutral, keep "pig" | Author |
| 4 | **Hospital interior** | (a) Exterior shot + phone call (b) Reuse another interior as the office (c) Model a custom interior | (a) first, then (b) |
| 5 | **Player character** | (a) Replace CJ's appearance with a Ray model (b) Ray as a separate character | Research in Phase 0 |
| 6 | **Conflict with CJ's missions** | With CLEO, the original story's mission markers stay on the map | Research in Phase 0; move to `main.scm` later if needed |
| 7 | **Name for the Cartel Lieutenant** | — | Optional |

---

## 7. CHANGELOG (v1 → v2)

| Area | v1 | v2 | Why |
|---|---|---|---|
| House | Commerce | Jefferson | Commerce is a business district; Jefferson is close to the motel, hospital and Idlewood |
| Motel | Garcia Motel | Jefferson Motel | Garcia is in San Fierro; it also clashed with Chief Garcia's name |
| Gang | Barksdale (The Wire) | Ballas | SA canon; Idlewood is already Ballas turf |
| Cartel | San Fierro Cartel | Cartel supplying the Loco Syndicate | Canon tie: Ballas–Loco Syndicate–Tenpenny crack chain |
| Bank | Fleeca (GTA V) | Unbranded bank ATM | Fleeca doesn't exist in SA |
| Suspect name | "BMYDRUG" | "black jacket, purple bandana" | BMYDRUG is a model file name, not in-game text |
| Budget | City (Miller) / State Senate DEA budget (Garcia) | The state cut the task force budget (both) | Contradiction; the DEA is federal, a state can't cut its budget |
| Insurance | Not mentioned | Federal insurance rejected the experimental protocol | Plot hole: "doesn't a DEA agent have insurance?" |
| Deadline | "3 days" / "Friday" / 48→36→24 h (within one day) | One deadline: **Friday 10:00**, pager times computed from real clock | 12 hours dropped in 6 |
| Ocean Docks | Same evening 22:45 | **Thursday** night; Free Patrol Day added in between | Timeline consistency + the player sees the legal path fail |
| Balance | $575 (math gave $555) | Raid bonus $85 + reporting bonus $15 = $575; $660 with [A]; notebook reads the variable | Arithmetic error; the choice was ignored |
| Salary | Weekly $1,200 "in installments" | Weekly net $950, paid Monday | "Installments" was unclear; salary not even covering mortgage + bills raises tension |
| Morality | Honor Points + Corruption mixed | Single `CORRUPTION` (0–100), Honor = 100 − Corruption | Two metrics were inconsistent |
| Fate Y outcome | "Your morality score is reset" | Corruption at least 50 | Gradual corruption plays better |
| Bribe | The whole $500,000 | $50,000 bag, $450,000 turned in | The cartel handing over the whole shipment wasn't believable; the missing money hooks Chapter 3 |
| Tenpenny | Only on the fate screen | Cameo in Chapter 1 + the lieutenant's "payroll" hint | Appeared without introduction |
| Fate screen | "Surgery bill" | "Chemotherapy down payment" | The treatment is chemotherapy |
| Notebook key | N | B | N is SA's "No" key and the fate screen also uses N |
| Interact / ATM key | E | T | E is SA's "next weapon" (on foot) and "look right" (in vehicle) |
| MDT key | TAB | M | TAB is SA's "answer phone" |
| Phone | Calls + SMS | Calls only; messages on the pager | No consumer SMS in 1992 |
| Dialogue | Unnatural lines / lines contradicting mechanics | Rewritten | — |
| Typos | "B Barksdale", "Aklana" | Fixed | — |
| Language | Turkish | English primary, Turkish localization | Global codebase |
