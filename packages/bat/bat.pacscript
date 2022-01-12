name="bat"
version="0.19.0"
url="https://github.com/sharkdp/bat/archive/refs/tags/v${version}.tar.gz"
build_depends="cargo"
replace="bat"
description="A cat(1) clone with wings"
hash="6A920CAD1E7AE069EB9393F5B6883E0A7F2C957186B1075976331DAAA5E0468A"
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
        gzip -c target/release/build/bat-*/out/assets/manual/bat.1 | sudo tee /usr/src/pacstall/${name}/usr/local/share/man/man1/${name}.1.gz > /dev/null
}
