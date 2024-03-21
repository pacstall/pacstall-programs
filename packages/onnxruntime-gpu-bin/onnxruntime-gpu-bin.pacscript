name="onnxruntime-gpu-bin"
gives="onnxruntime-gpu"
pkgname="onnxruntime-gpu"
_pkgname="onnxruntime"
repology=("project: onnxruntime")
pkgver="1.16.3"
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-gpu-${pkgver}.tgz"
pkgdesc="Cross-platform inference and training machine-learning accelerator with gpu support"
hash="bbdc33367c056029b3ac0c042cbca2236b8f59a3a53b4daf23432ef1d8bf52de"
maintainer="Zahrun <Zahrun@github.com>"
replace=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-1-7-0-bin" "${gives}" "${gives}-bin")
breaks=("onnxruntime-bin" "onnxruntime-1-7-0-bin")

package() {
  sudo install -Dm755 "lib/lib${_pkgname}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm755 "lib/lib${_pkgname}_"* -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
  sudo mkdir -p "${pkgdir}/usr/local/lib"
  sudo ln -sf "/usr/local/lib/lib${_pkgname}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${_pkgname}.so"
}
