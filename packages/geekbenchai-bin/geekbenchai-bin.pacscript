pkgname="geekbenchai-bin"
gives="geekbenchai"
pkgver="1.7.0"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/GeekbenchAI-${pkgver}-Linux.tar.gz")
pkgdesc="Cross-platform benchmark that evaluates AI workload performance"
arch=('amd64')
sha256sums=("062911d73c45f310e1f2cf3708fccdab371139c75b40e948c36f7863ce027443")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

package() {
  local srcdir
  if [[ -d "${pkgname}~${pkgver}/GeekbenchAI-${pkgver}-Linux" ]]; then
    srcdir="${pkgname}~${pkgver}/GeekbenchAI-${pkgver}-Linux"
  elif [[ -d "${pkgname}~${pkgver}" ]]; then
    srcdir="${pkgname}~${pkgver}"
  elif [[ -d "GeekbenchAI-${pkgver}-Linux" ]]; then
    srcdir="GeekbenchAI-${pkgver}-Linux"
  else
    echo "Could not find extracted GeekbenchAI directory"
    return 1
  fi

  cd "${srcdir}"
  install -Dm755 "banff" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "banff_avx2" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "banff_x86_64" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "banff.plar" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "banff-workload.plar" -t "${pkgdir}/opt/${gives}/"

  for lib in ./*.so*; do
    install -Dm755 "${lib}" -t "${pkgdir}/opt/${gives}/"
  done

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${gives}" << EOF
#!/bin/sh
export LD_LIBRARY_PATH="/opt/${gives}:${LD_LIBRARY_PATH}"
exec "/opt/${gives}/banff" "$@"
EOF
}
