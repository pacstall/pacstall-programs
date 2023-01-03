name="fselect-git"
pkgname="fselect"
gives="fselect"
build_depends="cargo rustc"
description="Find files with SQL-like queries"
url="https://github.com/jhspetersson/fselect.git"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
pkgver() {
	git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
	cargo build -j$(nproc) --release --locked
}

install() {
	sudo install -Dm755 target/release/fselect -t "${pkgdir}"/usr/bin
}
