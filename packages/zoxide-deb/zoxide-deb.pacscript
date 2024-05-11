pkgname="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer=("lfromanini <lfromanini@yahoo.com>")
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.4"
source=("https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb")

sha256sums_amd64=("81b7a762bcb8f789dfde4cac78ac34a406c6f79763f3669efbd60f65d013b2e1")
sha256sums_arm64=("575f520691dfd9acc1b280b0ca47f44f49bd004763b61abfb3da36f211d88215")
