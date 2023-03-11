name="zotero"
repology=("project: zotero")
version="6.0.22"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="397957e04e42e94103477f9f0d80773b98ac3bcbc006977a86faeafb8919d620"
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

prepare() {
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
    -e "s/^Icon=.*/Icon=zotero/" zotero.desktop
}

install() {
  sudo install -D zotero.desktop -t "${pkgdir}/usr/share/applications"
  installdir="${pkgdir}/opt/zotero"
  sudo mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
  sudo install -Dm644 "chrome/icons/default/default16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/zotero.png"
  sudo install -Dm644 "chrome/icons/default/default32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/zotero.png"
  sudo install -Dm644 "chrome/icons/default/default48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/zotero.png"
  sudo install -Dm644 "chrome/icons/default/default256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/zotero.png"
}
