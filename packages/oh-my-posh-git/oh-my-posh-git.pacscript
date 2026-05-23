pkgname="oh-my-posh-git"
gives="oh-my-posh"
source=("https://github.com/JanDeDobbeleer/oh-my-posh.git")
arch=("any")
pkgver="20.0.0"
pkgrel="2"
makedepends=("golang-1.22-go")
pacdeps=("nerd-fonts-hack")
breaks=("${gives}")
replaces=("${gives}")
pkgdesc="A prompt theme engine for any shell"
maintainer=("Zahrun <zahrunAtmurenaDotio>")
incompatible=('*:bookworm')
external_connection=true

build() {
  cd "oh-my-posh"
  cd src || exit 1
  sed -i "s/go 1.22.3/go 1.22.2/g" go.mod
  /usr/lib/go-1.22/bin/go build -o "${gives}"
}

package() {
  cd "oh-my-posh"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "src/${gives}" -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/oh-my-posh/themes"
  install -m 644 themes/* -t "${pkgdir}/usr/share/oh-my-posh/themes"
}
