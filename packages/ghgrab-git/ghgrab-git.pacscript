pkgname="ghgrab-git"
gives="ghgrab"
pkgdesc="Simple, pretty terminal tool that lets you browse and download files from GitHub, GitLab, Codeberg, Gitea, and Forgejo without leaving your CLI"
url='https://ghgrab.readthedocs.io/'
maintainer=("CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>")
pkgver="2.0.2"
arch=('amd64' 'arm64')
license=('MIT')
source=("git+https://github.com/abhixdd/ghgrab.git")
external_connection=true
_min_cargo='1.88'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup")

build() {
  cd "${srcdir}/ghgrab"
  export CARGO_HOME="${srcdir}/cargo-cache"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${srcdir}/ghgrab"
  install -Dm755 "target/release/ghgrab" -t "${pkgdir}/usr/bin"
}
