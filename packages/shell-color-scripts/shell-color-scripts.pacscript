name="shell-color-scripts"
version="3.0"
url="https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz"
description="A collection of terminal color scripts."
hash="31d94efd426d3d62459e2056cb4ea5ba051f77f46557a3cc0ad7b2ffdd48bf84"
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
