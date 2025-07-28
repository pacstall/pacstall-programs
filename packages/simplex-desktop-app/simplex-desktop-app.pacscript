pkgname='simplex-desktop-app'
gives='simplex-desktop'
pkgver='6.3.5'
pkgdesc='The first messaging platform with no user identifiers - 100% private by design (GUI)'
arch=('amd64')
url='https://simplex.chat'
license=('AGPL-3.0-or-later')
source=("${gives}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/${gives}-x86_64.AppImage")
repology=("project: ${gives}")
sha512sums=('beb599ee499d8207c8be48d7d7e9cec82b75bb64b1c1cff5450bb43c05c4c0d70539b374c5ca834893c248d388e188c2281183a42bc781799ea36d3bc1fc4c31')

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
