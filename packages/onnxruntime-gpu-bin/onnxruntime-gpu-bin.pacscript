name="onnxruntime-gpu-bin"
gives="onnxruntime"
repology=("project: onnxruntime")
pkgver="1.16.1"
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-gpu-${pkgver}.tgz"
pkgdesc="Cross-platform inference and training machine-learning accelerator with gpu support"
hash="474d5d74b588d54aa3e167f38acc9b1b8d20c292d0db92299bdc33a81eb4492d"
maintainer="Zahrun <Zahrun@github.com>"
replace=("onnxruntime")
breaks=("onnxruntime-bin" "onnxruntime-1-7-0-bin")

package() {
  sudo install -Dm755 "lib/lib${gives}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm755 "lib/lib${gives}_"* -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

post_install() {
  sudo rm -f "/usr/local/lib/lib${gives}.so"
  sudo ln -sf "/usr/local/lib/lib${gives}.so.${pkgver}" "/usr/local/lib/lib${gives}.so"
}

post_remove() {
  sudo rm -f "/usr/local/lib/lib${gives}.so"
}
