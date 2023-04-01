name="onnxruntime-bin"
pkgname="onnxruntime"
repology=("project: onnxruntime")
version="1.14.1"
url="https://github.com/microsoft/onnxruntime/releases/download/v${version}/onnxruntime-linux-x64-${version}.tgz"
description="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
hash="010585f534d822bf02d54c7cfc53b57aa3eb0cf34f8fb7503ee519ed18e25d29"
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
