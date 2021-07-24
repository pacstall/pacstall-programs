name="shell-color-scripts"
version="1.0"
url="https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz"
description="A collection of terminal color scripts."
hash="ffe50c7ca3ee5da0c7110be0763c64b12e8c858131d8e00e3c7954f2c9770a79"
maintainer="Fahri Korkmaz <fahri.korkmaz@protonmail.ch>"

prepare() {
        true
}

build() {
        true
}

install() {
        sudo install -D colorscript.sh "$STOWDIR/$name/usr/bin/colorscript"
        sudo install -D colorscripts/* -t "$STOWDIR/$name/opt/shell-color-scripts/colorscripts"
}
