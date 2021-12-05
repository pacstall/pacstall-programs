name="topgrade-bin"
pkgname="topgrade"
version="7.1.0"
url="https://github.com/r-darwish/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="f2f61d5833030ff545dedd42a65d7d75e510017de5748da3dd6a9bd6fb32ff52"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "$pkgname" -t "$STOWDIR/$name/usr/bin"
}
