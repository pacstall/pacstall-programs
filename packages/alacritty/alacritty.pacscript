name="alacritty"
version="0.7.2"
url="https://github.com/alacritty/alacritty/archive/refs/tags/v${version}.tar.gz"
build_depends="cargo cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 gzip"
description="A fast, cross-platform, OpenGL terminal emulator"
hash="750c294d384d23f1dfc30e9105380e4194507b0828ac91d8ffd94c9bbc18d6c3"
prepare() {
        true
}

build() {
        cargo build --release
}

install() {
        sudo mkdir -p /usr/src/pacstall/${name}/usr/bin
        sudo mv target/release/alacritty /usr/src/pacstall/${name}/usr/bin

        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/pixmaps
        sudo mv extra/logo/alacritty-term.svg /usr/src/pacstall/${name}/usr/share/pixmaps/Alacritty.svg

        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/applications
        sudo mv extra/linux/Alacritty.desktop /usr/src/pacstall/${name}/usr/share/applications

        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/bash-completion/completions
        sudo mv extra/completions/alacritty.bash /usr/src/pacstall/${name}/usr/share/bash-completion/completions

        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/fish/completions
        sudo mv extra/completions/alacritty.fish /usr/src/pacstall/${name}/usr/share/fish/completions

        sudo mkdir -p /usr/src/pacstall/${name}/usr/share/zsh/vendor-completions
        sudo mv extra/completions/_alacritty /usr/src/pacstall/${name}/usr/share/zsh/vendor-completions

        sudo mkdir -p /usr/src/pacstall/${name}/usr/local/share/man/man1
        gzip -c extra/alacritty.man | sudo tee /usr/src/pacstall/${name}/usr/local/share/man/man1/alacritty.1.gz >/dev/null

        sudo mkdir -p /usr/src/pacstall/${name}/usr/doc/share/alacritty
        sudo mv alacritty.yml /usr/src/pacstall/${name}/usr/doc/share/alacritty
}
