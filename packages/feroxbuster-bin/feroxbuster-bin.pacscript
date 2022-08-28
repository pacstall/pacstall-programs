maintainer="0x262D <pacstall@copypaste.anonaddy.me>"

name="feroxbuster-bin"
pkgname="feroxbuster"
gives="feroxbuster"

depends="fonts-noto-color-emoji"

version="2.7.1"
description="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/${gives}/releases/download/${version}/x86_64-linux-${gives}.tar.gz"
hash="62d088a480f0fc68d3344dc2860f6dc1939deeeb54e9d2dd23513878e97da6cc"

breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Bash
  wget -q -O "${pkgname}.bash" "https://raw.githubusercontent.com/epi052/${pkgname}/${version}/shell_completions/${pkgname}.bash"
  sudo install -Dm644 "./feroxbuster.bash" "${pkgdir}/usr/share/bash-completion/completions/feroxbuster.bash"

  # Zsh
  wget -q -O "_${pkgname}" "https://raw.githubusercontent.com/epi052/${pkgname}/${version}/shell_completions/_${pkgname}"
  sudo install -Dm644 "./_feroxbuster" "${pkgdir}/usr/share/zsh/site-functions/_feroxbuster"

  # Fish
  wget -q -O "${pkgname}.fish" "https://raw.githubusercontent.com/epi052/${pkgname}/${version}/shell_completions/${pkgname}.fish"
  sudo install -Dm644 "./feroxbuster.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/feroxbuster.fish"
}
# vim:set ft=sh ts=2 sw=2 et:
