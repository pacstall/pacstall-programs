pkgname="rust-bindgen-git"
gives="bindgen"
pkgver="0.70.1"
pkgdesc="Binding generator for rust language"
arch=('i686' 'x86_64')
url='https://github.com/rust-lang-nursery/rust-bindgen'
pacdeps=('rust-bin')
depends=('clang')
source=("https://github.com/rust-lang-nursery/rust-bindgen.git")
sha512sums=('SKIP')
maintainer=("davius <xdavius@github.com>")
external_connection=true

prepare() {
  cd "${srcdir}/rust-bindgen"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions
}

build() {
  cd "${srcdir}/rust-bindgen"
  cargo build --release

  local _completion="target/release/${gives} --generate-shell-completions"
  ${_completion} bash > "completions/${gives}"
  ${_completion} fish > "completions/${gives}.fish"
  ${_completion} zsh > "completions/_${gives}"

}

package() {
  cd "${srcdir}/rust-bindgen"

  install -D "target/release/bindgen" "${pkgdir}/usr/bin/bindgen"
  install -Dm664 "completions/${gives}" -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm664 "completions/${gives}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_${gives}" -t "${pkgdir}/usr/share/zsh/site-functions/"

  cd "${srcdir}/rust-bindgen/target/release/"

  libbindgen=$(ls libbindgen*.rlib)
  # shellcheck disable=SC2068
  for i in ${libbindgen[@]}; do
    install -D "${i}" "${pkgdir}/usr/lib/${i}"
  done

}
