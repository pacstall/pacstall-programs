name="os-installer-commit"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgname="os-installer"
description="A generic and changable os-installer (latest commit)"
version="$(wget -q -O - https://gitlab.gnome.org/p3732/os-installer/-/commits/main | grep 'data-clipboard-text="' | head -1 | cut -f14 -d'"')"
url="https://gitlab.gnome.org/p3732/os-installer/-/archive/${version}/os-installer-${version}.tar.gz"
depends="libgnome-desktop-4-2 libadwaita-1-0 libgweather-4-0 python3-yaml libudisks2-0 libvte-2.91-gtk4-0"
build_depends="meson gettext libgnome-desktop-4-dev libadwaita-1-dev libgweather-4-dev python3-yaml libudisks2-dev libvte-2.91-gtk4-dev"
breaks="${pkgname}-bin ${pkgname} ${pkgname}-git"
optdepends=("gnome-disk-utility: Default disk CMD if not set"
            "epiphany-browser: Default browser CMD if not set"
            "gnome-control-center: Default wifi CMD if not set")

prepare() {
  git config --global --add safe.directory /tmp/pacstall/os-installer
  fancy_message warn "This can only be built using the latest version of most OSes."
}

build() {
  # Build nessesary files
  meson --prefix="/usr" --buildtype=release . build
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" doc/* -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install
  sudo meson install -C build --destdir "${pkgdir}"
}
