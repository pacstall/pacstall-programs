name="onnxruntime-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
pkgver="1.16.1"
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
pkgdesc="Cross-platform inference and training machine-learning accelerator"
hash="53a0f03f71587ed602e99e82773132fc634b74c2d227316fbfd4bf67181e72ed"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

post_install() {
  sudo rm -f "/usr/local/lib/lib${gives}.so"
  sudo ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "/usr/local/lib/lib${gives}.so"
}

post_remove() {
  sudo rm -f "/usr/local/lib/lib${gives}.so"
}
