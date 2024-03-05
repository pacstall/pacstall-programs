name="oh-my-posh-git"
pkgname="oh-my-posh"
source=("https://github.com/JanDeDobbeleer/oh-my-posh.git")
pkgver="19.8.2"
makedepends=("golang-1.21-go")
pacdeps=("nerd-fonts-hack")
breaks=("${pkgname}")
replaces=("${pkgname}")
gives=("${pkgname}")
pkgdesc="A prompt theme engine for any shell"
maintainer="Zahrun <Zahrun@github.com>"
incompatible=('*:bookworm')


build() {
  cd src || exit 1
  /usr/lib/go-1.21/bin/go build -o "${pkgname}"
}

package() {
  sudo install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm755 "src/${pkgname}" -t "${pkgdir}/usr/bin/"
  sudo install -d "${pkgdir}/usr/share/oh-my-posh/themes"
  sudo install -m 644 themes/* -t "${pkgdir}/usr/share/oh-my-posh/themes"
}
