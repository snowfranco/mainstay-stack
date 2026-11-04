# Mainstay Stack

A cup-stacking web game for Mainstay Cafe. Every coffee order comes with a 6-character play code good for one play. Stack 20 cups in a run for a free pastry, top the weekly Stack Leaderboard for a free coffee, or land the week's drop on your 10th stack to unlock it free. One promo runs at a time.

This is a front-end prototype. The AR camera, logins, POS codes and barista scanning are simulated.

## Run it locally

Open `index.html` through any static server. Double-clicking the file also works for playing, but the share card needs `http://`:

```bash
python3 -m http.server 8765
```

Then open http://localhost:8765.

## Publish on GitHub Pages

1. Push this folder to a GitHub repository (keep `index.html` and `assets/` at the root).
2. In the repository, open Settings → Pages.
3. Under "Build and deployment", choose "Deploy from a branch", pick `main` and `/ (root)`, and save.
4. The game is live at `https://<user>.github.io/<repo>/` within a minute or two.

`.nojekyll` is included so Pages serves the files as they are.

## Demo script

1. Enter a name, then any 6-character code (or tap "Demo: use a sample code").
2. Play with the default promo. Tap or press Space to drop. The goal card on the right counts down to the free pastry; pass notes show who you are about to overtake.
3. Keep stacking past the roof: the sky opens up, then rain, snow, night and finally outer space.
4. On game over, tap "Share your stack" to make a GIF share card ("I just won a free pastry from Mainstay Cafe...") and pick a destination.
5. Back on the homepage, scroll to the red staff footer. "Demo: promos" switches the promo to the Matcha Latte or the cup plushie drop; it swings in as the 10th item.
6. "Open the admin demo" (or add `#admin` to the URL) shows the mock admin page. The red header marks it staff only.
7. "My rewards" lists codes ready to claim, claimed ones from past weeks, and points earned.

## What is simulated

- The cafe photo stands in for the live camera. Game objects are drawn over it.
- Any new play code is valid. Used codes are remembered in this browser.
- Rewards, the weekly board and the active drop live in localStorage. Finished runs are also written to a Supabase table when the key is set (see below), and the board merges the week's best cups per player from it.
- Sharing downloads the GIF and shows a confirmation. On phones that support file sharing, the system share sheet opens instead.
- The admin page is clickable only. Nothing it shows is saved or applied.
- Leaderboard faces are generated from each name, so there is nothing to upload.
- All sound is synthesised in the browser (drops, rain, birds, thunder, start, end and prize fanfares). It starts after the first tap.

## Database (Supabase, prototype level)

One table, `runs`, records every finished run (player, cups, score, streak, promo, codes, week). The admin page lists the latest runs, and the Stack Leaderboard merges the week's best cup count per player, so phones see each other.

1. In the Supabase project, open the SQL editor and run `supabase/schema.sql` once. It creates the table and lets the public key insert and read rows, nothing else.
2. Copy the project's publishable (anon) key from Settings → API keys into `SUPA.key` near the top of the script in `index.html`.
3. Publish. With the key empty, or when the file is opened from disk, the game stays fully local.

## Files

- `index.html`: the whole app (styles, markup and script, commented by section).
- `assets/`: cup, pastry, drop, logo and cafe images. `cafe light.png` is the game background; the front table top is the stacking surface.
- `assets/cut/`: the same sprites with their backgrounds removed. The game loads these first; if one is missing it falls back to the original and cuts it out in the browser.
