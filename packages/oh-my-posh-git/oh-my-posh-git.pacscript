name="oh-my-posh-git"
pkgname="oh-my-posh"
url="https://github.com/JanDeDobbeleer/oh-my-posh.git"
pkgver="18.11.0"
makedepends=("golang-go")
pacdeps=("nerd-fonts-hack")
breaks=("${pkgname}")
replace=("${pkgname}")
gives=("${pkgname}")
arch=('amd64')
pkgdesc="A prompt theme engine for any shell"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/main | cut -f1 | cut -c1-8
}

build() {
  cd src || exit 1
  go build -o "${pkgname}"
}

package() {
  sudo install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm755 "src/${pkgname}" -t "${pkgdir}/usr/bin/"
  sudo install -d "${pkgdir}/usr/share/oh-my-posh/themes"
  sudo install -m 644 themes/* -t "${pkgdir}/usr/share/oh-my-posh/themes"
}
