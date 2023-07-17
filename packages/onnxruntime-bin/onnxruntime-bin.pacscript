name="onnxruntime-bin"
pkgname="onnxruntime"
repology=("project: onnxruntime")
version="1.15.1"
url="https://github.com/microsoft/onnxruntime/releases/download/v${version}/onnxruntime-linux-x64-${version}.tgz"
description="Cross-platform inference and training machine-learning accelerator"
hash="5492f9065f87538a286fb04c8542e9ff7950abb2ea6f8c24993a940006787d87"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "lib/lib${pkgname}.so.${version}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

postinst() {
  sudo rm -f "/usr/local/lib/lib${pkgname}.so"
  sudo ln -sf "/usr/local/lib/lib${pkgname}.so.${version}" "/usr/local/lib/lib${pkgname}.so"
}

removescript() {
  sudo rm -f "/usr/local/lib/lib${pkgname}.so"
}
