name="onnxruntime-1-7-0-bin"
pkgname="onnxruntime"
version="1.7.0"
url="https://github.com/microsoft/onnxruntime/releases/download/v${version}/onnxruntime-linux-x64-${version}.tgz"
depends=""
description="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
hash="0345f45f222208344406d79a6db3280ed2ccc884dc1e064ce6e6951ed4c70606"
maintainer="Zahrun <Zahrun@github.com>"
prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "lib/lib${pkgname}.so.${version}" -t "$STOWDIR/$name/usr/local/lib"
  cd $STOWDIR/$name/usr/local/lib
  sudo rm "lib${pkgname}.so" 2> /dev/null
  sudo ln -s "./lib${pkgname}.so.${version}" "lib${pkgname}.so"
  cd - > /dev/null
  rm lib/*
  sudo install -Dm644 include/* -t "$STOWDIR/$name/usr/local/include"
  sudo install -Dm644 LICENSE -t "$STOWDIR/$name/usr/share/licenses/$name"
}
