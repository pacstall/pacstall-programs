pkgname="thunderbird-bin"
gives="thunderbird"
pkgver="140.0.1"
arch=('amd64')
repology=("project: ${gives}")
url='https://www.thunderbird.net/en-US/'
pkgdesc="Thunderbird is a free email application that's easy to set up and customize and it's loaded with great features!"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://archive.mozilla.org/pub/${gives}/releases/${pkgver}/linux-x86_64/en-US/${gives}-${pkgver}.tar.xz")
sha256sums=("97ba814fb587b8ec4f83a5b513e6d2147d9d9c3716f2e7207e60ba8c2cdb3d37")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/lib/thunderbird"
  cp -r thunderbird/* "${pkgdir}/usr/lib/thunderbird"
  chmod +x "${pkgdir}/usr/lib/thunderbird/thunderbird"
  chmod +x "${pkgdir}/usr/lib/thunderbird/thunderbird-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Thunderbird
Comment=Email Client
Exec=/usr/lib/thunderbird/thunderbird %u
Terminal=false
Type=Application
Icon=/usr/lib/thunderbird/chrome/icons/default/default128.png
Categories=Network;Email;MimeType=x-scheme-handler/mailto;
StartupNotify=true' | tee "${pkgdir}/usr/share/applications/thunderbird.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/thunderbird/thunderbird-bin" "${pkgdir}/usr/bin/thunderbird-bin"
  ln -sf "/usr/lib/thunderbird/thunderbird" "${pkgdir}/usr/bin/thunderbird"
}
