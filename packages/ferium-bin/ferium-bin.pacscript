name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.1.10"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-gnu-nogui.zip"
hash="eb87ea75aa7670b2d510487c74cada1ba74a7889bd5c8766c0b7feb5530c1d8a"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 ferium "${STOWDIR}/${name}/usr/bin/${pkgname}"
  # install shell completions
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/bash-completion/completions/ferium"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
