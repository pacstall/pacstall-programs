name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.1.7"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-gnu-nogui.zip"
hash="66d566df3ce6d7e2047dddee7357be4a13f37a79b1a4e03d6aef36bca30108a1"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 ferium "${STOWDIR}/${name}/usr/bin/${pkgname}"
  # install completions
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/bash-completion/completions/ferium"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/zsh/site-functions/_ferium"
}

# vim:set ft=sh ts=2 sw=2 et:
