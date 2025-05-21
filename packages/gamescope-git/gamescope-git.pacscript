pkgname="gamescope-git"
gives="gamescope"
provides=("${gives}")
replace=("${gives}")
pkgver="3.14.22"
pkgdesc='SteamOS session compositing window manager'
arch=("amd64")
url='https://github.com/ValveSoftware/gamescope'
depends=("hwdata"
  "seatd"
  "mesa-vulkan-drivers"
  "xwayland"
  "libglm-dev"
  "libavif-dev"
  "libcap-dev"
  "libdecor-0-dev"
  "libdrm-dev"
  "libinput-dev"
  "libpipewire-0.3-dev"
  "libx11-dev"
  "libxcb1-dev"
  "libxcomposite-dev"
  "libxdamage-dev"
  "libxext-dev"
  "libxfixes-dev"
  "libxkbcommon-dev"
  "libxmu-dev"
  "libxrender-dev"
  "libxres-dev"
  "libxtst-dev"
  "libxxf86vm-dev"
  "libsdl2-dev"
  "libxcb-ewmh-dev")
makedepends=("meson"
  "pkg-config"
  "libx11-dev"
  "libxdamage-dev"
  "libxcomposite-dev"
  "libxrender-dev"
  "libxext-dev"
  "libxfixes-dev"
  "libxxf86vm-dev"
  "libxtst-dev"
  "libxres-dev"
  "libxcb1-dev"
  "libdrm-dev"
  "libvulkan-dev"
  "libpipewire-0.3-dev"
  "wayland-protocols"
  "libxkbcommon-dev"
  "libcap-dev"
  "libsdl2-dev"
  "libstb-dev"
  "libwlroots-dev"
  "libliftoff-dev"
  "glslang-tools"
  "hwdata"
  "libglm-dev"
  "libxmu-dev"
  "libbenchmark-dev"
  "xwayland")

pacdeps=("openvr")
pacdeps_bookworm=("vkroots-git" "libdisplay-info-git" "xcb-util-errors" "wayland")
pacdeps_ubuntu=("xcb-util-errors" "wayland")

if [[ ${DISTRO#*:} != "bookworm" ]]; then
  makedepends+=("vkroots-headers" "libdisplay-info-dev")
fi

if [[ ${DISTRO%:*} != "ubuntu" && ${DISTRO#*:} != "bookworm" ]]; then
  depends+=("libxcb-errors-dev" "libwayland-dev")
  makedepends+=("libxcb-errors-dev" "libwayland-dev")
fi

source=('git+https://github.com/ValveSoftware/gamescope.git'
  'git+https://github.com/Joshua-Ashton/wlroots.git'
  'git+https://gitlab.freedesktop.org/emersion/libliftoff.git'
  'git+https://github.com/Joshua-Ashton/vkroots.git'
  'git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git'
  'git+https://github.com/ValveSoftware/openvr.git'
  'git+https://github.com/Joshua-Ashton/reshade.git'
  'git+https://github.com/KhronosGroup/SPIRV-Headers.git')
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
external_connection=true
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${gives}"

  # Add custom patches if needed
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ ${src} == *.patch ]] || continue
    echo "Applying patch ${src}..."
    git apply -v "../${src}"
  done

  meson subprojects download

  git submodule init subprojects/wlroots
  git config submodule.subprojects/wlroots.url ../wlroots

  git submodule init subprojects/libliftoff
  git config submodule.subprojects/libliftoff.url ../libliftoff

  git submodule init subprojects/vkroots
  git config submodule.subprojects/vkroots.url ../vkroots

  git submodule init subprojects/libdisplay-info
  git config submodule.subprojects/libdisplay-info.url ../libdisplay-info

  git submodule init subprojects/openvr
  git config submodule.subprojects/openvr.url ../openvr

  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade

  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers

  git -c protocol.file.allow=always submodule update
}

build() {
  meson --prefix=/usr "${gives}" build \
    -Dforce_fallback_for=stb,wlroots,vkroots,libliftoff,glm,libdisplay-info \
    -Dpipewire=enabled
  ninja -C build
}

package() {
  meson install -C build --skip-subprojects --destdir="${pkgdir}"

  cd "${srcdir}/${gives}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}/"
}
