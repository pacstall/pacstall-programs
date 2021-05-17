## Creating a pacscript
This is a pacscript:
```bash
name="foo"
version="1.0"
url="https://github.com/Henryws/foo/archive/refs/tags/1.0.zip"
build_depends="vim gcc"
depends="neofetch plasma"
breaks="libfoo-git"
replace="alacritty"
description=“foo is the ultimate program capable of foo and bar!”
hash=“2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae”
removescript="yes"
optdepends=("bar: not foo"
"alacritty: a blazing fast terminal")
ppa=("graphics-drivers/ppa"
"webupd8team/y-ppa-manager")
maintainer="Mr. Person <mr.person.protonmail.com>"
prepare() {
          ./autogen.sh
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall
}

postinst(){
          echo "Do post install stuff here"
}

removescript(){
          rm somedir
}
```

I will be using the word `pkgname` as the name of your package.

the first variable is `name`. It is what pacstall records and is the most important. The contents of `name`, (`pkgname`) will be in `/usr/src/pacstall/pkgname` (where pacstall puts files to symlink to the system) and `/var/log/pacstall_installed/pkgname` (a file which holds metadata like version number, date installed, description, etc). Keep it lowercase

The next is `version`. It is the version number (obviously). It should (but not required) be using [semver](https://semver.org). As long as the version number can be incremented, it works. When you change this version to a higher number, it will trigger an upgrade when you run `sudo pacstall -Up`.

`url` is the url of the package. It can end in `.tar.xz`, `.zip`, or `.git`. git is not recommended unless the maintainer does not have a releases page or tags (see st-lukesmith). When using github, use releases or tags (but try in that order).

`build_depends` is the packages needed to compile the package. They are Ubuntu apt package names.

`depends` are packages that are required to run, but not to compile. If a github page just says ‘here are the dependencies’, try to sort them first, but if not, put them in `depends`.

`description` is a description of the package. Try to keep the description as close to the original as possible (e.g neofetch’s is `A command-line system information tool written in bash 3.2+`.)

`breaks` are where you put the packages that will break if you install this package. An example would be foo and foo-git. They both install to the same files, but different sources. It is not needed unless you are making a `-git` package or `-bin`.

`replace` are name of the apt package that this package replaces, the user will be asked to continue before the apt package is removed.

`hash` is the output of running `sha256sum 1.0.zip` (from the example above). You just need the number and not the number + file name.

`removescript` is a variable that is used when you want to signify that something should be done after a package is uninstalled. It should be `yes` or not in the script at all

`optdepends` is where you put optional dependencies. Pacstall will ask the user if they want to install them after the package finishes installing.

`ppa` is an array that you can use to install ppa's. It is highly discouraged to use ppa's as they are fundamentaly broken. You do not need to include `ppa:` in the array as pacstall does that for you and it's easier for the end user.

`maintainer` is where you put yourself in the format shown above: `name <email.email.com>`. This makes it easy for people to contact maintainers about issues

The `prepare` function is what you run to prepare a package. You don’t need to cd into the package source directory because pacstall will do that already.

The `build` function is what compiles the package. Use multicore as much as possible. To get the number of cores in a system, run `nproc`. You can use that in combination with `-j$(nproc)` to compile on multicore (`make -j$(nproc)`).

The install function installs the package. The most important thing is to install to `/usr/src/pacstall/pkgname`. An example with make would be `sudo make install DESTDIR=/usr/src/pacstall/pkgname`.

`postinst` is what commands should be run after pkg is installed. If you don't need it, leave it out

`removescript` is what commands should be run after pkg is uninstalled. The contents will be remotely sourced when you trigger a `-R pkg` flag. This is NOT a script uninstalls the package, just what should be run. [Here's an example](https://github.com/Henryws/pacstall-programs/blob/master/packages/tuner/tuner.pacscript) of how that would be done

You need to save it as `pkgname.pacscript`. To add a package to `pacstall-programs`, fork it and create a directory in packages called `pkgname` and add the `pkgname.pacscript` inside it. Then send me a pull request.

### Remember to wrap everything in double quotes

You can test it by cd'ing into the directory holding `pkgname.pacscript` and running `sudo pacstall -Il pkgname`. If it works, good! If not, pacstall should tell you what went wrong


### Other
If you need (for some reason) to download files that aren't part of the package (if it didn't ship a `.desktop`, for example), use [GitHub Gists](https://gist.github.com). When you download it in your pacscript, use `wget -q <gist>` so there is no output. If you need to upload an image (for whatever reason), use [postimg.cc](https://postimg.cc).
Lastly, do not ask the user for any input unless absolutely necessary. Use external variables to detect what you need to know before asking the user.

### Opening a PR
When you complete your script, fork this repo and add your script to packages/`pkgname`/`pkgname`.pacscript. Open a PR here and make the title: "Add pkgname" with the label `Package Add`. Please do one PR per package as the auto checker to make sure pacstall can install it works.

### Updating your package
When you want to update your package, make sure you are on the latest commit (fetch upstream) and change the `version`, `url`, and `hash` (if used). Then make a PR and use the label `update pkg`
