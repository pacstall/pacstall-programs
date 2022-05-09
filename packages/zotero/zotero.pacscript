name="zotero"
version="6.0.6"
repology=("project: zotero" "repo: aur")
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="dd347882279564d66a59caa4671b4828a9d58dc777ad4b00dff737d918a6e901"
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
