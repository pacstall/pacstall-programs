name="tgpt-bin"
gives="tgpt"
pkgver="2.7.3"
pkgdesc="AI chatbots in terminal without needing API keys"
arch=("amd64" "arm64" "i386")
homepage='https://github.com/aandrew-me/tgpt'
url="https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/${gives}-linux-${CARCH}"
case "${CARCH}" in
  amd64)
    hash="2d23406201b42c01ff1d7a9add89089cff40535adf0d585002fafcd39c34389a"
    ;;
  arm64)
    hash="d7d5db3cc9238c25df8d2af48ff791dbc5714b0141192a6366267b7fd9a3f55d"
    ;;
  armhf)
    url="${url/armhf/arm}"
    hash="6d6bc35482c2f487986c1840fd8d64011e7b43a4f432b6a5c6747758b29fdac9"
    ;;
  i386)
    hash="3b8fc616680330f4c34f2a787d7187ccbfee606f06616d8d54ff055115216815"
    ;;
  *) ;;
esac

package() {
    sudo install -Dm755 "${gives}-linux-${CARCH}" "${pkgdir}/usr/bin/${gives}"
}
