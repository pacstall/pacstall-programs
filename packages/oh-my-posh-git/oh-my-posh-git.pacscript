pkgname="oh-my-posh-git"
gives="oh-my-posh"
source=("https://github.com/JanDeDobbeleer/oh-my-posh.git")
pkgver="19.8.2"
makedepends=("golang-1.21-go")
pacdeps=("nerd-fonts-hack")
breaks=("${gives}")
replaces=("${gives}")
pkgdesc="A prompt theme engine for any shell"
maintainer=("Zahrun <Zahrun@github.com>")
incompatible=('*:bookworm')


build() {
  cd "${_archive}"
  cd src || exit 1
  /usr/lib/go-1.21/bin/go build -o "${gives}"
}

package() {
  cd "${_archive}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "src/${gives}" -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/oh-my-posh/themes"
  install -m 644 themes/* -t "${pkgdir}/usr/share/oh-my-posh/themes"
}
