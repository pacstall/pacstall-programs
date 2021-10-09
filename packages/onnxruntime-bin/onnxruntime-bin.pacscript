name="onnxruntime-bin"
pkgname="onnxruntime"
version="1.9.0"
url="https://github.com/microsoft/onnxruntime/releases/download/v1.9.0/onnxruntime-linux-x64-${version}.tgz"
depends=""
description="ONNX Runtime is a cross-platform inference and training machine-learning accelerator."
hash="f386ab80e9d6d41f14ed9e61bff4acc6bf375770691bc3ba883ba0ba3cabca7f"
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
	sudo ln -s "./lib${pkgname}.so.${version}" "lib${pkgname}.so"
	cd -
	rm lib/*
	sudo install -Dm644 include/* -t "$STOWDIR/$name/usr/local/include"
	sudo install -Dm644 LICENSE -t "$STOWDIR/$name/usr/share/licenses/$name"
}
