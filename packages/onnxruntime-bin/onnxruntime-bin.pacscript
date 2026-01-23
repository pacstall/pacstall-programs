pkgname="onnxruntime-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
replaces=("${gives}" "${gives}-bin" "${gives}-1-7-0-bin" "${gives}-gpu" "${gives}-gpu-bin")
arch=("amd64")
pkgver="1.22.0"
source=("@${pkgname}~${pkgver}::https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator"
sha256sums=("8344d55f93d5bc5021ce342db50f62079daf39aaafb5d311a451846228be49b3")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm755 "lib/lib${gives}_*.so" -t "${pkgdir}/usr/local/lib"
  cp -r lib/cmake lib/pkgconfig "${pkgdir}/usr/local/lib/"
  sed -i s^/lib64^/lib^g \
    "${pkgdir}/usr/local/lib/cmake/${gives}/${gives}Targets-release.cmake" \
    "${pkgdir}/usr/local/lib/pkgconfig/lib${gives}.pc"
  mkdir -p "${pkgdir}/usr/local/include/${gives}"
  cp -r include/* "${pkgdir}/usr/local/include/${gives}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so"
  ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${gives}.so.1"
}
