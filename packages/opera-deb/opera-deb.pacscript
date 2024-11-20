maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="opera-deb"
gives="opera-stable"
replaces=("${gives}")
pkgver="114.0.5282.185"
source=("https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb")
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
sha256sums=("f938bcc6a8df93e9dc4defdd3ddb7291a0f7ba85abecc8f0c301f6b7103d1106")
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:
