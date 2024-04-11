pkgname="onnxruntime-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
replaces=("${gives}" "${gives}-bin" "${gives}-1-7-0-bin" "${gives}-gpu" "${gives}-gpu-bin")
pkgver="1.16.3"
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator"
sha256sums=("b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e")
maintainer=("Zahrun <Zahrun@github.com>")

package() {
  cd "${_archive}"
  install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/lib"
  ln -s "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so"
}
