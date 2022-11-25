name="protonup-qt-git"
description="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
url="https://github.com/DavidoTek/ProtonUp-Qt.git"

depends="python3"
build_depends="python3 python3-pip"
pkgver() {
    # get the latest tag (newest release version) - master may be broken, tags are releases
    git ls-remote --tags "${url}" | tail -n1 | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    sudo mkdir -p "${STOWDIR}/${name}/usr/bin"

    sed 's/==.*//g' requirements.txt > requirements_nover.txt
    pip3 install --verbose --no-index --ignore-installed --prefix="${STOWDIR}/${name}/usr" -r requirements_nover.txt

cat >"${STOWDIR}/${name}/usr/bin/net.davidotek.pupgui2.sh" <<EOL
#!/bin/bash
PYTHONPATH=$PYTHONPATH:${STOWDIR}/${name}/usr/local/lib/`ls ${STOWDIR}/${name}/usr/local/lib/ | grep python3`/dist-packages/ python3 -m pupgui2
EOL

    sudo ln -s "${STOWDIR}/${name}/usr/bin/net.davidotek.pupgui2.sh" "/usr/bin/protonup-qt"
}

install() {
    pip3 install --verbose --no-index --no-build-isolation --prefix="${STOWDIR}/${name}/usr" --no-deps .

    cp -r share "${STOWDIR}/${name}/usr/"
}

removescript() {
    sudo rm "/usr/bin/protonup-qt"
}
