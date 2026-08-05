# herdr-colors

Terminal workspace manager for AI coding agents, with a sidebar you can actually
scan. Based on herdr v0.7.5, this edition adds workspace color coding:

- **Right-click a workspace → Color...** — 12 vivid swatches, mouse or keyboard
  (arrows + Enter), persisted across restarts.
- **Auto color by project** — workspaces with no manual pick get a deterministic
  color from their directory. Same project, same color, zero setup.
- **Red name = needs you** — an agent blocked on input (permission prompt,
  question) turns the workspace name bright red until you answer.
- **Teal name = finished, unread** — clears itself when you open the workspace.
- Colors also apply in the collapsed (narrow) sidebar.

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
- **Do not run `herdr update`** — it pulls upstream and replaces this build. Updates
  ship through this repo's releases.
- Sessions, workspaces, and colors survive restarts; colors live in herdr's normal
  session snapshot.

## Usage

Same as herdr: run `herdr`. Full docs at [herdr.dev](https://herdr.dev).

## License

AGPL-3.0-or-later (same as upstream), see [LICENSE](LICENSE). Built on
[herdr](https://github.com/herdrdev/herdr) v0.7.5; the changes above are this
repo's commits on top of it.
