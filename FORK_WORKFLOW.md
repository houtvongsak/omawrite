# Maintaining this fork

`origin` is your GitHub fork (`houtvongsak/omawrite`). `upstream` is the official
repository (`omacom/omawrite`). Changes made during this setup are local; the
remote fork's master branch has not been rewritten.

| Branch | Purpose |
| --- | --- |
| `master` | Clean upstream code, tracking `upstream/master` |
| `personal` | The combined version to build and use |
| `feature/zoom-range` | Upstream zoom extended to 50–300%, retaining persistence |
| `feature/full-width` | Full-width toggle remembered across launches |
| `feature/shortcuts-dialog` | Responsive, themed shortcut reference and help aliases |
| `feature/build-docs` | Build, test, and Arch installation instructions |
| `backup/current-fork` | Original fork at `722fd69`, before the update |

## Update and verify

From a clean working tree:

```sh
git switch personal
./bin/update-personal
```

The script fetches upstream, advances `master` with a fast-forward merge, merges
it into `personal`, then runs the test suite and builds the app. It does not
install, push, or open a PR. It stops if the working tree is dirty or a merge
needs attention. Git's local `rerere` setting remembers conflict resolutions.

If a merge conflicts, inspect the changes, resolve the files, and finish it:

```sh
git status
# Edit the conflicted files, then git add each resolved file.
git commit
./bin/test
./bin/build
```

Run the personal build with `./build/omawrite`. The installed system executable
is separate; use `./bin/install` when you decide to install the personal build.
The version remains upstream's 0.7.0; the Git branch and commit identify the
personal additions.

## Keep PRs independent

Start each new feature from current upstream code:

```sh
git fetch upstream
git switch -c feature/my-change upstream/master
# Make and verify one focused change, then commit it.
git switch personal
git merge --no-ff feature/my-change
```

Before proposing an existing feature, update and test its branch independently:

```sh
git switch feature/full-width
git merge --no-edit upstream/master
./bin/test
./bin/build
git diff upstream/master...HEAD
```

Merge any further feature fixes back into `personal`. Do not submit `personal`
as a PR: it includes all our preferences and integration changes. Full width
and the shortcut reference each update the help text, so their combination has
a small integration change on `personal`.

When ready to publish, push only the intended feature branch to `origin` and
open its PR against `omacom/omawrite:master`. Publishing `personal` separately
with `git push -u origin personal` provides a remote backup without rewriting
the old remote master branch. Keep the personal branch's published history;
regular merges avoid force pushes.

Build documentation is the smallest PR candidate. The wider zoom range is a
personal preference, and upstream acceptance of full width or a dialog redesign
should be considered separately.
