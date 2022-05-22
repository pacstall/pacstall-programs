name="zotero"
version="6.0.8"
repology=("project: zotero" "repo: aur")
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="4b7b3cd85ea4a6320e22a308c65648053ffb78da4b7fa7478ce39a098c5d87a1"
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

prepare() {
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
         -e "s/^Icon=.*/Icon=\/opt\/zotero\/zotero.ico/" \
         zotero.desktop
}

build() {
  true
}

install() {
  pkgdir="${STOWDIR}/${name}"

  sudo install -D zotero.desktop -t "${pkgdir}/usr/share/applications"

  installdir="${pkgdir}/opt/zotero"
  sudo mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
}
