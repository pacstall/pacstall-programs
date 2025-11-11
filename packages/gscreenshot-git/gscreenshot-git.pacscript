pkgname="gscreenshot-git"
gives="gscreenshot"
pkgver="3.11.0"
pkgdesc="Screenshot tool supporting multiple backends"
arch=("any" "amd64" "arm64")
url='https://github.com/thenaterhood/gscreenshot'
license=("GPL-3.0-only")
depends=(
  "python3"
  "python3-pil"
  "scrot"
  "libgtk-3-0"
  "python3-gi"
  "slop"
)
makedepends=(
  "fakeroot"
  "gettext"
  "python3-build"
  "python3-installer"
  "python3-wheel"
  "python3-setuptools"
)
optdepends=(
  "xclip: command line clipboard support"
  "xdg-utils: for opening screenshot files from gscreenshot"
  "pandoc: for generating the manpage at build (or use go-md2man)"
  "go-md2man: for generating the manpage at build (or use pandoc)"
  "slurp: for region selection on Wayland"
  "wl-clipboard: Wayland clipboard support"
  "python3-dbus: required when using the XDG desktop portal backend"
)
conflicts=("${gives}" "${pkgname}")
provides=("${gives}")
source=("https://github.com/thenaterhood/gscreenshot.git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

build() {
  cd "${gives}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
