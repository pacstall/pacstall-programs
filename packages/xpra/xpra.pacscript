pkgname="xpra"
arch=("any")
pkgver="6.5.3"
pkgdesc="Persistent remote applications for X"
url='https://xpra.org/'
license=("GPL-2.0-or-later")
source=("https://github.com/Xpra-org/xpra/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("87ac8dbf38fa162402ab95f4591d9906d3695e26958943f6d833dc105bce905c")
makedepends=(
  "python3"
  "python3-setuptools"
  "python3-dev"
  "python-gi-dev"
  "python3-cairo-dev"
  "cython3"
  "pkg-config"
  "libxxhash-dev"
  "liblz4-dev"
  "libbrotli-dev"
  "libavif-dev"
  "libwebp-dev"
  "libturbojpeg0-dev"
  "libdrm-dev"
  "libqrencode-dev"
  "libsystemd-dev"
  "libpam0g-dev"
  "libxkbfile-dev"
  "libxres-dev"
  "libxcomposite-dev"
  "libxdamage-dev"
  "libxfixes-dev"
  "libxext-dev"
  "libxrandr-dev"
  "libxtst-dev"
  "libx11-dev"
  "libgirepository1.0-dev"
  "libgtk-3-dev"
  "libcairo2-dev"
)
depends=(
  "python3"
  "python3-gi"
  "python3-cairo"
  "gir1.2-gtk-3.0"
  "python3-rencode"
  "python3-lz4"
  "python3-pil"
  "python3-paramiko"
  "python3-dnspython"
  "python3-zeroconf"
  "python3-opengl"
  "xvfb"
  "x11-xserver-utils"
  "gstreamer1.0-plugins-base"
)
replaces=(
  "${pkgname}"
  "${pkgname}-server"
  "${pkgname}-client"
  "${pkgname}-client-gtk3"
  "${pkgname}-client-qt6"
  "${pkgname}-client-gnome"
  "${pkgname}-common"
  "${pkgname}-codecs"
  "${pkgname}-codecs-extras"
  "${pkgname}-codecs-nvidia"
  "${pkgname}-codecs-amd"
  "${pkgname}-x11"
  "${pkgname}-audio"
  "${pkgname}-audio-server"
  "${pkgname}-server-wayland"
  "${pkgname}-git"
  "${pkgname}-deb"
  "${pkgname}-bin"
)
breaks=("${replaces[@]}")
repology=("project: ${pkgname}")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

build() {
  cd "${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --install-layout=deb --optimize=1
}
