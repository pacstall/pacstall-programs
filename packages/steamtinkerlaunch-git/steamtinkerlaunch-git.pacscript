name="steamtinkerlaunch-git"
url="https://github.com/frostworx/steamtinkerlaunch.git"
pkgver="12.12"
depends=("gawk" "xdotool" "wget" "vim" "xdotool" "x11-utils")
breaks=("steamtinkerlaunch" "${name}-git" "${name}-deb" "${name}-app" "${name}-deb" "${name}-bin")
replace=("steamtinkerlaunch")
gives="steamtinkerlaunch"
pkgdesc="Linux wrapper tool for use with the Steam client for custom launch options and 3rd party programs."
optdepends=("strace: system call tracer"
  "gamemode: linux gaming optimizer"
  "mangohud: vulkan/opengl monitoring hud"
  "winetricks: wine settings tweaker"
  "vkbasalt: vulkan graphics enhancer"
  "goverlay: vulkan overlay configurator"
  "scummvm: VM for point-and-click games"
  "gameconqueror: memory editing for cheating")
maintainer="echometerain <echometer@disroot.org>"
pacdeps=("yad")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo install -Dm755 steamtinkerlaunch -t "${pkgdir}/usr/bin"
  sudo install -d "${pkgdir}/usr/share/steamtinkerlaunch"
  sudo cp -r collections eval guicfgs lang misc "${pkgdir}/usr/share/steamtinkerlaunch"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/steamtinkerlaunch"
  sudo install -Dm644 "misc/steamtinkerlaunch.desktop" -t "${pkgdir}/usr/share/applications"
  sudo install -Dm644 "misc/steamtinkerlaunch.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}

post_install() {
  steamtinkerlaunch yad "/usr/local/bin/yad"
}
