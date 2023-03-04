name="smartgit"
version="22.1.3"
url="https://www.syntevo.com/downloads/smartgit/smartgit-linux-22_1_3.tar.gz"
depends="git libgtk-3-0 libcurl4"
description="Graphical Git client with support for GitHub, Bitbucket and GitLab"
hash="4e7a63445227aa6958d367c68bba31a12e0fd43cda86bc85bcd2e2b49e4d8cce"
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
