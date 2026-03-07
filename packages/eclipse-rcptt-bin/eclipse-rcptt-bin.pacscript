pkgname="eclipse-rcptt-bin"
pkgver="2.7.3"
gives="eclipse-rcptt"
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('amd64')
url="https://eclipse.org/rcptt"
license=('EPL-2.0')
depends=('java-runtime>=21')
source=("https://cdimage.debian.org/mirror/eclipse.org/rcptt/release/${pkgver}/ide/rcptt.ide-${pkgver}-linux.gtk.x86_64.zip"
  "https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.png"
  "https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.desktop")
sha512sums=('908de8b338da1be732b52740607a8e0a57c6e3c4a3293fd9112310664a3f62f8f8b9899dc257c3c4a768643b721f3a8ea04bc633e4367d92a6ef0f0228d38b19'
  'df5b0fb3b465c19033bf73a9b3ca67ed0f107b1ebdedee0240952c8913a8225134717e59d74d5445b24f7fab08d20f97f7e11628d384fc4968e4869059501f74'
  '002a074ce1a41bc84bf688c21e3e8e94ba4662b167f459e5cc46397434565fab30520cc78e062407ac7eaba73d84604ff2d16aa27c3aa2d39cc9aea27d969d8c')
depends=('libwebkit2gtk-4.1-0')
maintainer=("Matthias Mailänder <matthias@mailaender.name>")

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "rcptt" "${pkgdir}/usr/lib/eclipse-rcptt"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse-rcptt/rcptt" "${pkgdir}/usr/bin/eclipse-rcptt"

  install -Dm0644 "eclipse-rcptt.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eclipse-rcptt.png"
  install -Dm0644 "eclipse-rcptt.desktop" "${pkgdir}/usr/share/applications/eclipse-rcptt.desktop"
}
