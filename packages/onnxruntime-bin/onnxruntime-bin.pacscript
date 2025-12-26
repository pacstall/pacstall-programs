pkgname="onnxruntime-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
replaces=("${gives}" "${gives}-bin" "${gives}-1-7-0-bin" "${gives}-gpu" "${gives}-gpu-bin")
arch=("amd64")
pkgver="1.22.0"
source=("@${pkgname}~${pkgver}::https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator"
sha256sums=("8344d55f93d5bc5021ce342db50f62079daf39aaafb5d311a451846228be49b3")
maintainer=("Zahrun <Zahrun@github.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/lib"
  ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so"
}
