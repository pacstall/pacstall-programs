name="endlessh-git"
gives="endlessh"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-bin")
url="https://github.com/skeeto/endlessh.git"
pkgver="1.1"
pkgdesc="SSH tarpit that very slowly sends an endless, random SSH banner"
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  # Download sample config
  wget -q https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config
  if [[ "$(sha256sum sample-config | cut -d' ' -f 1)" != "f92a2341103a7c6243d7cbc32a3400e0f01ecd5fae12a0731029f6c50ba9f451" ]]; then
    fancy_message error "Checksum for sample config failed"
    return 1
  fi
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
  sudo install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 sample-config "${pkgdir}/etc/endlessh/config"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
