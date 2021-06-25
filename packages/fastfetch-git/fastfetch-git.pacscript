#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="fastfetch-git"
pkgname="fastfetch"
pkgdir="/usr/src/pacstall/${name}"
homedir="/home/$(logname)"
description="Like neofetch, but much faster because written in c"
url="https://github.com/LinusDierheimer/fastfetch.git"
build_depends="cmake libpci-dev libx11-dev libxrandr-dev libwayland-client0 libwayland-dev libgio-cil libglib2.0-dev libdconf-dev libxfconf-0-dev libsqlite3-dev"
optdepends=("libpci-dev: GPU output"
            "libx11-dev: Resolution output"
            "libxrandr-dev: Refresh rate in resolution output"
            "libwayland-client0: Best resolution performance + support for monitors with different refresh rates in wayland sessions"
            "libglib2.0-dev: Output for values that are only stored in GSettings"
            "libdconf-dev: Output for values that are only stored in DConf"
            "libxfconf-0-dev: XFWM theme + xfce-terminal font"
            "libsqlite3-dev: RPM package count")
breaks="${pkgname} ${pkgname}-bin"
removescript="yes"


pkgver() {
  git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  # Build fastfetch
  cmake -j"$(nproc)" .
  cmake --build . -j"$(nproc)"
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install fastfetch and flashfetch binary
  sudo install -Dm755 "fastfetch" "flashfetch" -t "${pkgdir}/usr/bin"

  # Install bash completions
  sudo install -Dm644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # Install presets
  for file in presets/*; do
    sudo install -D "$file" -t "${pkgdir}/usr/share/${pkgname}/presets"
  done
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
  sudo rm -rf "/usr/share/${pkgname}"

  # Remove left over directories
  if ask "Do you want to remove the configuration files?" Y; then
    sudo rm -rf "${homedir}/.config/fastfetch"
  fi
  if ask "Do you want to remove the left over cache?" Y; then
    sudo rm -rf "${homedir}/.cache/fastfetch"
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
