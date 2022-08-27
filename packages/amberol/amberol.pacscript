name="amberol"
version="0.9.0"
build_depends="python3 meson ninja-build rustc cargo libgtk-4-dev libadwaita-1-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gettext libdbus-1-dev pkg-config"
url="https://gitlab.gnome.org/World/amberol/-/archive/${version}/amberol-${version}.tar.gz"
hash="61e23d24691a622cea6d6bceff2324a85a16b0cc110dcac8a0fe29a3bf746777"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
repology=("project: ${name}")

prepare() {
  # force cargo to compile release
  echo -e "\n[profile.release]
opt-level = 3" >> Cargo.toml
  meson setup _builddir .
}

build() {
  meson compile -C _builddir
}

install() {
  DESTDIR="${STOWDIR}/${name}" ninja -C _builddir install
}
