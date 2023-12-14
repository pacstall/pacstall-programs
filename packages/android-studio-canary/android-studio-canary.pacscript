name="android-studio-canary"
gives="android-studio"
repology=("project: ${gives}")
replace=("${gives}-beta" "${gives}" "${name}")
pkgver="2023.1.1.26"
url="https://dl.google.com/dl/android/studio/ide-zips/${pkgver}/${gives}-${pkgver}-linux.tar.gz"
depends=("libc6-i386" "lib32ncurses6" "lib32stdc++6" "lib32z1" "libbz2-1.0:i386")
pkgdesc="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
hash="977e8a9855414f7d41157f0be0e10fb740c42bd337f763d5d96b3e059780663d"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  # Moving all android studio files to /opt
  sudo install -d "${pkgdir}/opt/${gives}"
  sudo cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "${pkgdir}/opt/${gives}"

  # Creating a launcher in $PATH
  sudo install -d "${pkgdir}/usr/bin"

  sudo install -d "${pkgdir}/usr/share/applications"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${gives}/${gives}.desktop" -O "${pkgdir}//usr/share/applications/${gives}.desktop"

  sudo install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo chmod -R ugo+rX "${pkgdir}/opt"
}

post_install() {
  sudo ln -sf "/opt/${gives}/bin/studio.sh" "/usr/bin/${gives}"

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

post_remove() {
  sudo update-desktop-database -q
  sudo rm -f "/usr/bin/${gives}"
}
