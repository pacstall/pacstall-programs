name="shellharden-bin"
pkgname="shellharden"
version="4.1.1"
url="https://github.com/anordal/shellharden/releases/download/v${version}/shellharden-${version}-x86_64-linux-gnu"
pkgdir="${STOWDIR}/${name}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
gives="${pkgname}"
description="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
hash="089342fca69bdcac5c236e9df434a98da5b9d36de145e51b776bcf73cd66bbeb"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 shellharden-"${version}"-x86_64-linux-gnu "${pkgdir}"/usr/bin/shellharden
}
