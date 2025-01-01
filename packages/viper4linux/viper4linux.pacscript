pkgname="viper4linux"
pkgver="2.0"
source=("@${pkgname}~${pkgver}::https://github.com/SamarthH/Viper4LinuxForPacstall/releases/download/v1.0/Viper4LinuxForPacstall.zip")
depends=("build-essential" "cmake" "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" "gstreamer1.0-tools")
pkgdesc="A Port of Viper4Android to Linux, or in the words of noahbliss: Making Loonix sound good"
sha256sums=("fe85277ca63f8a99beb2c347b6d9a268eb783c601c8fcbb7d0366d4797ff9900")
arch=('amd64')

prepare() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/x86_64-linux-gnu/gstreamer-1.0"
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/home/${USER}/.config"
}

build() {
  cd "${pkgname}~${pkgver}"
  cd gst-plugin-viperfx
  cmake -j"${NCPU}" .
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  #These are basically install instructions from https://github.com/Audio4Linux/Viper4Linux
  cp libgstviperfx.so "${pkgdir}/usr/lib/x86_64-linux-gnu/gstreamer-1.0/"

  cd "${srcdir}"

  cp "viperfx_core_binary/libviperfx_x64_linux.so" "${pkgdir}/usr/lib/libviperfx.so"

  cd Viper4Linux
  cp -r viper4linux "${pkgdir}/home/${USER}/.config/"

  install -Dm755 viper -t "${pkgdir}/usr/bin"
}
