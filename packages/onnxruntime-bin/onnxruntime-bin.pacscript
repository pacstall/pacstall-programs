name="onnxruntime-bin"
pkgname="onnxruntime"
repology=("project: onnxruntime")
version="1.15.0"
url="https://github.com/microsoft/onnxruntime/releases/download/v${version}/onnxruntime-linux-x64-${version}.tgz"
description="Cross-platform inference and training machine-learning accelerator"
hash="1b3e88c0ea8e2770e5c9b11a36886097954a642c054b341992dcef268d8bb902"
maintainer="Zahrun <Zahrun@github.com>"

install() {
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
