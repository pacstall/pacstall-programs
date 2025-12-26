pkgname="gradience-git"
pkgver="0.8.0-beta2"
pkgdesc="Change the look of Adwaita, with ease"
arch=('amd64' 'arm64')
url='https://github.com/GradienceTeam/Gradience'
license=('GPL-3.0-or-later')
depends=('libadwaita-1-0' 'libsoup-3.0-0' 'gettext' 'python3-gi' 'python3-lxml' 'python3-pil' 'python3-pluggy' 'python3-svglib' 'python3-yapsy' 'python3-regex' 'libportal-gtk4-1' 'python3-cssutils' 'python3-jinja2' 'python3-libsass')
makedepends=('meson' 'gobject-introspection' 'sassc' 'python-gi-dev' 'libsoup-3.0-dev' 'libadwaita-1-dev' 'libportal-gtk4-dev' "${depends[@]}")
checkdepends=('appstream' 'appstream-util')
pacdeps=('blueprint-compiler' 'adw-gtk-theme' 'python3-anyascii' 'python3-material-color-utilities')
pacdeps_noble=('python3-zombie-imp')
pacdeps_oracular=("${pacdeps_noble[@]}")
pacdeps_trixie=("${pacdeps_noble[@]}")
pacdeps_sid=("${pacdeps_noble[@]}")
pacdeps_devel=("${pacdeps_noble[@]}")
source=("${url}.git")
maintainer=("Oren Klopfer <oren@taumoda.com>")
external_connection=true

build() {
  meson "Gradience" build --prefix=/usr --buildtype=release
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
