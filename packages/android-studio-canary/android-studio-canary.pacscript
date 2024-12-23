pkgname="android-studio-canary"
gives="android-studio"
repology=("project: ${gives}")
replaces=("${gives}-beta" "${gives}" "${pkgname}")
arch=("amd64")
pkgver="2024.2.1.11"
source=(
  "@${pkgname}~${pkgver}::https://dl.google.com/dl/android/studio/ide-zips/${pkgver}/${gives}-${pkgver}-linux.tar.gz"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${gives}/${gives}.desktop"
)
depends=("libc6-i386" "lib32ncurses6" "lib32stdc++6" "lib32z1" "libbz2-1.0:i386")
pkgdesc="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
sha256sums=(
  "81f2fa5da72ab6f6afacca4a5327de5191e133ad02706e3ee440dc8658b8cdc3"
  "SKIP"
)
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  # Moving all android studio files to /opt
  install -d "${pkgdir}/opt/${gives}"
  cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "${pkgdir}/opt/${gives}"

  # Creating a launcher in $PATH
  install -d "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"

  install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  chmod -R ugo+rX "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/bin/studio.sh" "${pkgdir}/usr/bin/${gives}"
}

post_install() {

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

post_remove() {
  sudo update-desktop-database -q
}
