pkgname=ventoy-bin
pkgver=1.0.97
pkgrel=1
pkgdesc="A new bootable USB solution"
maintainer="xdavius <xdavius@github.com>"
arch=('amd64')
url="http://www.ventoy.net"
license=('GPL-3.0-or-later')
depends=('bash' 'util-linux' 'xz-utils' 'dosfstools')
optdepends=('libgtk-3-dev: GTK3 GUI'
  'qtbase-5-dev: Qt5 GUI'
  'polkit: run GUI from application menu')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
  "https://aur.archlinux.org/cgit/aur.git/plain/sanitize.patch?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy-extend-persistent?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoygui?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy-persistent?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoyplugson?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy.desktop?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoyweb?h=ventoy-bin")
sha256sums=('1368a9082c9db25958e5407ef4984322d90d3bb00905337d4bd41678e06c1150'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

prepare() {
  cd "${_archive}"
  export CARCH="x86_64"
  # Decompress tools
  pushd tool/"${CARCH}" || exit
  for file in *.xz; do
    xzcat "${file}" >"${file%.xz}"
    chmod +x "${file%.xz}"
  done

  # Cleanup .xz crap
  rm -fv ./*.xz
  popd || exit

  # Apply sanitize patch
  patch --verbose -p0 <"${srcdir}/sanitize.patch"

  # Log location
  sed -i 's|log\.txt|/var/log/ventoy.log|g' WebUI/static/js/languages.js tool/languages.json

  # Non-POSIX compliant scripts
  sed -i 's|bin/sh|usr/bin/env bash|g' tool/{ventoy_lib.sh,VentoyWorker.sh}

  # Clean up unused binaries
  # Preserving mkexfatfs and mount.exfat-fuse because exfatprogs is incompatible
  for binary in xzcat hexdump; do
    rm -fv tool/"${CARCH}"/"${binary}"
  done
}

package() {
  cd "${_archive}"
  export CARCH="x86_64"
  install -Dm644 -vt "${pkgdir}/opt/${pkgname%-bin}/boot/" boot/*
  install -Dm644 -vt "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}/" "${pkgname%-bin}"/*
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/tool/" tool/*.{cer,glade,json,sh,xz}
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/tool/${CARCH}/" tool/"${CARCH}"/*
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/" ./*.sh
  cp --no-preserve=o -avt "${pkgdir}/opt/${pkgname%-bin}/" plugin WebUI

  install -Dm755 "VentoyGUI.${CARCH}" -vt "${pkgdir}/opt/${pkgname%-bin}"
  install -Dm644 WebUI/static/img/VentoyLogo.png -v "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -vt "${pkgdir}/usr/share/applications"

  # Link system binaries
  for binary in xzcat hexdump; do
    ln -svf /usr/bin/"${binary}" "${pkgdir}/opt/${pkgname%-bin}/tool/${CARCH}/"
  done

  install -Dm755 "${srcdir}/${pkgname%-bin}"{,gui,web,plugson,-{,extend-}persistent} -vt "${pkgdir}"/usr/bin/

  # Remove Gtk 2 files
  if [[ "${CARCH}" == "x86_64" ]]; then
    rm "${pkgdir}/opt/${pkgname%-bin}/tool/${CARCH}/Ventoy2Disk.gtk2"
  fi
}
