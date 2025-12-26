pkgname="thunderbird-bin"
gives="thunderbird"
pkgver="141.0"
arch=('amd64')
repology=("project: ${gives}")
url='https://www.thunderbird.net/en-US/'
pkgdesc="Thunderbird is a free email application that's easy to set up and customize and it's loaded with great features!"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://archive.mozilla.org/pub/${gives}/releases/${pkgver}/linux-x86_64/en-US/${gives}-${pkgver}.tar.xz")
sha256sums=("137a75c034b8bda7cbe546555f384e19eba82e51ed531577d5e5d178718568f4")

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
