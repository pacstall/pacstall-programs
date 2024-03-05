name="geekbench-bin"
gives="geekbench"
pkgver="5.4.5"
source=("https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64')
hash=("240f5bbd16fcbb4a86e99b1047da89df2695f678bf324756a3dc51b663e9f762")

package() {
  sudo install -Dm755 "${gives}5" -t "${pkgdir}/opt/${gives}"
  sudo install -Dm755 "${gives}_x86_64" -t "${pkgdir}/opt/${gives}"
  sudo install -Dm644 "${gives}.plar" -t "${pkgdir}/opt/${gives}/"
  sudo mkdir -p "${pkgdir}/usr/bin"
}

post_install() {
  sudo ln -s "/opt/${gives}/${gives}5" "/usr/bin/${gives}5"
}

post_remove() {
  sudo rm -f "/usr/bin/${gives}5"
}
