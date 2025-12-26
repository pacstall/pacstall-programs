pkgname="smartgit"
arch=("any")
pkgver="24.1.3"
source=("@${pkgname}~${pkgver}::https://www.syntevo.com/downloads/smartgit/smartgit-linux-${pkgver//./_}.tar.gz")
depends=("git" "libgtk-3-0" "libcurl4")
pkgdesc="Graphical Git client with support for GitHub, Bitbucket and GitLab"
# the source for this pacscript uses dynamic hashing, so we have to ignore it
maintainer=("echometerain <echometer@disroot.org>")
repology=("project: smartgit")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "./licenses"/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "./license.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}" -t "${pkgdir}/opt"
  chmod 755 "${pkgdir}/opt"

  for _size in 32 48 64 128 256; do
    chmod 755 "./bin/smartgit-${_size}.png"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    mv "./bin/smartgit-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  chmod 755 "${pkgdir}/opt/${pkgname}/bin/smartgit.sh"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/bin/smartgit.sh" "${pkgdir}/usr/bin/smartgit"
}
