name="zotero"
version="5.0.96.2"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="653faac4d2e3746dbd0e1c95d095ed8031c38b68183f22ab6708093aba392082"
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

tarfile="Zotero-${version}_linux-x86_64.tar.bz2"

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

  sudo install -D zotero.desktop -t /usr/src/pacstall/${name}/usr/share/applications

  installdir=/usr/src/pacstall/${name}/opt/zotero

  mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
}
