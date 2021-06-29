name="TachideskJUI"
pkgname="tachidesk-jui"
version="1.1.1"
description="A free and open source manga reader that runs extensions built for Tachiyomi"
url="https://github.com/Suwayomi/TachideskJUI.git"
maintainer="D-Brox <BroxZuka@protonmail.com>"
depends=("openjdk-15-jre")
make_depends=("openjdk-15-jdk")
pkgdir="/usr/src/pacstall/${pkgname}"
jar_path="${pkgdir}/usr/share/java/${pkgname}"
removescript="yes"

prepare() {
    wget -q "https://github.com/Suwayomi/TachideskJUI/releases/download/v${version}/TachideskJUI-linux-x64-${version}.jar" -O "${name}.jar"
    #Bash file
    wget -q "https://gist.githubusercontent.com/D-Brox/e330f3de88219a2637f5103940ee551a/raw/913ff9ea4252de2c67f8c14d0d882f11e4304f5c/tachidesk-jui" -O "${pkgname}"
    #Desktop Entry
    wget -q "https://gist.githubusercontent.com/D-Brox/133d2faa86cbedbfb58d359e1ef7ce37/raw/27b4d5fcc4cda3183396e400c43d6c0479d58239/TachideskJUI.desktop" -O "${name}.desktop"
    # Icon
    wget -q "https://raw.githubusercontent.com/Suwayomi/Tachidesk/master/server/src/main/resources/icon/faviconlogo.png" -O "${name}.png"
}

build() {
    sudo bash "scripts/SetupUnix.sh"
}

install() {
    sudo install -Dm644 "src/main/resources/Tachidesk.jar" -t "${pkgdir}/usr/share/java/${pkgname}/"
    sudo install -Dm644 "${name}.jar" -t "${pkgdir}/usr/share/java/${pkgname}/"
    
    sudo install -Dm755 "tachidesk-jui" -t "${pkgdir}/usr/bin/"
    sudo install -Dm644 "TachideskJUI.desktop"  -t "${pkgdir}/usr/share/applications/"
    sudo install -Dm644 "${name}.png" -t "${pkgdir}/usr/share/pixmaps/"
    
    sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript () {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
    sudo rm -rf "/usr/share/java/${pkgname}"
}

