pkgname="tgpt-bin"
gives="tgpt"
pkgver="2.7.3"
pkgdesc="AI chatbots in terminal without needing API keys"
arch=("amd64" "arm64" "armhf" "i386")
url='https://github.com/aandrew-me/tgpt'
source=("https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/${gives}-linux-${CARCH/armhf/arm}")
sha256sums_amd64=("2d23406201b42c01ff1d7a9add89089cff40535adf0d585002fafcd39c34389a")
sha256sums_arm64=("d7d5db3cc9238c25df8d2af48ff791dbc5714b0141192a6366267b7fd9a3f55d")
sha256sums_armhf=("6d6bc35482c2f487986c1840fd8d64011e7b43a4f432b6a5c6747758b29fdac9")
sha256sums_i386=("3b8fc616680330f4c34f2a787d7187ccbfee606f06616d8d54ff055115216815")

package() {
  cd "${srcdir}"
  install -Dm755 "${gives}-linux-${CARCH}" "${pkgdir}/usr/bin/${gives}"
}
