pkgname="onnxruntime-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
replaces=("${gives}" "${gives}-bin" "${gives}-1-7-0-bin" "${gives}-gpu" "${gives}-gpu-bin")
arch=("amd64")
pkgver="1.17.1"
source=("@${pkgname}~${pkgver}::https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator"
sha256sums=("89b153af88746665909c758a06797175ae366280cbf25502c41eb5955f9a555e")
maintainer=("Zahrun <Zahrun@github.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/lib"
  ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so"
}
