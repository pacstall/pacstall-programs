pkgname="gradience"
pkgver="0.4.1-patch1"
pkgdesc="Change the look of Adwaita, with ease"
arch=('amd64' 'arm64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL-3.0-or-later')
depends=('libadwaita-1-0' 'libsoup-3.0-0' 'python3-gi' 'python3-anyascii' 'python3-lxml' 'python3-pil' 'python3-pluggy' 'python3-svglib' 'python3-yapsy' 'python3-regex' 'python3-material-color-utilities' 'libportal-gtk4-1' 'python3-cssutils' 'python3-jinja2')
makedepends=('meson' 'gobject-introspection' 'sassc' 'python3-gi-dev' 'libsoup-3.0-dev' 'libadwaita-1-dev' 'libportal-gtk4-dev')
checkdepends=('appstream')
pacdeps=('blueprint-compiler' 'adw-gtk-theme')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
maintainer=("Oren Klopfer <oren@taumoda.com>")
b2sums=('ca16dacd9c5c4af901a5e289d11aafa0a581f43477ea473d06e92a17582b6e397de60ab2e52036602e4028b0fde688a5511c6b7ba0577c08c03a6ed50e04383d')

build() {
  meson "Gradience-${pkgver}" build --buildtype=release
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

post_install() {
  echo ""
  echo "Setup Tutorial"
  echo ""
  echo "For Flatpak Libadwaita applications, you need to override their permissions:"
  echo "sudo flatpak override --filesystem=xdg-config/gtk-4.0"
  echo ""
  echo "For Flatpak applications, you need to override their permissions:"
  echo "sudo flatpak override --filesystem=xdg-config/gtk-3.0"
  echo ""
  echo "============================================================================="
  echo "Please don't report theming issue to upstream, open an issue in the Gradience"
  echo "repo instead (https://github.com/GradienceTeam/Gradience/issues/new/choose)"
  echo "============================================================================="
}
