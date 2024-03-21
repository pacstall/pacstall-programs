name="onnxruntime-1-7-0-bin"
pkgname="onnxruntime"
pkgver="1.7.0"
replace=("${pkgname}" "${pkgname}-bin" "${pkgname}-gpu" "${pkgname}-gpu-bin")
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
pkgdesc="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
hash="0345f45f222208344406d79a6db3280ed2ccc884dc1e064ce6e6951ed4c70606"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "lib/lib${pkgname}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
  sudo mkdir -p "${pkgdir}/usr/local/lib"
  sudo ln -s "/usr/local/lib/lib${pkgname}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${pkgname}.so"
}

post_install() {
  sudo rm -f "/usr/local/lib/lib${pkgname}.so" 2> /dev/null
}
