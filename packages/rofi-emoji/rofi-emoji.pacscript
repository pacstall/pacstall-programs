pkgname=rofi-emoji
pkgname=$_pkgname-abi8
pkgver="3.3.0"
pkgdesc="A Rofi plugin for selecting emojis"
url="https://github.com/Mange/rofi-emoji"
arch=('x86_64')
license=("MIT")
depends=( 'libcairo2' 'libc6' 'libglib2.0-0' 'gcc-10-base' 'rofi' )
provides=(${pkgname})
conflicts=(${pkgname})
checkdepends=('check')
optdepends=(
	'xsel: X11 support'
	'xclip: X11 support'
	'wl-clipboard: Wayland support'
)
source=("https://github.com/Mange/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
		"https://github.com/Mange/rofi-emoji/commit/8c7083eeccc577dcd9bb26bf4b67f80c9451d697.patch)
sha256sums=('a2d5f19f015b4014360d23a4fe2820baf09ef3b69d45677df52537206876ce47'
            'a7b0ac99a17aa45ccc1d1c102dca392a6a8ab918ac45260d4e014064c0570443')
b2sums=('7132c287f87c97a64ee7da2ce39352541e2bf8dc17c5fb3ae38c5de3be353b5aaca0ad13be8e2ab71d760d98d6cb957d96b815cff9582d1317d7fd2c290a1f96'
        '94e0c4a20c030d67554c8f5e5f2229c447990a250d06d657b186a946b5045e2dd39551201f12cf052806f3dc8568bd2a1e53abdde98188581c92fcadaadf73b3')
prepare() {
	cd ${pkgname}-${pkgver}
	patch -p1 -i $srcdir/abi8.patch
}

build() {
	cd ${pkgname}-${pkgver}
	autoreconf -i
	./configure --prefix=/usr
	make
}

check() {
	cd ${pkgname}-${pkgver}
	make check
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
