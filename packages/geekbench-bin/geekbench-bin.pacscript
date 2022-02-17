name="geekbench-bin"
gives="geekbench"
version="5.4.4"
url="https://cdn.geekbench.com/Geekbench-${version}-Linux.tar.gz"
description="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
hash="da489a3fb57f7460c78984eabd513001a00cad2a0bcd8b6f478860b46ea25284"

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
  cd "$STOWDIR/$name/usr/bin"
  if [[ -f "${gives}5" ]]; then
    sudo rm "${gives}5"
  fi
  sudo ln -s "../../opt/$gives/${gives}5" "${gives}5"
}
