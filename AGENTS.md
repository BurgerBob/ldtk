# AGENTS.md

Fork of LDtk (upstream `deepnight/ldtk`).

## This repo is public

Never commit anything personal or tied to a specific game project that uses this fork:
no names, no local paths, no project names, no server addresses.
Machine-specific settings go in git-ignored files (e.g. `export-release.local.bat`).

## After every source change

Always do all four steps, without asking:

1. Commit the change in this repo (`git commit`).
2. Push it (`git push origin master`).
3. Export the standalone build with `export-release.bat`. The target dir comes from
   `export-release.local.bat` (git-ignored). The script ends with `pause`: run it with
   stdin redirected (e.g. `cmd /c "<repo>\export-release.bat < nul"`).
4. The target dir is inside an SVN working copy: commit the exported build there.
   `svn add --force` the target dir (new files), `svn rm` the files `svn status` shows
   as missing (`!`), then `svn commit` that dir only.

Changes that do not touch the build (docs, agent notes) only need steps 1 and 2.

## Build

- Release: `haxe main.hxml` and `haxe renderer.hxml` (done by `export-release.bat`).
- Debug: `build-and-run.bat`.
