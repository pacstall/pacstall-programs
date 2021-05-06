

## Pacstall technical stuff

### Script locations
In Pacstall, the main (long and complicated) scripts are too long to put in `/bin/pacstall` so I put them in `/usr/share/pacstall/scripts/` and they are sourced from pacstall. You can’t just source a script and it runs, because some variables are passed through from pacstall. The smaller flags are in `/bin/pacstall`

### Where what goes where
`/tmp/pacstall/pkg` is the temporary building space for packages. Pacstall downloads them into their own directory and builds. One advantage of tmp is that it runs off ram so there is less overhead than running from an ssd or hard drive. This directory will be removed after install (or fail) to 1) reduce RAM, and 2) clear space
`/usr/src/pacstall/pkg` is where the files for built packages live. They are symlinked to the system from here. If you run `sudo stow -D pkg` from `/usr/src/pacstall`, it will unlink from stow. Then you could run `sudo rm -rf pkg` to completely remove this although pacstall does this with the `-R` flag.
`/var/log/pacstall_installed/pkg` is a text file containing metadata for the package. It contains the date installed, description, version, and if applicable, a removescript reference

### API’s (I guess)
Pacstall uses functions throughout the scripts to bring uniformity to the code and user output. The most common is `fancy_message`. It looks like this
```bash
[+] INFO: message
[*] WARNING: message
[!] ERROR: message
```
You can call it by running the contents of /usr/share/pacstall/scripts/install-local.sh. Then you can run `fancy_message {info,warn,error} message` to display visually appealing output. Info displays important things like package installed successfully or stuff like that. Warn is when something is not quite right, but will still work. Error should only be used before the script fails.

The next function is `ask`. Running this should give a basic prompt asking for input:
```bash
if ask “Are you sure you want to continue?” Y; then
	fancy_message info “You have continued”
else
	fancy_message error “You have not continued”
	exit 1
fi
```
It is a simple if then else function. Note the Y in the first line, that is the default answer that if no output is given, will be defaulted to. If you don’t specify a Y or N, `ask` will repeat asking until they give valid input.
