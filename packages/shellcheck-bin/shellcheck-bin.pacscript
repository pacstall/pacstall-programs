name="shellcheck-bin"
version="0.9.0"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
description="Gives warnings and suggestions for bash/sh shell scripts"
hash="700324c6dd0ebea0117591c6cc9d7350d9c7c5c287acbad7630fa17b1d4d9e2f"
url="https://github.com/koalaman/shellcheck/releases/download/v${version}/shellcheck-v${version}.linux.x86_64.tar.xz"
arch=('amd64')
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: shellcheck")

install() {
  sudo install -Dm644 shellcheck "${pkgdir}/usr/bin/shellcheck"
  sudo install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sudo chmod +x "${pkgdir}/usr/bin/shellcheck"
}
