name="zotero"
repology=("project: zotero")
version="6.0.16"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="3ea0bb3eaa514a6fd8b77a4af13bb372b86d7c949e257ead876c5bda7fc1ba5f"
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
