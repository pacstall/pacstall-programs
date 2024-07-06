pkgname="typora-deb"
gives="typora"
pkgver="1.9.3-1"
url='https://typora.io'
repology=("project: typora")
depends=("libgtk-3-0" "libnss3")
arch=('amd64')
sha256sums=("deb47f0af1458d13e4cf6ee69b55ade61c204549cb2fb9692c5280da6a082f1f")
source=("https://download.typora.io/linux/${gives}_${pkgver%-*}_amd64.deb")
optdepends=(
  "noto-fonts-emoji: Or some other emoji fonts to see/use emojis"
  "pandoc: Import/export for extra file formats"
)
replaces=("typora")
pkgdesc="A minimal markdown editor and reader"
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

# vim:set ft=sh ts=2 sw=2 et:
