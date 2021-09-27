# mdtabs for TabFS

Copy `[$TITLE]($URL)` of tabs to clipboard with [TabFS](https://github.com/osnr/TabFS) (thanks Omar !!).

Note: This script was written for a personal use-case — it may not be the most wieldy. It uses `pbcopy` which works on mac os. Look into `clip` if on windows or `xclip`/`xsel` if on linux. Also — here's a gist of an earlier script I was using that just copies every open tab except roam, with no available options: [capturetabs.sh](https://gist.github.com/sulsanaul/97006e76c5b7f495765205f4d88d0915). It has the benefit of being shorter and more readable.

# Installation

Clone (or download/unzip) into same directory as `mnt/`, or place wherever and change `$PRE_DIR`.

`chmod 755 mdtabs.sh`

# Usage

`./mdtabs.sh` copies the last focused tab to the clipboard and overwrites `tabs.md`.

## Options

`-a`: target All tabs

`-d`: close (Delete) targeted tabs (must use with `-a` or `-x`)

`-x`: eXclude tabs that match a particular query (must use with `-a`)

`-m`: set a value to deliMit lines in `tabs.md`

## Examples

### Copy link to last focused tab

`./mdtabs.sh`

#### Output (copied to clipboard)

`cat tabs.md`

`[sulsanaul/mdtabs](https://github.com/sulsanaul/mdtabs)`

### Copy links to all tabs

`./mdtabs.sh -a`

### Copy all tabs and close them

`./mdtabs.sh -ad`

### Copy all tabs except for those with "twitter" in the title or url

`./mdtabs.sh -ax twitter`

### Copy and close all tabs except those matching "roam"

`./mdtabs.sh -adx roam`

### Copy all with a custom delimiter

`./mdtabs.sh -am "* "`

#### Output

`cat tabs.md`
```
* [sulsanaul/mdtabs](https://github.com/sulsanaul/mdtabs)
* [Home / Twitter](https://twitter.com/home)
```
