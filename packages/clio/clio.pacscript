pkgname="clio"
repology=("project: ${gives}")
pkgver="1.0"
pkgdesc="CLI tool that displays facts about Linux, Unix, and computers using bash"
arch=('amd64' 'arm64')
license=('MIT')
maintainer=("Alisha <alishyy@proton.me>")
url="https://github.com/alishyyy/clio"
source=("git+https://github.com/alishyyy/clio.git")
sha256sums=("SKIP") # Git sources typically use SKIP

build() {
  # No build is required as clio is a bash script.
  :
}

package() {
  # Install the main clio script to /usr/bin
  install -Dm755 clio "$pkgdir/usr/bin/clio"

  # Optionally, install the install.sh script
  #install -Dm755 install.sh "$pkgdir/usr/bin/clio-install"
}
