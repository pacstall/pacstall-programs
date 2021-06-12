name="soundux"
pkgdir="/usr/src/pacstall/$name"
version="0.2.7"
url="https://github.com/Soundux/Soundux/releases/download/$version/soundux-$version.tar.gz"
build_depends="cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev"
depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio"
description="A cross-platform soundboard"
hash="017003fc96f49df30575975f3904c0d8a500e325a9d2bca8c3dc69fed0cab0a7"
maintainer="D3SOX <d3sox@protonmail.com>"
pacdeps=("pipewire")

prepare() {
  true
}

build() {
  mkdir -p build
  cd build
  cmake ..
  cmake --build . --config Release -j$(nproc)
}

install() {
  sudo make install DESTDIR="$pkgdir"
  # install binary symlink
  mkdir -p "$pkgdir/usr/bin/"
  ln -sf /opt/soundux/soundux "$pkgdir/usr/bin/soundux"
  
  # install doc
  install -Dm 644 -t "$pkgdir/usr/share/doc/$name" "../README.md"
  # install license
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$name" "../LICENSE"
}
