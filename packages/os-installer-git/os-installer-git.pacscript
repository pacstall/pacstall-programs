name="os-installer-git"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgname="os-installer"
description="Dynamic menu library and client program inspired by dmenu (git release)"
url="https://gitlab.gnome.org/p3732/os-installer.git"
depends="libgnome-desktop-4-1 libadwaita-1-0 libgweather-4-0 python3-yaml libudisks2-0 libvte-2.91-gtk4-0"
build_depends="meson libgnome-desktop-4-dev libadwaita-1-dev libgweather-4-dev python3-yaml libudisks2-dev libvte-2.91-gtk4-dev"
breaks="${pkgname}-bin ${pkgname}"
optdepends=("gnome-disk-utility: Default disk CMD if not set"
            "epiphany-browser: Default browser CMD if not set"
            "gnome-control-center: Default wifi CMD if not set")

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  # Build nessesary files
  meson --prefix="${STOWDIR}/${name}/usr" --buildtype=release . build
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" doc/* -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install
  sudo meson install -C build --destdir "${STOWDIR}/${name}/usr"
}
