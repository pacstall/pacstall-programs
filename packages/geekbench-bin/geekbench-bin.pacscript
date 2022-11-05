name="geekbench-bin"
gives="geekbench"
version="5.4.5"
url="https://cdn.geekbench.com/Geekbench-${version}-Linux.tar.gz"
description="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
hash="240f5bbd16fcbb4a86e99b1047da89df2695f678bf324756a3dc51b663e9f762"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "${gives}5" -t "$STOWDIR/$name/opt/$gives"
  sudo install -Dm755 "${gives}_x86_64" -t "$STOWDIR/$name/opt/$gives"
  sudo install -Dm644 "${gives}.plar" -t "$STOWDIR/$name/opt/$gives/"
  sudo mkdir -p "$STOWDIR/$name/usr/bin"
}

postinst() {
  sudo ln -s "/opt/$gives/${gives}5" "/usr/bin/${gives}5"
}

removescript() {
  sudo rm -f "/usr/bin/${gives}5"
}
