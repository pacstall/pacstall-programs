name="smartgit"
pkgver="22.1.7"
url="https://www.syntevo.com/downloads/smartgit/smartgit-linux-${pkgver//./_}.tar.gz"
depends=("git" "libgtk-3-0" "libcurl4")
pkgdesc="Graphical Git client with support for GitHub, Bitbucket and GitLab"
hash="138cd50d6afd604de39ed907a20d3e63ac551c9cf643c0262d60f1b84abeec81"
maintainer="echometerain <echometer@disroot.org>"
repology=("project: smartgit")

package() {
  sudo install -Dm755 "./licenses"/* -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm755 "./license.html" -t "${pkgdir}/usr/share/licenses/${name}"
  sudo mkdir -p "${pkgdir}/opt"
  sudo cp -r "${SRCDIR}/${name}" -t "${pkgdir}/opt"
  sudo chmod 755 "${pkgdir}/opt"

  for _size in 32 48 64 128 256; do
    sudo chmod 755 "./bin/smartgit-${_size}.png"
    sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    sudo mv "./bin/smartgit-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${name}.png"
  done

  sudo chmod 755 "${pkgdir}/opt/${name}/bin/smartgit.sh"
  sudo ln -s "/opt/${name}/bin/smartgit.sh" "${pkgdir}/usr/bin/smartgit"
}
