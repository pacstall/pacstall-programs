name="endlessh-git"
pkgname="endlessh"
gives="endlessh"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-bin")
url="https://github.com/skeeto/endlessh.git"
description="SSH tarpit that very slowly sends an endless, random SSH banner"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

prepare() {
  # Download sample config
  wget -q https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config
  if [[ "$(sha256sum sample-config | cut -d' ' -f 1)" != "f92a2341103a7c6243d7cbc32a3400e0f01ecd5fae12a0731029f6c50ba9f451" ]]; then
    fancy_message error "Checksum for sample config failed"
    return 1
  fi
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  sudo install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 sample-config "${pkgdir}/etc/endlessh/config"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
