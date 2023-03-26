name="android-studio"
repology=("project: ${name}")
replace="${name}"
breaks="${name}-beta ${name}-canary"
version="2022.1.1.21"
url="https://dl.google.com/dl/android/studio/ide-zips/${version}/${name}-${version}-linux.tar.gz"
depends="libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
hash="0bca26c45daf5cad79b131c34013b985d146a2526990ea2aa6d88792d51905a1"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"

install() {
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

postinst() {
  sudo ln -sf "/opt/${name}/bin/studio.sh" "/usr/bin/${name}"

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

removescript() {
  sudo update-desktop-database -q
  sudo rm -f "/usr/bin/${name}"
}
