pkgname="onnxruntime-gpu-bin"
gives="onnxruntime-gpu"
repology=("project: onnxruntime")
arch=("amd64")
pkgver="1.22.0"
source=("@${pkgname}~${pkgver}::https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-gpu-${pkgver}.tgz")
pkgdesc="Cross-platform inference and training machine-learning accelerator with gpu support"
sha256sums=("2a19dbfa403672ec27378c3d40a68f793ac7a6327712cd0e8240a86be2b10c55")
maintainer=("Zahrun <zahrunAtmurenaDotio>")
replaces=("${gives}-1-7-0-bin" "${gives}" "${gives}-bin")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lib/libonnxruntime.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  install -Dm755 "lib/libonnxruntime_"* -t "${pkgdir}/usr/local/lib"
  cp -r lib/cmake lib/pkgconfig "${pkgdir}/usr/local/lib/"
  sed -i s^/lib64^/lib^g \
    "${pkgdir}/usr/local/lib/cmake/onnxruntime/onnxruntimeTargets-release.cmake" \
    "${pkgdir}/usr/local/lib/pkgconfig/libonnxruntime.pc"
  mkdir -p "${pkgdir}/usr/local/include/onnxruntime"
  cp -r include/* "${pkgdir}/usr/local/include/onnxruntime/"
  install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf "/usr/local/lib/libonnxruntime.so.${pkgver}" "${pkgdir}/usr/local/lib/libonnxruntime.so"
  ln -sf "/usr/local/lib/libonnxruntime.so.${pkgver}" "${pkgdir}/usr/local/lib/libonnxruntime.so.1"
}
