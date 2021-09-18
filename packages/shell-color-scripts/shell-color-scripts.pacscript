name="shell-color-scripts"
version="2.0"
url="https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz"
description="A collection of terminal color scripts."
hash="9fb6da20d742ecf0e06b8ccaea622ecf6f91fe634300dfe93ab24b4638816dbf"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"
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