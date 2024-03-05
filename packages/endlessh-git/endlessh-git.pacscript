name="endlessh-git"
pkgname="endlessh"
gives="endlessh"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-bin")
source=(
  "https://github.com/skeeto/endlessh.git"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config"
)
hash=(
  "SKIP"
  "f92a2341103a7c6243d7cbc32a3400e0f01ecd5fae12a0731029f6c50ba9f451"
)
pkgver="1.1"
pkgdesc="SSH tarpit that very slowly sends an endless, random SSH banner"
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  sudo install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 sample-config "${pkgdir}/etc/endlessh/config"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
