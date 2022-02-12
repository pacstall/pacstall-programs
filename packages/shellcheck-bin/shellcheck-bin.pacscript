name="shellcheck-bin"
pkgname="shellcheck"
version="0.8.0"
pkgdir="${STOWDIR}/${name}"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
description="ShellCheck is a GPLv3 tool that gives warnings and suggestions for bash/sh shell scripts"
hash="ab6ee1b178f014d1b86d1e24da20d1139656c8b0ed34d2867fbb834dad02bf0a"
url="https://github.com/koalaman/shellcheck/releases/download/v${version}/shellcheck-v${version}.linux.x86_64.tar.xz"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm644 shellcheck "${pkgdir}/usr/bin/shellcheck"
  sudo install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sudo chmod +x "${pkgdir}/usr/bin/shellcheck"
}
