pkgname="ventoy-bin"
gives="ventoy"
pkgver="1.1.04"
pkgdesc="A new bootable USB solution"
arch=('amd64')
url='https://www.ventoy.net'
license=('GPL-3.0-or-later')
depends=('bash' 'util-linux' 'xz-utils' 'dosfstools')
optdepends=('libgtk-3-dev: GTK3 GUI'
  'qtbase-5-dev: Qt5 GUI'
  'polkit: run GUI from application menu')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("@${pkgname}~${pkgver}::https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
  "https://aur.archlinux.org/cgit/aur.git/plain/sanitize.patch?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy-extend-persistent?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoygui?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy-persistent?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoyplugson?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoy.desktop?h=ventoy-bin"
  "https://aur.archlinux.org/cgit/aur.git/plain/ventoyweb?h=ventoy-bin")
sha256sums=('c77603e8b5cd51d75eb7dd54ea9bd2961c83c7fca8539541b86127f2e790673f'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
maintainer=("xdavius <xdavius@github.com>")
repology=("project: ${gives}")

prepare() {
  cd "${pkgname}~${pkgver}"
  # Decompress tools
  pushd tool/"x86_64"
  for file in ./*.xz; do
    xzcat "${file}" > "${file%.xz}"
    chmod +x "${file%.xz}"
  done

  # Cleanup .xz crap
  rm -fv ./*.xz
  popd

  # Apply sanitize patch
  patch --verbose -p0 < "${srcdir}/sanitize.patch"

  # Log location
  sed -i 's|log\.txt|/var/log/ventoy.log|g' WebUI/static/js/languages.js tool/languages.json

  # Non-POSIX compliant scripts
  sed -i 's|bin/sh|usr/bin/env bash|g' tool/{ventoy_lib.sh,VentoyWorker.sh}

  # Clean up unused binaries
  # Preserving mkexfatfs and mount.exfat-fuse because exfatprogs is incompatible
  for binary in xzcat hexdump; do
    rm -fv tool/"x86_64"/"${binary}"
  done
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 -vt "${pkgdir}/opt/${pkgname%-bin}/boot/" boot/*
  install -Dm644 -vt "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}/" "${pkgname%-bin}"/*
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/tool/" tool/*.{cer,glade,json,sh,xz}
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/tool/x86_64/" tool/"x86_64"/*
  install -Dm755 -vt "${pkgdir}/opt/${pkgname%-bin}/" ./*.sh
  cp --no-preserve=o -avt "${pkgdir}/opt/${pkgname%-bin}/" plugin WebUI

  install -Dm755 "VentoyGUI.x86_64" -vt "${pkgdir}/opt/${pkgname%-bin}"
  install -Dm644 WebUI/static/img/VentoyLogo.png -v "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -vt "${pkgdir}/usr/share/applications"

  # Link system binaries
  for binary in xzcat hexdump; do
    ln -svf /usr/bin/"${binary}" "${pkgdir}/opt/${pkgname%-bin}/tool/x86_64/"
  done

  install -Dm755 "${srcdir}/${pkgname%-bin}"{,gui,web,plugson,-{,extend-}persistent} -vt "${pkgdir}"/usr/bin/

  # Remove Gtk 2 files
  rm "${pkgdir}/opt/${pkgname%-bin}/tool/x86_64/Ventoy2Disk.gtk2"
}
