# herdr-colors

Terminal workspace manager for AI coding agents, with a sidebar you can actually
scan. Based on herdr v0.9.3, this edition adds workspace color coding:

- **Right-click a workspace → Color...**: 12 vivid swatches. The picker opens on
  the color the workspace shows now and previews your choice live in the sidebar.
  Arrows or j/k then Enter, 1-9 for the first nine swatches, 0 for auto, Esc
  cancels. Picks persist across restarts.
- **Auto color by project**: workspaces with no manual pick get a deterministic
  color from their directory, and open workspaces never share one until all nine
  auto colors are in use. Red and teal are never auto colors.
- **Color rules**: pin colors by path in `config.toml`. A manual pick wins, then
  the first matching rule, then auto. `herdr server reload-config` applies edits.

  ```toml
  [[ui.colors.rules]]
  path = "~/upcomers-*"    # ~ expands; * and ? stay in one folder, ** crosses folders
  color = "mauve"
  ```
- **Red name = needs you**: an agent blocked on input (permission prompt,
  question) turns the workspace name bright red until you answer.
- **Pulse + reminder when it waits too long**: after 3 minutes blocked the name
  pulses and herdr sends one "still waiting for you" notification (following
  `[ui.toast] delivery`). Tune with `[ui.colors] blocked_alert_secs = 180`, 0
  turns it off.
- **Teal name = finished, unread**: clears itself when you open the workspace.
- The agents list uses each workspace's color, and colors also apply in the
  collapsed (narrow) sidebar.
- Scriptable: the socket method `workspace.set_color` takes a `workspace_id` and a
  swatch key (or null for auto), so plugins can color workspaces too.

## Install (macOS / Linux)

```sh
curl -fsSL https://raw.githubusercontent.com/hodkovickybuh/herdr-colors/main/install.sh | sh
```

Or grab a binary + `.sha256` from
[Releases](https://github.com/hodkovickybuh/herdr-colors/releases/latest) and put it
on your PATH yourself.

Notes:

- If you have the Homebrew herdr installed, `brew uninstall herdr` first (or the tap
  binary may shadow this one depending on PATH).
- **Do not run `herdr update`**: it pulls upstream and replaces this build. Updates
  ship through this repo's releases.
- Sessions, workspaces, and colors survive restarts; colors live in herdr's normal
  session snapshot.

## Usage

Same as herdr: run `herdr`. Full docs at [herdr.dev](https://herdr.dev).

## License

AGPL-3.0-or-later (same as upstream), see [LICENSE](LICENSE). Built on
[herdr](https://github.com/herdrdev/herdr) v0.9.3; the changes above are this
repo's commits on top of it.
