name="alacritty-ligatures-git"
pkgname="alacritty"
url="https://github.com/zenixls2/alacritty.git"
breaks="${name} ${name}-bin ${name}-app"
build_depends="cargo cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 gzip"
description="A fast, cross-platform, OpenGL terminal emulator"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
        git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
        git checkout ligature
}

build() {
        cargo build -j"$(nproc)" --release
}

install() {
        sudo install -D target/release/alacritty -t /usr/src/pacstall/"${name}"/usr/bin

        sudo install -D extra/logo/alacritty-term.svg /usr/src/pacstall/"${name}"/usr/share/pixmaps/Alacritty.svg

        sudo install -D extra/linux/Alacritty.desktop -t /usr/src/pacstall/"${name}"/usr/share/applications

        sudo install -D extra/completions/alacritty.bash -t /usr/src/pacstall/"${name}"/usr/share/bash-completion/completions
        sudo install -D extra/completions/alacritty.fish -t /usr/src/pacstall/"${name}"/usr/share/fish/completions
        sudo install -D extra/completions/_alacritty -t /usr/src/pacstall/"${name}"/usr/share/zsh/vendor-completions

        sudo mkdir -p /usr/src/pacstall/"${name}"/usr/local/share/man/man1
        gzip -c extra/alacritty.man | sudo tee /usr/src/pacstall/"${name}"/usr/local/share/man/man1/alacritty.1.gz > /dev/null

        sudo install -D alacritty.yml -t /usr/src/pacstall/"${name}"/usr/doc/share/alacritty
}
# vim:set ft=sh ts=2 sw=2 et:
