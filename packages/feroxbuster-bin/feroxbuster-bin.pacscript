maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="feroxbuster-bin"
pkgname="feroxbuster"
gives="feroxbuster"
depends=("fonts-noto-color-emoji")
pkgver="2.10.0"
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/${gives}/releases/download/v${pkgver}/x86_64-linux-${gives}.tar.gz"
hash="dc511b6b2da4462cacd8d8985b49620e29f431d97d45efc7d305c436d4603b13"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Bash
  wget -q -O "${pkgname}.bash" "https://raw.githubusercontent.com/epi052/${pkgname}/${pkgver}/shell_completions/${pkgname}.bash"
  sudo install -Dm644 "./feroxbuster.bash" "${pkgdir}/usr/share/bash-completion/completions/feroxbuster.bash"

  # Zsh
  wget -q -O "_${pkgname}" "https://raw.githubusercontent.com/epi052/${pkgname}/${pkgver}/shell_completions/_${pkgname}"
  sudo install -Dm644 "./_feroxbuster" "${pkgdir}/usr/share/zsh/site-functions/_feroxbuster"

  # Fish
  wget -q -O "${pkgname}.fish" "https://raw.githubusercontent.com/epi052/${pkgname}/${pkgver}/shell_completions/${pkgname}.fish"
  sudo install -Dm644 "./feroxbuster.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/feroxbuster.fish"
}
