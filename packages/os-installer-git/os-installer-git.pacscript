name="os-installer-git"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
gives="os-installer"
pkgdesc="A generic and changable os-installer"
url="https://gitlab.gnome.org/p3732/os-installer.git"
pkgver="0.3"
depends=("libgnome-desktop-4-2" "libadwaita-1-0" "libgweather-4-0" "python3-yaml" "libudisks2-0" "libvte-2.91-gtk4-0" "gir1.2-gnomedesktop-4.0" "gir1.2-vte-3.91")
makedepends=("meson" "gettext" "libgnome-desktop-4-dev" "libadwaita-1-dev" "libgweather-4-dev" "python3-yaml" "libudisks2-dev" "libvte-2.91-gtk4-dev")
breaks=("${gives}-bin" "${gives}" "${gives}-commit")
optdepends=("gnome-disk-utility: Default disk CMD if not set"
  "epiphany-browser: Default browser CMD if not set"
  "gnome-control-center: Default wifi CMD if not set")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

build() {
  # Build nessesary files
  meson build --prefix="/usr" --buildtype=release
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE" doc/* -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install
  sudo meson install -C build --destdir "${pkgdir}"
}
