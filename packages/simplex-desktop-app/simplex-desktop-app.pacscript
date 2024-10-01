pkgname='simplex-desktop-app'
gives='simplex-desktop'
pkgver='6.0.4'
pkgdesc='The first messaging platform with no user identifiers - 100% private by design (GUI)'
arch=('amd64')
url='https://simplex.chat'
license=('AGPL-3.0-or-later')
source=("${gives}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/${gives}-x86_64.AppImage")
repology=("project: ${gives}")
maintainer=('vigress8 <vig@disroot.org>')
sha512sums=('ee7b2e7e63d6df065e6dc792c27634fe3cfa6a8623072fede69048bcfaf3eb4e1cd680a5f1c08c16a7153b5bdfdad0d8824ef5a40bc555402cfcfe1a50a95b3a')

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
