name="onnxruntime-1-7-0-bin"
gives="onnxruntime"
pkgver="1.7.0"
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
pkgdesc="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
hash="0345f45f222208344406d79a6db3280ed2ccc884dc1e064ce6e6951ed4c70606"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

post_install() {
  sudo rm -f "/usr/local/lib/lib${gives}.so" 2> /dev/null
  sudo ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "/usr/local/lib/lib${gives}.so"
}

post_remove() {
  sudo rm -f "/usr/local/lib/lib${gives}.so"
}
