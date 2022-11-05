if [[ "$(grep -Po 'ID=\K[^"]+' /etc/os-release)" == "debian" ]]; then
    fancy_message error "This script doesn't work on Debian"
    cleanup # Trigger pacstall cleanups
    exit 1
fi

name="alacritty"
version="0.11.0"
repology=("project: alacritty")
url="https://github.com/alacritty/alacritty/archive/refs/tags/v${version}.tar.gz"
build_depends="cargo cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 gzip"
description="A fast, cross-platform, OpenGL terminal emulator"
maintainer="Warofzen <warofzen1@protonmail.com>"
hash="0fb3370c662f5b87d1b9a487aef999195212b192e08f6f68a572fed8fd637e07"
prepare() {
        true
}

build() {
        cargo build -j$(nproc) --release
}

install() {
        sudo install -D target/release/alacritty -t /usr/src/pacstall/${name}/usr/bin

        sudo install -D extra/logo/alacritty-term.svg /usr/src/pacstall/${name}/usr/share/pixmaps/Alacritty.svg

        sudo install -D extra/linux/Alacritty.desktop -t /usr/src/pacstall/${name}/usr/share/applications

        sudo install -D extra/completions/alacritty.bash -t /usr/src/pacstall/${name}/usr/share/bash-completion/completions
        sudo install -D extra/completions/alacritty.fish -t /usr/src/pacstall/${name}/usr/share/fish/completions
        sudo install -D extra/completions/_alacritty -t /usr/src/pacstall/${name}/usr/share/zsh/vendor-completions

        sudo mkdir -p /usr/src/pacstall/${name}/usr/local/share/man/man1
        gzip -c extra/alacritty.man | sudo tee /usr/src/pacstall/${name}/usr/local/share/man/man1/alacritty.1.gz > /dev/null

        sudo install -D alacritty.yml -t /usr/src/pacstall/${name}/usr/doc/share/alacritty
}
