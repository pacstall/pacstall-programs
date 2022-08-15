name="shellharden"
pkgname="shellharden"
version="4.3.0"
repology=("project: ${pkgname}")
url="https://github.com/anordal/shellharden/archive/refs/tags/v${version}.zip"
pkgdir="${STOWDIR}/${name}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
gives="${pkgname}"
depends="rustc"
description="A syntax highlighter and a tool to semi-automate the rewriting of scripts to ShellCheck conformance"
hash="d6679f7a2a3e96da923b2f04339a966202a24172f1bbc58e56e7982eca2a76dc"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  cargo build --release
}

install() {
  sudo install -Dm755 target/release/shellharden "${pkgdir}"/usr/bin/shellharden
}
