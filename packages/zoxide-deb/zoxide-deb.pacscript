pkgname="zoxide-deb"
gives="zoxide"
pkgdesc="A smarter cd command. Supports all major shells."
maintainer=("lfromanini <lfromanini@yahoo.com>")
repology=("project: zoxide")
arch=("amd64" "arm64")
pkgver="0.9.5"
source=("https://github.com/ajeetdsouza/zoxide/releases/download/v${pkgver}/zoxide_${pkgver}-1_${CARCH}.deb")

sha256sums_amd64=("2175b8df1f6e83f74d0eb7812f8697d66dfb6363ae92e6e9a975791a3aad6bc0")
sha256sums_arm64=("6ef41e82ba2e7399dc33b67e78065dbde3f2e0544ca56dad743b2e20b69dc833")
