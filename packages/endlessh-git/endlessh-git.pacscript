pkgname="endlessh-git"
gives="endlessh"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-bin")
source=(
  "https://github.com/skeeto/endlessh.git"
  "sample-config::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config"
)
pkgver="1.1"
pkgdesc="SSH tarpit that very slowly sends an endless, random SSH banner"
maintainer=("Elsie19 <elsie19@pm.me>")

prepare() {
  cd "${_archive}"
  # Download sample config
  if [[ "$(sha256sum ${srcdir}/sample-config | cut -d' ' -f 1)" != "f92a2341103a7c6243d7cbc32a3400e0f01ecd5fae12a0731029f6c50ba9f451" ]]; then
    fancy_message error "Checksum for sample config failed"
    return 1
  fi
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
  sudo install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 ${srcdir}/sample-config "${pkgdir}/etc/endlessh/config"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:

sha256sums=(
  "SKIP"
  "SKIP"
)
