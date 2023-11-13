name="android-studio"
repology=("project: ${name}" "repo: aur")
replace=("${name}" "${name}-beta" "${name}-canary")
pkgver="2022.3.1.21"
url="https://dl.google.com/dl/android/studio/ide-zips/${pkgver}/${name}-${pkgver}-linux.tar.gz"
depends=("libc6-i386" "lib32ncurses6" "lib32stdc++6" "lib32z1" "libbz2-1.0:i386")
pkgdesc="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
hash="c6bd608fd2cf7ebdf0576f6e6283b5b594d3a72a80009f82ffabe70c9b457203"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  # Moving all android studio files to /opt
  sudo install -d "${pkgdir}/opt/${name}"
  sudo cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "${pkgdir}/opt/${name}"

  # Creating a launcher in $PATH
  sudo install -d "${pkgdir}/usr/bin"

  sudo install -d "${pkgdir}/usr/share/applications"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${name}.desktop" -O "${pkgdir}//usr/share/applications/${name}.desktop"

  sudo install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${name}.png"
  sudo chmod -R ugo+rX "${pkgdir}/opt"
}

post_install() {
  sudo ln -sf "/opt/${name}/bin/studio.sh" "/usr/bin/${name}"

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

post_remove() {
  sudo update-desktop-database -q
  sudo rm -f "/usr/bin/${name}"
}
