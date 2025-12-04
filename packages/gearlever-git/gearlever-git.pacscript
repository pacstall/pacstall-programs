pkgname="gearlever-git"
gives="gearlever"
pkgver="4.0.3"
pkgdesc="Manage AppImages with ease"
arch=('any')
url='https://mijorus.it/projects/gearlever'
license=('GPL-3.0')
maintainer=('aKqir24 <aKqir24@github.com>')
makedepends=('meson' 'ninja-build' 'python3' 'pkg-config' 'libgtk-4-dev')
depends=('libadwaita-1-dev' 'python3-xdg' 'python3-gi' 'python3-ftputil')
pacdeps=('python3-desktop-entry-lib')
source=("https://github.com/mijorus/${gives}.git")

prepare() {
  cd "${gives}"

  # Some small fixes & patches
  sed -i "s/\(\['arch'\]\)/['uname', '-m']/g" src/AppDetails.py
  sed -i "s/7zz/7z/g" src/providers/AppImageProvider.py
  sed -i "s/get_appimage_offset/\/usr\/lib\/gearlever\/get_appimage_offset/g" src/providers/AppImageProvider.py
  find . -name "meson.build" -exec sed -i 's/\.path()/\.full_path()/g' {} +
}

build() {
  cd "${gives}"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build -j"${NCPU}"
}

package() {
  cd "${gives}"
  meson install -C build --destdir "${pkgdir}"

  # Install scripts & license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${gives}/COPYING"
  install -Dm755 "build-aux/get_appimage_offset.sh" "${pkgdir}/usr/lib/gearlever/get_appimage_offset"

  # Cleanup
  rm -f "${pkgdir}/usr/share/icons/hicolor/scalable/actions/meson.build"
  rm -f "${pkgdir}/usr/share/${gives}/${gives}/meson.build"
}
