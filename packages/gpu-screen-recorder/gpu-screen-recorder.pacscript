pkgname="gpu-screen-recorder"
pkgdesc="A shadowplay-like screen recorder for Linux"
pkgver="5.11.2"
arch=("amd64")
url='https://git.dec05eba.com/gpu-screen-recorder/about'
repology=("project: gpu-screen-recorder")
license=("GPL-3.0-only")
source=("https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha256sums=("cfb3044df3dc169f86e38aecf0c34fed8aa21d52894c7873c2d38f704e87bbe9")
makedepends=(
  "meson"
  "libglvnd-dev"
  "libavcodec-dev"
  "libavformat-dev"
  "libavutil-dev"
  "libswresample-dev"
  "libavfilter-dev"
  "libxcomposite-dev"
  "libxrandr-dev"
  "libxdamage-dev"
  "libxfixes-dev"
  "libx11-dev"
  "libpulse-dev"
  "libva-dev"
  "libdrm-dev"
  "libcap-dev"
  "libwayland-dev"
  "libpipewire-0.3-dev"
  "libdbus-1-dev"
  "libxnvctrl-dev"
  "libvulkan-dev"
)
depends=(
  "libglvnd0"
  "libxcomposite1"
  "libxrandr2"
  "libxdamage1"
  "libxfixes3"
  "libx11-6"
  "libpulse0"
  "libva2"
  "libdrm2"
  "libcap2"
  "libcap2-bin"
  "libwayland-client0"
  "libwayland-egl1"
  "libdbus-1-3"
  "libvulkan1"
)
depends_focal=(
  "libavcodec58"
  "libavutil56"
  "libavformat58"
  "libavfilter7"
  "libswresample3"
  "libpipewire-0.2-1"
)
depends_jammy=(
  "libavcodec58"
  "libavutil56"
  "libavformat58"
  "libavfilter7"
  "libswresample3"
  "libpipewire-0.3-0"
)
depends_mantic=(
  "libavcodec60"
  "libavutil58"
  "libavformat60"
  "libavfilter9"
  "libswresample4"
  "libpipewire-0.3-0"
)
depends_noble=(
  "libavcodec60"
  "libavutil58"
  "libavformat60"
  "libavfilter9"
  "libswresample4"
  "libpipewire-0.3-0t64"
)
depends_oracular=(
  "libavcodec61"
  "libavutil59"
  "libavformat61"
  "libavfilter10"
  "libswresample5"
  "libpipewire-0.3-0t64"
)
depends_bullseye=(
  "libavcodec58"
  "libavutil56"
  "libavformat58"
  "libavfilter7"
  "libswresample3"
  "libpipewire-0.3-0"
)
depends_bookworm=(
  "libavcodec59"
  "libavutil57"
  "libavformat59"
  "libavfilter8"
  "libswresample4"
  "libpipewire-0.3-0"
)
depends_trixie=(
  "libavcodec61"
  "libavutil59"
  "libavformat61"
  "libavfilter10"
  "libswresample5"
  "libpipewire-0.3-0t64"
)
depends_sid=(
  "libavcodec61"
  "libavutil59"
  "libavformat61"
  "libavfilter10"
  "libswresample5"
  "libpipewire-0.3-0t64"
)
optdepends=(
  "intel-media-va-driver-non-free: Required to record your screen on Intel Broadwell or later iGPUs"
  "mesa-va-drivers: Required to record your screen on AMD/Intel GPUs"
  "libxnvctrl0: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug"
)
optdepends_ubuntu=(
  # These optdeps lines make pacstall hang for a while when resolving optional
  # dependencies, but there seems to be no virtual or meta package to handle
  # this better.
  "libnvidia-encode-390 | libnvidia-encode-418 | libnvidia-encode-430 | libnvidia-encode-440 | libnvidia-encode-450 | libnvidia-encode-455 | libnvidia-encode-460 | libnvidia-encode-465 | libnvidia-encode-470 | libnvidia-encode-495 | libnvidia-encode-510 | libnvidia-encode-515 | libnvidia-encode-520 | libnvidia-encode-525 | libnvidia-encode-530 | libnvidia-encode-535 | libnvidia-encode-545 | libnvidia-encode-550: Required to record your screen on NVIDIA"
  "libnvidia-compute-390 | libnvidia-compute-418 | libnvidia-compute-430 | libnvidia-compute-440 | libnvidia-compute-450 | libnvidia-compute-455 | libnvidia-compute-460 | libnvidia-compute-465 | libnvidia-compute-470 | libnvidia-compute-495 | libnvidia-compute-510 | libnvidia-compute-515 | libnvidia-compute-520 | libnvidia-compute-525 | libnvidia-compute-530 | libnvidia-compute-535 | libnvidia-compute-545 | libnvidia-compute-550: Required to record your screen on NVIDIA"
  "libnvidia-fbc1-390 | libnvidia-fbc1-418 | libnvidia-fbc1-430 | libnvidia-fbc1-440 | libnvidia-fbc1-450 | libnvidia-fbc1-455 | libnvidia-fbc1-460 | libnvidia-fbc1-465 | libnvidia-fbc1-470 | libnvidia-fbc1-495 | libnvidia-fbc1-510 | libnvidia-fbc1-515 | libnvidia-fbc1-520 | libnvidia-fbc1-525 | libnvidia-fbc1-530 | libnvidia-fbc1-535 | libnvidia-fbc1-545 | libnvidia-fbc1-550: Required to record your screen on NVIDIA on X11"
)
optdepends_debian=(
  "libnvidia-encode1: Required to record your screen on NVIDIA"
  "libcuda1: Required to record your screen on NVIDIA"
  "libnvidia-fbc1: Required to record your screen on NVIDIA on X11"
)
maintainer=("bibelin <balian1belin@yandex.ru>")

prepare() {
  meson setup --buildtype=release --prefix=/usr -Dsystemd=true build
}

build() {
  ninja -C build -j"${NCPU}"
}

package() {
  meson install -C build --destdir="${pkgdir}"
}

post_install() {
  # Allows to avoid entring password when starting recording with "-w screen"
  setcap cap_sys_admin+ep /usr/bin/gsr-kms-server
}
