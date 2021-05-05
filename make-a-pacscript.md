## Creating a pacscript
This is a pacscript:
```bash
name="foo"
version="1.0"
url="https://github.com/Henryws/foo/archive/refs/tags/1.0.zip"
build_depends="vim gcc"
depends="neofetch plasma"
breaks="libfoo-git"
description=“foo is the ultimate program capable of foo and bar!”
hash=“2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae”
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
```
the first variable is `name`. It is what pacstall records and is the most important. `name` will be in `/usr/src/pacstall/name` (where pacstall puts files to symlink to the system) and `/var/log/pacstall_installed/name` (a file which holds metadata like version number, date installed, description, etc).

The next is `version`. It is the version number (obviously). It should (but not required) be using [semver](https://semver.org). As long as the version number can be incremented, it works. When you change this version to a higher number, it will trigger an upgrade when you run `sudo pacstall -Up`.

`url` is the url of the package. It can end in .tar.xz, .zip, or .git. git is not recommended unless the maintainer does not have a releases page or tags (see st-lukesmith). When using github, use releases or tags (but try in that order).

`build_depends` is the packages needed to compile the package. They are Ubuntu apt package names.

`depends` are packages that are required to run, but not to compile. If a github page just says ‘here are the dependencies’, try to sort them first, but if not, put them in `depends`.

`description` is a description of the package. Try to keep the description as close to the original as possible (e.g neofetch’s is `A command-line system information tool written in bash 3.2+`.)

`breaks` are where you put the packages that will break if you install this package. An example would be foo and foo-git. They both install to the same files, but different sources.

`hash` is the output of running `sha256sum 1.0.zip` (from the example above). You just need the number and not the number + file name.

The `prepare` function is what you run to prepare a package. You don’t need to cd into the package source directory because pacstall will do that already.

The `build` function is what compiles the package. Use multicore as much as possible. To get the number of cores in a system, run `nproc`. You can use that in combination with `-j$(nproc)` to compile on multicore (`make -j$(nproc)`).

The install function installs the package. The most important thing is to install to `/usr/src/pacstall/name`. An example with make would be `sudo make install DESTDIR=/usr/src/pacstall/name`.

### Remember to wrap everything in double quotes
