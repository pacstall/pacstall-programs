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
pacdeps=("rust-bin")

build() {
  cd "${srcdir}/ghgrab"
  cargo build --release
}

package() {
  cd "${srcdir}/ghgrab"

  install -Dm755 -d "${pkgdir}/usr/bin"

  install -Dm755 "target/release/ghgrab" "${pkgdir}/usr/bin/ghgrab"
}
