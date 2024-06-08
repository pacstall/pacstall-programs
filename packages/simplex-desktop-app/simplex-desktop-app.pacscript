pkgname='simplex-desktop-app'
gives='simplex-desktop'
pkgver='5.8.0'
pkgdesc='The first messaging platform with no user identifiers - 100% private by design (GUI)'
arch=('amd64')
url='https://simplex.chat'
license=('AGPL-3.0-or-later')
source=("${gives}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/${gives}-x86_64.AppImage")
repology=("project: ${gives}")
maintainer=('vigress8 <vig@disroot.org>')
sha512sums=('4183f6018dc2f08f82f3dd9ac6d6834cce13919c201d38ba792074b965de9c5b5071cdee37fb560cdd3479d26d0859a08a96ad61d358a6d0b0d2a4148b4355bc')

package() {
  chmod +x "${gives}"
  ./"${gives}" --appimage-extract usr/share
  cp -rf squashfs-root/* "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}"
  find "${pkgdir}" -name '*.desktop' -exec sed -i "s/^Exec=.*/Exec=${gives}/" '{}' +
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps" "${pkgdir}/usr/share/icons/simplex.png"
  rm "${_}"

  install -Dm755 "${gives}" -t "${pkgdir}/opt/${gives}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${gives}/${gives}" "${_}"
}
