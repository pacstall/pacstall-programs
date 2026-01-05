#!/usr/bin/env bash

name="scenefx-git"
pkgver="git"
pkgdesc="A drop-in replacement for the wlroots scene API that allows Wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
license=("MIT")
arch=("amd64")

depends=(
	"libglvnd0"
	"libwayland-client0"
	"libdrm2"
	"libpixman-1-0"
)

makedepends=(
	"git"
	"glslang-tools"
	"meson"
	"ninja-build"
	"pkg-config"
	"wayland-protocols"
)

conflicts=(
	"scenefx"
	"scenefx0.4"
)

provides=(
	"libscenefx-0.4.so"
)

source=(
	"git+https://github.com/wlrfx/scenefx.git"
)

prepare() {
	cd "$srcdir/scenefx"
}

build() {
	cd "$srcdir/scenefx"

	export PKG_CONFIG_PATH="/usr/lib/wlroots0.19/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"

	meson setup build \
		--prefix=/usr \
		--buildtype=release \
		-Dwerror=false

	ninja -C build
}

package() {
	cd "$srcdir/scenefx"
	DESTDIR="$pkgdir" ninja -C build install
}

