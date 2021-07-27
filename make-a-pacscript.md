## Creating a pacscript
### This is an example of pacscript:
```bash
name="foo"
version="1.0"
url="https://github.com/Henryws/foo/archive/refs/tags/1.0.zip"
build_depends="vim gcc"
depends="neofetch plasma"
breaks="libfoo-git"
replace="alacritty"
description="foo is the ultimate program capable of foo and bar!"
hash="2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae"
removescript="yes"
optdepends=("bar: not foo"
"alacritty: a blazing fast terminal")
ppa=("graphics-drivers/ppa"
"webupd8team/y-ppa-manager")
maintainer="Mr. Person <mr.person.protonmail.com>"
pacdeps=("dmenu" "tuner")
patch=("https://dwm.suckless.org/patches/anybar/dwm-anybar-20200810-bb2e722.diff")

pkgver() {
          # Retrieve the new package version here.
          # Should be used for -git packages and
          # packages that supply the hash of the
          # newer version.
}

prepare() {
          ./autogen.sh
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          # It is recommended for paths to be condensed with
          # variables and to be wrapped by double quotes
          sudo make install DESTDIR="$STOWDIR/$name"
          
          # If the package comes already compiled, use 'install'
          sudo install -Dm755 $name -t  "$STOWDIR/$name/usr/bin"
}

postinst(){
          echo "Do post-install stuff here"
}

removescript(){
          # remove directories that are not removed during removal
          rm -rf somedir
}
```
### Built-in variables:
```
LOGDIR="/var/log/pacstall/metadata" # Package log file directory
SRCDIR="/tmp/pacstall" # Package installation temporary directory, automatically cleared at the end of install
STGDIR="/usr/share/pacstall" # Pacstall scripts directory
STOWDIR="/usr/src/pacstall" # Package install directory, symlinked at the end of install
```

#### `name`

It is what pacstall records and is the most important. The contents of `name`, (`pkgname` is the auxiliary name) will be in `/usr/src/pacstall/$name` (where pacstall puts files to symlink to the system) and `/var/log/pacstall_installed/$name` (a file which holds metadata like version number, date installed, description, etc). Use the following naming schema for `$name`:
- Keep it lowercase
- Pacscripts that install from a `deb` file should be called `pkgname-deb`
- Pacscripts that install from a git repository should be called `pkgname-git`
- Pacscripts that install an appimage should be called `pkgname-app`
- Pacscripts that install the binary of the package should be called `pkgname-bin`

#### `pkgname`

It's recommended to use as an auxiliary variable, in case the package name ends with one of the cases cited above. If the package name name was `foo-bin`, using `pkgname="foo"` would help during installation

#### `version`

It's the version number (obviously). It should ideally (but not required) be using [semver](https://semver.org). As long as the version number can be incremented, it works. When you change this version to a higher number, it will trigger an upgrade when you run `sudo pacstall -Up`.

### `pkgver`

It's a function that retrieves the new version of the package for autoupdates. Should only be used for git packages and packages that come with the new hash. In this last case, it should also retrieve the new checksum of the file.

#### `url`

It's the url of the package. It can it can end in `.tar.xz`, `.zip`,`.deb`, `.app`, or `.git`, or be an executable or a binary, like `.sh` or`.jar`. However, git is not recommended unless the maintainer does not have a releases page or tags (see st-lukesmith). When using github, use releases or tags (but try in that order). In the same way, executables are only recommended if that's the only form of release of the package.

#### `description`

It's a description of the package. Try to keep the description as close to the original as possible (e.g neofetch’s is `A command-line system information tool written in bash 3.2+`.)

#### `maintainer`

It's where you put yourself in the format shown above: `username <email.example.com>`. This makes it easy for people to contact maintainers about issues

#### `build_depends`

They are the packages needed to compile the package. They must be Ubuntu apt package names.

#### `depends`
`depends` are packages that are required to run, but not to compile. If a github page just says ‘here are the dependencies’, try to sort them first, but if not, put them in `depends`.

#### `pacdeps`

It's an array of pacscripts dependencies. Should be used when the pacscript needs a package that is not present in the `apt`repositories (see soundux).  

#### `ppa`

It's an array that you can use to install ppa's. It is highly discouraged to use ppa's as they are fundamentaly broken. You do not need to include `ppa:` in the array as pacstall does that for you and it's easier for the end user. You should only use a ppa if absolutely necessary. Consider making a pacscript instead and putting it in `pacdeps`

#### `optdepends`

It's where you put optional dependencies. Pacstall will ask the user if they want to install them after the package finishes installing.

#### `breaks` 

This is where you put the packages that would break if you install this package. An example would be foo and foo-git. They both install to the same files, but different sources. It is not needed unless you are making a `-git` package or `-bin`.

#### `replace` 

It's the name of the apt package that this package replaces, the user will be asked to continue before the apt package is removed.

#### `hash`

It's the output of running `sha256sum 1.0.zip` (from the example above). You just need the checksum and not the number + file name.

#### `patch`

It's an array that contains urls to patches you may need. Pacstall will download patches to `PACSTALL_patchesdir` in the root of your source (eg if you have the directory kvantum, Pacstall will make a directory inside of it called `PACSTALL_patchesdir`). You can run the patches in the `prepare`function.

#### `prepare`

The `prepare` function is what you run to prepare a package. You don’t need to cd into the package source directory because pacstall will do that already.

#### `build`

The `build` function is what compiles the package. Use multicore as much as possible. To get the number of cores in a system, run `nproc`. You can use that in combination with `-j$(nproc)` to compile on multicore (`make -j$(nproc)`). If the package does not need to be compiled, justuse `true` inside the function.

#### `install`

The `install` function is what installs the package. The most important thing is to install to `$STOWDIR/$name`. An example with make would be `sudo make install DESTDIR=$STOWDIR/$name`.

#### `postinst` 

It's a series of commands that should be run after pkg is installed. If you don't need it, leave it out.

#### `removescript`

It's a series of commands that should be run after pkg is uninstalled. The contents will be remotely sourced when you trigger a `-R pkg` flag. This is NOT a script uninstalls the package, just what should be run to complete it. [Here's an example](https://github.com/pacstall/pacstall-programs/blob/master/packages/tuner/tuner.pacscript) of how that would be done

### Pacscript name

You need to save it as `$name`.pacscript. To add a package to `pacstall-programs`, fork it and create a directory in packages called `pkgname` and add the `$name`.pacscript inside it. Then send me a pull request.

### Remember to wrap everything in double quotes

You can test it by cd'ing into the directory holding `$name`.pacscript and running `sudo pacstall -Il $name`. If it works, good! If not, pacstall should tell you what went wrong

### Other

If you need (for some reason) to download files that aren't part of the package (if it didn't ship a `.desktop`, for example), we suggest using [GitHub Gists](https://gist.github.com). When you download it in your pacscript, use `wget -q <gist>` so there is no output. If you need to upload an image (for whatever reason), use [postimg.cc](https://postimg.cc).
Lastly, do not ask the user for any input unless absolutely necessary. Use external variables to detect what you need to know before asking the user.

### Updating the packagelist

Before submitting a PR please update the `packagelist` inside the root of this repository. Add your package name in alphabetic order into the file. 

### Opening a PR
When you complete your script, fork this repo and add your script to packages/`$name`/`$name`.pacscript. Open a PR here and make the title: "Add `$name`" with the label `Package Add`. Please do one PR per package to make sure the auto checker can test if the pacscript works.

### Updating your package
When you want to update your package, make sure you are on the latest commit (fetch upstream) and change the `version`, `url`, and `hash` (if used). Then make a PR and use the label `update pkg`
