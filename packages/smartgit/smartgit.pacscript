name="smartgit"
version="22.1.4"
url="https://www.syntevo.com/downloads/smartgit/smartgit-linux-22_1_4.tar.gz"
depends="git libgtk-3-0 libcurl4"
description="Graphical Git client with support for GitHub, Bitbucket and GitLab"
hash="7b96e0200edd6e54435afc02d9da91151f92a7ab8c01641b86532a1bc6b8bd99"
maintainer="echometerain <echometer@disroot.org>"
repology=("project: smartgit")

install() {
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
}

postinst() {
  sudo ln -s "/opt/${name}/bin/smartgit.sh" "/usr/bin/smartgit"
}

removescript() {
  sudo rm -f "/usr/bin/smartgit"
}
