name="soundux"
version="0.2.7"
url="https://github.com/Soundux/Soundux/releases/download/${version}/soundux-${version}.tar.gz"
build_depends="cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev libpipewire-0.3-dev"
description="A cross-platform soundboard"
hash="017003fc96f49df30575975f3904c0d8a500e325a9d2bca8c3dc69fed0cab0a7"
maintainer="D3SOX <d3sox@protonmail.com>"
# libindicator3-dev does not exist on debian
incompatible=('debian:*')
repology=("project: soundux")

build() {
    mkdir -p build
    cd build || exit 1
    cmake ..
    cmake --build . --config Release -j"$(nproc)"
}

install() {
    cd build/
    sudo make install DESTDIR="${pkgdir}"

    # install doc
    sudo install -Dm 644 -t "${pkgdir}/usr/share/doc/${name}" "../README.md"
    # install license
    sudo install -Dm 644 -t "${pkgdir}/usr/share/licenses/${name}" "../LICENSE"
}

removescript() {
    sudo rm -rf "/usr/share/doc/${name}"
    sudo rm -rf "/usr/share/licenses/${name}"
}
