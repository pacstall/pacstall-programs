pkgname=("ly-git")
repology=("project: ly")
arch=('any')
pkgver="1.0.2"
url='https://github.com/fairyglade/ly'
source=(
  "https://github.com/fairyglade/ly.git"
  "pam_path-fix.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
depends=("systemd")
makedepends=("build-essential" "libpam0g-dev" "libxcb-xkb-dev")
pacdeps=("zig-bin")
gives="ly"
conflicts=("${gives}")
replaces=("lightdm" "sddm")
pkgdesc="TUI display manager"
priority='required'
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('WTFPL')
external_connection=true

prepare() {
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc"
}

build() {
  cd "ly"

  # See: https://github.com/fairyglade/ly/pull/725
  patch build.zig "${srcdir}"/pam_path-fix.patch

  zig build
}

package() {
  cd "ly"
  zig build -Ddest_directory="${pkgdir}" installsystemd
}

post_install() {
  systemctl enable ly.service
  systemctl disable getty@tty2.service
}
