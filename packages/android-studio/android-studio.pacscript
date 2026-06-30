pkgname="android-studio"
pkgver="2026.1.1.10"
_vername="quail1-patch2"
arch=("amd64")
repology=("project: ${pkgname}" "repo: aur" "visiblename: ${pkgname}")
replaces=("${pkgname}" "${pkgname}-beta" "${pkgname}-canary")
depends=("libc6-i386" "lib32ncurses6" "lib32stdc++6" "lib32z1" "libbz2-1.0:i386")
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
source=(
  "@${pkgname}~${pkgver}::https://dl.google.com/dl/android/studio/ide-zips/${pkgver}/${pkgname}-${_vername}-linux.tar.gz"
  "${pkgname}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${pkgname}.desktop"
)
sha256sums=(
  "fbd3f116d12caed724ea8da0d2cdae7e791170f79f2aa11273ea0f2d22a224dc"
  "SKIP"
)

package() {
  cd "${pkgname}~${pkgver}"
  # Moving all android studio files to /opt
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "${pkgdir}/opt/${pkgname}"

  # Creating a launcher in $PATH
  install -d "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  chmod -R ugo+rX "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/bin/studio" "${pkgdir}/usr/bin/${pkgname}"
}

post_install() {

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

post_remove() {
  sudo update-desktop-database -q
}
