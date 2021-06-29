name="Tachidesk"
pkgname="tachidesk"
version="0.4.3_r670"
description="A free and open source manga reader that runs extensions built for Tachiyomi"
maintainer="D-Brox <BroxZuka@protonmail.com>"
url="https://github.com/Suwayomi/Tachidesk.git"
depends=("openjdk-15-jre")
pkgdir="/usr/src/pacstall/${pkgname}"
removescript="yes"


prepare() {
  # Tachidesk jar, with webUI
  wget -q "https://github.com/Suwayomi/Tachidesk/releases/download/v0.4.3/Tachidesk-v${version%_*}-${version#*_}.jar" -O "${name}.jar"
  # Bash file
  wget -q "https://gist.githubusercontent.com/D-Brox/6c1946d22414e34cf537c1f682482642/raw/b103ae6a59846e515fe22199ef27dacf29226ce4/tachidesk" -O "${pkgname}"
}

build() {
   true 
}

install() {
  sudo install -Dm644 "${name}.jar" -t "${pkgdir}/usr/share/java/${pkgname}/"
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript () {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
    sudo rm -rf "/usr/share/java/${pkgname}"
}
