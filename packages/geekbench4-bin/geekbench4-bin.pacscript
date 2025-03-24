pkgname="geekbench4-bin"
gives="geekbench4"
pkgver="4.4.4"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Legacy version. Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64' 'i386')
sha256sums=("295b01134b9e59ec26a1563fbf3c57dac2a1453ce2b723cd47ec264f06415a22")
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/opt/${gives}/"
  # only install the appropriate binary
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm755 "geekbench_x86_64" -t "${pkgdir}/opt/${gives}/"
  else
    install -Dm755 "geekbench_x86_32" -t "${pkgdir}/opt/${gives}/"
  fi
  install -Dm644 "geekbench.plar" -t "${pkgdir}/opt/${gives}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/${gives}" "${pkgdir}/usr/bin/${gives}"
}
