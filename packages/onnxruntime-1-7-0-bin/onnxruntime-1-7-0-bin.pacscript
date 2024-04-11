pkgname="onnxruntime-1-7-0-bin"
gives="onnxruntime"
pkgver="1.7.0"
replaces=("${gives}" "${gives}-bin" "${gives}-gpu" "${gives}-gpu-bin")
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
pkgdesc="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
sha256sums=("0345f45f222208344406d79a6db3280ed2ccc884dc1e064ce6e6951ed4c70606")
maintainer=("Zahrun <Zahrun@github.com>")

package() {
  cd "${_archive}"
  install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/lib"
  ln -s "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so"
}
