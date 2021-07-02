maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

name="rust-analyzer"
_version=2021-06-28
version=${_version//-}
url="https://github.com/rust-analyzer/rust-analyzer/archive/refs/tags/${_version}.tar.gz"
breaks="rust-analyzer rust-analyzer-git"
description="Experimental Rust compiler front-end for IDEs"
build_depends="cargo"
hash="a281bab5e119134fc563b37acc9a70bc14b611cff4ae0574650d5802b2716ccf"
removescript="yes"


prepare() {
    true
}

build() {
    cargo build --release --locked
}

install() {
    pkgdir="/usr/src/pacstall/$name"

    sudo install -Dt "${pkgdir}"/usr/bin target/release/rust-analyzer
    sudo install -Dm644 -t "${pkgdir}"/usr/share/licenses/$name LICENSE-MIT
}

removescript() {
    sudo rm -rf "/usr/share/licenses/$name"
}
