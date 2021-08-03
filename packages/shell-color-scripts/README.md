# Shell Color Scripts
Shell Color Scripts is a collection of color scripts. It was created by [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg).

![Screenshot of shell-color-scripts](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dotfiles12.png)

# Usage
```
colorscript --help
Description: A collection of terminal color scripts.

Usage: colorscript [OPTION] [SCRIPT NAME/INDEX]
  -h, --help, help    	Print this help.
  -l, --list, list    	List all color scripts.
  -r, --random, random	Run a random color script.
  -e, --exec, exec    	Run a spesific color script by SCRIPT NAME or INDEX.
```

# Bash Configuration
If you want to run a random script every time you open a terminal, then add the following lines to your `.bashrc`:

```
### RANDOM COLOR SCRIPT ###
colorscript random
```