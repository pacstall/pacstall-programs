pkgname="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer=("lfromanini <lfromanini@yahoo.com>")
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.8"
source=("https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb")

sha256sums_amd64=("c8b49c861b577e703200c53cf5e3dfc8c8b11babb39c6b43deec4dc83efff42a")
sha256sums_arm64=("14af5e3815a7876ce60066136560e93cb763617f4a5f87b8ffd2fd87ec5a67ef")
