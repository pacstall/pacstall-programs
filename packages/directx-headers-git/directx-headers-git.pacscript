pkgname="directx-headers-git"
gives="directx-headers-dev"
pkgdesc="DirectX headers for using D3D12"
pkgver="1.614.0"
arch=('x86_64' 'i686')
makedepends=('meson' 'git')
provides=('directx-headers-dev')
url='https://github.com/microsoft/DirectX-Headers'
source=('DirectX-Headers::git+https://github.com/microsoft/DirectX-Headers.git')
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

build() {
  if [[ ${AARCH} == "x86_64" ]]; then
    meson setup DirectX-Headers build \
      --prefix /usr \
      --libexecdir lib/x86_64-linux-gnu \
      --sbindir sbin \
      --buildtype plain \
      --auto-features enabled \
      --wrap-mode nodownload \
      -D b_lto=false \
      -D b_pie=true \
      -D build-test=false
  else
    meson setup DirectX-Headers build \
      --prefix /usr \
      --libexecdir lib/"${CARCH}"-linux-gnu \
      --sbindir sbin \
      --buildtype plain \
      --auto-features enabled \
      --wrap-mode nodownload \
      -D b_lto=false \
      -D b_pie=true \
      -D build-test=false
  fi

  meson configure --no-pager build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" DirectX-Headers/LICENSE
}
