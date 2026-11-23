# AGENTS.md

Fork of LDtk (`BurgerBob/ldtk`, upstream `deepnight/ldtk`) used as the level editor of Rogue Princess.

## After every change (asked by Cyrille, 2026-11-23)

Always do all four steps, without asking:

1. Commit the change in this repo (`git commit`).
2. Push it (`git push origin master`).
3. Export the standalone build with `export-release.bat`. The target dir comes from
   `export-release.local.bat` (git-ignored), currently
   `D:\_rogue_princess\Common\ExternalTools\ldtk`, inside the Rogue Princess SVN working copy.
   The script ends with `pause`: run it with stdin redirected (e.g. `cmd //c "export-release.bat < nul"`).
4. Commit the exported build in SVN: `svn add --force` on the target dir (new files),
   `svn rm` the files `svn status` shows as missing (`!`), then `svn commit` that dir only.

## Build

- Release: `haxe main.hxml` and `haxe renderer.hxml` (done by `export-release.bat`).
- Debug: `build-and-run.bat`.
