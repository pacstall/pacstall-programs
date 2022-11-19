name="helix"
version="22.08.1"
repology=("project: helix")
url="https://github.com/helix-editor/helix/archive/refs/tags/${version}.tar.gz"
build_depends="cargo git"
description="A post-modern modal text editor"
maintainer="Marcin Puc <tranzystorek.io@protonmail.com>"
hash="c9b184d53bab51e7a9fe81dc8c191a853177abba67ea408e968937f31b50b45a"

build() {
    cargo build -j"$(nproc)" --release --locked
}

install() {
    sudo install -Dm755 target/release/hx -t "${pkgdir}/usr/lib/${name}"

    printf '#!/bin/sh\nHELIX_RUNTIME=/usr/lib/helix/runtime exec /usr/lib/helix/hx "$@"\n' > hx
    sudo install -Dm755 hx -t "${pkgdir}/usr/bin"

    rm -f runtime/grammars/.gitkeep
    rm -f runtime/themes/README.md
    rm -rf runtime/grammars/sources
    sudo mkdir -p "${pkgdir}/usr/lib/${name}"
    sudo cp -r runtime "${pkgdir}/usr/lib/${name}/"

    sudo install -Dm644 contrib/helix.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    sudo install -Dm644 contrib/Helix.desktop -t "${pkgdir}/usr/share/applications"

    sudo install -Dm644 contrib/completion/hx.bash "${pkgdir}/usr/share/bash-completion/completions/hx"
    sudo install -Dm644 contrib/completion/hx.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    sudo install -Dm644 contrib/completion/hx.zsh "${pkgdir}/usr/share/zsh/vendor-completions/_hx"
}
