pkgname="onnxruntime-gpu-bin"
gives="onnxruntime-gpu"
repology=("project: onnxruntime")
pkgver="1.16.3"
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-gpu-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator with gpu support"
sha256sums=("bbdc33367c056029b3ac0c042cbca2236b8f59a3a53b4daf23432ef1d8bf52de")
maintainer=("Zahrun <Zahrun@github.com>")
replaces=("${_gives}" "${_gives}-bin" "${_gives}-1-7-0-bin" "${gives}" "${gives}-bin")

package() {
  cd "${_archive}"
  install -Dm755 "lib/lib${_gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm755 "lib/lib${_gives}_"* -t "${pkgdir}/usr/local/lib"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/lib"
  ln -s "/usr/local/lib/lib${_gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${_gives}.so"
}
