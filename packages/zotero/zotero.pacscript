name="zotero"
repology=("project: zotero" "repo: aur")
version="6.0.15"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="87f8726918ee9d5915a07995a6bbb8f3582837bdc09e8d530d10c3839015a132"
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
