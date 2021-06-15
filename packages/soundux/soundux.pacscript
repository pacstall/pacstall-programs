name="soundux"
pkgdir="/usr/src/pacstall/$name"
version="0.2.7"
url="https://github.com/Soundux/Soundux/releases/download/$version/soundux-$version.tar.gz"
build_depends="cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev"
description="A cross-platform soundboard"
hash="017003fc96f49df30575975f3904c0d8a500e325a9d2bca8c3dc69fed0cab0a7"
maintainer="D3SOX <d3sox@protonmail.com>"
removescript="yes"

_ubuntuver=$(grep "VERSION_ID=" /etc/os-release | grep -o "[0-9]*" | tr -d '[:space:]')
if [ $_ubuntuver -ge 2010 ]; then
  depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio libpipewire-0.3-dev"
else
  depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio"
  pacdeps=("pipewire")
fi

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
  
  # install doc
  sudo install -Dm 644 -t "$pkgdir/usr/share/doc/$name" "../README.md"
  # install license
  sudo install -Dm 644 -t "$pkgdir/usr/share/licenses/$name" "../LICENSE"
}

removescript() {
    sudo rm -rf "/usr/share/doc/$name"
    sudo rm -rf "/usr/share/licenses/$name"
}
