name="bat"
version="0.18.1"
url="https://github.com/sharkdp/bat/archive/refs/tags/v${version}.tar.gz"
build_depends="cargo"
replace="bat"
description="A cat(1) clone with wings"
hash="ab5246c3bec8745c14ca9a0473971f00fbce2fdc1ce7842e0a96676ee5eac2af"
maintainer="Orphaned"
prepare() {
        true
}

build() {
        cargo build --release
}

install() {
        sudo install -D target/release/bat -t /usr/src/pacstall/${name}/usr/bin

        sudo install -D target/release/build/bat-*/out/assets/completions/bat.fish -t /usr/src/pacstall/${name}/usr/share/fish/completions
        sudo install -D target/release/build/bat-*/out/assets/completions/bat.zsh /usr/src/pacstall/${name}/usr/share/zsh/vendor-completions/_bat

        sudo mkdir -p /usr/src/pacstall/${name}/usr/local/share/man/man1
        gzip -c target/release/build/bat-*/out/assets/manual/bat.1 | sudo tee /usr/src/pacstall/${name}/usr/local/share/man/man1/${name}.1.gz >/dev/null
}
