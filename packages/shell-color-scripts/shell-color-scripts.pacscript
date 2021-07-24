name="shell-color-scripts"
version="1.0"
url="https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz"
description="A collection of terminal color scripts."
hash="ffe50c7ca3ee5da0c7110be0763c64b12e8c858131d8e00e3c7954f2c9770a79"
maintainer="Fahri Korkmaz <fahri.korkmaz@protonmail.ch>"

prepare() {
        sudo rm -rf /opt/shell-color-scripts
}

build() {
        true
}

install() {
        sudo mkdir -p /opt/shell-color-scripts/colorscripts
        sudo cp colorscript.sh /usr/bin/colorscript
        sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
}
