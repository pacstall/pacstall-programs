pkgname="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer=("lfromanini <lfromanini@yahoo.com>")
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.6"
source=("https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb")

sha256sums_amd64=("e26117e6ef010f010dbe47cef4f5f72faa6a96dfd8cc723ce535d0614c16bb78")
sha256sums_arm64=("308928793a0b9dff52d98cddd1c96837dd7107dcdaece7641580085774cd1fab")
