# Mainstay Cafe: Mainstay Stack

*Updated 3 Nov 2026 to reflect the working prototype. Sections marked "Prototype update" record what changed and why. The original concept text is kept below it.*

- **Problem.** A café depends on regulars, and customers have little reason to choose Mainstay over the café next door on an ordinary day.
- **Solution.** Mainstay Stack, a short phone game unlocked by every coffee order, with rewards claimed in the café.
- **How it works:**
    - Every order comes with a 6-character code good for one play.
    - Stacking 20 cups in one run earns a free pastry.
    - The tallest stack of the week wins a free coffee.
- **New Drops.** Mainstay uses the game to launch new products, limited-time offers and merch. While a drop is running, it swings in as the 10th item in the stack. Landing it unlocks that item free: for example, a free Matcha Latte during its launch, or a free Mainstay cup plush keychain during a merch release. It only appears once per play, and the player keeps stacking for a high score after that. **One promo runs at a time:** the free pastry is the default, and a live drop replaces it for the length of the drop.
- **Why drops matter for the business:**
    - *A built-in launch channel.* Every player sees the new item, with no ad spend.
    - *Trial.* A free first taste turns curious customers into buyers of the new item.
    - *Demand signal.* Redeemed codes show how much interest a launch gets.
    - *Urgency.* Drops run for a limited time, so customers come back while one is on.
- **Why stacking cups.** It's simple to learn in seconds and fits the 3 to 5 minute wait for an order, and every item on screen is a Mainstay product, so every play promotes the brand.
- **Design principles:**
    - *Gratification.* Confetti, a flash, a fanfare and a five-second banner for unlocking rewards; confetti and a pass note for overtaking someone.
    - *Motivation.* A goal card is always on screen: "6 to a free pastry", then "3 to pass Mei". Pass notes warn you when you are close: "2 cups from passing Tin".
    - *Variation.* Pastries, special cups, drops, birds and balloons, rain, snow, and a sky that climbs from daylight to night to outer space.
    - *Progressive difficulty.* Calm at the start, harder the higher you go.
    - *Fun, not formal.* Bright UI colours and a friendly sans-serif. The brand navy, espresso and brass are kept for the logo and the products so they stand out in play.
- **SCAMPER.** The game **adapts** Tower Block, **substitutes** Mainstay products for generic blocks, and **combines** play with in-store rewards and product launches.
- **Cost.** About $21 a month for the weekly coffee at $4.85. Pastry and drop rewards are only earned through a paid order, and the 10th-item placement makes the drop reachable for most players, which is the point of a trial.

**When customers play**

- While they wait for their order. A run takes 1 to 3 minutes.
- At the table with friends, competing for the weekly top stack.

---

## Prototype update: decisions made while building

The prototype is a single-page web game (`index.html` plus `assets/`) published from the `main` branch of github.com/snowabraxas/mainstay-stack. It runs on phones and desktop, needs no install, and simulates the AR camera, the POS codes and the barista scan.

### Brand and look

1. **Brand colours are for the logo and the products, not the UI.** Navy, espresso and brass made the screens feel formal. The UI now uses a brighter palette: sapphire for primary actions, canary yellow for secondary actions and the in-game goal card, sky blue and cream for surfaces. Red appears in exactly one place, to flag staff-only tools.
2. **Typography.** Plus Jakarta Sans everywhere (no serif, no rounded letterforms). The only serif on screen is inside the official logo artwork.
3. **Logo.** The official Mainstay Cafe lockup (badge, wordmark, tagline) is used as supplied, with its background removed, on the welcome, code, game-over and share cards.
4. **Background.** The game plays on the "cafe light" photo. The front table top is the stacking surface. The wall logo in the photo is kept clear on the homepage by limiting the preview stack height on phones.
5. **Welcome and code screens.** A line-up of cups and pastries drops in along the bottom edge to set the tone before play. The code screen greets by name: "Hey, Snow!"

### Game experience

6. **Camera and sky.** As the tower grows, the view climbs off the table, past the roofline and into open sky. The roof dissolves into the sky with a gradient. The sky darkens with altitude: daylight, golden hour, night with stars, then outer space at around 45 cups. Rain (cups 14 to 26, with lightning) and snow (30 to 48) still arrive by cup count.
7. **HUD priorities.** The cup count is the big number top-left; points sit under it. Spills and wind are top-right. The goal card is small, translucent and mid-screen on the right so it never covers the swinging item.
8. **Pass notes.** "2 cups from passing Diego" appears when you are within three cups of someone, with their face; "You passed Diego! You're #7 on the board" follows. Mock regulars include Ana the stack master, Mochi's mom, Tin, Latte Larry and Diego F.
9. **Height markers** every 10 cups (Morning rush, Lunch crowd, Afternoon pick-me-up, Closing time) show as soon as that level scrolls into view, before you reach it. The 20-cup flag reads "Free pastry here!" when the pastry promo is on.
10. **Unlock moments last longer.** The "Free pastry unlocked!" and drop banners stay about five seconds, with a circular product pop, confetti, a flash and a fanfare. The next item waits a beat so the moment lands.
11. **Pastries are almost cup-sized** so they have impact. Drop items (matcha, plushie) are cut out and shown on a canary card with a DROP tag.
12. **Sound.** All sound is synthesised in the browser: drop and perfect chimes, spill, start and end jingles, bird chirps, a rain bed that fades in and out, thunder, gusts, and a prize celebration. Sound starts after the first tap, as browsers require.
13. **One promo at a time (bug fix).** Earlier the free pastry stayed active during a matcha or plushie drop, so a player could earn both. Now a live drop replaces the pastry goal for the run.
14. **Copy** is short and upbeat, and the homepage steps and the drop card no longer repeat each other. Steps: "Tap to drop. Stack them high." / "Land the Matcha Latte on your 10th stack to win it for free." / "Top the Monday leaderboard to claim a free coffee." Drop card: "New Drop Alert: Matcha Latte 🎉 Fresh on the menu. Get it for free when you land the 10th stack!" and "Limited edition Mainstay cup plush keychain 🎉 Stack your way to the 10th tier and win it on the house." "Timber! The tower tipped." "So close! Next order, next chance."

### Leaderboard and rewards

15. **Stack Leaderboard** ranks by cups stacked, not points, since cups are what players watch during a run. Points stay as a secondary stat. The board shows the week's dates, resets every Monday, and shows the top three on a podium with a crown, and ranks 4 to 10 as a list. Staff are tagged.
16. **Faces on the board.** Every player gets a consistent cartoon face generated from their name, so the board feels like a community with nothing to upload and no moderation burden.
17. **My rewards** shows points earned, codes ready to claim (with QR), and claimed rewards from past weeks, each with the cups and points it was earned with.

### Growth

18. **Share your stack.** On game over, the player can make a short animated GIF of their run: the logo, "I just won a free pastry! from Mainstay Cafe" (or "I just stacked 23 cups!"), the stack dropping in, achievement pills, confetti, and a "Join the challenge → Download Mainstay Stack" button with @mainstaycafe. Story (9:16) and Feed (1:1) formats. Tapping Share asks where: Instagram Story or Feed, TikTok, Facebook Story or Feed. On phones with file sharing, the system share sheet opens; elsewhere the GIF is saved and a confirmation shows.

### Staff and admin

19. **Admin page (mock).** Reached from the red "Staff only · demo tools" footer on the homepage or by adding `#admin` to the URL. A red header marks it staff only. It shows this week's numbers, the promo list (Free pastry as default, Matcha Latte, cup plush keychain, a draft), a new-drop form, difficulty sliders, reward settings, the promo window ("Runs for 6 weeks"), and leaderboard and code tools. Everything is clickable; nothing is saved or applied.
20. **Demo tools** (promo switcher, admin link) live in that red footer so they read as staff-only and never look like part of the customer game.

### Technical

21. **Static, single file, no dependencies** beyond Google Fonts and the QR library allowed in the brief. The GIF encoder is written in-page.
22. **Sprites are pre-cut** to transparent PNGs in `assets/cut/`, so the game renders correctly even when the file is opened from disk. Originals are kept, and the in-browser cut-out remains as a fallback.
23. **Everything persists in the browser's localStorage** (name, used codes, board, rewards, points, active promo), so the game works with no connection.
26. **A simple database records runs (Supabase, prototype level).** Each finished run is written to one table (`runs`: player, cups, score, streak, players passed, promo, reward codes, week). The weekly board merges the best cup count per player from that table, so two phones now see each other on the Stack Leaderboard, and the admin page lists the latest runs live. The browser writes with the public key under row-level security (insert and read only). Schema in `supabase/schema.sql`.
27. **Panels on phones.** The My rewards, promos and share sheets keep their title row and close button fixed while the list scrolls, after the close button was found hidden under the mobile browser bar on long lists.
24. **Published via GitHub Pages** from the `main` branch root (`.nojekyll` included). Pages must be switched on once in the repository settings.
25. **A demo recording** (`mainstay-stack-demo-snow.mp4`) shows a full run as Snow: sign-in, the climb, the pastry unlock at 20 cups, and the game-over card with the code.

---

## Demo script (updated)

1. **The poster (AR).** "A customer sees the Mainstay Stack poster and scans it." Show the Web-AR.Studio scene. "In the full version, Play launches the game in AR. Today, the prototype simulates it as a web game."
2. **Sign in.** Enter a name. Point out the official logo and the treats dropping in along the bottom. "Hey, Snow!"
3. **The receipt.** "With every coffee, the cup or receipt has a QR code for one play." Tap "Demo: use a sample code". Try the same code twice to show "This code has been used."
4. **Homepage.** The promo banner, the Stack Leaderboard with faces and the podium, and My rewards with claimed history and points earned.
5. **Play.** Stack cups. Point out a perfect drop, the goal card counting down, a pass note ("2 cups from passing Tin"), the 10-cup marker arriving early, the roof dissolving into sky, and the rain at 14.
6. **Reach 20 cups.** The flash, the croissant pop, the fanfare and "Free pastry unlocked!" The run keeps going.
7. **Game over.** Cups first, then points, the code with QR, and your place on the board.
8. **Share.** Tap "Share your stack", switch between Story and Feed, and pick Instagram Story. Read the caption: "I just won a free pastry from Mainstay Cafe. Join the challenge."
9. **Drops.** In the red staff footer, open "Demo: promos" and pick Matcha Latte. Show the homepage banner change ("New drop alert"), play to the 10th item, land the matcha crate, and show "Free Matcha Latte unlocked!" Note that the free pastry is off while the drop runs.
10. **Admin.** Open the admin demo. Walk through promos, difficulty, rewards and the promo window. "Clickable only; nothing is applied."

**Why customers engage**

- It's quick fun with no app to download.
- Every order is a fresh chance at a free pastry.
- There's always someone to pass on the weekly board, and a face to go with the name.

### Customer value

1. **A better wait.** Waiting time turns into a short, fun game.
2. **A real, simple reward.** A good run earns a free pastry. The tallest stack of the week earns a free coffee.
3. **Connection and recognition.** Customers compete with friends, other regulars and the baristas, and see their names and faces on the board, which puts the tagline into practice: "Come for the coffee, stay for the company."
4. **First access.** Customers try new items free and get first access to limited merch through drops.
5. **Something to show off.** A share card for Instagram, TikTok and Facebook turns a good run into word of mouth.

### Business alignment

- **Built into every order.** The POS prints a play QR code on each receipt or cup label, so every play and every reward comes from a sale.
- **Quick for staff.** Baristas scan the pastry code at the till and hand over the pastry in seconds.
- **A weekly routine.** Every Monday morning the manager checks the board, gives the winner a free-coffee code, and the board resets.
- **Drives repeat visits.** Each new order is a new chance to play and win, which encourages customers to come back.
- **Product launches.** For each new item or merch release, marketing turns on a drop in the game. Baristas redeem drop codes like pastry codes, and the number of redemptions shows how the launch is going.
- **Free reach.** Every share card carries the logo, the handle and a call to join, paid for by a pastry.
- **Fits your strategy.** It suits all three segments: students compete on the weekly board, business people play while they wait, and local residents become regulars chasing a top score. It also strengthens the café's "third place" feel.

---

## Out of scope (not built in the prototype)

**Simulated in the prototype, to be built for launch**

1. Unique single-use play codes generated by the POS and printed on receipts or cup labels. The prototype accepts any 6-character code and remembers used ones only in the player's browser.
2. Barista scanning that validates a reward code and marks it redeemed. Codes and QRs are generated, but nothing checks them at the till.
3. A production leaderboard service. Runs are recorded in a Supabase table and merged into the board, but there is no deduplication of names, no moderation, no rate limiting, and the mock regulars are still seeded on every phone.
4. The weekly reset and winner selection on a server, and issuing the free-coffee code automatically. The prototype resets by the device's clock.
5. Accounts, logins and loyalty-programme sync. Players just type a name.
6. A working admin backend. The admin page is clickable only; no setting is saved, applied or audited.
7. Real AR: camera feed, surface detection and tracking. The cafe photo stands in for the camera, with a scan animation, handheld drift and film grain.
8. Direct posting to Instagram, TikTok and Facebook. The prototype uses the phone's share sheet or saves the GIF; destination buttons are a simulated picker.
9. Real player photos on the leaderboard. Faces are generated from names; an upload flow and moderation would be needed for real ones.
10. Sound assets and music. All audio is synthesised in the browser.

**Not started**

11. Anti-cheat and score validation (the game runs entirely on the client and any browser can write to the runs table).
12. Analytics and reporting: plays, redemptions, launch performance, retention.
13. Push or SMS notifications ("You've been passed", "New drop this week").
14. Multiple café locations, per-store boards and promos.
15. Accessibility beyond reduced-motion support (screen-reader pass, colour-contrast audit, larger-text mode).
16. Localisation and other languages.
17. Installable app or offline play (PWA).
18. Green bonus for reusable cups and double-points hours.
19. Difficulty presets and admin settings actually changing gameplay.
20. Video (MP4) share format and a downloadable app, which the share card's "Download Mainstay Stack" button points at.
