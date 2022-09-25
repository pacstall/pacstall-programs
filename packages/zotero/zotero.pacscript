name="zotero"
repology=("project: zotero" "repo: aur")
version="6.0.13"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="cee1c95a926069bb845c7c158fe2f32bbbca0c10c12df31e93747a2466c8143a"
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
