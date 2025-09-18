pkgname="gearlever-git"
gives="gearlever"
pkgver="3.4.2"
pkgdesc="Manage AppImages with ease"
arch=('any')
url='https://mijorus.it/projects/gearlever'
license=('GPL-3.0')
maintainer=('aKqir24 <aKqir24@github.com>')
makedepends=('meson' 'ninja-build' 'python3' 'pkg-config' 'libgtk-4-dev')
depends=('libadwaita-1-dev' 'python3-xdg')
source=("https://github.com/mijorus/gearlever/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
	cd "${gives}-${pkgver}"

	# Patch for arch -> uname
	sed -i "s/\(\['arch'\]\)/['uname', '-m']/g" src/AppDetails.py src/models/UpdateManager.py

	# Use system 7z instead of bundled 7zz
    sed -i "s/7zz/7z/g" src/providers/AppImageProvider.py

    # Fix script path
    sed -i "s|get_appimage_offset|/usr/lib/gearlever/get_appimage_offset|g" src/providers/AppImageProvider.py

	meson setup build/ --buildtype=release --prefix=/usr
}

build() {
	cd "${gives}-${pkgver}"

	meson setup build --prefix=/usr --buildtype=release
	meson compile -C build
}

package() {
	cd "${gives}-${pkgver}"
    meson install -C build --destdir "${pkgdir}"

    # Install license
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${gives}/COPYING"

    # Install script
    install -Dm755 "build-aux/get_appimage_offset.sh" "${pkgdir}/usr/lib/gearlever/get_appimage_offset"

    # Cleanup
    rm -f "${pkgdir}/usr/share/icons/hicolor/scalable/actions/meson.build"
    rm -f "${pkgdir}/usr/share/${gives}/${gives}/meson.build"
}
