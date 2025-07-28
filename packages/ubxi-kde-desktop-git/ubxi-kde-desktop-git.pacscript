pkgname="ubxi-kde-desktop-git"
arch=("amd64" "arm64")
pkgver="0.0.1"
pkgrel="4"
source=("https://github.com/rhino-linux/ubxi-kde-desktop.git")
depends=(
  "plasma-desktop" "konsole" "systemsettings" "plasma-nm" "plasma-disks"
  "plasma-firewall" "plasma-pa" "plasma-systemmonitor" "kinfocenter" "kmenuedit"
  "kscreen" "dolphin" "kio-extras" "kdegraphics-thumbnailers" "kde-config-gtk-style"
  "kde-config-gtk-style-preview" "kde-config-screenlocker" "breeze-gtk-theme" "xdg-desktop-portal-gtk" "xdg-desktop-portal-kde"
  "ufw" "vulkan-tools" "wayland-utils" "pulseaudio-utils" "aha" "clinfo"
  "bluedevil" "plasma-widgets-addons" "plasma-session-wayland" "plasma-session-x11"
)
optdepends=(
  "kde-spectacle: a simple application for capturing desktop screenshots"
  "ark: File archiver by KDE"
  "plasma-vault: Plasma applet and services for creating encrypted vaults"
  "plasma-thunderbolt: Plasma addons for managing Thunderbolt devices"
  "powerdevil: Global power saver settings"
)
makedepends=("plasma-session-wayland")
pacdeps=("rhino-ubxi-core")
replaces=("unicorn-desktop" "unicorn-mobile")
gives="ubxi-kde-desktop"
priority='required'
pkgdesc="UBXI KDE Plasma Desktop"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
compatible=('ubuntu:*')
license=('GPL-3.0-or-later')

build() {
  cd "${gives}"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/wallpapers"
  mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
  mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
  mkdir -p "${pkgdir}/usr/share/plasma/layout-templates"
  mkdir -p "${pkgdir}/usr/share/color-schemes"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/etc/xdg"
  mkdir -p "${pkgdir}/usr/share/wayland-sessions"
}

package() {
  cd "${gives}"
  # Icons
  install -Dm644 "rhino/logos/logo.png" -t "${pkgdir}/usr/share/icons"
  install -Dm644 "rhino/logos/logo.svg" -t "${pkgdir}/usr/share/icons"
  cp rhino/icons/{uniDesktop,uniPlasma,uniSearch}.png "${pkgdir}/usr/share/icons"

  # Wallpapers for Plasma
  cp -r rhino/wallpapers "${pkgdir}/usr/share"

  # Plasma Global Theme
  cp -r plasma/look-and-feel/org.rhinolinux.unicorn.desktop "${pkgdir}/usr/share/plasma/look-and-feel"

  # Plasma Style
  cp -r plasma/desktoptheme/unicorn "${pkgdir}/usr/share/plasma/desktoptheme"

  # Plasma Layout Templates
  cp -r plasma/layout-templates/* "${pkgdir}/usr/share/plasma/layout-templates"

  # Unicorn color scheme
  install -Dm644 "plasma/color-schemes/Unicorn.colors" "${pkgdir}/usr/share/color-schemes"

  # Plasma config
  install -Dm644 "plasma/kcm-about-distrorc" -t "${pkgdir}/etc/xdg"
  install -Dm644 "plasma/kdeglobals" -t "${pkgdir}/etc/xdg"
  install -Dm644 "plasma/kglobalshortcutsrc" -t "${pkgdir}/etc/xdg"

  # KRunner for Search Bar and KWin Overview for Desktop Switcher
  cp plasma/applications/{krunner,kwin-overview}.desktop "${pkgdir}/usr/share/applications"

  # Patch Wayland session
  if [[ -f /usr/share/wayland-sessions/plasma.desktop ]]; then
    cp /usr/share/wayland-sessions/plasma.desktop "${pkgdir}/usr/share/wayland-sessions/plasma.desktop"
  else
    cp /usr/share/wayland-sessions/plasma.desktop.bak "${pkgdir}/usr/share/wayland-sessions/plasma.desktop"
  fi
  sed -i 's|^Exec=.*|Exec=/usr/bin/startplasma-wayland|' "${pkgdir}/usr/share/wayland-sessions/plasma.desktop"
}

pre_install() {
  sudo dpkg-divert --quiet --package "${gives}" --divert /usr/share/wayland-sessions/plasma.desktop.bak --rename /usr/share/wayland-sessions/plasma.desktop
}

post_install() {
  if ! [[ -f "${homedir}/.config/kglobalshortcutsrc" ]]; then
    cp "/etc/xdg/kglobalshortcutsrc" "${homedir}/.config"
  fi
}

post_remove() {
  if ! [[ -d "${STAGEDIR}/${pkgname}" ]]; then
    sudo dpkg-divert --quiet --package "${gives}" --remove --rename /usr/share/wayland-sessions/plasma.desktop
  fi
}
