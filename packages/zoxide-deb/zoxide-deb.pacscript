pkgname="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer=("lfromanini <lfromanini@yahoo.com>")
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.9"
source=("https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb")

sha256sums_amd64=("5ab14485571b00a2cd0d1f2e910f6bcd57ab4da59e4c9e974a9530c3d8ba23a3")
sha256sums_arm64=("6ed2562bb8fad59e794ae5ea43eef9c5c61627744a3cc4cb93b75f56246d9338")
