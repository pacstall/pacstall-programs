name="prismlauncher-cracked-bin"
gives="prismlauncher"
version="7.0"
homepage="https://github.com/Diegiwg/PrismLauncher-Cracked/"
description="This project is a Fork of Prism Launcher, which aims to 'unblock' the use of Offline Accounts, disabling the restriction of having a functional Online Account. No other modifications were applied to the project's source code"
maintainer="Diegiwg <diegiwg@gmail.com>"
url="https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/7.0/PrismLauncher-Linux-develop.tar.gz"
hash="dcf00bd474a8d1d968ec0b2f93a78eaf5f41bbd29f5a6a9301d81145450cee2f"

prepare() {
  chmod +x ./bin/prismlauncher
}

install() {
  sudo install -Dm644 "./share/man/man6/prismlauncher.6" "${pkgdir}/share/man/man6/prismlauncher.6"
  sudo install -Dm644 "./share/metainfo/org.prismlauncher.PrismLauncher.metainfo.xml" "${pkgdir}/share/metainfo/org.prismlauncher.PrismLauncher.metainfo.xml"
  sudo install -Dm644 "./share/icons/hicolor/scalable/apps/org.prismlauncher.PrismLauncher.svg" "${pkgdir}/share/icons/hicolor/scalable/apps/org.prismlauncher.PrismLauncher.svg"
  sudo install -Dm644 "./share/applications/org.prismlauncher.PrismLauncher.desktop" "${pkgdir}/share/applications/org.prismlauncher.PrismLauncher.desktop"
  sudo install -Dm644 "./share/mime/packages/modrinth-mrpack-mime.xml" "${pkgdir}/share/mime/packages/modrinth-mrpack-mime.xml"
  sudo install -Dm644 "./share/prismlauncher/JavaCheck.jar" "${pkgdir}/share/prismlauncher/JavaCheck.jar"
  sudo install -Dm644 "./share/prismlauncher/NewLaunch.jar" "${pkgdir}/share/prismlauncher/NewLaunch.jar"

  sudo install -Dm755 "./bin/prismlauncher" "$\{pkgdir\}/usr/bin/prismlauncher"
}
