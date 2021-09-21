# mdtabs
Copy `[$TITLE]($URL)` of tabs to clipboard with [TabFS](https://github.com/osnr/TabFS).

Note: This script was written for a personal use-case — it may not be the most wieldy. It uses `pbcopy` which works on mac os. Look into `clip` if on windows or `xclip`/`xsel` if on linux.

# Installation

Download, unzip, and place in same directory as `mnt/`, or place wherever and change `$PRE_DIR`.

# Usage

`./mdtabs.sh` copies the last focused tab to the clipboard and overwrites `tabs.md`.

## Flags

`-a`: target All tabs

`-d`: close (Delete) targeted tabs (must use with `-a` or `-x`)

`-x`: eXclude tabs that match a particular query (must use with `-a`)

`-m`: set a value to deliMit lines in `tabs.md`

## Examples

### Copy link to last focused tab

`./mdtabs.sh`

### Copy links to all tabs

`./mdtabs.sh -a`

### Copy all tabs and close them

`./mdtabs.sh -ad`

### Copy all tabs except for those with "twitter" in the title or url

`./mdtabs.sh -ax twitter`

### Copy and close all tabs except those matching "roam"

`./mdtabs.sh -adx roam`
