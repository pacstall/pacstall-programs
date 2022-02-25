name="zotero"
version="5.0.96.3"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="7aa48dce6906368a4627b541caf51f7c510f273dd61d2edbe7e8e05005bf854e"
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
  sudo install -D zotero.desktop -t /usr/src/pacstall/${name}/usr/share/applications
  installdir=/usr/src/pacstall/${name}/opt/zotero
  sudo mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
}
