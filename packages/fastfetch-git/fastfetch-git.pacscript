#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fastfetch-git"
pkgname="fastfetch"
pkgdesc="Like neofetch, but much faster because written in c"
url="https://github.com/LinusDierheimer/fastfetch.git"
pkgver="2.2.3"
makedepends=("cmake" "libpci-dev" "libvulkan-dev" "libwayland-dev" "libxrandr-dev" "libxcb-randr0-dev" "libdconf-dev" "libdbus-1-dev" "libmagickcore-dev" "libxfconf-0-dev" "libegl-dev" "libglx-dev" "libosmesa6-dev" "ocl-icd-opencl-dev" "libnm-dev" "libpulse-dev" "libddcutil-dev" "directx-headers-dev")
optdepends=("libpci-dev: GPU output"
  "libvulkan1: Vulkan module and GPU fallback"
  "libegl1: OpenGL module"
  "libxcb-randr0: Resolution and refresh rate support for X11 sessions"
  "libwayland-clint0: Resolution and refresh rate support for wayland sessions"
  "libglib2.0-0: Output for values that are only stored in GSettings"
  "libdconf1: Output for values that are only stored in DConf"
  "libxfconf-0-3: XFWM theme + xfce-terminal font"
  "libnm0: Used for Wifi detection"
  "libpulse0: Used for Sound device detection"
  "libddcutil3: Used for brightness detection for external displays"
  "libdbus-1-3: Used for bluetooth, Player & Media detection"
)
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
pkgver() {
  git ls-remote "${url}" dev | cut -f1 | cut -c1-8
}

build() {
  # Build fastfetch
  mkdir -p build/
  (
    cd build/ || return 2
    cmake ..
    cmake --build . --target fastfetch --target flashfetch -j "${NCPU}"
  )
}

package() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install fastfetch and flashfetch binary
  sudo install -Dm755 "build/fastfetch" "build/flashfetch" -t "${pkgdir}/usr/bin"

  # Install bash completions
  sudo install -Dm644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # Install presets
  sudo mkdir -p "${pkgdir}/usr/share/${pkgname}/presets"
  sudo cp -r presets/* "${pkgdir}/usr/share/${pkgname}/presets"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
  sudo rm -rf "/usr/share/${pkgname}"

  # Remove left over directories
  if ask "Do you want to remove the configuration files?" Y; then
    rm -rf "${homedir}/.config/fastfetch"
  fi
  if ask "Do you want to remove the left over cache?" Y; then
    rm -rf "${homedir}/.cache/fastfetch"
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
