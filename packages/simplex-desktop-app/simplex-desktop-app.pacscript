pkgname='simplex-desktop-app'
gives='simplex-desktop'
pkgver='6.1.1'
pkgdesc='The first messaging platform with no user identifiers - 100% private by design (GUI)'
arch=('amd64')
url='https://simplex.chat'
license=('AGPL-3.0-or-later')
source=("${gives}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/${gives}-x86_64.AppImage")
repology=("project: ${gives}")
maintainer=()
sha512sums=('15c894d4b91852405268be381db3d88a9a01745e2a89d3930bbfd019b4ddbfbb88ee0611a7759e4d4ebfaecf7f96547d890fbda826fafd86504c256865ceb70e')

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
