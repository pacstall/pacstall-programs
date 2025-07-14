gives="keyd"
pkgname="${gives}-deb"
pkgver="2.5.0-4"
pkgdesc='Keyboard key remapping daemon'
arch=('amd64' 'arm64' 'armhf' 'i386' 'riscv64')
source=("http://ftp.debian.org/debian/pool/main/k/${gives}/${gives}_${pkgver}_${CARCH}.deb")
sha256sums_amd64=("a")
sha256sums_arm64=("b")
sha256sums_armhf=("c")
sha256sums_i386=("d")
sha256sums_riscv64=("e")
depends=('libc6>=2.34')
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")
