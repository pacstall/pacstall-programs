pkgname="endlessh-git"
gives="endlessh"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-bin")
source=(
  "https://github.com/skeeto/endlessh.git"
  "sample-config::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config"
)
sha256sums=(
  "SKIP"
  "f92a2341103a7c6243d7cbc32a3400e0f01ecd5fae12a0731029f6c50ba9f451"
)
arch=("any")
pkgver="1.1"
pkgdesc="SSH tarpit that very slowly sends an endless, random SSH banner"
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "endlessh"
  make -j"${NCPU}"
}

package() {
  cd "endlessh"
  make install DESTDIR="${pkgdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
  install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  install -Dm644 "${srcdir}"/sample-config "${pkgdir}/etc/endlessh/config"
}

# vim:set ft=sh ts=2 sw=2 et:
