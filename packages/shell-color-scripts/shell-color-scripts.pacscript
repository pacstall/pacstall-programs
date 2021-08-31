name="shell-color-scripts"
version="1.0"
url="https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz"
description="A collection of terminal color scripts."
hash="ffe50c7ca3ee5da0c7110be0763c64b12e8c858131d8e00e3c7954f2c9770a79"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"

prepare() {
        true
}

build() {
        true
}

install() {
        install -D colorscript.sh "$STOWDIR/$name/usr/bin/colorscript"
        install -D colorscripts/* -t "$STOWDIR/$name/opt/shell-color-scripts/colorscripts"
}
