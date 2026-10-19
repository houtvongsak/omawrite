# Updating the full-width fork

The `personal` branch follows official Omawrite with full-width mode as its only
custom app feature. Zoom and the shortcut dialog follow upstream unchanged,
except for the full-width shortcut listed in the dialog.

`origin` is `houtvongsak/omawrite`; `upstream` is `omacom/omawrite`.
The fork's default branch is `personal`. Local `master` tracks clean upstream
code. The original fork history is retained on the remote `master` and
`backup/current-fork` branches.

From a clean working tree, update, test, and build:

```sh
git switch personal
./bin/update-personal
```

The script fetches upstream, advances local `master`, merges it into `personal`,
and runs the tests and build. If a merge conflicts, resolve the files, commit,
and run `./bin/test` and `./bin/build` before publishing.

Publish the verified update:

```sh
git push origin personal
```

Run the local app with `./build/omawrite`. Use `./bin/install` to install it.
